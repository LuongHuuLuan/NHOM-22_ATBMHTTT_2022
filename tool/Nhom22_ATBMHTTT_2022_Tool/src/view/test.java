package view;

import com.spire.pdf.PdfDocument;
import com.spire.pdf.PdfPageBase;
import com.spire.pdf.attachments.PdfAttachment;
import com.spire.pdf.security.PdfCertificate;
import com.spire.pdf.security.PdfSignature;

public class test {
	public static void main(String[] args) {
		// Create a PdfDocument object

		PdfDocument doc = new PdfDocument();
		doc.loadFromFile("D:\\test\\1.pdf");
		PdfCertificate certificate = new PdfCertificate("D:\\test\\test.pfx", "1234");

//		PdfCertificate certificate = new PdfCertificate("e-iceblue".getBytes());
		PdfSignature pdfSignature = new PdfSignature(doc, doc.getPages().get(doc.getPages().getCount() - 1),
				certificate, "nGƯỜI TA Ở ĐÂU");
		PdfAttachment attachment = new PdfAttachment("D:\\test\\1.json");
		doc.getAttachments().add(attachment);
		doc.saveToFile("D:\\test\\2.pdf");
		doc.close();
		System.out.println("ok");
//		PdfDocument document = new PdfDocument();
//		PdfPageBase pdfPageBase = document.getPages().add();
//		do
	}
}
