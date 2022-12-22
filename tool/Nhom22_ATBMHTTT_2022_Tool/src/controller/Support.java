package controller;

import org.json.JSONException;
import org.json.JSONObject;
import java.awt.event.ActionEvent;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileWriter;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.util.List;

import javax.swing.JFileChooser;
import javax.swing.JFrame;
import javax.swing.JOptionPane;
import javax.swing.JTextArea;
import javax.swing.JTextField;
import javax.swing.filechooser.FileSystemView;

public class Support {
	private JFrame frame = new JFrame();
	private Hash hash = new Hash("SHA-256");

	public void workWithJchooseFile(ActionEvent e, JTextField userName, JTextField email, JTextField phone,
			JTextArea pub, JTextArea pri, String typeKey) {
		String com = ((ActionEvent) e).getActionCommand();

		if (com.equals("Khởi tạo file chữ kí")) {
			JFileChooser fileChooser = new JFileChooser();
			fileChooser.setFileSelectionMode(JFileChooser.DIRECTORIES_ONLY);
			int option = fileChooser.showSaveDialog(frame);
			if (option == JFileChooser.APPROVE_OPTION) {
				File file = fileChooser.getSelectedFile();
				save(file.getAbsolutePath() + "\\" + "PublicKeyAndDigitalSignature.json", userName, email, phone, pub, "PUBLIC_KEY");
				save(file.getAbsolutePath() + "\\" + "PrivateKeyAndDigitalSignature.json", userName, email, phone, pri, "PRIVATE_KEY");
			}
		} else {
			JFileChooser j = new JFileChooser(FileSystemView.getFileSystemView().getHomeDirectory());
			int r = j.showOpenDialog(null);
			if (r == JFileChooser.APPROVE_OPTION) {
				if (typeKey.equalsIgnoreCase("PUBLIC_KEY")) {
				read(j.getSelectedFile(), pub);
				} else read(j.getSelectedFile(), pri);
			}
		}
	}

	public void save(String fileName, JTextField userName, JTextField email, JTextField phone, JTextArea key,
			String typeKey) {
		JSONObject json = new JSONObject();
		try {
			json.put("userName", hash.hash(userName.getText().trim()));
			json.put("email", hash.hash(email.getText().trim()));
			json.put("phone", hash.hash(phone.getText().trim()));
			if (typeKey.equalsIgnoreCase("PUBLIC_KEY")) {
				json.put("publicKey", hash.hash(key.getText().trim()));
			} else if (typeKey.equalsIgnoreCase("PRIVATE_KEY")) {
				json.put("privateKey", hash.hash(key.getText().trim()));
			}
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
