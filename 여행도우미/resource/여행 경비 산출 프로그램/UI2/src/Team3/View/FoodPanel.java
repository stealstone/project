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
public class FoodPanel extends JPanel {
	private ImageIcon icon;
	private JPanel p,p1,p2,p3,p5,p6;
	@SuppressWarnings("rawtypes")
	private JComboBox combo,combo1,combo2,combo3;
	private JButton btnnext,btndamgi,btnsee,btnback,btnreset;
	private JTextArea textArea;
	private JLabel label,label1,label2;
	
	private Vector<Integer> temp,food ;
	private JSpinner menuCount;
	private Databases db;
	private Total total;
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public FoodPanel(JTabbedPane tab,Total total,Vector<String> tempKey,Vector<String> tempKey2,Databases db){
		
		this.db = db;
		this.total = total;
		food = new Vector<Integer>(1,1);
		temp = new Vector<Integer>(1,1);
		temp.addElement(0);
		this.setLayout(null);
	/* 총 패널 ------------------------------------------------------*/	
		this.p1 = new JPanel();
		this.p1.setLayout(null);
		this.p1.setBounds(5, 5, 474, 620);
		
		/* 역선택 ------------------------------------------------------*/	
		this.p2 = new JPanel();
		this.p2.setBorder(new TitledBorder(new BevelBorder(BevelBorder.RAISED), ""));
		this.p2.setLayout(null);
		this.p2.setBounds(20, 20, 434, 100);
		
		this.label = new JLabel("역 선택");
        this.label.setBounds(5, 5, 414, 30);
        this.label.setFont(new Font("맑은 고딕", Font.BOLD,25));
        this.p2.add(label);
        
		String a[] = { "앞 패널에서 선택해 주세요" };
        combo = new JComboBox(a);
        combo.setBounds(10, 40, 414, 40);
        combo.setFont(new Font("맑은 고딕", Font.BOLD,20));
       // combo.addItemListener(this);
        
        /* 텍스트 라인  ------------------------------------------------------*/
		 textArea = new JTextArea(); 
		 textArea.setBounds(20, 380, 434, 187); 
		 textArea.setEditable(false); 
        /* 관광지 ------------------------------------------------------*/
        this.p3 = new JPanel();
		this.p3.setBorder(new TitledBorder(new BevelBorder(BevelBorder.RAISED), ""));
		this.p3.setLayout(null);
		this.p3.setBounds(20, 120, 434, 100);
		this.label1 = new JLabel("관광지");
        this.label1.setBounds(5, 5, 414, 30);
        this.label1.setFont(new Font("맑은 고딕", Font.BOLD,25));
        this.p3.add(label1);
		
		
		String b[] = { "앞 패널에서 선택 해 주세요 " };
        combo1 = new JComboBox(b);
        combo1.setBounds(10, 40, 414, 40);
        combo1.setFont(new Font("맑은 고딕", Font.BOLD,20));
        combo2 = new JComboBox(b);
        combo2.setBounds(10, 40, 160, 40);
        combo2.setFont(new Font("맑은 고딕", Font.BOLD,20));
        combo3 = new JComboBox(b);
        combo3.setBounds(190, 40, 160, 40);
        combo3.setFont(new Font("맑은 고딕", Font.BOLD,20));
                
        combo1.addItemListener(new ComboBoxCTL2(combo2,tempKey,null,total,db,2, textArea)); // 관광지를 누르면 음식선택창 변경
        combo2.addItemListener(new ComboBoxCTL2(combo3,tempKey,food,total,db,3, textArea));// 음식종류를 누르면 식당선택창 변경
        combo3.addItemListener(new ComboBoxCTL2(null,null,temp,this.total,db,8, textArea));	//인덱스값추가.
        
        /* 메뉴 선택 ------------------------------------------------------*/
        this.p5 = new JPanel();
     	this.p5.setBorder(new TitledBorder(new BevelBorder(BevelBorder.RAISED), ""));
     	this.p5.setLayout(null);
     	this.p5.setBounds(20, 220, 434, 100);
     	
     	this.label2 = new JLabel("메뉴 선택");
        this.label2.setBounds(5, 5, 414, 30);
        this.label2.setFont(new Font("맑은 고딕", Font.BOLD,25));
        this.p5.add(label2);

     
        

        
        /*********이미지출력이벤트**************/
		JLabel jlbel = new JLabel();
		jlbel.setBounds(10, 10, 455, 600);	
		combo3.addItemListener(new ImageController(p6, icon, jlbel,this.db,3));
		
		/********************************/
        
        

      
        
        /* 갯수 선택 스피너 추가 (10.25)-------------------------------------------*/
        SpinnerNumberModel menuCountModel = 
        		new SpinnerNumberModel(0,0,100,1);
        this.menuCount = new JSpinner(menuCountModel);        
        this.menuCount.setBounds(370, 40, 50, 41);
        this.p5.add(menuCount);      
        
                
        /* 메뉴 라디오 버튼 ------------------------------------------------------*/
        /*foodRadio1 = new JRadioButton("김치찌개 - 김밥나라");
        foodRadio1.setBounds(10,80, 140, 20);
        foodRadio2 = new JRadioButton("김치찌개 - 김밥천국");
        foodRadio2.setBounds(150,80, 140, 20);
        foodRadio3 = new JRadioButton("김치찌개 - 김밥지옥");
        foodRadio3.setBounds(290,80, 140, 20);*/
        /* 버튼  ------------------------------------------------------*/
	 	this.btnback = new JButton("삭 제");
	 	this.btnback.setBounds(215, 325, 115, 35);
		this.btnback.setFont(new Font("맑은 고딕", Font.BOLD,16));
		btnback.addActionListener(new DamgiController(this.total,null,food,null, textArea,temp,2,db,menuCount,0));
		
		this.btnreset = new JButton("역 선택");
		this.btnreset.setBounds(100, 570, 100, 40);
		this.btnreset.setFont(new Font("맑은 고딕", Font.BOLD,20));
		this.btnreset.addActionListener(new TabNextController(tab, 1));
		
		
        this.btnnext = new JButton("다 음");
        this.btnnext.setBounds(230, 570, 100, 40);
        this.btnnext.setFont(new Font("맑은 고딕", Font.BOLD,20));
		this.btnnext.addActionListener(new TabNextController(tab,4));
		
		this.btndamgi = new JButton("담기 / 수정");
		this.btndamgi.setBounds(335, 325, 115, 35);
		this.btndamgi.setFont(new Font("맑은 고딕", Font.BOLD,16));
		btndamgi.addActionListener(new DamgiController(this.total,null,food,null, textArea,temp,2,db,menuCount,1));
		
	
        /* 패널에 추가 ------------------------------------------------------*/
        //this.p5.add(foodRadio1);
        //this.p5.add(foodRadio2);
        //this.p5.add(foodRadio3);
        this.p5.add(combo2);
        this.p5.add(combo3);
        this.p3.add(combo1);
        this.p2.add(combo);
        this.p1.add(textArea);
        this.p1.add(btnreset);
        this.p1.add(btnback);
        this.p1.add(btnnext);
        this.p1.add(btndamgi);
        this.p1.add(p5);
        this.p1.add(p3);
        this.p1.add(p2);
        
        
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
	
	@SuppressWarnings("rawtypes")
	public JComboBox getCombo2() {
		return combo2;
	}
	
	@SuppressWarnings("rawtypes")
	public JComboBox getCombo3() {
		return combo3;
	}
	
	
	
}
	
	


