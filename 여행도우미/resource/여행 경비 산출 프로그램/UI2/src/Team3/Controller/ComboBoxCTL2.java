package Team3.Controller;
import java.awt.Font;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.ItemEvent;
import java.awt.event.ItemListener;
import java.util.Vector;

import javax.swing.JComboBox;
import javax.swing.JTextArea;

import Team3.Model.Databases;
import Team3.Model.Total;

@SuppressWarnings("unused")
public class ComboBoxCTL2 implements ItemListener {
	private Vector<String> enter, food,rest,stay,room,tempKey;
	private Vector<Integer> travelp, temp,tempKey2;
	@SuppressWarnings("rawtypes")
	private JComboBox tpc1, tpc1_1, tpc1_2, tpc2, tpc2_1, tpc2_2;
	private Databases db;
	private int flag;
	private Total total;
	private JTextArea textArea;

	public ComboBoxCTL2(@SuppressWarnings("rawtypes") JComboBox tpc1,  Vector<String> tempKey,Vector<Integer> tempKey2,Total total, Databases db, int flag, JTextArea textArea) {
		this.tempKey= tempKey; // 관광지키 정보
		this.tempKey2= tempKey2; 
		this.total = total;
		this.tpc1 = tpc1;
		this.flag = flag;
		this.db = db;
		this.textArea = textArea;
	}

	@SuppressWarnings("unchecked")
	@Override
	public void itemStateChanged(ItemEvent event) {

		event.getSource();
		Object item = event.getItem();

		/*************** 
		 * Flag 1 - 관광지
		 * Flag 2 - 음식타입
		 * Flag 3 - 음식점
		 * Flag 4 - 투숙유형 
		 * Flag 5 - 숙박지
		 * Flag 6 - 숙박지타입별가격 
		 * Flag 7 - 입장료 가격 산출 1단계
		 *  *****************/
		if (flag == 1) {

			if (event.getStateChange() == ItemEvent.SELECTED) {
				String key = db.getTravel_key(db.getTravel_v().indexOf(item.toString()));
				enter = db.getEnter(key);
				tpc1.removeAllItems();
				tempKey.clear();
				int count = 0;
				tempKey.addElement(key); //현재선택된관광지키 저장.
				for (int i = 0; i < enter.size(); i++) {
					tpc1.addItem(enter.elementAt(i));
				}
				textArea.setText(item.toString() + " 관광지를 선택하셨습니다.");
				textArea.setFont(new Font("맑은 고딕",Font.BOLD,20));
				
			}
		}

		if (flag == 2) {
			
			if (event.getStateChange() == ItemEvent.SELECTED) {
				food = db.getFood(db.getTravel_key(db.getTravel_v().indexOf(item.toString())));
				tpc1.removeAllItems();
				
				tempKey.addElement(db.getTravel_key(db.getTravel_v().indexOf(item.toString())));
				for (int i = 0; i < food.size(); i++) {
					tpc1.addItem(food.elementAt(i));
				}				
			}
		}
		
		if (flag == 3) {
					
					if (event.getStateChange() == ItemEvent.SELECTED) {
						//System.out.println(item.toString() + " selected.");
						String key = db.getFood_key(db.getFood_v().indexOf(item.toString()));
						System.out.println(key);
						tempKey2.addElement(db.getFood_v().indexOf(item.toString()));
						rest = db.getRest(key,tempKey.lastElement());
						tpc1.removeAllItems();
											
						for (int i = 0; i < rest.size(); i++) {
							tpc1.addItem(rest.elementAt(i));
							}	
						textArea.setText(item.toString() + " 음식를 선택하셨습니다.");
						textArea.setFont(new Font("맑은 고딕",Font.BOLD,20));
					}
				}

		if (flag == 4) {
					
					if (event.getStateChange() == ItemEvent.SELECTED) {
						//System.out.println(item.toString() + " selected.");
						String key =db.getTravel_key(db.getTravel_v().indexOf(item.toString()));
						
						stay = db.getStay(key);
						tpc1.removeAllItems();
						tempKey.addElement(db.getTravel_key(db.getTravel_v().indexOf(item.toString())));
						for (int i = 0; i < stay.size(); i++) {
							tpc1.addItem(stay.elementAt(i));
						}				
					}
				}
		
		if (flag == 5) {
					
					if (event.getStateChange() == ItemEvent.SELECTED) {
						//System.out.println(item.toString() + " selected.");
						String key =tempKey.lastElement();
						System.out.println("이건 키 : " + key);
						room = db.getRoom(db.getStay_key(db.getStay_v().indexOf(item.toString())));
						tpc1.removeAllItems();
						tempKey2.addElement(db.getStay_v().indexOf(item.toString()));
						for (int i = 0; i < room.size(); i++) {
							tpc1.addItem(room.elementAt(i));
						}				
					}
				}
		
		if (flag == 6) {
			
			if (event.getStateChange() == ItemEvent.SELECTED) {
				//System.out.println(item.toString() + " selected.");
				String key =tempKey.lastElement();
				System.out.println("이건 숙박키 : " + key);
				room = db.getRoomType(item.toString());
				tempKey2.addElement(db.getRoom_v().indexOf(item.toString()));
				tpc1.removeAllItems();
	
				for (int i = 0; i < room.size(); i++) {
					tpc1.addItem(room.elementAt(i));
				}	
				textArea.setText(item.toString() + " 숙박지를 선택하셨습니다.");
				textArea.setFont(new Font("맑은 고딕",Font.BOLD,20));
			}
		}
		
		if (flag == 7) {
					
					if (event.getStateChange() == ItemEvent.SELECTED) {
						tempKey2.clear(); 
						//System.out.println("가격!!~~~~~~~~!"+db.getEnter_fee().elementAt(db.getEnter_v().indexOf(item.toString())));
						System.out.println("인덱스값7!!!~~~~~~~~!"+db.getEnter_v().indexOf(item.toString()));
						tempKey2.addElement(db.getEnter_v().indexOf(item.toString())); // 인덱스 추가
				}	}
		
		if (flag == 8) {
			
			if (event.getStateChange() == ItemEvent.SELECTED) {
					tempKey2.clear(); 
					//System.out.println("가격!!~~~~~~~~!"+db.getEnter_fee().elementAt(db.getEnter_v().indexOf(item.toString())));
					System.out.println("인덱스값8!!!~~~~~~~~!"+db.getRest_v().indexOf(item.toString()));
					tempKey2.addElement(db.getRest_v().indexOf(item.toString())); // 인덱스 추가
			}}
		if (flag == 9) {
			
			if (event.getStateChange() == ItemEvent.SELECTED) {
					tempKey2.clear(); 
					//System.out.println("가격!!~~~~~~~~!"+db.getEnter_fee().elementAt(db.getEnter_v().indexOf(item.toString())));
					System.out.println("인덱스값9!!!~~~~~~~~!"+db.getRoomType_v().indexOf(item.toString()));
					tempKey2.addElement(db.getRoomType_v().indexOf(item.toString())); // 인덱스 추가
			}	
			

}}}

/*
 * if (event.getStateChange() == ItemEvent.DESELECTED) {
 * System.out.println(item.toString() + " deselected."); }
 */

