package Team3.View;

import java.awt.Font;
import java.util.Vector;

import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JRadioButton;
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


@SuppressWarnings({ "serial", "unused" })
public class RoomPanel extends JPanel {
	private ImageIcon icon;
	private JLabel label, label1, label2;
	private JPanel p,p1,p2,p3,p6;
	@SuppressWarnings("rawtypes")
	private JComboBox combo,combo1,combo2,combo3,combo4;
	private JButton btnnext,btnsee,btnback,btnreset;
	private JTextArea textArea;
	private JSpinner roomCount;
	private Databases db;
	private Total total;
	private Vector<String> tempKey;
	private Vector<Integer> stay, room,room_type; // Stay 숙소 타입 인덱스 정보 보유, room 숙소명 인텍스 정보 보유 ,room_type 방 종류정보 인덱
	private JButton btndamgi;
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public RoomPanel(JTabbedPane tab,Total total,Vector<String> tempKey, Databases db){
		this.stay = new Vector<Integer>(1,1);
		this.room = new Vector<Integer>(1,1);
		this.room_type = new Vector<Integer>(1,1);
		room_type.addElement(0);
		this.tempKey = tempKey;
		this.db = db;
		this.total = total;
		this.setLayout(null);
	/* 총 패널 ------------------------------------------------------*/	
		this.p1 = new JPanel();
		this.p1.setLayout(null);
		this.p1.setBounds(5, 5, 474, 620);
		//this.p1.setBorder(new TitledBorder(new BevelBorder(BevelBorder.RAISED)));
		/* 역선택 ------------------------------------------------------*/	
		this.p2 = new JPanel();
		this.p2.setBorder(new TitledBorder(new BevelBorder(BevelBorder.RAISED), ""));
		this.p2.setLayout(null);
		this.p2.setBounds(20, 20, 434, 100);
		/* 텍스트 라인  ------------------------------------------------------*/
		 textArea = new JTextArea(); 
		 textArea.setBounds(20, 430, 434, 127);
		 textArea.setEditable(false);
		this.label = new JLabel("역 선택");
	    this.label.setBounds(5, 1, 414, 30);
	    this.label.setFont(new Font("맑은 고딕", Font.BOLD,25));
	    this.p2.add(label);
	    
	    this.label1 = new JLabel("관광지");
        this.label1.setBounds(5, 1, 414, 30);
        this.label1.setFont(new Font("맑은 고딕", Font.BOLD,25));
        
		
		String a[] = {"앞 패널에서 선택 해 주세요." };
		
        combo = new JComboBox(a);
        combo.setBounds(10, 30, 414, 40);
        combo.setFont(new Font("맑은 고딕", Font.BOLD,20));
        combo1 = new JComboBox(a);
        combo1.setBounds(10, 30, 414, 40);
        combo1.setFont(new Font("맑은 고딕", Font.BOLD,20));
      	combo2 = new JComboBox(a);
      	combo2.setBounds(10, 30, 200, 40);
      	combo2.setFont(new Font("맑은 고딕", Font.BOLD,20));
      	combo3 = new JComboBox(a);
        combo3.setBounds(225, 30, 200, 40);
        combo3.setFont(new Font("맑은 고딕", Font.BOLD,20));
        combo4 = new JComboBox(a);
        combo4.setBounds(10, 90, 330,40);
        combo4.setFont(new Font("맑은 고딕", Font.BOLD,20));
        
       // combo.addItemListener(this);
        /* 관광지 ------------------------------------------------------*/
        this.p3 = new JPanel();
		this.p3.setBorder(new TitledBorder(new BevelBorder(BevelBorder.RAISED), ""));
		this.p3.setLayout(null);
		this.p3.setBounds(20, 120, 434, 100);
		/*********이미지출력이벤트**************/
		JLabel jlbel = new JLabel();
		jlbel.setBounds(10, 10, 455, 600);	
		combo3.addItemListener(new ImageController(p6, icon, jlbel,this.db,4));
				
		/********************************/
         
        
        /* 숙박 선택 ------------------------------------------------------*/
        this.p6 = new JPanel();
      	this.p6.setBorder(new TitledBorder(new BevelBorder(BevelBorder.RAISED), ""));
      	this.p6.setLayout(null);
      	this.p6.setBounds(20, 220, 434, 160);
      	combo1.addItemListener(new ComboBoxCTL2(combo2,tempKey,null,total,db,4, textArea));
      	combo2.addItemListener(new ComboBoxCTL2(combo3,tempKey,stay,total,db,5, textArea));
      	combo3.addItemListener(new ComboBoxCTL2(combo4,tempKey,room,total,db,6, textArea));
      	combo4.addItemListener(new ComboBoxCTL2(null,null,room_type,total,db,9, textArea));
   
        /* 유형, 주중/주말 선택 콤보박스 추가(10.25)--------------------------*/
      	this.label2 = new JLabel("숙박 선택");
        this.label2.setBounds(5, 1, 414, 30);
        this.label2.setFont(new Font("맑은 고딕", Font.BOLD,25));
        this.p6.add(label2);
        this.p6.add(combo4);        
         /*갯수 선택 스피너 추가(10,25)-------------------------------------*/
        SpinnerNumberModel roomCountModel = 
        		new SpinnerNumberModel(0,0,100,1);
        this.roomCount = new JSpinner(roomCountModel);        
        this.roomCount.setBounds(355, 90, 50, 41);
        this.p6.add(roomCount);        
        
		
        /* 버튼  ------------------------------------------------------*/
	 	this.btnback = new JButton("삭 제");
		this.btnback.setBounds(215, 380, 115, 35);
		this.btnback.setFont(new Font("맑은 고딕", Font.BOLD,16));
		btnback.addActionListener(new DamgiController(this.total,null,stay,room,textArea,room_type,3,db,roomCount,0));
				
		this.btndamgi = new JButton("담기 / 수정");
		this.btndamgi.setBounds(335, 380, 115, 35);
		this.btndamgi.setFont(new Font("맑은 고딕", Font.BOLD,16));
		btndamgi.addActionListener(new DamgiController(this.total,null,stay,room,textArea,room_type,3,db,roomCount,1));
		
        this.btnnext = new JButton("다 음");
      	this.btnnext.setBounds(230, 570, 100, 40);
      	this.btnnext.setFont(new Font("맑은 고딕", Font.BOLD,20));
      	this.btnnext.addActionListener(new TabNextController(tab,5));
      		
      	this.btnreset = new JButton("역 선택");
      	this.btnreset.setBounds(100, 570, 100, 40);
      	this.btnreset.setFont(new Font("맑은 고딕", Font.BOLD,20));
      	this.btnreset.addActionListener(new TabNextController(tab, 1));
      			 
        /* 패널에 추가 ------------------------------------------------------*/
        this.p6.add(combo2);
		this.p6.add(combo3);
        this.p3.add(combo1);
        this.p2.add(combo);
        this.p1.add(textArea);
        this.p1.add(btndamgi);
        this.p1.add(btnback);
        this.p1.add(btnnext);
        this.p1.add(btnreset);
        this.p1.add(p6);
        this.p1.add(p3);
        this.p1.add(p2);
        this.p3.add(label1);
        
        
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
	
	@SuppressWarnings("rawtypes")
	public JComboBox getCombo1() {
		return combo1;
	}
	
}
	



	



