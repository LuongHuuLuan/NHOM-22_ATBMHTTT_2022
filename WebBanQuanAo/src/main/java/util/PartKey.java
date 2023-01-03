package util;

import org.json.JSONObject;

import javax.servlet.http.Part;
import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.security.KeyFactory;
import java.security.NoSuchAlgorithmException;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.PKCS8EncodedKeySpec;
import java.security.spec.X509EncodedKeySpec;
import java.util.Base64;

public class PartKey {
    private Part part;
    private String StringKey;
    private String keyType;
    private PublicKey publicKey;
    private PrivateKey privateKey;

    public PartKey(Part part, String keyType) {
        this.part = part;
        this.keyType = keyType;
        this.convertKey();
    }

    private void convertKey() {
        try {
            BufferedReader reader = new BufferedReader(new InputStreamReader(this.part.getInputStream()));
            String line = reader.readLine();
            String content = "";
            while (line != null) {
                content += line;
                line = reader.readLine();
            }
            this.part.getInputStream().close();
            reader.close();
            JSONObject jsonObject = new JSONObject(content);

            if (this.keyType.equals("publicKey")) {
                String key = jsonObject.getString("publicKey");
                this.StringKey = key;
                byte[] keyBytes = Base64.getDecoder().decode(key);
                X509EncodedKeySpec ks = new X509EncodedKeySpec(keyBytes);
                KeyFactory kf = KeyFactory.getInstance("RSA");
                this.publicKey = kf.generatePublic(ks);
            } else {
                String key = jsonObject.getString("privateKey");
                this.StringKey = key;
                byte[] keyBytes = Base64.getDecoder().decode(key);
                PKCS8EncodedKeySpec ks = new PKCS8EncodedKeySpec(keyBytes);
                KeyFactory kf = KeyFactory.getInstance("RSA");
                this.privateKey = kf.generatePrivate(ks);
            }
        } catch (IOException e) {
            throw new RuntimeException(e);
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        } catch (InvalidKeySpecException e) {
            throw new RuntimeException(e);
        }
    }

    public Part getPart() {
        return part;
    }

    public void setPart(Part part) {
        this.part = part;
    }

    public String getStringKey() {
        return StringKey;
    }

    public void setStringKey(String stringKey) {
        StringKey = stringKey;
    }

    public String getKeyType() {
        return keyType;
    }

    public void setKeyType(String keyType) {
        this.keyType = keyType;
    }

    public PublicKey getPublicKey() {
        return publicKey;
    }

    public void setPublicKey(PublicKey publicKey) {
        this.publicKey = publicKey;
    }

    public PrivateKey getPrivateKey() {
        return privateKey;
    }

    public void setPrivateKey(PrivateKey privateKey) {
        this.privateKey = privateKey;
    }
}
