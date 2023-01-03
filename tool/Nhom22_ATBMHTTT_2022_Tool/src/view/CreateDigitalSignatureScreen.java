package view;

import java.awt.Color;
import java.awt.EventQueue;
import java.awt.Font;
import java.awt.SystemColor;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.security.NoSuchProviderException;
import java.util.Base64;

import javax.swing.DefaultComboBoxModel;
import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;
import javax.swing.JTextField;
import javax.swing.border.EmptyBorder;
import javax.swing.border.EtchedBorder;
import javax.swing.border.LineBorder;
import javax.swing.border.TitledBorder;

import controller.Hash;
import controller.Key;
import controller.RSA;
import controller.Support;
import heppers.Constants;

public class CreateDigitalSignatureScreen extends JPanel {
	private Key key = new Key();
	private RSA rsa;
	private Hash hash = new Hash("SHA-256");
	private JTextArea textAreaKhoaCongKhai;
	private JTextArea textAreaKhoaBiMat;
	private Support support = new Support();
	private JPanel contentPane;
	private JTextField textField_UserName;
	private JTextField textField_Email;
	private JTextField textField_Phone;
	private JFrame frame = new JFrame();

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					CreateDigitalSignatureScreen frame = new CreateDigitalSignatureScreen();
					frame.setVisible(true);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
	}

	/**
	 * Create the frame.
	 * @throws NoSuchProviderException 
	 */
	public CreateDigitalSignatureScreen() throws NoSuchProviderException {
//		setTitle("Tạo chữ kí điện tử");
//		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
//		setBounds(100, 100, 978, 599);
		rsa =  new RSA();
		setBorder(new EmptyBorder(5, 5, 5, 5));
		setLayout(null);
		setBounds(100, 100, 978, 599);
//		contentPane = new JPanel();
		setBackground(SystemColor.window);

//		setContentPane(contentPane);
//		setLayout(null);

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

		JPanel panel_1 = new JPanel();
		panel_1.setBackground(SystemColor.window);
		panel_1.setFont(new Font("Tahoma", Font.PLAIN, 17));
		panel_1.setBorder(new TitledBorder(new EtchedBorder(EtchedBorder.LOWERED, null, null), "T\u1EA1o Kh\u00F3a",
				TitledBorder.LEADING, TitledBorder.TOP, new Font("Segoe UI Light", Font.BOLD, 16),
				new Color(179, 179, 179)));
		panel_1.setBounds(32, 95, 438, 442);
		add(panel_1);
		panel_1.setLayout(null);

		JLabel lblNewLabel_2 = new JLabel("Độ dài Key");
		lblNewLabel_2.setFont(new Font("Times New Roman", Font.PLAIN, 18));
		lblNewLabel_2.setBounds(20, 36, 94, 26);
		panel_1.add(lblNewLabel_2);

		JComboBox comboBox = new JComboBox();
		comboBox.setFont(new Font("Tahoma", Font.PLAIN, 15));
		comboBox.setModel(new DefaultComboBoxModel(new String[] { "1024"}));
		comboBox.setBounds(124, 36, 94, 27);
		panel_1.add(comboBox);

		JLabel lblNewLabel_3 = new JLabel("Khóa công khai");
		lblNewLabel_3.setFont(new Font("Times New Roman", Font.PLAIN, 18));
		lblNewLabel_3.setBounds(20, 82, 123, 26);
		panel_1.add(lblNewLabel_3);

		JButton btnKhoaCongKhai = new JButton("Thêm File");
		btnKhoaCongKhai.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				//Long a line here
				int keySize = Integer.parseInt((String) comboBox.getItemAt(comboBox.getSelectedIndex()));
				//done
				support.workWithJchooseFile(e, textField_UserName, textField_Email, textField_Phone,
						textAreaKhoaCongKhai, textAreaKhoaBiMat, Constants.PUBLIC_KEY, keySize);
			}
		});
		btnKhoaCongKhai.setFocusPainted(false);
		btnKhoaCongKhai.setBorder(null);
		btnKhoaCongKhai.setBackground(new Color(236, 240, 241));
		btnKhoaCongKhai.setFont(new Font("Times New Roman", Font.PLAIN, 16));
		btnKhoaCongKhai.setBounds(146, 84, 96, 26);
		panel_1.add(btnKhoaCongKhai);

		JScrollPane scrollPane = new JScrollPane();
		scrollPane.setBorder(new LineBorder(new Color(192, 192, 192), 1, true));
		scrollPane.setBounds(20, 118, 396, 120);
		panel_1.add(scrollPane);

		textAreaKhoaCongKhai = new JTextArea();
		textAreaKhoaCongKhai.setFont(new Font("Times New Roman", Font.PLAIN, 16));
		textAreaKhoaCongKhai.setLineWrap(true);
		scrollPane.setViewportView(textAreaKhoaCongKhai);
		textAreaKhoaCongKhai.setBorder(null);

		JLabel lblNewLabel_3_1 = new JLabel("Khóa bí mật");
		lblNewLabel_3_1.setFont(new Font("Times New Roman", Font.PLAIN, 18));
		lblNewLabel_3_1.setBounds(20, 261, 123, 26);
		panel_1.add(lblNewLabel_3_1);

		JButton btnKhoaBiMat = new JButton("Thêm File");
		btnKhoaBiMat.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				//Long a line here
				int keySize = Integer.parseInt((String) comboBox.getItemAt(comboBox.getSelectedIndex()));
				//done
				support.workWithJchooseFile(e, textField_UserName, textField_Email, textField_Phone,
						textAreaKhoaCongKhai, textAreaKhoaBiMat, Constants.PRIVATE_KEY, keySize);
			}
		});
		btnKhoaBiMat.setFont(new Font("Times New Roman", Font.PLAIN, 16));
		btnKhoaBiMat.setFocusPainted(false);
		btnKhoaBiMat.setBorder(null);
		btnKhoaBiMat.setBackground(new Color(236, 240, 241));
		btnKhoaBiMat.setBounds(146, 263, 96, 26);
		panel_1.add(btnKhoaBiMat);

		JScrollPane scrollPane_1 = new JScrollPane();
		scrollPane_1.setBorder(new LineBorder(new Color(179, 179, 179)));
		scrollPane_1.setBounds(20, 297, 396, 120);
		panel_1.add(scrollPane_1);

		textAreaKhoaBiMat = new JTextArea();
		textAreaKhoaBiMat.setFont(new Font("Times New Roman", Font.PLAIN, 16));
		textAreaKhoaBiMat.setLineWrap(true);
		scrollPane_1.setViewportView(textAreaKhoaBiMat);
		textAreaKhoaBiMat.setBorder(null);

		JButton btnKhoiTao = new JButton("Khởi tạo");
		btnKhoiTao.setForeground(SystemColor.text);
		btnKhoiTao.setBackground(new Color(52, 152, 219));
		btnKhoiTao.setFocusPainted(false);
		btnKhoiTao.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				key.generatorKey(Integer.parseInt((String) comboBox.getItemAt(comboBox.getSelectedIndex())));
				textAreaKhoaCongKhai.setText(Base64.getEncoder().encodeToString(key.getPub().getEncoded()));
				textAreaKhoaBiMat.setText(Base64.getEncoder().encodeToString(key.getPri().getEncoded()));
			}
		});
		btnKhoiTao.setFont(new Font("Times New Roman", Font.PLAIN, 16));
		btnKhoiTao.setBounds(239, 36, 90, 27);
		panel_1.add(btnKhoiTao);

		JPanel panel_1_1 = new JPanel();
		panel_1_1.setLayout(null);
		panel_1_1.setFont(new Font("Tahoma", Font.PLAIN, 17));
		panel_1_1.setBorder(new TitledBorder(
				new EtchedBorder(EtchedBorder.LOWERED, new Color(255, 255, 255), new Color(160, 160, 160)),
				"T\u1EA1o ch\u1EEF k\u00ED \u0111i\u1EC7n t\u1EED", TitledBorder.LEADING, TitledBorder.TOP,
				new Font("Segoe UI Light", Font.BOLD, 16), new Color(179, 179, 179)));
		panel_1_1.setBackground(Color.WHITE);
		panel_1_1.setBounds(480, 95, 458, 442);
		add(panel_1_1);

		JLabel lblNewLabel_4 = new JLabel("User Name");
		lblNewLabel_4.setFont(new Font("Times New Roman", Font.PLAIN, 18));
		lblNewLabel_4.setBounds(46, 37, 91, 29);
		panel_1_1.add(lblNewLabel_4);

		JLabel lblNewLabel_4_1 = new JLabel("Email");
		lblNewLabel_4_1.setFont(new Font("Times New Roman", Font.PLAIN, 18));
		lblNewLabel_4_1.setBounds(83, 118, 54, 29);
		panel_1_1.add(lblNewLabel_4_1);

		JLabel lblNewLabel_4_2 = new JLabel("Phone");
		lblNewLabel_4_2.setFont(new Font("Times New Roman", Font.PLAIN, 18));
		lblNewLabel_4_2.setBounds(83, 202, 54, 29);
		panel_1_1.add(lblNewLabel_4_2);

		textField_UserName = new JTextField();
		textField_UserName.setBorder(new LineBorder(new Color(192, 192, 192)));
		textField_UserName.setFont(new Font("Times New Roman", Font.PLAIN, 16));
		textField_UserName.setBounds(147, 34, 261, 37);
		panel_1_1.add(textField_UserName);
		textField_UserName.setColumns(10);

		textField_Email = new JTextField();
		textField_Email.setFont(new Font("Times New Roman", Font.PLAIN, 16));
		textField_Email.setColumns(10);
		textField_Email.setBorder(new LineBorder(new Color(192, 192, 192)));
		textField_Email.setBounds(147, 110, 261, 37);
		panel_1_1.add(textField_Email);

		textField_Phone = new JTextField();
		textField_Phone.setFont(new Font("Times New Roman", Font.PLAIN, 16));
		textField_Phone.setColumns(10);
		textField_Phone.setBorder(new LineBorder(new Color(192, 192, 192)));
		textField_Phone.setBounds(147, 194, 261, 37);
		panel_1_1.add(textField_Phone);

		JButton btnNewButton = new JButton("Trở về");
		btnNewButton.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				JFrame jF = (JFrame) getTopLevelAncestor();
				jF.getContentPane().removeAll();
				jF.setContentPane(new MainPanel());
				jF.getContentPane().revalidate();
				jF.getContentPane().repaint();
			}
		});
		btnNewButton.setFocusPainted(false);
		btnNewButton.setForeground(SystemColor.text);
		btnNewButton.setBackground(new Color(231, 76, 60));
		btnNewButton.setFont(new Font("Times New Roman", Font.PLAIN, 18));
		btnNewButton.setBounds(338, 371, 91, 37);
		panel_1_1.add(btnNewButton);

		JButton btnKhiToFile = new JButton("Khởi tạo file chữ kí");
		btnKhiToFile.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				if (!textField_UserName.getText().equals("") & !textField_Email.getText().equals("") & !textField_Phone.getText().equals("")
						& !textAreaKhoaCongKhai.getText().equals("") & !textAreaKhoaBiMat.getText().equals("")) {
					//Long a line here
					int keySize = Integer.parseInt((String) comboBox.getItemAt(comboBox.getSelectedIndex()));
					//done
					support.workWithJchooseFile(e, textField_UserName, textField_Email, textField_Phone,
							textAreaKhoaCongKhai, textAreaKhoaBiMat, null, keySize);
				} else {
					JOptionPane.showMessageDialog(frame, "Thiếu thông tin!", "Có lỗi rồi bạn ơi!",
							JOptionPane.ERROR_MESSAGE);
				}
			}
		});
		btnKhiToFile.setForeground(SystemColor.text);
		btnKhiToFile.setFocusPainted(false);
		btnKhiToFile.setBackground(new Color(26, 188, 156));
		btnKhiToFile.setFont(new Font("Times New Roman", Font.PLAIN, 18));
		btnKhiToFile.setBounds(66, 371, 193, 37);
		panel_1_1.add(btnKhiToFile);
	}
}
