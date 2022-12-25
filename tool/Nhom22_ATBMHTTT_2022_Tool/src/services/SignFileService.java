package services;

import com.spire.pdf.PdfDocument;
import com.spire.pdf.attachments.PdfAttachment;

public class SignFileService {
	private static SignFileService fileService = null;
	private PdfDocument doc;
	private boolean signed = false;//status file is signed yet ?

	//instance SignFileService class
	public static SignFileService getInstance() {
		if (fileService == null) {
			fileService = new SignFileService();
		}
		return fileService;
	}

	
	//sign on file (attachment file encrypt)
	public void sign(String pathPDF, String pathSign) {
		doc = new PdfDocument();
		doc.loadFromFile(pathPDF);
		PdfAttachment attachment = new PdfAttachment(pathSign);
		doc.getAttachments().add(attachment);
		signed = !signed;// set signed is true
	}

	//save file signed
	public String saveFileSign(String pathDes) {
		if (signed) {
			doc.saveToFile(pathDes);
			doc.close();
			signed = !signed;// set signed is false
			return "Lưu thành công";
		}
		return "Lưu thất bại vì file chưa được ký";
	}
}
