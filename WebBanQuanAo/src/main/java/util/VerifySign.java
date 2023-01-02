package util;

import com.spire.pdf.PdfDocument;
import com.spire.pdf.attachments.PdfAttachmentCollection;
import model.Sign;
import org.json.JSONObject;

import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;
import java.io.*;
import java.security.InvalidKeyException;
import java.security.NoSuchProviderException;

public class VerifySign {
    private String orderNoSignUrl;
    private String orderSignUrl;

    private String publicKey;
    private String jsonSign;
    private Sign sign;

    public VerifySign(String orderNoSignUrl, String orderSignUrl, Sign sign) {
        this.orderNoSignUrl = orderNoSignUrl;
        this.orderSignUrl = orderSignUrl;
        this.sign = sign;
        this.jsonSign = readJsonSign();
    }

    public String getHashOrderNoSign() {
        return Hash.getIntance(Constants.SHA_256).hashFile(orderNoSignUrl);
    }

    private String readJsonSign() {
        // Create a new PDF document.
        String content = "";
        try {
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
        } catch (IOException e) {
            e.printStackTrace();
        }
        return content;
    }

    private String getSign() {
        JSONObject jsonObject = new JSONObject(this.jsonSign);
        return jsonObject.getString("billEncrypt");
    }

    public String getHashOrderSign() {
        String decryptHash = "";
        try {
            String sign = getSign();
            decryptHash = RSA.getInstance().decrypt(sign, Constants.PUBLIC_KEY, this.sign.getKeySize());
        } catch (IllegalBlockSizeException e) {
            throw new RuntimeException(e);
        } catch (BadPaddingException e) {
            throw new RuntimeException(e);
        } catch (InvalidKeyException e) {
            throw new RuntimeException(e);
        } catch (NoSuchProviderException e) {
            throw new RuntimeException(e);
        }
        return decryptHash;
    }

    public boolean isValid() {
        String hashNoSign = getHashOrderNoSign();
        String hashSign = getHashOrderSign();
        if (hashSign.startsWith(hashNoSign) || hashSign.endsWith(hashNoSign)) {
            return true;
        }
        return false;
    }
}
