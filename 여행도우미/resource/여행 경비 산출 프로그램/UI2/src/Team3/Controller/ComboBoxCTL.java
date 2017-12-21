package Team3.Controller;
import java.awt.Font;
import java.awt.event.ItemEvent;
import java.awt.event.ItemListener;
import java.util.Vector;

import javax.swing.JComboBox;
import javax.swing.JTextArea;

import Team3.Model.Databases;
import Team3.Model.Total;

public class ComboBoxCTL implements ItemListener {
	@SuppressWarnings("unused")
	private Vector<String> station, travel;
	private Total total;
	@SuppressWarnings("rawtypes")
	private JComboBox tpc1, tpc1_1, tpc1_2, tpc2, tpc2_1, tpc2_2;
	// private int flag;
	private Databases db;
	private JTextArea textArea;

	public ComboBoxCTL(@SuppressWarnings("rawtypes") JComboBox tpc1, @SuppressWarnings("rawtypes") JComboBox tpc1_1, @SuppressWarnings("rawtypes") JComboBox tpc1_2,
			@SuppressWarnings("rawtypes") JComboBox tpc2, @SuppressWarnings("rawtypes") JComboBox tpc2_1, @SuppressWarnings("rawtypes") JComboBox tpc2_2,
			Vector<String> station, Databases db, JTextArea textArea, Total total) {
		this.total = total;
		this.station = station;
		this.tpc1 = tpc1;
		this.tpc1_1 = tpc1_1;
		this.tpc1_2 = tpc1_2;
		this.tpc2 = tpc2;
		this.tpc2_1 = tpc2_1;
		this.tpc2_2 = tpc2_2;
		this.db = db;
		this.textArea = textArea;
	}

	@SuppressWarnings("unchecked")
	@Override
	public void itemStateChanged(ItemEvent event) {

		/*************************** 시작역 선택 **************************************/
		event.getSource();
		Object item = event.getItem();
		System.out.println("TOTOTOTO" + item.toString());

		if (event.getStateChange() == ItemEvent.SELECTED) {
			/************* 역 초기화 *****************/
			this.total.getStation_v().clear();
			
			/************* 관광지 초기화 *****************/
			this.total.getTraveltype_key().clear();
			this.total.getTraveltype_v().clear();
			this.total.getTravel_v().clear();
			this.total.getTravelp_v().clear();
			this.total.getTravelp_nv().clear();
			this.total.getTravelp_rv().clear();
			
			/************* 음식 초기화 *****************/
			this.total.getFoodtype_key().clear();
			this.total.getFoodtype_v().clear();
			this.total.getFood_v().clear();
			this.total.getFoodp_v().clear();
			this.total.getFoodp_nv().clear();
			this.total.getFoodp_rv().clear();
			
			/************* 숙소 초기화 *****************/
			this.total.getRoomtype_key().clear();
			this.total.getRoomtype_v().clear();
			this.total.getRoom_v().clear();
			this.total.getRoomp_v().clear();
			this.total.getRoomp_nv().clear();
			this.total.getRoomp_rv().clear();
			
			System.out.println(item.toString() + " selected.");
			tpc1.removeAllItems();
			tpc1.addItem(item.toString());
			tpc1_1.removeAllItems();
			tpc1_1.addItem(item.toString());
			tpc1_2.removeAllItems();
			tpc1_2.addItem(item.toString());
			this.total.getStation_v().addElement(item.toString());


			/*************************** 여행지 선택 **************************************/
			tpc2.removeAllItems();
			tpc2_1.removeAllItems();
			tpc2_2.removeAllItems();

			travel = db.getSight(db.getStation_key(db.getStation_v().indexOf(
					item.toString())));

			for (int i = 0; i < travel.size(); i++) {
				tpc2.addItem(travel.elementAt(i));
				tpc2_1.addItem(travel.elementAt(i));
				tpc2_2.addItem(travel.elementAt(i));
			}
			textArea.setText(item.toString() + "을 선택하셨습니다.");
			textArea.setFont(new Font("맑은 고딕",Font.BOLD,20));
		}

		if (event.getStateChange() == ItemEvent.DESELECTED) {
			System.out.println(item.toString() + " deselected.");
		}
	}
}
