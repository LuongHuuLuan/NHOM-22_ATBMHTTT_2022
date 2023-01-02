package util;

import java.io.*;

public class MySignature {
    private String url;
    private int keySize;
    private String phone;
    private String publicKey;
    private String userName;
    private String email;

    public MySignature(String url) {
        this.url = url;
         this.read(url);
    }

    private String readData(String url) {
        String result = "";
        try {
            BufferedReader bufferedReader = new BufferedReader(new FileReader(url));
            String line = bufferedReader.readLine();
            while (line != null) {
                result += line;
                line = bufferedReader.readLine();
            }
            bufferedReader.close();
        } catch (FileNotFoundException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
        return result;
    }

    private void read(String url) {
        String data = readData(url).trim();
        data = data.replace("{", "");
        data = data.replace("}", "");
        String[] keyValues = data.split(",");
        for (int i = 0; i < keyValues.length; i++) {
            if (i == 0) {
                this.keySize = Integer.parseInt(keyValues[i].split(":")[1].trim());
            } else if (i == 1) {
                this.phone = keyValues[i].split(":")[1].replace("\"", "").trim();
            } else if (i == 2) {
                this.publicKey = keyValues[i].split(":")[1].replace("\"", "").trim();
            } else if (i == 3) {
                this.userName = keyValues[i].split(":")[1].replace("\"", "").trim();
            } else {
                this.email = keyValues[i].split(":")[1].replace("\"", "").trim();
            }
        }
    }

    public void delete() {
        System.out.println(url);
        File f = new File(url);
        if (f.exists()) {
            f.delete();
        }
    }

    public int getKeySize() {
        return keySize;
    }

    public void setKeySize(int keySize) {
        this.keySize = keySize;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getPublicKey() {
        return publicKey;
    }

    public void setPublicKey(String publicKey) {
        this.publicKey = publicKey;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
}
