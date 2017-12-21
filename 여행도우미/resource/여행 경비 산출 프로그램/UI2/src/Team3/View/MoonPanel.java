package Team3.View;


import java.awt.Color;
import java.awt.Font;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JTabbedPane;
import javax.swing.border.BevelBorder;
import javax.swing.border.TitledBorder;

import Team3.Controller.TabNextController;


@SuppressWarnings({ "unused", "serial" })
public class MoonPanel extends JPanel {

	private JPanel p;
	private JButton btnstart;
	private ImageIcon icon;
	
	public MoonPanel(JTabbedPane tab){
		
		//패널  설정 및 크기
		this.setLayout(null);
		this.p = new JPanel();
		this.p.setLayout(null);
		this.p.setBounds(5, 5, 965, 620);
		
		//이미지 삽입 
		JLabel jlbel = new JLabel(new ImageIcon("Images/moon.jpg"));
		jlbel.setBounds(10, 10, 945, 600);
		
		//버튼 크기 
		this.btnstart = new JButton("시작하기");
		this.btnstart.setBounds(400, 550, 150, 50);
		this.btnstart.setFont(new Font("맑은 고딕", Font.BOLD,20));
		
		//패널에 버튼 추가및 이미지 추가
		p.add(btnstart);
		p.add(jlbel);
		
		
		
		this.btnstart.addActionListener(new TabNextController(tab,1));
		this.add(p);
	}
}
	
