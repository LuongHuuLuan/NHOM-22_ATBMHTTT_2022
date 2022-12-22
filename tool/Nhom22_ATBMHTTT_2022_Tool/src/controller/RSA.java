package controller;

import java.security.InvalidKeyException;
import java.security.KeyFactory;
import java.security.NoSuchAlgorithmException;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.PKCS8EncodedKeySpec;
import java.security.spec.X509EncodedKeySpec;
import java.util.Base64;

import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.swing.JTextArea;

public class RSA {
	private Cipher cipher;

	public RSA() {
		try {
			this.cipher = Cipher.getInstance("RSA");
		} catch (NoSuchAlgorithmException | NoSuchPaddingException e) {
			e.printStackTrace();
		}
	}

	public String encrypt(String text, String type, Object... objects)
			throws InvalidKeyException, IllegalBlockSizeException, BadPaddingException {
		if (type.equalsIgnoreCase("PUBLIC_KEY")) {
			this.cipher.init(Cipher.ENCRYPT_MODE, (PublicKey) objects[0]);
		} else {
			this.cipher.init(Cipher.ENCRYPT_MODE, (PrivateKey) objects[0]);
		}
		return Base64.getEncoder().encodeToString(cipher.doFinal(text.getBytes()));
	}

	public String decrypt(String text, String type, Object... objects)
			throws InvalidKeyException, IllegalBlockSizeException, BadPaddingException {
		if (type.equalsIgnoreCase("PUBLIC_KEY")) {
			this.cipher.init(Cipher.DECRYPT_MODE, (PublicKey) objects[0]);
		} else {
			this.cipher.init(Cipher.DECRYPT_MODE, (PrivateKey) objects[0]);
		}
		return new String(cipher.doFinal(Base64.getDecoder().decode(text.getBytes())));
	}

	public void encryptKeyText(JTextArea textIn, JTextArea textKey, JTextArea textOut, String typeKey)
			throws InvalidKeySpecException, NoSuchAlgorithmException, InvalidKeyException, IllegalBlockSizeException,
			BadPaddingException {
		if (typeKey.equalsIgnoreCase("PUBLIC_KEY")) {
			byte[] publicBytes = Base64.getDecoder().decode(textKey.getText().trim());
			X509EncodedKeySpec keySpec = new X509EncodedKeySpec(publicBytes);
			PublicKey pubKey = KeyFactory.getInstance("RSA").generatePublic(keySpec);
			textOut.setText(encrypt(textIn.getText(), "PUBLIC_KEY", pubKey));
		} else {
			byte[] clear = Base64.getDecoder().decode(textKey.getText().trim());
			PKCS8EncodedKeySpec keySpec = new PKCS8EncodedKeySpec(clear);
			KeyFactory fact = KeyFactory.getInstance("RSA");
			PrivateKey priKey = fact.generatePrivate(keySpec);
			textOut.setText(encrypt(textIn.getText(), "PRIVATE_KEY", priKey));
		}
	}

	public void decryptKeyText(JTextArea textIn, JTextArea textKey, JTextArea textOut, String typeKey)
			throws InvalidKeySpecException, NoSuchAlgorithmException, InvalidKeyException, IllegalBlockSizeException,
			BadPaddingException {
		if (typeKey.equalsIgnoreCase("PUBLIC_KEY")) {
			byte[] publicBytes = Base64.getDecoder().decode(textKey.getText().trim());
			X509EncodedKeySpec keySpec = new X509EncodedKeySpec(publicBytes);
			PublicKey pubKey = KeyFactory.getInstance("RSA").generatePublic(keySpec);
			textOut.setText(decrypt(textIn.getText(), "PUBLIC_KEY", pubKey));
		} else {
			byte[] clear = Base64.getDecoder().decode(textKey.getText().trim());
			PKCS8EncodedKeySpec keySpec = new PKCS8EncodedKeySpec(clear);
			KeyFactory fact = KeyFactory.getInstance("RSA");
			PrivateKey priKey = fact.generatePrivate(keySpec);
			textOut.setText(decrypt(textIn.getText(), "PRIVATE_KEY", priKey));
		}
	}
}
