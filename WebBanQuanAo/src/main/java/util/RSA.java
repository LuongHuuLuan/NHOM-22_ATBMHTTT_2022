package util;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.security.InvalidKeyException;
import java.security.KeyFactory;
import java.security.NoSuchAlgorithmException;
import java.security.NoSuchProviderException;
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
	// Long add more 1 line
	private static RSA rsa = null;

	public RSA() throws NoSuchProviderException {
		try {
			this.cipher = Cipher.getInstance("RSA/ECB/PKCS1Padding");
		} catch (NoSuchAlgorithmException | NoSuchPaddingException e) {
			e.printStackTrace();
		}
	}

	// Long add some line here :)))))
	public static RSA getInstance() throws NoSuchProviderException {
		if (rsa == null) {
			rsa = new RSA();
		}
		return rsa;
	}
	// Done

	public String encrypt(String text, String type, Object... objects)
			throws InvalidKeyException, IllegalBlockSizeException, BadPaddingException {
		if (type.equalsIgnoreCase("PUBLIC_KEY")) {
			PublicKey publicKey = (PublicKey) objects[0];
			this.cipher.init(Cipher.ENCRYPT_MODE, publicKey);
		} else {
			PrivateKey privateKey = (PrivateKey) objects[0];
			this.cipher.init(Cipher.ENCRYPT_MODE, privateKey);
			System.out.println(privateKey.getEncoded().length);
		}
		// Long add some line here
		int keySize = (int) objects[1];// get key size
		System.out.println("key size " + keySize);
		ByteArrayInputStream byteArrayInputStream = new ByteArrayInputStream(text.getBytes());
		ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
		byte[] buffered = generateByteBuffer(Constants.ENCRYPT, keySize);
		try {
			while (byteArrayInputStream.read(buffered) != -1) {
				byteArrayOutputStream.write(cipher.doFinal(buffered));
			}
			byteArrayOutputStream.flush();
		} catch (IllegalBlockSizeException | BadPaddingException | IOException e) {
			e.printStackTrace();
		}
//		return Base64.getEncoder().encodeToString(cipher.doFinal(text.getBytes()));
		return Base64.getEncoder().encodeToString(byteArrayOutputStream.toByteArray());
//		return new String(byteArrayOutputStream.toByteArray());
	}

	public String decrypt(String text, String type, Object... objects)
			throws InvalidKeyException, IllegalBlockSizeException, BadPaddingException {
		if (type.equalsIgnoreCase(Constants.PUBLIC_KEY)) {
			this.cipher.init(Cipher.DECRYPT_MODE, (PublicKey) objects[0]);
		} else {
			this.cipher.init(Cipher.DECRYPT_MODE, (PrivateKey) objects[0]);
		}
		// Long add some line here :)))
		// decode base64 string to byte array
		byte[] temp = Base64.getDecoder().decode(text);
		int keySize = (int) objects[1];// get key size
		// read all byte
		ByteArrayInputStream byteArrayInputStream = new ByteArrayInputStream(temp);
		ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
		byte[] buffered = generateByteBuffer(Constants.DECRYPT, keySize);
		try {
			while (byteArrayInputStream.read(buffered) != -1) {
				byteArrayOutputStream.write(cipher.doFinal(buffered));
			}
//			return new String(Base64.getEncoder().encode(byteArrayOutputStream.toByteArray()));
			return new String(byteArrayOutputStream.toByteArray());
		} catch (IllegalBlockSizeException | BadPaddingException | IOException e) {
			e.printStackTrace();
			return "Error";
		}
//		return new String(cipher.doFinal(Base64.getDecoder().decode(text.getBytes())));
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

	// Long add some line here :))))
	/*
	 * - this method generate byte buffer to read - With mode encrypt then create a
	 * - byte array: + key size 1024 then byte array size is 128 -11 = 117 (padding)
	 * + key size 2048 then byte array size is 256 - 11 = 245 (padding) - With mode
	 * - decrypt then create a byte array: + key size 1024 then byte array size is
	 * 128 + key size 2048 then byte array size is 256
	 */
	public byte[] generateByteBuffer(String type, int keySize) {
		if (type.equals(Constants.ENCRYPT)) {
			return new byte[keySize == 512 ? 53 : keySize == 1024 ? 117 : keySize == 2048 ? 245 : 501];
		} else {
			return new byte[keySize == 512 ? 64 : keySize == 1024 ? 128 : keySize == 2048 ? 256 : 512];
		}
	}
}
