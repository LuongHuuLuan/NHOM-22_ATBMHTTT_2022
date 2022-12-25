package view;

import javax.swing.JPanel;
import javax.swing.border.EmptyBorder;
import javax.swing.JTextArea;
import javax.swing.JLabel;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JFrame;

public class TutorialScreen extends JPanel {

	/**
	 * Create the panel.
	 */
	public TutorialScreen() {
		setBorder(new EmptyBorder(5, 5, 5, 5));
		setLayout(null);
		setBounds(100, 100, 978, 599);
		
		JTextArea textArea = new JTextArea();
		textArea.setBounds(53, 45, 869, 441);
		add(textArea);
		
		JLabel lblNewLabel = new JLabel("Hướng dẫn sử dụng");
		lblNewLabel.setBounds(53, 20, 188, 14);
		add(lblNewLabel);
		
		JButton btnNewButton = new JButton("Trở về");
		btnNewButton.setBounds(833, 531, 89, 23);
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
	}
}
