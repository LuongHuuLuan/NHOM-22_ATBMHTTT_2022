package view;

import java.awt.Color;
import java.awt.Desktop;
import java.awt.Font;
import java.awt.SystemColor;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.File;
import java.io.IOException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.security.NoSuchProviderException;
import java.security.spec.InvalidKeySpecException;

import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;
import javax.swing.JButton;
import javax.swing.JFileChooser;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JSeparator;

import org.jpedal.examples.viewer.Commands;
import org.jpedal.examples.viewer.Viewer;

import services.SignFileService;
import javax.swing.border.LineBorder;
import javax.swing.filechooser.FileNameExtensionFilter;

public class SignPDFScreen extends JPanel {
	private JLabel lblNewLabel;
	private JLabel lblNewLabel_1;
	private final String LOAD_PDF = "LOAD_PDF";
	private final String LOAD_SIGN = "LOAD_SIGN";
	private final String SAVE_FILE_SIGN = "SAVE_FILE_SIGN";
	private String pathPDF = null;
	private String pathSign;
	private JButton btn_TabBrowser_1;
	private JButton btn_TabBrowser;

	/**
	 * Create the panel.
	 */
	public SignPDFScreen() {
		setBackground(SystemColor.window);
		setBorder(null);
		setBounds(100, 100, 978, 599);
		setLayout(null);

		JButton btnNewButton = new JButton("Trở về");
		btnNewButton.setFont(new Font("Times New Roman", Font.PLAIN, 18));
		btnNewButton.setForeground(SystemColor.text);
		btnNewButton.setBackground(new Color(231, 76, 60));
		btnNewButton.setBounds(757, 475, 107, 37);
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
		btnNewButton_1.setFocusPainted(false);
		btnNewButton_1.setBorder(null);
		btnNewButton_1.setBackground(new Color(236, 240, 241));
		btnNewButton_1.setFont(new Font("Times New Roman", Font.PLAIN, 16));
		btnNewButton_1.setBounds(41, 150, 164, 26);
		add(btnNewButton_1);

		lblNewLabel = new JLabel("Chưa có file nào được chọn");
		lblNewLabel.setFont(new Font("Times New Roman", Font.PLAIN, 16));
		lblNewLabel.setBounds(241, 150, 202, 26);
		add(lblNewLabel);

		JButton btnNewButton_1_1 = new JButton("Import khóa riêng tư");
		btnNewButton_1_1.setFocusPainted(false);
		btnNewButton_1_1.setBorder(null);
		btnNewButton_1_1.setBackground(new Color(236, 240, 241));
		btnNewButton_1_1.setFont(new Font("Times New Roman", Font.PLAIN, 16));
		btnNewButton_1_1.setBounds(41, 241, 164, 26);
		add(btnNewButton_1_1);
		btnNewButton_1_1.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				loadFile(LOAD_SIGN);
			}
		});

		lblNewLabel_1 = new JLabel("Chưa có file nào được chọn");
		lblNewLabel_1.setFont(new Font("Times New Roman", Font.PLAIN, 16));
		lblNewLabel_1.setBounds(239, 241, 231, 26);
		add(lblNewLabel_1);

		JButton btnNewButton_2 = new JButton("Ký lên văn bản");
		btnNewButton_2.setFont(new Font("Times New Roman", Font.PLAIN, 16));
		btnNewButton_2.setBounds(223, 366, 200, 26);
		add(btnNewButton_2);

		JButton btnNewButton_2_1 = new JButton("Lưu văn bản đã ký");
		btnNewButton_2_1.setFont(new Font("Times New Roman", Font.PLAIN, 16));
		btnNewButton_2_1.setBounds(552, 366, 200, 26);
		add(btnNewButton_2_1);

		JSeparator separator = new JSeparator();
		separator.setBounds(234, 180, 209, 2);
		add(separator);

		JSeparator separator_1 = new JSeparator();
		separator_1.setBounds(229, 271, 214, 2);
		add(separator_1);

		btn_TabBrowser = new JButton("Preview Tab Browser");
		btn_TabBrowser.setEnabled(false);
		btn_TabBrowser.setFocusPainted(false);
		btn_TabBrowser.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				try {
					Desktop desktop = Desktop.getDesktop();
					desktop.open(new File(pathPDF));
				} catch (IOException e1) {
					JOptionPane.showMessageDialog(getParent(), e1.getMessage());
				}
			}
		});
		btn_TabBrowser.setFont(new Font("Times New Roman", Font.PLAIN, 16));
		btn_TabBrowser.setBounds(733, 150, 200, 26);
		add(btn_TabBrowser);

		btn_TabBrowser_1 = new JButton("Preview PDF");
		btn_TabBrowser_1.setEnabled(false);
		btn_TabBrowser_1.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				DemoPDFScreen demo = new DemoPDFScreen(pathPDF);
			}
		});
		btn_TabBrowser_1.setFont(new Font("Times New Roman", Font.PLAIN, 16));
		btn_TabBrowser_1.setFocusPainted(false);
		btn_TabBrowser_1.setBounds(509, 150, 200, 26);
		add(btn_TabBrowser_1);
		
		JPanel panel = new JPanel();
		panel.setLayout(null);
		panel.setBackground(new Color(174, 186, 198));
		panel.setBounds(0, 0, 978, 75);
		add(panel);
		
		JLabel lblNewLabel_2 = new JLabel("Logo School here");
		lblNewLabel_2.setFont(new Font("Tahoma", Font.PLAIN, 12));
		lblNewLabel_2.setBounds(32, 5, 61, 61);
		panel.add(lblNewLabel_2);
		
		JLabel lblNewLabel_1_1 = new JLabel("Trường Đại học Nông Lâm Tp.HCM");
		lblNewLabel_1_1.setFont(new Font("Segoe UI Light", Font.BOLD, 24));
		lblNewLabel_1_1.setBounds(121, 5, 466, 36);
		panel.add(lblNewLabel_1_1);
		
		JLabel lblNewLabel_1_1_1 = new JLabel("Khoa CNTT - An toàn và bảo mật hệ thống thông tin");
		lblNewLabel_1_1_1.setFont(new Font("Segoe UI Light", Font.BOLD, 22));
		lblNewLabel_1_1_1.setBounds(121, 37, 660, 30);
		panel.add(lblNewLabel_1_1_1);
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
				} catch (NoSuchProviderException e1) {
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
//		fileChooser.setFileSelectionMode(JFileChooser.FILES_ONLY);
//		fileChooser.setFileFilter(new FileNameExtensionFilter("PDF Documents", "pdf"));
//        fileChooser.setFileFilter(new FileNameExtensionFilter("MS Office Documents", "docx", "xlsx", "pptx"));
//        fileChooser.setFileFilter(new FileNameExtensionFilter("Images", "jpg", "png", "gif", "bmp"));
//        fileChooser.addChoosableFileFilter(new FileNameExtensionFilter("PDF Documents", "pdf"));
//        fileChooser.addChoosableFileFilter(new FileNameExtensionFilter("MS Office Documents", "docx", "xlsx", "pptx"));
//        fileChooser.addChoosableFileFilter(new FileNameExtensionFilter("Images", "jpg", "png", "gif", "bmp"));
		fileChooser.setAcceptAllFileFilterUsed(false);
		FileNameExtensionFilter pdf = new FileNameExtensionFilter("PDF Documents", "pdf");
		FileNameExtensionFilter ms = new FileNameExtensionFilter("MS Office Documents", "docx", "xlsx", "pptx");
		FileNameExtensionFilter img = new FileNameExtensionFilter("Images", "jpg", "png", "gif", "bmp");
		fileChooser.addChoosableFileFilter(pdf);
		fileChooser.addChoosableFileFilter(ms);
		fileChooser.addChoosableFileFilter(img);
//        fileChooser.setAcceptAllFileFilterUsed(true);
		fileChooser.showOpenDialog(this);
		try {
			File file = fileChooser.getSelectedFile();
			JOptionPane optionPane = new JOptionPane();
			String extFile = file.getName().split("\\.")[1];
			if (extFile.equals("pdf") && type.equals(LOAD_PDF)) {
				lblNewLabel.setText(file.getName());
				pathPDF = file.getAbsolutePath();
				optionPane.showMessageDialog(this, "ĐÃ LOAD FILE");
				btn_TabBrowser_1.setEnabled(true);
				btn_TabBrowser.setEnabled(true);
//				DemoPDFScreen demo = new DemoPDFScreen(pathPDF);
//				demo.setPathPDF(pathPDF);
//				System.setProperty("org.jpedal.userControlledLAF", "javax.swing.plaf.metal.MetalLookAndFeel");
//				Viewer viewer = new Viewer(panel,null);
//				viewer.setupViewer();
//				viewer.executeCommand(Commands.OPENFILE, new Object[]{pathPDF});
//				Desktop desktop = Desktop.getDesktop();
//			    desktop.open(file);
//				openpdf(pathPDF);

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

//	void openpdf(String file) {
//		try {
//			SwingController control = new SwingController();
//			SwingViewBuilder factry = new SwingViewBuilder(control);
//			panel = factry.buildViewerPanel();
//			ComponentKeyBinding.install(control, panel);
//			control.getDocumentViewController().setAnnotationCallback(
//					new org.icepdf.ri.common.MyAnnotationCallback(control.getDocumentViewController()));
//			control.openDocument(file);
//			scrollPane.add(panel);
//		} catch (Exception ex) {
//			JOptionPane.showMessageDialog(this, "Cannot Load Pdf");
//		}
//	}

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
			IllegalBlockSizeException, BadPaddingException, NoSuchProviderException {
		if (pathPDF == null || pathSign == null) {
			JOptionPane.showMessageDialog(this, "Vui lòng chọn đầy đủ");
		} else {
			SignFileService.getInstance().sign(pathPDF, pathSign);
			JOptionPane.showMessageDialog(this, "Đã ký thành công");
		}
	}
}
