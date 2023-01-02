package util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;

public class FileUtil {
    public static void copyFile(String sFile, String dFile, boolean moved) {
        File sourceFile = new File(sFile);
        if (sourceFile.exists()) {
            File destFile = new File(dFile);
            long countByte = sourceFile.length();
            try {
                FileInputStream fis = new FileInputStream(sourceFile);
                FileOutputStream fos = new FileOutputStream(destFile);
                byte[] b = new byte[(int) countByte];
                while (fis.read(b) != -1) {
                    fos.write(b);
                }
                fis.close();
                fos.close();
                if (moved) {
                    sourceFile.delete();
                }
            } catch (Exception e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }
    }
}
