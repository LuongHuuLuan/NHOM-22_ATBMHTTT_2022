package controller;

import com.spire.pdf.PdfDocument;
import com.spire.pdf.attachments.*;
import java.io.*;

public class getAllAttachments {
	public static void main(String[] args) throws Exception {

	}

	public String getSign(String pdfUrl) throws IOException {
		// Create a new PDF document.
		PdfDocument pdf = new PdfDocument();
		// Load the file from disk.
		pdf.loadFromFile("libs/a.pdf");
		// Get a collection of attachments on the PDF document.
		PdfAttachmentCollection collection = pdf.getAttachments();
		// Save all the attachments to the files.
		String fileName = collection.get(0).getFileName();
		File file = new File(fileName);
		ByteArrayInputStream bais = new ByteArrayInputStream(collection.get(0).getData());
		BufferedReader reader = new BufferedReader(new InputStreamReader(bais));

		String line = reader.readLine();
		String content = "";
		while (line != null) {
			content += line;
			line = reader.readLine();
		}
		reader.close();
		
		content = content.replace("{", "");
		content = content.replace("}", "");
        String[] keyValues = content.split(",");
        String sign = keyValues[0].split(":")[1].replace("\"", "").trim();
        return sign;
	}
}
