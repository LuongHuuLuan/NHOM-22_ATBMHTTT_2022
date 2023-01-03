package util;

import com.spire.pdf.PdfDocument;
import com.spire.pdf.attachments.PdfAttachmentCollection;
import model.Sign;
import org.json.JSONObject;

import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;
import java.io.*;
import java.security.*;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.X509EncodedKeySpec;
import java.util.Base64;

public class VerifySign {
    private String orderNoSignUrl;
    private String orderSignUrl;

    private String publicKey;
    private String jsonSign;
    private Sign sign;

    public VerifySign(String orderNoSignUrl, String orderSignUrl, Sign sign) throws Exception {
        this.orderNoSignUrl = orderNoSignUrl;
        this.orderSignUrl = orderSignUrl;
        this.sign = sign;
        this.jsonSign = readJsonSign();
    }

    public String getHashOrderNoSign() {
        return Hash.getIntance(Constants.SHA_256).hashFile(orderNoSignUrl);
    }

    private String readJsonSign() throws Exception {
        // Create a new PDF document.
        String content = "";
        PdfDocument pdf = new PdfDocument();
        // Load the file from disk.
        pdf.loadFromFile(orderSignUrl);
        // Get a collection of attachments on the PDF document.
        PdfAttachmentCollection collection = pdf.getAttachments();
        // Save all the attachments to the files.
        String fileName = collection.get(0).getFileName();
        File file = new File(fileName);
        ByteArrayInputStream bais = new ByteArrayInputStream(collection.get(0).getData());
        BufferedReader reader = new BufferedReader(new InputStreamReader(bais));

        String line = reader.readLine();
        while (line != null) {
            content += line;
            line = reader.readLine();
        }
        reader.close();
        return content;
    }

    private String getSign() {
        JSONObject jsonObject = new JSONObject(this.jsonSign);
        return jsonObject.getString("billEncrypt");
    }

    public String getHashOrderSign() throws Exception {
        String decryptHash = "";
        String sign = getSign();
        byte[] keyBytes = Base64.getDecoder().decode(this.sign.getSign());
        X509EncodedKeySpec ks = new X509EncodedKeySpec(keyBytes);
        KeyFactory kf = KeyFactory.getInstance("RSA");
        PublicKey pk = kf.generatePublic(ks);
        decryptHash = RSA.getInstance().decrypt(sign, Constants.PUBLIC_KEY, pk, this.sign.getKeySize());
        return decryptHash;
    }

    public boolean isValid() throws Exception {
        String hashNoSign = getHashOrderNoSign();
        String hashSign = getHashOrderSign();
        if (hashSign.startsWith(hashNoSign) || hashSign.endsWith(hashNoSign)) {
            return true;
        }
        return false;
    }
}
