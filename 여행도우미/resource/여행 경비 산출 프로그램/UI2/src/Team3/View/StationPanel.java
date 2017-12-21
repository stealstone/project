package Team3.View;


import java.awt.Font;
import java.util.Vector;

import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JTabbedPane;
import javax.swing.JTextArea;
import javax.swing.border.BevelBorder;
import javax.swing.border.TitledBorder;

import Team3.Controller.ComboBoxCTL;
import Team3.Controller.ImageController;
import Team3.Controller.TabNextController;
import Team3.Model.Databases;
import Team3.Model.Total;


@SuppressWarnings({ "unused", "serial" })
public class StationPanel extends JPanel {
	
	private JLabel jlbel,label;
	private JPanel p,p1,p2,p3;
	@SuppressWarnings("rawtypes")
	private JComboBox combo,tpc1,tpc1_1,tpc1_2,tpc2,tpc2_1,tpc2_2;
	private JButton btnnext,btnsee;
	private JTextArea textArea;
	private Vector<String> station;
	private ImageIcon icon;
	private Total total;
	private Databases db;
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public StationPanel(JTabbedPane tab,Vector<String> station,JComboBox tpc1,JComboBox tpc1_1,JComboBox tpc1_2,JComboBox tpc2,JComboBox tpc2_1,JComboBox tpc2_2,Databases db, Total total){
		this.db = db;		
		this.tpc1 = tpc1;
		this.tpc1_1 = tpc1_1;
		this.tpc1_2 = tpc1_2;
		this.tpc2 = tpc2;
		this.tpc2_1 = tpc2_1;
		this.tpc2_2 = tpc2_2;
		this.total = total;
		this.setLayout(null);
		
		this.p1 = new JPanel();
		this.p1.setLayout(null);
		this.p1.setBounds(5, 5, 474, 620);
		//this.p1.setBorder(new TitledBorder(new BevelBorder(BevelBorder.RAISED)));
		
		this.p2 = new JPanel();
		this.p2.setBorder(new TitledBorder(new BevelBorder(BevelBorder.RAISED),""));
		this.p2.setLayout(null);
		this.p2.setBounds(20, 20, 434, 100);
		
		this.label = new JLabel("역 선택");
        this.label.setBounds(5, 5, 414, 30);
        this.label.setFont(new Font("맑은 고딕", Font.BOLD,30));
        this.p2.add(label);
        
		textArea = new JTextArea(); 
		textArea.setBounds(20, 470, 434, 87); 
		textArea.setEditable(false); 
		
		station = db.getStation();
        combo = new JComboBox(station);
        combo.setBounds(10, 40, 414, 40);
        combo.setFont(new Font("맑은 고딕", Font.BOLD,20));
        combo.addItemListener(new ComboBoxCTL(tpc1,tpc1_1,tpc1_2,tpc2,tpc2_1,tpc2_2,station,db, textArea, this.total));          
       
        
        
        /************이미지 출력을 위한 패널설정**************/
        this.p3 = new JPanel();
		this.p3.setLayout(null);
		this.p3.setBounds(480, 5, 474, 620);        
		 /*********************************************/
		
        this.btnnext = new JButton("다 음");
		this.btnnext.setBounds(185, 570, 100, 40);
		this.btnnext.setFont(new Font("맑은 고딕", Font.BOLD,20));
		this.btnnext.addActionListener(new TabNextController(tab,2));
				
        this.p2.add(combo);
        this.p1.add(textArea);
        this.p1.add(btnnext);
        this.p1.add(p2);
        
        this.p = new JPanel();
		//this.p.setBorder(new TitledBorder(new BevelBorder(BevelBorder.RAISED)));
		this.p.setLayout(null);
		this.p.setBounds(490, 5, 474, 620);		
		
		/*********이미지출력이벤트**************/
		JLabel jlbel = new JLabel();
		jlbel.setBounds(10, 10, 455, 600);	
		jlbel.setIcon( new ImageIcon("Images/지도3.png"));
		combo.addItemListener(new ImageController(p, icon, jlbel,this.db,1));
		this.p.add(jlbel);
		/********************************/
		JLabel jlbel1 = new JLabel();
		jlbel1.setBounds(0, 0, 1000, 700);
		jlbel1.setIcon(new ImageIcon("Images/background.jpg"));
		
		this.add(p1);
		this.add(p);
		this.add(jlbel1);
	}
}
	
