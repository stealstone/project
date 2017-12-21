package Team3.View;

import java.awt.Font;
import java.util.Vector;

import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JSpinner;
import javax.swing.JTabbedPane;
import javax.swing.JTextArea;
import javax.swing.SpinnerNumberModel;
import javax.swing.border.BevelBorder;
import javax.swing.border.TitledBorder;

import Team3.Controller.ComboBoxCTL2;
import Team3.Controller.DamgiController;
import Team3.Controller.ImageController;
import Team3.Controller.TabNextController;
import Team3.Model.Databases;
import Team3.Model.Total;


@SuppressWarnings("serial")
public class travelPanel extends JPanel {
	private ImageIcon icon;
	private JPanel p,p1,p2,p3,p4,p5;
	@SuppressWarnings("rawtypes")
	private JComboBox combo,combo1,combo2;
	//private JRadioButton Radio1,Radio2,Radio3; 		//교통수단 라디오버튼 제거
	@SuppressWarnings("unused")
	private JButton btnnext,btndamgi,btnsee,btnreset;
	private JTextArea textArea;
	@SuppressWarnings("unused")
	private Vector<String> travel, travel_i;
	private Vector<Integer> temp; // 인덱스값 정보 들어있음
	private JSpinner spin;
	@SuppressWarnings("unused")
	private JLabel labelold,labadult,labkid,label,label2,label3;
	private Total total;
	private Databases db;
	private JButton btnback;
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public travelPanel(JTabbedPane tab,Total total,Databases db){
		travel_i = new Vector<String>(1,1);
		travel = new Vector<String>(1,1);
		temp = new Vector<Integer>(1,1);
		temp.addElement(0);
		
		this.total = total;
		this.db = db;
		this.setLayout(null);
		this.p1 = new JPanel();
		this.p1.setLayout(null);
		this.p1.setBounds(5, 5, 474, 620);
		//this.p1.setBorder(new TitledBorder(new BevelBorder(BevelBorder.RAISED)));
		
		this.p2 = new JPanel();
		this.p2.setBorder(new TitledBorder(new BevelBorder(BevelBorder.RAISED), ""));
		this.p2.setLayout(null);
		this.p2.setBounds(20, 20, 434, 100);
		String a[] = { "앞 패널에서 선택 해 주세요."};
		
		this.label = new JLabel("역 선택");
        this.label.setBounds(5, 5, 414, 30);
        this.label.setFont(new Font("맑은 고딕", Font.BOLD,25));
        this.p2.add(label);
        combo2 = new JComboBox(a);
        combo = new JComboBox(a);       
        combo.setBounds(10, 40, 414, 40);
        combo.setFont(new Font("맑은 고딕", Font.BOLD,20));
        textArea = new JTextArea(); 
        textArea.setTabSize(100);
        textArea.setBounds(20, 380, 434, 187);
		textArea.setEditable(false);
       // combo.addItemListener(this);
        
        this.p3 = new JPanel();
		this.p3.setBorder(new TitledBorder(new BevelBorder(BevelBorder.RAISED), ""));
		this.p3.setLayout(null);
		this.p3.setBounds(20, 120, 434, 100);
		
		this.label2 = new JLabel("관광지");
        this.label2.setBounds(5, 5, 414, 30);
        this.label2.setFont(new Font("맑은 고딕", Font.BOLD,25));
        this.p3.add(label2);
		
		String b[] = { "앞 패널에서 선택 해 주세요."};
        combo1 = new JComboBox(b);
        combo1.setBounds(10, 40, 414, 40);
        combo1.setFont(new Font("맑은 고딕", Font.BOLD,20));
        combo1.addItemListener(new ComboBoxCTL2(combo2,travel,temp,this.total,db,1, textArea));	 // 두번째 콤보박스 이벤트
        
        
        /*********이미지출력이벤트**************/
		JLabel jlbel = new JLabel();
		jlbel.setBounds(10, 10, 455, 600);	
		combo1.addItemListener(new ImageController(p, icon, jlbel,this.db,2));
		
		/********************************/
        
        //--------27일 희진 수정-------
        this.p4 = new JPanel();
		this.p4.setBorder(new TitledBorder(new BevelBorder(BevelBorder.RAISED), ""));
		this.p4.setLayout(null);
		this.p4.setBounds(20, 220, 434, 100); 
		
		this.label3 = new JLabel("입장료 선택");
        this.label3.setBounds(5, 5, 414, 30);
        this.label3.setFont(new Font("맑은 고딕", Font.BOLD,25));
        this.p4.add(label3);
		 
		@SuppressWarnings("unused")
		String c []= {"앞 패널 부터 실행하세요."};
		
		combo2.setBounds(10,40,340,40);
		combo2.setFont(new Font("맑은 고딕", Font.BOLD,20));
		combo2.addItemListener(new ComboBoxCTL2(null,null,temp,this.total,db,7, textArea));	 // 세번째 콤보박스 이벤트
	    SpinnerNumberModel spinnerMod=
	    new SpinnerNumberModel(0,0,100,1);	       
	    spin= new JSpinner(spinnerMod);
	    spin.setBounds(370, 40, 50, 41);	       
	    this.p4.add(spin);	
	    this.p4.add(combo2);
		
	        /************이미지 출력을 위한 패널설정**************/
	        this.p5 = new JPanel();
			this.p5.setLayout(null);
			this.p5.setBounds(480, 5, 474, 620);        
			 /*********************************************/
		
	        
				

		 	this.btnback = new JButton("삭 제");
		 	this.btnback.setBounds(215, 325, 115, 35);
			this.btnback.setFont(new Font("맑은 고딕", Font.BOLD,16));
			this.btnback.addActionListener(new DamgiController(this.total,travel,null,null,textArea,temp,1,db,spin,0));
			
			this.btndamgi = new JButton("담기 / 수정");
			this.btndamgi.setBounds(335, 325, 115, 35);
			this.btndamgi.setFont(new Font("맑은 고딕", Font.BOLD,16));					
			this.btndamgi.addActionListener(new DamgiController(this.total,travel,null,null,textArea,temp,1,db,spin,1));
			
			this.btnnext = new JButton("다 음");
			this.btnnext.setBounds(230, 570, 100, 40);
			this.btnnext.setFont(new Font("맑은 고딕", Font.BOLD,20));
			this.btnnext.addActionListener(new TabNextController(tab,3));
			
			this.btnreset = new JButton("역 선택");
			this.btnreset.setBounds(100, 570, 100, 40);
			this.btnreset.setFont(new Font("맑은 고딕", Font.BOLD,20));
			this.btnreset.addActionListener(new TabNextController(tab, 1));
			
        this.p3.add(combo1);
        this.p2.add(combo);
        this.p1.add(textArea);
        this.p1.add(btnreset);
        this.p1.add(btnnext);
        this.p1.add(btndamgi);
        this.p1.add(btnback);
        this.p1.add(p4);
        this.p1.add(p2);
        this.p1.add(p3);
        
        
        this.p = new JPanel();
		//this.p.setBorder(new TitledBorder(new BevelBorder(BevelBorder.RAISED)));
		this.p.setLayout(null);
		this.p.setBounds(490, 5, 474, 620);
		
		JLabel jlbel1 = new JLabel();
		jlbel1.setBounds(0, 0, 1000, 700);
		jlbel1.setIcon(new ImageIcon("Images/background.jpg"));
		
				
		this.p.add(jlbel);
		this.add(p);
		this.add(p1);
		this.add(jlbel1);
	}
	
	@SuppressWarnings("rawtypes")
	public JComboBox getCombo() {
		return combo;
	}
	public void setCombo(@SuppressWarnings("rawtypes") JComboBox combo) {
		this.combo = combo;
	}
	
	@SuppressWarnings("rawtypes")
	public JComboBox getCombo1() {
		return combo1;
	}
	public void setCombo1(@SuppressWarnings("rawtypes") JComboBox combo1) {
		this.combo1 = combo1;
	}
	
}



