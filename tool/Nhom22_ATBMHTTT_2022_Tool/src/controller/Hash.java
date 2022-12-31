package controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.math.BigInteger;
import java.security.DigestInputStream;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class Hash {
	public String SHA_224 = "SHA-256";
	String name;
	MessageDigest md;

	public Hash(String name) {
		this.name = name;
		try {
			this.md = MessageDigest.getInstance(this.name);
		} catch (NoSuchAlgorithmException e) {
			System.exit(1);
		}
	}

	public static Hash getIntance(String name) {
		return new Hash(name);
	}

	public String hash(String data) {
		if (this.md == null) {
			return "";
		}
		byte[] out = this.md.digest(data.getBytes());
		BigInteger bi = new BigInteger(1, out);
		return bi.toString(16);

	}

	public String hashFile(String path) {
		if (this.md == null) {
			return "";
		}
		File f = new File(path);
		if (f.exists()) {
			try {
				DigestInputStream dis = new DigestInputStream(new BufferedInputStream(new FileInputStream(f)), md);
				int i=0;
				byte[] buff = new byte[1024];
				do {
					i = dis.read(buff);
				} while (i != -1);
				BigInteger bi = new BigInteger(1, dis.getMessageDigest().digest());
				return bi.toString(16);
			} catch (Exception e) {
				throw new RuntimeException(e);
			}
		}
		return "";
	}
}
