package view;

import java.awt.Color;
import java.awt.EventQueue;
import java.awt.Font;
import java.awt.SystemColor;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.border.EmptyBorder;

public class Home extends JFrame {

	private JPanel contentPane;

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					Home frame = new Home();
					frame.setVisible(true);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
	}

	/**
	 * Create the frame.
	 */
	public Home() {
		setTitle("Nhom22_ATBMHTTT_2020_Tool");
		setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
		setBounds(100, 100, 978, 599);
		JPanel contentPane = new JPanel();
		contentPane.setBackground(SystemColor.window);
		contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));

		setContentPane(contentPane);
		contentPane.setLayout(null);
		
		JLabel lblNewLabel_2 = new JLabel("CÔNG CỤ HỖ TRỢ CHỮ KÍ ĐIỆN TỬ");
		lblNewLabel_2.setFont(new Font("Times New Roman", Font.BOLD, 28));
		lblNewLabel_2.setBounds(244, 119, 491, 53);
		contentPane.add(lblNewLabel_2);
		
		JButton btnGenerateSignature = new JButton("Tạo chữ kí điện tử");
		btnGenerateSignature.setForeground(SystemColor.desktop);
		btnGenerateSignature.setFocusPainted(false);
		btnGenerateSignature.setBackground(new Color(130, 204, 221));
		btnGenerateSignature.setFont(new Font("Times New Roman", Font.PLAIN, 18));
		btnGenerateSignature.setBounds(197, 251, 177, 46);
		contentPane.add(btnGenerateSignature);
		
		JButton btnSignPdf = new JButton("Kí văn bản");
		btnSignPdf.setForeground(SystemColor.desktop);
		btnSignPdf.setFocusPainted(false);
		btnSignPdf.setBackground(new Color(0, 210, 211));
		btnSignPdf.setFont(new Font("Times New Roman", Font.PLAIN, 18));
		btnSignPdf.setBounds(509, 251, 153, 46);
		contentPane.add(btnSignPdf);
		
		JButton btnExit = new JButton("Thoát");
		btnExit.setForeground(SystemColor.desktop);
		btnExit.setFocusPainted(false);
		btnExit.setBackground(new Color(229, 80, 57));
		btnExit.setFont(new Font("Times New Roman", Font.PLAIN, 18));
		btnExit.setBounds(739, 469, 147, 46);
		contentPane.add(btnExit);
		
		JButton btnHngDnS = new JButton("Hướng dẫn");
		btnHngDnS.setForeground(SystemColor.desktop);
		btnHngDnS.setFocusPainted(false);
		btnHngDnS.setBackground(new Color(120, 224, 143));
		btnHngDnS.setFont(new Font("Times New Roman", Font.PLAIN, 18));
		btnHngDnS.setBounds(520, 469, 136, 46);
		contentPane.add(btnHngDnS);
		
		JPanel panel = new JPanel();
		panel.setLayout(null);
		panel.setBackground(new Color(174, 186, 198));
		panel.setBounds(0, 0, 964, 75);
		contentPane.add(panel);
		
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
	}

}
