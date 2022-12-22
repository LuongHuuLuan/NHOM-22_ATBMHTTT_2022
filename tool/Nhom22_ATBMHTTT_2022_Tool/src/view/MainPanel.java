package view;

import java.awt.Color;
import java.awt.Font;
import java.awt.SystemColor;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.border.EmptyBorder;

public class MainPanel extends JPanel {

	/**
	 * Create the panel.
	 */
	public MainPanel() {
		setBackground(SystemColor.window);
		setBorder(new EmptyBorder(5, 5, 5, 5));
		setBounds(100, 100, 978, 599);
		setLayout(null);
		JLabel lblNewLabel_2 = new JLabel("CÔNG CỤ HỖ TRỢ CHỮ KÍ ĐIỆN TỬ");
		lblNewLabel_2.setFont(new Font("Times New Roman", Font.BOLD, 28));
		lblNewLabel_2.setBounds(244, 119, 491, 53);
		add(lblNewLabel_2);

		JButton btnGenerateSignature = new JButton("Tạo chữ kí điện tử");
		btnGenerateSignature.setForeground(SystemColor.desktop);
		btnGenerateSignature.setFocusPainted(false);
		btnGenerateSignature.setBackground(new Color(130, 204, 221));
		btnGenerateSignature.setFont(new Font("Times New Roman", Font.PLAIN, 18));
		btnGenerateSignature.setBounds(80, 251, 177, 46);
		add(btnGenerateSignature);
		btnGenerateSignature.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				moveScreen(new CreateSignatureScreen());
			}
		});

		JButton btnSignPdf = new JButton("Kí văn bản");
		btnSignPdf.setForeground(SystemColor.desktop);
		btnSignPdf.setFocusPainted(false);
		btnSignPdf.setBackground(new Color(0, 210, 211));
		btnSignPdf.setFont(new Font("Times New Roman", Font.PLAIN, 18));
		btnSignPdf.setBounds(521, 251, 153, 46);
		add(btnSignPdf);

		JButton btnExit = new JButton("Thoát");
		btnExit.setForeground(SystemColor.desktop);
		btnExit.setFocusPainted(false);
		btnExit.setBackground(new Color(229, 80, 57));
		btnExit.setFont(new Font("Times New Roman", Font.PLAIN, 18));
		btnExit.setBounds(739, 469, 147, 46);
		add(btnExit);

		JButton btnHngDnS = new JButton("Hướng dẫn");
		btnHngDnS.setForeground(SystemColor.desktop);
		btnHngDnS.setFocusPainted(false);
		btnHngDnS.setBackground(new Color(120, 224, 143));
		btnHngDnS.setFont(new Font("Times New Roman", Font.PLAIN, 18));
		btnHngDnS.setBounds(520, 469, 136, 46);
		add(btnHngDnS);

		JPanel panel = new JPanel();
		panel.setLayout(null);
		panel.setBackground(new Color(174, 186, 198));
		panel.setBounds(0, 0, 964, 75);
		add(panel);

		JLabel lblNewLabel = new JLabel("Logo School here");
		lblNewLabel.setFont(new Font("Tahoma", Font.PLAIN, 12));
		lblNewLabel.setBounds(32, 5, 61, 61);
		panel.add(lblNewLabel);

		JLabel lblNewLabel_1 = new JLabel("Trường Đại học Nông Lâm Tp.HCM");
		lblNewLabel_1.setFont(new Font("Segoe UI Light", Font.BOLD, 24));
		lblNewLabel_1.setBounds(121, 5, 466, 36);
		panel.add(lblNewLabel_1);

		JLabel lblNewLabel_1_1 = new JLabel("Khoa CNTT - An toàn và bảo mật hệ thống thông tin");
		lblNewLabel_1_1.setFont(new Font("Segoe UI Light", Font.BOLD, 22));
		lblNewLabel_1_1.setBounds(121, 37, 660, 30);
		panel.add(lblNewLabel_1_1);

		JButton btnXutThngTin = new JButton("Xuất thông tin chữ ký");
		btnXutThngTin.setForeground(SystemColor.desktop);
		btnXutThngTin.setFont(new Font("Times New Roman", Font.PLAIN, 18));
		btnXutThngTin.setFocusPainted(false);
		btnXutThngTin.setBackground(new Color(130, 204, 221));
		btnXutThngTin.setBounds(715, 251, 202, 46);
		add(btnXutThngTin);
	}

	void moveScreen(JPanel panelFoward) {
		JFrame jF = (JFrame) getTopLevelAncestor();
		jF.getContentPane().removeAll();
		jF.setContentPane(panelFoward);
		jF.getContentPane().revalidate();
		jF.getContentPane().repaint();
	}
}
