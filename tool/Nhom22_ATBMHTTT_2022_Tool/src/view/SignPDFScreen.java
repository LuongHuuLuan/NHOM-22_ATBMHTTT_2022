package view;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.File;

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

		JButton btnNewButton_1_1 = new JButton("Import thông tin chữ ký");
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
		btnNewButton_2.setBounds(521, 511, 164, 23);
		add(btnNewButton_2);
		btnNewButton_2.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				sign();
			}
		});
		btnNewButton_1.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				loadFile(LOAD_PDF);
			}
		});

	}

	void loadFile(String type) {
		JFileChooser fileChooser = new JFileChooser();
		fileChooser.showOpenDialog(this);
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
	}

	void sign() {
		SignFileService.getInstance().sign(pathPDF, pathSign);
		JOptionPane.showMessageDialog(this, "Đã ký thành công");
	}
}
