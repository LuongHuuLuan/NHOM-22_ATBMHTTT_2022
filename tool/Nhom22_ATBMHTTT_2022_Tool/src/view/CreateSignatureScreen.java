package view;

import javax.swing.JPanel;
import javax.swing.JLabel;
import javax.swing.JTextField;
import javax.swing.border.EmptyBorder;
import javax.swing.JTextArea;
import javax.swing.JScrollPane;
import javax.swing.JButton;
import javax.swing.JFrame;

import java.awt.Canvas;
import javax.swing.ImageIcon;
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;

public class CreateSignatureScreen extends JPanel {
	private JTextField textField;
	private JTextField textField_1;
	private JTextField textField_2;

	/**
	 * Create the panel.
	 */
	public CreateSignatureScreen() {
		setBorder(new EmptyBorder(5, 5, 5, 5));
		setLayout(null);
		setBounds(100, 100, 978, 599);

		JLabel lblNewLabel = new JLabel("Tên người ký");
		lblNewLabel.setBounds(23, 36, 89, 14);
		add(lblNewLabel);

		textField = new JTextField();
		textField.setBounds(156, 33, 255, 20);
		add(textField);
		textField.setColumns(10);

		JLabel lblChcVnghNghip = new JLabel("Chức vụ");
		lblChcVnghNghip.setBounds(23, 87, 123, 14);
		add(lblChcVnghNghip);

		textField_1 = new JTextField();
		textField_1.setColumns(10);
		textField_1.setBounds(156, 84, 255, 20);
		add(textField_1);

		JLabel lblNewLabel_1_1 = new JLabel("Email");
		lblNewLabel_1_1.setBounds(23, 144, 89, 14);
		add(lblNewLabel_1_1);

		textField_2 = new JTextField();
		textField_2.setColumns(10);
		textField_2.setBounds(156, 141, 255, 20);
		add(textField_2);

		JLabel lblNewLabel_1_1_1 = new JLabel("Ghi chú");
		lblNewLabel_1_1_1.setBounds(23, 199, 89, 14);
		add(lblNewLabel_1_1_1);

		JScrollPane scrollPane = new JScrollPane();
		scrollPane.setBounds(156, 194, 255, 136);
		add(scrollPane);

		JTextArea textArea = new JTextArea();
		scrollPane.setViewportView(textArea);

		JButton btnNewButton = new JButton("Trở về");
		btnNewButton.setBounds(751, 470, 89, 23);
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

		JButton btnToChK = new JButton("Tạo chữ ký");
		btnToChK.setBounds(156, 470, 133, 23);
		add(btnToChK);

		JScrollPane scrollPane_1 = new JScrollPane();
		scrollPane_1.setBounds(484, 58, 376, 272);
		add(scrollPane_1);

		JLabel lblNewLabel_1 = new JLabel("");
		scrollPane_1.setViewportView(lblNewLabel_1);
		lblNewLabel_1.setIcon(new ImageIcon("C:\\Users\\Nguyen Duy Long\\OneDrive\\Máy tính\\Screenshot_21111.png"));

		JLabel lblNewLabel_2 = new JLabel("Hình ảnh chữ ký");
		lblNewLabel_2.setBounds(484, 36, 123, 14);
		add(lblNewLabel_2);

		JButton btnTiHnhnh = new JButton("Load hình ảnh chữ ký");
		btnTiHnhnh.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
			}
		});
		btnTiHnhnh.setBounds(311, 470, 175, 23);
		add(btnTiHnhnh);
		
		JButton btnLuChK = new JButton("Lưu chữ ký");
		btnLuChK.setBounds(510, 470, 133, 23);
		add(btnLuChK);

	}
}
