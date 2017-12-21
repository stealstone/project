package Team3.View;

	import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Font;
import java.util.Vector;

import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTabbedPane;
import javax.swing.JTable;
import javax.swing.JTextArea;
import javax.swing.ScrollPaneConstants;
import javax.swing.border.BevelBorder;
import javax.swing.border.LineBorder;
import javax.swing.border.TitledBorder;
import javax.swing.table.DefaultTableModel;

import Team3.Controller.OutputAction;
import Team3.Controller.SaveController;
import Team3.Controller.SaveController1;
import Team3.Controller.TabNextController;
import Team3.Model.Total;


	@SuppressWarnings({ "unused", "serial" })
	public class OutputPanel extends JPanel {
		private JTabbedPane tab;
		private Vector<Object> TravelTable;
		private JFrame f;
		private JButton btnDisplay,btnSave, btnSave1,btnreset;
		private JLabel label;
		private JPanel pNorth;
		private JScrollPane scroll, scroll1, scroll2;
		private Total total;
		private String a;
		private JPanel p,p1,p2,p3;
        private JTable table1,table2,table;
        private JTextArea textArea;


		public OutputPanel(JTabbedPane tab,  Total total) {
			
			this.setLayout(null);
			this.TravelTable = new Vector<Object>(1,1);
			this.total = total;
		
			this.p = new JPanel();
			this.p.setLayout(null);
			this.p.setBounds(15,50, 960, 180);
			JTable table = new JTable();
			table.getTableHeader().setFont(new Font("맑은 고딕", Font.BOLD,18));
			table.setFont(new Font("맑은 고딕", Font.BOLD,15));
			
			this.p1 = new JPanel();
			this.p1.setLayout(null);
			this.p1.setBounds(15,250, 960, 180);
			this.p1.setFont(new Font("맑은 고딕", Font.BOLD,20));
			JTable table1 = new JTable();
			table1.getTableHeader().setFont(new Font("맑은 고딕", Font.BOLD,18));
			table1.setFont(new Font("맑은 고딕", Font.BOLD,15));
			
			this.p2 = new JPanel();
			this.p2.setLayout(null);
			this.p2.setBounds(15,450, 960, 180);
			JTable table2 = new JTable();
			table2.getTableHeader().setFont(new Font("맑은 고딕", Font.BOLD,18));
			table2.setFont(new Font("맑은 고딕", Font.BOLD,15));
			
			textArea = new JTextArea(); 
			textArea.setBounds(750, 120, 195, 40);
			textArea.setBorder(new LineBorder(Color.BLACK));
			textArea.setEditable(false); 
			
			this.btnDisplay = new JButton("총 정리");
		 	this.btnDisplay.setFont(new Font("맑은 고딕", Font.BOLD,15));
			this.btnDisplay.setBounds(235, 5, 100, 40);
			
			
			this.btnSave = new JButton("파일 저장");
			this.btnSave.setFont(new Font("맑은 고딕", Font.BOLD,15));
			this.btnSave.setBounds(375, 5, 100, 40);
			
			this.btnSave1 = new JButton("엑셀 저장");
			this.btnSave1.setFont(new Font("맑은 고딕", Font.BOLD,15));
			this.btnSave1.setBounds(515, 5, 100, 40);
			
			this.btnreset = new JButton("다시 하기");
			this.btnreset .setFont(new Font("맑은 고딕", Font.BOLD,15));
			this.btnreset.setBounds(655, 5, 100, 40);
			
			
			this.label = new JLabel();
			this.label .setFont(new Font("맑은 고딕", Font.BOLD,25));
			this.label.setBounds(120, 0, 100, 40);
		
			this.btnDisplay.addActionListener(new OutputAction(table, table1, table2,this.label,total, textArea));
			this.btnSave.addActionListener(new SaveController(this.f, total));
			this.btnSave1.addActionListener(new SaveController1(this.f, total));
			this.btnreset.addActionListener(new TabNextController(tab, 1));
			
			this.scroll = new JScrollPane(table, ScrollPaneConstants.VERTICAL_SCROLLBAR_ALWAYS,
                    ScrollPaneConstants.HORIZONTAL_SCROLLBAR_NEVER);
			this.scroll.setBounds(10, 10, 940, 160);
		 
			
			p.add(this.scroll);
			this.scroll1 = new JScrollPane(table1, ScrollPaneConstants.VERTICAL_SCROLLBAR_ALWAYS,
					  ScrollPaneConstants.HORIZONTAL_SCROLLBAR_NEVER);
			this.scroll1.setBounds(10, 10, 940, 160);
			p1.add(this.scroll1);
			
			this.scroll2 = new JScrollPane(table2, ScrollPaneConstants.VERTICAL_SCROLLBAR_ALWAYS,
					  ScrollPaneConstants.HORIZONTAL_SCROLLBAR_NEVER);
			this.scroll2.setBounds(10, 10, 940, 100);
			
			
			 
			 p2.add(textArea);
			 p2.add(this.scroll2);
			
			/* 배경이미지 ------------------------------------------------------*/
			JLabel jlbel1 = new JLabel();
			jlbel1.setBounds(0, 0, 1000, 700);
			jlbel1.setIcon(new ImageIcon("Images/background.jpg"));
			
		    this.add(btnDisplay);
		    this.add(btnSave);
		    this.add(btnSave1);
		    this.add(btnreset);
		    this.add(label);
			this.add(p);
			this.add(p1);
			this.add(p2);
			this.add(jlbel1);
		    	
		}
	}

