package view;

import java.awt.EventQueue;
import java.awt.SystemColor;

import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.border.EmptyBorder;

import org.jpedal.examples.viewer.Commands;
import org.jpedal.examples.viewer.Viewer;

public class DemoPDFScreen extends JFrame {
	private JPanel panel;
//	private String pathPDF = null;
//	
//	public void setPathPDF(String pathPDF) {
//		this.pathPDF = pathPDF;
//	}
//	
//
//	public String getPathPDF() {
//		return pathPDF;
//	}


	private JPanel contentPane;
	public void displayPdfFile(String pathFile, JPanel panel) {
		System.setProperty("org.jpedal.userControlledLAF", "javax.swing.plaf.metal.MetalLookAndFeel");
		Viewer viewer = new Viewer(panel,null);
		viewer.setupViewer();
		viewer.executeCommand(Commands.OPENFILE, new Object[]{pathFile});
	}

	/**
	 * Launch the application.
	 */
//	public static void main(String[] args) {
//		EventQueue.invokeLater(new Runnable() {
//			public void run() {
//				try {
//					DemoPDFScreen frame = new DemoPDFScreen();
//					frame.setVisible(true);
//				} catch (Exception e) {
//					e.printStackTrace();
//				}
//			}
//		});
//	}

	/**
	 * Create the frame.
	 */
	public DemoPDFScreen(String pathPDF) {
		setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
		setBounds(100, 100, 1200, 700);
		contentPane = new JPanel();
		contentPane.setBorder(new EmptyBorder(100, 100, 978, 599));
		setContentPane(contentPane);
		contentPane.setLayout(null);
		
		panel = new JPanel();
		panel.setBounds(0, 0, 1186, 663);
		contentPane.add(panel);
		displayPdfFile(pathPDF, panel);
		setVisible(true);
		setLocationRelativeTo(null);
	}
}
