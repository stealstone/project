package Team3.View;

import java.awt.Dimension;
import java.awt.Font;
import java.awt.Toolkit;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.sql.Connection;
import java.util.Vector;

import javax.swing.ImageIcon;
import javax.swing.JComboBox;
import javax.swing.JFrame;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JTabbedPane;
import javax.swing.UIManager;

import Team3.Controller.DBClose;
import Team3.Controller.DBConnection;
import Team3.Model.Databases;
import Team3.Model.Total;

public class Main {
	private JFrame f;
	@SuppressWarnings("unused")
	private JPanel p;
	private JTabbedPane tab;
	private Vector<String> station,tempKey,tempKey2;
	@SuppressWarnings({ "unused", "rawtypes" })
	private Vector<JComboBox> comv;
	private Total total;
	private Connection conn;
	private Databases db;
	
	public Main(){
		total = new Total();
		this.p= new JPanel();
		this.f = new JFrame("여 행");
		ImageIcon ig = new ImageIcon("Images/train_2.gif"); 
	    this.f.setIconImage(ig.getImage());
		this.tab = new JTabbedPane();
		this.station = new Vector<String>(1,1);
		DBConnection.setProperty("lib/dbinfo.properties");
		DBConnection.loadDriver();
		this.conn = DBConnection.getConnection();
		
		this.tempKey = new Vector<String>(1,1);
		this.tempKey.addElement("START_KEY!! 그냥넣음");
		this.tempKey2 = new Vector<String>(1,1);
		this.tempKey2.addElement("START_KEY!! 그냥넣음");		
		
	}
	private void display(){		
		Toolkit toolkit = Toolkit.getDefaultToolkit();
		Dimension d = toolkit.getScreenSize();		
		this.db = new Databases(conn); // 데이터베이스 객체 생성 
		this.f.setSize(1000,700);
		
		this.f.addWindowListener(new WindowAdapter(){
			@Override
			public void windowClosing(WindowEvent evt){
				int choice = JOptionPane.showConfirmDialog(f, "종료 하시겠습니까?", "종 료", 
						 JOptionPane.YES_NO_OPTION, JOptionPane.QUESTION_MESSAGE);
				if(choice == JOptionPane.YES_OPTION){
					DBClose.close(conn);
					System.exit(0);
				}else{
					f.setDefaultCloseOperation(JFrame.DO_NOTHING_ON_CLOSE);
				}
			}
		});
		
		
		
		
		RoomPanel rp = new RoomPanel(this.tab,this.total,this.tempKey,this.db);
		FoodPanel fp = new FoodPanel(this.tab,this.total,this.tempKey,this.tempKey2,this.db);
		
		/*******관광지 패널 추출*********/
		@SuppressWarnings("rawtypes")
		JComboBox tpc2_1 = fp.getCombo1(); 
		@SuppressWarnings("rawtypes")
		JComboBox tpc2_2 = rp.getCombo1();
		/*******역 패널 추출*********/
		@SuppressWarnings("rawtypes")
		JComboBox tpc1_1 = fp.getCombo();
		@SuppressWarnings("rawtypes")
		JComboBox tpc1_2 = rp.getCombo();
		
		travelPanel tp = new travelPanel(this.tab,this.total,this.db); // 관광지패널 생성
		
		/*******역 패널 추출*********/
		@SuppressWarnings("rawtypes")
		JComboBox tpc1 = tp.getCombo();		
		/*******관광지 패널 추출*********/
		@SuppressWarnings("rawtypes")
		JComboBox tpc2 = tp.getCombo1();
		
		StationPanel sp =new StationPanel(this.tab,station,tpc1,tpc1_1,tpc1_2,tpc2,tpc2_1,tpc2_2,db,this.total); //역패널 생성
		OutputPanel op = new OutputPanel(this.tab, this.total);	
		
		

		
		this.f.setLocation(d.width / 2 - this.f.getWidth() / 2, d.height / 2 - this.f.getHeight() / 2);
		this.tab.setFont(new Font("맑은 고딕", Font.BOLD,20));
		this.tab.add("시작하기", new MoonPanel(this.tab));
		this.tab.add("역이름",sp);
		this.tab.add("관광명소",tp);
		this.tab.add("메뉴",fp);
		this.tab.add("숙박", rp);
		this.tab.add("총 정리",op );
		this.f.add(this.tab);
		this.f.setVisible(true);
		this.tab.setEnabledAt(1, false);
		this.tab.setEnabledAt(2, false);
		this.tab.setEnabledAt(3, false);
		this.tab.setEnabledAt(4, false);
		this.tab.setEnabledAt(5, false);
	}
public static void main(String[] args) {
		try {
			// 1. quaqua.jar : Quaqua Look and Feel
			UIManager.setLookAndFeel("ch.randelshofer.quaqua.QuaquaLookAndFeel");
			JFrame.setDefaultLookAndFeelDecorated(true);
		} catch (Exception e) {
		}
		new Main().display();
		
		}
}








