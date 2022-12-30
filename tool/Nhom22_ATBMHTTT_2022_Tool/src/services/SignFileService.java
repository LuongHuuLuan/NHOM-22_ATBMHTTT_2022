package services;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.security.InvalidKeyException;
import java.security.KeyFactory;
import java.security.NoSuchAlgorithmException;
import java.security.PrivateKey;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.PKCS8EncodedKeySpec;
import java.security.spec.X509EncodedKeySpec;
import java.util.Base64;

import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;

import org.json.JSONObject;

import com.spire.pdf.PdfDocument;
import com.spire.pdf.attachments.PdfAttachment;

import controller.Hash;
import controller.RSA;
import heppers.Constants;

public class SignFileService {
	private static SignFileService fileService = null;
	private PdfDocument doc;
	private boolean signed = false;// status file is signed yet ?
	private String billEncrypt;
	private PrivateKey priKey;

	// instance SignFileService class
	public static SignFileService getInstance() {
		if (fileService == null) {
			fileService = new SignFileService();
		}
		return fileService;
	}

	// sign on file (attachment file encrypt)
	public void sign(String pathPDF, String pathPriKey) throws IOException, InvalidKeySpecException,
			NoSuchAlgorithmException, InvalidKeyException, IllegalBlockSizeException, BadPaddingException {
		// read file private key by format JSON
		BufferedReader bufferedReader = new BufferedReader(new FileReader(pathPriKey));
		String jsonString = "";
		String line = "";
		while ((line = bufferedReader.readLine()) != null) {
			jsonString += line;
		}
		bufferedReader.close();
		// hashing file PDF
		String hashBill = Hash.getIntance(Constants.SHA_256).hashFile(pathPDF);
		// load JSON
		JSONObject jsonObject = new JSONObject(jsonString);
		// get value of key "privateKey"
		String privateKeyString = (String) jsonObject.get("privateKey");
		// get value of key "keySize"
		int keySize = jsonObject.getInt("keySize");
		// convert from string to private key
		byte[] privateBytes = Base64.getDecoder().decode(privateKeyString.trim());
		PKCS8EncodedKeySpec keySpec = new PKCS8EncodedKeySpec(privateBytes);
		this.priKey = KeyFactory.getInstance(Constants.RSA).generatePrivate(keySpec);
		// encrypt hash of the bill
		String billEncrypt = RSA.getInstance().encrypt(hashBill, Constants.PRIVATE_KEY, this.priKey, keySize);
		// load file PDF
		doc = new PdfDocument();
		doc.loadFromFile(pathPDF);
		signed = true;// set signed is true
		this.billEncrypt = billEncrypt;// assign string encrypt
	}

	// save file signed
	public String saveFileSign(String pathDes) throws IOException {
		if (signed) {
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("billEncrypt", this.billEncrypt);
			jsonObject.put("algorithmHashing", Constants.SHA_256);
			jsonObject.put("algorithm", priKey.getAlgorithm());
			File file = new File(pathDes);
			// file bill saved after encrypt
			String billJsonPath = file.getParent() + "\\bill.json";
			BufferedWriter writer = new BufferedWriter(new FileWriter(billJsonPath));
			writer.write(jsonObject.toString());
			writer.flush();
			writer.close();
			// attachment file bill JSON be saved before
			PdfAttachment attachment = new PdfAttachment(billJsonPath);
			doc.getAttachments().add(attachment);
			doc.saveToFile(pathDes);
			doc.close();
			signed = false;// set signed is false
			return "Lưu thành công";
		}
		return "Lưu thất bại vì file chưa được ký";
	}

}
