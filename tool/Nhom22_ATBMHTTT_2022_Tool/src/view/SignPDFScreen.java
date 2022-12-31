package view;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.File;
import java.io.IOException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;

import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;
import javax.swing.JButton;
import javax.swing.JFileChooser;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.border.EmptyBorder;

import services.SignFileService;

public class SignPDFScreen extends JPanel {
	private JLabel lblNewLabel;
	private JLabel lblNewLabel_1;
	private final String LOAD_PDF = "LOAD_PDF";
	private final String LOAD_SIGN = "LOAD_SIGN";
	private final String SAVE_FILE_SIGN = "SAVE_FILE_SIGN";
	private String pathPDF;
	private String pathSign;

	/**
	 * Create the panel.
	 */
	public SignPDFScreen() {
		setBorder(new EmptyBorder(5, 5, 5, 5));
		setLayout(null);
		setBounds(100, 100, 978, 599);

		JButton btnNewButton = new JButton("Trở về");
		btnNewButton.setBounds(777, 511, 89, 23);
		add(btnNewButton);
		btnNewButton.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				JFrame jF = (JFrame) getTopLevelAncestor();
				jF.getContentPane().removeAll();
				jF.setContentPane(new MainPanel());
				jF.getContentPane().revalidate();
				jF.getContentPane().repaint();
			}
		});

		JButton btnNewButton_1 = new JButton("Import file PDF");
		btnNewButton_1.setBounds(67, 72, 180, 23);
		add(btnNewButton_1);

		lblNewLabel = new JLabel("Chưa có file nào được chọn");
		lblNewLabel.setBounds(381, 81, 373, 14);
		add(lblNewLabel);

		JButton btnNewButton_1_1 = new JButton("Import khóa riêng tư");
		btnNewButton_1_1.setBounds(67, 153, 180, 23);
		add(btnNewButton_1_1);
		btnNewButton_1_1.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				loadFile(LOAD_SIGN);
			}
		});

		lblNewLabel_1 = new JLabel("Chưa có file nào được chọn");
		lblNewLabel_1.setBounds(381, 157, 373, 14);
		add(lblNewLabel_1);

		JButton btnNewButton_2 = new JButton("Ký lên văn bản");
		btnNewButton_2.setBounds(355, 511, 164, 23);
		add(btnNewButton_2);

		JButton btnNewButton_2_1 = new JButton("Lưu văn bản đã ký");
		btnNewButton_2_1.setBounds(546, 511, 164, 23);
		add(btnNewButton_2_1);
		btnNewButton_2_1.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				try {
					saveFile();
				} catch (IOException e1) {
					// TODO Auto-generated catch block
					JOptionPane.showMessageDialog(getParent(), e1.getMessage());
				}
			}
		});
		btnNewButton_2.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				try {
					sign();
				} catch (IOException e1) {
					// TODO Auto-generated catch block
					JOptionPane.showMessageDialog(getParent(), e1.getMessage());
				} catch (InvalidKeyException e1) {
					// TODO Auto-generated catch block
					JOptionPane.showMessageDialog(getParent(), e1.getMessage());
				} catch (InvalidKeySpecException e1) {
					// TODO Auto-generated catch block
					JOptionPane.showMessageDialog(getParent(), e1.getMessage());
				} catch (NoSuchAlgorithmException e1) {
					// TODO Auto-generated catch block
					JOptionPane.showMessageDialog(getParent(), e1.getMessage());
				} catch (IllegalBlockSizeException e1) {
					// TODO Auto-generated catch block
					JOptionPane.showMessageDialog(getParent(), e1.getMessage());
				} catch (BadPaddingException e1) {
					// TODO Auto-generated catch block
					JOptionPane.showMessageDialog(getParent(), e1.getMessage());
				}
			}
		});
		btnNewButton_1.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				loadFile(LOAD_PDF);
			}
		});

	}

	// load file PDF or file attachment
	// input: type action file need load
	void loadFile(String type) {
		JFileChooser fileChooser = new JFileChooser();
		fileChooser.showOpenDialog(this);
		try {
			File file = fileChooser.getSelectedFile();
			JOptionPane optionPane = new JOptionPane();
			String extFile = file.getName().split("\\.")[1];
			if (extFile.equals("pdf") && type.equals(LOAD_PDF)) {
				lblNewLabel.setText(file.getName());
				pathPDF = file.getAbsolutePath();
				optionPane.showMessageDialog(this, "ĐÃ LOAD FILE");
			} else if (type.equals(LOAD_SIGN)) {
				lblNewLabel_1.setText(file.getName());
				pathSign = file.getAbsolutePath();
				optionPane.showMessageDialog(this, "ĐÃ LOAD FILE");
			} else {
				optionPane.showMessageDialog(this, "FILE ĐƯỢC CHỌN KHÔNG PHẢI FILE PDF");
			}
		} catch (NullPointerException e) {
			JOptionPane.showMessageDialog(getParent(), e.getMessage());
		}
	}

	// save file after signed
	void saveFile() throws IOException {
		JFileChooser fileChooser = new JFileChooser();
		fileChooser.showSaveDialog(this);
		String path = fileChooser.getCurrentDirectory() + "\\" + fileChooser.getSelectedFile().getName();
		String message = SignFileService.getInstance().saveFileSign(path);
		JOptionPane.showMessageDialog(this, message);
	}

	// sign on file PDF (attachment a file)
	void sign() throws IOException, InvalidKeyException, InvalidKeySpecException, NoSuchAlgorithmException,
			IllegalBlockSizeException, BadPaddingException {
		if (pathPDF == null || pathSign == null) {
			JOptionPane.showMessageDialog(this, "Vui lòng chọn đầy đủ");
		} else {
			SignFileService.getInstance().sign(pathPDF, pathSign);
			JOptionPane.showMessageDialog(this, "Đã ký thành công");
		}
	}
}
