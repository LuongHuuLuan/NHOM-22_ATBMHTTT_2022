package controller;

import java.awt.event.ActionEvent;
import java.io.File;
import java.io.FileWriter;
import java.io.PrintWriter;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.util.List;

import javax.swing.JFileChooser;
import javax.swing.JFrame;
import javax.swing.JOptionPane;
import javax.swing.JTextArea;
import javax.swing.JTextField;
import javax.swing.filechooser.FileNameExtensionFilter;
import javax.swing.filechooser.FileSystemView;

import org.json.JSONException;
import org.json.JSONObject;

import heppers.Constants;

public class Support {
	private JFrame frame = new JFrame();
	private Hash hash = new Hash(Constants.SHA_256);

	public void workWithJchooseFile(ActionEvent e, JTextField userName, JTextField email, JTextField phone,
			JTextArea pub, JTextArea pri, String typeKey, int keySize) {
		String com = ((ActionEvent) e).getActionCommand();

		if (com.equals("Khởi tạo file chữ kí")) {
			JFileChooser fileChooser = new JFileChooser();
			fileChooser.addChoosableFileFilter(new FileNameExtensionFilter("PDF Documents", "pdf"));
	        fileChooser.addChoosableFileFilter(new FileNameExtensionFilter("MS Office Documents", "docx", "xlsx", "pptx"));
	        fileChooser.addChoosableFileFilter(new FileNameExtensionFilter("Images", "jpg", "png", "gif", "bmp"));
	 
	        fileChooser.setAcceptAllFileFilterUsed(true);
			fileChooser.setFileSelectionMode(JFileChooser.DIRECTORIES_ONLY);
			int option = fileChooser.showSaveDialog(frame);
			if (option == JFileChooser.APPROVE_OPTION) {
				File file = fileChooser.getSelectedFile();
				save(file.getAbsolutePath() + "\\" + "PublicKeyAndDigitalSignature.json", userName, email, phone, pub,
						Constants.PUBLIC_KEY, keySize);
				save(file.getAbsolutePath() + "\\" + "PrivateKeyAndDigitalSignature.json", userName, email, phone, pri,
						Constants.PRIVATE_KEY, keySize);
				JOptionPane.showMessageDialog(frame,
		                "Lưu file thành công tại thư mục: " + file.getAbsolutePath(),
		                "Thành công",
		                JOptionPane.INFORMATION_MESSAGE);
			}
		} else {
			JFileChooser j = new JFileChooser(FileSystemView.getFileSystemView().getHomeDirectory());
			int r = j.showOpenDialog(null);
			if (r == JFileChooser.APPROVE_OPTION) {
				if (typeKey.equalsIgnoreCase(Constants.PUBLIC_KEY)) {
					read(j.getSelectedFile(), pub);
				} else
					read(j.getSelectedFile(), pri);
			}
		}
	}

	public void save(String fileName, JTextField userName, JTextField email, JTextField phone, JTextArea key,
			String typeKey, int keySize) {
		JSONObject json = new JSONObject();
		try {
			json.put("userName", hash.hash(userName.getText().trim()));
			json.put("email", hash.hash(email.getText().trim()));
			json.put("phone", hash.hash(phone.getText().trim()));
			if (typeKey.equalsIgnoreCase(Constants.PUBLIC_KEY)) {
				json.put("publicKey", key.getText().trim());
			} else if (typeKey.equalsIgnoreCase(Constants.PRIVATE_KEY)) {
				json.put("privateKey", key.getText().trim());
			}
			json.put("keySize", keySize);
//			json.put("phone", List.of("Mountain View", "Los Angeles", "New York"));
		} catch (JSONException e) {
			JOptionPane.showMessageDialog(frame, "Lỗi: " + e.getMessage(), "Có lỗi rồi bạn ơi!",
					JOptionPane.ERROR_MESSAGE);
		}

		try (PrintWriter out = new PrintWriter(new FileWriter(fileName))) {
			out.write(json.toString());
		} catch (Exception e) {
			JOptionPane.showMessageDialog(frame, "Lỗi: " + e.getMessage(), "Có lỗi rồi bạn ơi!",
					JOptionPane.ERROR_MESSAGE);
		}
	}

	public void read(File file, JTextArea textArea) {
		String result = "";
		if (file.getName().endsWith(".txt")) {
			try {
				List<String> allText = Files.readAllLines(file.toPath(), StandardCharsets.UTF_8);
				for (String line : allText) {
					result += line;
				}
				textArea.setText(result);
			} catch (Exception e) {
				JOptionPane.showMessageDialog(frame, e.getMessage(), "Lỗi", JOptionPane.ERROR_MESSAGE);
			}
		} else {
			JOptionPane.showMessageDialog(frame, "Hiện tại hệ thống chỉ hỗ trợ đọc file text", "Chú ý",
					JOptionPane.INFORMATION_MESSAGE);
		}
	}
}
