package services;

import com.spire.pdf.PdfDocument;
import com.spire.pdf.attachments.PdfAttachment;

public class SignFileService {
	private static SignFileService fileService = null;

	public static SignFileService getInstance() {
		if (fileService == null) {
			fileService = new SignFileService();
		}
		return fileService;
	}

	public void sign(String pathPDF, String pathSign) {
		PdfDocument doc = new PdfDocument();
		doc.loadFromFile(pathPDF);
		PdfAttachment attachment = new PdfAttachment(pathSign);
		doc.getAttachments().add(attachment);
		doc.saveToFile("D:\\test\\2.pdf");
		doc.close();
	}
}
