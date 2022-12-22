package view;

import com.spire.pdf.PdfDocument;
import com.spire.pdf.security.PdfCertificate;
import com.spire.pdf.security.PdfCertificationFlags;
import com.spire.pdf.security.PdfSignature;

public class test {
	public static void main(String[] args) {
		// Create a PdfDocument object

		PdfDocument doc = new PdfDocument();
		doc.loadFromFile("D:\\test\\1.pdf");
		PdfCertificate certificate = new PdfCertificate("D:\\pdf_java\\samples\\data\\gary.pfx", "e-iceblue");
		
//		PdfCertificate certificate = new PdfCertificate("e-iceblue".getBytes());
		PdfSignature pdfSignature = new PdfSignature(doc, doc.getPages().get(doc.getPages().getCount() - 1), certificate, "nguyễn dũy long");
		pdfSignature.setDocumentPermissions(PdfCertificationFlags.Forbid_Changes);
		pdfSignature.setDocumentPermissions(PdfCertificationFlags.Allow_Form_Fill);
		doc.saveToFile("D:\\test\\2.pdf");
		doc.close();
		System.out.println("ok");

	}
}
