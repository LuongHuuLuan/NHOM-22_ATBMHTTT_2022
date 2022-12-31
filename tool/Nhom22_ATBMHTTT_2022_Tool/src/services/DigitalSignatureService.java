package services;

import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.NoSuchAlgorithmException;
import java.security.PrivateKey;
import java.security.PublicKey;

import javax.crypto.Cipher;
import javax.crypto.NoSuchPaddingException;

public class DigitalSignatureService {
	private Cipher cipher;
	private KeyPair keyPair;
	private PublicKey publicKey;
	private PrivateKey privateKey;

	public DigitalSignatureService() {
		try {
			cipher = Cipher.getInstance("RSA/ECB/PKCS1Padding");
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		} catch (NoSuchPaddingException e) {
			e.printStackTrace();
		}
	}
	
	/*
	 * create key
	 */
	public void createKey(int keySize) {
		try {
			KeyPairGenerator generatorKeyPairGenerator = KeyPairGenerator.getInstance("RSA");
			generatorKeyPairGenerator.initialize(keySize);
			keyPair = generatorKeyPairGenerator.generateKeyPair();
			publicKey = keyPair.getPublic();
			privateKey = keyPair.getPrivate();
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
	}

	void createSignature() {
		
	}
}
