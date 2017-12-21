package Team3.Controller;
import java.awt.Font;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.ItemListener;
import java.util.Vector;

import javax.swing.JComboBox;
import javax.swing.JSpinner;
import javax.swing.JTextArea;

import Team3.Model.Databases;
import Team3.Model.Total;

@SuppressWarnings("unused")
public class DamgiController implements ActionListener {
	private Vector<String> travel, travel_i ;
	private Vector<Integer> temp,temp2,temp3;
	private Databases db;
	private int flag;
	private Total total;
	private JTextArea textArea;
	private int delete;
	private JSpinner spin;
	
	public DamgiController( Total total,Vector<String> travel,Vector<Integer> temp2,Vector<Integer> temp3,JTextArea textArea ,Vector<Integer> temp,int flag,Databases db, JSpinner spin,int delete) {
		this.delete = delete;
		this.temp2 = temp2;
		this.temp3 = temp3;
		this.travel = travel;
		this.spin = spin;
		this.temp = temp;
		this.textArea = textArea;
		this.total = total;
		this.flag = flag;
	
		// this.tpc1_2 = tpc1_2;
		this.db = db;
	}
	
	public DamgiController(Total total2, Vector<String> travel2,
			Vector<Integer> temp22, Vector<Integer> temp32,
			JTextArea textArea2, int temp4, int flag2, Databases db2,
			JSpinner spin2, int delete2) {
		// TODO Auto-generated constructor stub
	}

	/*************** 
	 * Flag 1 - 관광지정보 전달
	 * Flag 2 - 음식정보 전달
	 * Flag 3 - 숙박정보 전달
	 *  *****************/

	@Override
	public void actionPerformed(ActionEvent e) {
		if (flag == 1) {
			 int i = temp.lastElement();
			 int num = (int) spin.getValue();
						 
			 if(total.getTraveltype_key().isEmpty()==false &&(total.getTraveltype_key().indexOf(db.getEnter_key().elementAt(i))) != -1 ){
				 int temp =total.getTraveltype_key().indexOf(db.getEnter_key().elementAt(i));
				 total.getTraveltype_key().remove(temp);
				 total.getTravel_v().remove(temp);
				 total.getTraveltype_v().remove(temp);
				 total.getTravelp_nv().remove(temp);
				 total.getTravelp_v().remove(temp);
				 total.getTravelp_rv().remove(temp);
				 }
			 
			 
			 total.getTraveltype_key().addElement(db.getEnter_key().elementAt(i)); // 입장권 타입 기본키 저장
			 total.getTravel_v().addElement(db.getTravel_v().elementAt(db.getTravel_key().indexOf(travel.lastElement()))); //관광지이름 호출 및 저장
			 total.getTraveltype_v().addElement(db.getEnter_v().elementAt(i));
			 total.getTravelp_nv().addElement(num);
			 total.getTravelp_v().addElement(db.getEnter_fee().elementAt(i));
			 total.getTravelp_rv().addElement((db.getEnter_fee().elementAt(i))*num);
			 
			 if(delete == 0){
				 int temp =total.getTraveltype_key().indexOf(db.getEnter_key().elementAt(i));
				 total.getTraveltype_key().remove(temp);
				 total.getTravel_v().remove(temp);
				 total.getTraveltype_v().remove(temp);
				 total.getTravelp_nv().remove(temp);
				 total.getTravelp_v().remove(temp);
				 total.getTravelp_rv().remove(temp);
				System.out.println("지워졌지롱");	 
				if (total.getTraveltype_key().isEmpty()==true) {textArea.setText("");}
				else{	new DamgiController( total, travel,temp2,temp3,textArea ,temp,flag,db, spin,1);}
			 }			 
			 
			 if(total.getTraveltype_key().size() == 1){
			 textArea.setText(total.getTravel_v().elementAt(0)+ " : " +total.getTraveltype_v().elementAt(0)
						 + " " + total.getTravelp_nv().elementAt(0) +"명,\n 표1개당 : "+total.getTravelp_v().elementAt(0) +"원 --> "+"총 "+total.getTravelp_rv().elementAt(0) +"원"
						 + "\n전체 비용 : " + total.getTravelp_rv().elementAt(0) + "원");
			 textArea.setFont(new Font("맑은 고딕",Font.BOLD,14));}
			 
			 else if(total.getTraveltype_key().size() == 2){
		     int tot = total.getTravelp_rv().elementAt(0) + total.getTravelp_rv().elementAt(1);
		     textArea.setText(total.getTravel_v().elementAt(0)+ " : "+total.getTraveltype_v().elementAt(0)
						 + " " + total.getTravelp_nv().elementAt(0) +"명,\n 표1개당 : "+total.getTravelp_v().elementAt(0) +"원 --> "+"총 "+total.getTravelp_rv().elementAt(0) +"원"
						 + "\n"+total.getTravel_v().elementAt(1)+ " : "+ total.getTraveltype_v().elementAt(1)
						 + " " + total.getTravelp_nv().elementAt(1) +"명,\n 표1개당 : "+total.getTravelp_v().elementAt(1) +"원 --> "+"총 "+total.getTravelp_rv().elementAt(1) +"원"
						 + "\n전체 비용 : " + tot + "원");
		     textArea.setFont(new Font("맑은 고딕",Font.BOLD,14));}
			 
			 else if(total.getTraveltype_key().size() == 3){
				 int tot1 = total.getTravelp_rv().elementAt(0) + total.getTravelp_rv().elementAt(1) + total.getTravelp_rv().elementAt(2);
				 textArea.setText(total.getTravel_v().elementAt(0)+ " : " +total.getTraveltype_v().elementAt(0)
						 + " " +total.getTravelp_nv().elementAt(0) +"명,\n 표1개당 : "+total.getTravelp_v().elementAt(0) +"원 --> "+"총 "+total.getTravelp_rv().elementAt(0) +"원"
						 + "\n"+total.getTravel_v().elementAt(1)+ " : " + total.getTraveltype_v().elementAt(1)
						 + " " +total.getTravelp_nv().elementAt(1) +"명,\n 표1개당 : "+total.getTravelp_v().elementAt(1) +"원 --> "+"총 "+total.getTravelp_rv().elementAt(1) +"원"
						 + "\n"+total.getTravel_v().elementAt(2)+ " : " +total.getTraveltype_v().elementAt(2)
						 + " " +total.getTravelp_nv().elementAt(2) +"명,\n 표1개당 : "+total.getTravelp_v().elementAt(0) +"원 --> "+"총 "+total.getTravelp_rv().elementAt(2) +"원"
						 + "\n전체 비용 : " + tot1 + "원");
				 textArea.setFont(new Font("맑은 고딕",Font.BOLD,14));}
			 
			 else if(total.getTraveltype_key().size() == 4){
				 int tot2 = total.getTravelp_rv().elementAt(0) + total.getTravelp_rv().elementAt(1) + total.getTravelp_rv().elementAt(2) + total.getTravelp_rv().elementAt(3);
			 textArea.setText(total.getTravel_v().elementAt(0)+ " : " +total.getTraveltype_v().elementAt(0)
					 + " " +total.getTravelp_nv().elementAt(0) +"명,\n 표1개당 : "+total.getTravelp_v().elementAt(0) +"원 --> "+"총 "+total.getTravelp_rv().elementAt(0) +"원"
					 + "\n"+total.getTravel_v().elementAt(1)+ " : " + total.getTraveltype_v().elementAt(1)
					 + " " +total.getTravelp_nv().elementAt(1) +"명,\n 표1개당 : "+total.getTravelp_v().elementAt(1) +"원 --> "+"총 "+total.getTravelp_rv().elementAt(1) +"원"
					 + "\n"+total.getTravel_v().elementAt(2)+ " : " + total.getTraveltype_v().elementAt(2)
					 + " " +total.getTravelp_nv().elementAt(2) +"명,\n 표1개당 : "+total.getTravelp_v().elementAt(0) +"원 --> "+"총 "+total.getTravelp_rv().elementAt(2) +"원"
					 + "\n"+ total.getTravel_v().elementAt(3)+ " : " + total.getTraveltype_v().elementAt(3)
					 + " " +total.getTravelp_nv().elementAt(3) +"명,\n 표1개당 : "+total.getTravelp_v().elementAt(3) +"원 --> "+"총 "+total.getTravelp_rv().elementAt(3) +"원"
					 + "\n전체 비용 : " + tot2 + "원");
			 textArea.setFont(new Font("맑은 고딕",Font.BOLD,14));}
			
		}
		
		if (flag == 2) {
			 int i = temp.lastElement();
			 int num = (int) spin.getValue();
			 if(total.getFoodtype_key().isEmpty()==false &&(total.getFoodtype_key().indexOf(db.getRest_key().elementAt(i))) != -1 ){
				 int temp =total.getFoodtype_key().indexOf(db.getRest_key().elementAt(i));
				 total.getFoodtype_key().remove(temp);
				 total.getFood_v().remove(temp);
				 total.getFoodtype_v().remove(temp);
				 total.getFoodp_nv().remove(temp);
				 total.getFoodp_v().remove(temp);
				 total.getFoodp_rv().remove(temp);
				 }
			//System.out.println(food.lastElement()); //db.getFood_v().elementAt(tempKey2.lastElement())
			total.getFoodtype_key().addElement(db.getRest_key().elementAt(i));
			 total.getFood_v().addElement(db.getFood_v().elementAt(temp2.lastElement()));
			 total.getFoodtype_v().addElement(db.getRest_v().elementAt(i));
			 total.getFoodp_nv().addElement(num);
			 total.getFoodp_v().addElement(db.getFood_fee().elementAt(i));
			 total.getFoodp_rv().addElement((db.getFood_fee().elementAt(i))*num);
		
			 if(delete == 0){
				 int temp =total.getFoodtype_key().indexOf(db.getRest_key().elementAt(i));
				 total.getFoodtype_key().remove(temp);
				 total.getFood_v().remove(temp);
				 total.getFoodtype_v().remove(temp);
				 total.getFoodp_nv().remove(temp);
				 total.getFoodp_v().remove(temp);
				 total.getFoodp_rv().remove(temp);
				System.out.println("지워졌지롱");	 
				if (total.getTraveltype_key().isEmpty()==true) {textArea.setText("");}
				else{	new DamgiController( total, travel,temp2,temp3,textArea ,temp,flag,db, spin,1);}
			 }		
		 
			if(total.getFoodtype_key().size() == 1){
			 textArea.setText("음식명: "+total.getFood_v().elementAt(0)+" 식당명 :"+total.getFoodtype_v().elementAt(0) + " "
						 + total.getFoodp_nv().elementAt(0) +"인분,\n1인분 가격 : "+total.getFoodp_v().elementAt(0) +"원 -->"+"총"+total.getFoodp_rv().elementAt(0) +"원"
						 + "\n전체 비용 : " + total.getFoodp_rv().elementAt(0) +"원");
			 textArea.setFont(new Font("맑은 고딕",Font.BOLD,14));}
			 
			 else if(total.getFoodtype_key().size() == 2){
			 int tot = total.getFoodp_rv().elementAt(0) + total.getFoodp_rv().elementAt(1);
		     textArea.setText("음식명: "+total.getFood_v().elementAt(0)+" 식당명 :"+total.getFoodtype_v().elementAt(0) + " "
						 + total.getFoodp_nv().elementAt(0) +"인분,\n1인분 가격 :  "+total.getFoodp_v().elementAt(0) +"원 -->"+"총"+total.getFoodp_rv().elementAt(0) +"원"
						 + "\n"+"음식명: "+total.getFood_v().elementAt(1)+" 식당명 :"+total.getFoodtype_v().elementAt(1) + " "
						 + total.getFoodp_nv().elementAt(1) +"인분,\n1인분 가격 :  "+total.getFoodp_v().elementAt(1) +"원 -->"+"총"+total.getFoodp_rv().elementAt(1) +"원"
						 + "\n전체 비용 : " + tot + "원");
		     textArea.setFont(new Font("맑은 고딕",Font.BOLD,14));}
			
			 else if(total.getFoodtype_key().size() == 3){
				 int tot1 = total.getFoodp_rv().elementAt(0) + total.getFoodp_rv().elementAt(1) + total.getFoodp_rv().elementAt(2);
			     textArea.setText("음식명: "+total.getFood_v().elementAt(0)+" 식당명 :"+total.getFoodtype_v().elementAt(0) + " "
							 + total.getFoodp_nv().elementAt(0) +"인분,\n1인분 가격 :  "+total.getFoodp_v().elementAt(0) +"원 -->"+"총"+total.getFoodp_rv().elementAt(0) +"원"
							 + "\n" +"음식명: "+total.getFood_v().elementAt(1)+" 식당명 :"+total.getFoodtype_v().elementAt(1) + " "
							 + total.getFoodp_nv().elementAt(1) +"인분,\n1인분 가격 :  "+total.getFoodp_v().elementAt(1) +"원 -->"+"총"+total.getFoodp_rv().elementAt(1) +"원"
							 + "\n"+"음식명: "+total.getFood_v().elementAt(2)+" 식당명 :"+ total.getFoodtype_v().elementAt(2) + " "
							 + total.getFoodp_nv().elementAt(2) +"인분,\n1인분 가격 :  "+total.getFoodp_v().elementAt(2) +"원 -->"+"총"+total.getFoodp_rv().elementAt(2) +"원"
							 + "\n전체 비용 : " + tot1 + "원");
			     textArea.setFont(new Font("맑은 고딕",Font.BOLD,14));}
			 
			 else if(total.getFoodtype_key().size() == 4){
				 int tot2 = total.getFoodp_rv().elementAt(0) + total.getFoodp_rv().elementAt(1) + total.getFoodp_rv().elementAt(2) + total.getFoodp_rv().elementAt(3);
			     textArea.setText("음식명: "+total.getFood_v().elementAt(0)+" 식당명 :"+total.getFoodtype_v().elementAt(0) + " "
							 + total.getFoodp_nv().elementAt(0) +"인분,\n1인분 가격 :  "+total.getFoodp_v().elementAt(0) +"원 -->"+"총"+total.getFoodp_rv().elementAt(0) +"원"
							 + "\n"+"음식명: "+total.getFood_v().elementAt(1)+" 식당명 :"+total.getFoodtype_v().elementAt(1) + " "
							 + total.getFoodp_nv().elementAt(1) +"인분,\n1인분 가격 :  "+total.getFoodp_v().elementAt(1) +"원 -->"+"총"+total.getFoodp_rv().elementAt(1) +"원"
							 + "\n"+"음식명: "+total.getFood_v().elementAt(2)+" 식당명 :"+ total.getFoodtype_v().elementAt(2) + " "
							 + total.getFoodp_nv().elementAt(2) +"인분,\n1인분 가격 :  "+total.getFoodp_v().elementAt(2) +"원 -->"+"총"+total.getFoodp_rv().elementAt(2) +"원"
							 + "\n" +"음식명: "+total.getFood_v().elementAt(3)+" 식당명 :"+ total.getFoodtype_v().elementAt(3) + " "
							 + total.getFoodp_nv().elementAt(3) +"인분,\n1인분 가격 :  "+total.getFoodp_v().elementAt(3) +"원 -->"+"총"+total.getFoodp_rv().elementAt(3) +"원"
							 + "\n전체 비용 : " + tot2 + "원");
			     textArea.setFont(new Font("맑은 고딕",Font.BOLD,14));}
		}
		
		if (flag == 3) {
			 int i = temp.lastElement();
			 int num = (int) spin.getValue();
			 if(total.getRoomtype_key().isEmpty()==false &&(total.getRoomtype_key().indexOf(db.getRoomType_key().elementAt(i))) != -1 ){
				 int temp =total.getRoomtype_key().indexOf(db.getRoomType_key().elementAt(i));
				 total.getRoomtype_key().remove(temp);
				 total.getStay_v().remove(temp);
				 total.getRoom_v().remove(temp);
				 total.getRoomtype_v().remove(temp);
				 total.getRoomp_nv().remove(temp);
				 total.getRoomp_v().remove(temp);
				 total.getRoomp_rv().remove(temp);
				 }
			 total.getRoomtype_key().addElement(db.getRoomType_key().elementAt(i));
			 total.getStay_v().addElement(db.getStay_v().elementAt(temp2.lastElement()));
			 total.getRoom_v().addElement(db.getRoom_v().elementAt(temp3.lastElement()));
			 total.getRoomtype_v().addElement(db.getRoomType_v().elementAt(i));
			 total.getRoomp_nv().addElement(num);
			 total.getRoomp_v().addElement(db.getRoom_fee().elementAt(i));
			 total.getRoomp_rv().addElement((db.getRoom_fee().elementAt(i))*num);
			 
			 if(delete == 0){
				 int temp =total.getRoomtype_v().indexOf(db.getRoomType_v().elementAt(i));
				 total.getRoomtype_key().remove(temp);
				 total.getStay_v().remove(temp);
				 total.getRoom_v().remove(temp);
				 total.getRoomtype_v().remove(temp);
				 total.getRoomp_nv().remove(temp);
				 total.getRoomp_v().remove(temp);
				 total.getRoomp_rv().remove(temp);
				System.out.println("지워졌지롱");	 
				if (total.getTraveltype_key().isEmpty()==true) {textArea.setText("");}
				else{	new DamgiController( total, travel,temp2,temp3,textArea ,temp,flag,db, spin,1);}
			 }		
		 
			if(total.getRoomtype_v().size() == 1){
			 textArea.setText("숙소명 :"+total.getRoom_v().elementAt(0)+" || 방종류 :"+total.getRoomtype_v().elementAt(0) + "\n"
					 	+ total.getRoomp_nv().elementAt(0) +"박" + (total.getRoomp_nv().elementAt(0)+1) + "일 , 가격 : "+total.getRoomp_v().elementAt(0) +"원 -->"+"총"+total.getRoomp_rv().elementAt(0) +"원"
						+ "\n전체 비용 : " + total.getRoomp_rv().elementAt(0) +"원");
			 textArea.setFont(new Font("맑은 고딕",Font.BOLD,14));}
			 else if(total.getRoomtype_v().size() == 2){
			 int tot = total.getRoomp_rv().elementAt(0) + total.getRoomp_rv().elementAt(1);
		     textArea.setText("숙소명 :"+total.getRoom_v().elementAt(0)+" || 방종류 :"+total.getRoomtype_v().elementAt(0)+ "\n"
		    		 + total.getRoomp_nv().elementAt(0) +"박" + (total.getRoomp_nv().elementAt(0)+1) + "일 , 가격 :  "+total.getRoomp_v().elementAt(0) +"원 -->"+"총"+total.getRoomp_rv().elementAt(0) +"원"
						 + "\n"+"숙소명 :"+total.getRoom_v().elementAt(1)+" || 방종류 :"+total.getRoomtype_v().elementAt(1)+ "\n"
						+ total.getRoomp_nv().elementAt(1) +"박" + (total.getRoomp_nv().elementAt(1)+1) + "일 , 가격 :  "+total.getRoomp_v().elementAt(1) +"원 -->"+"총"+total.getRoomp_rv().elementAt(1) +"원"
						+ "\n전체 비용 : " + tot +"원");
		     textArea.setFont(new Font("맑은 고딕",Font.BOLD,14));}
			
			 else if(total.getRoomtype_v().size() == 3){
				 int tot1 = total.getRoomp_rv().elementAt(0) + total.getRoomp_rv().elementAt(1) + total.getRoomp_rv().elementAt(2);
			     textArea.setText("숙소명 :"+total.getRoom_v().elementAt(0)+" || 방종류 :"+total.getRoomtype_v().elementAt(0)+ "\n"
							 + total.getRoomp_nv().elementAt(0) +"박" + (total.getRoomp_nv().elementAt(0)+1) + "일 , 가격 :  "+total.getRoomp_v().elementAt(0) +"원 -->"+"총"+total.getRoomp_rv().elementAt(0) +"원"
							 + "\n"+"숙소명 :"+total.getRoom_v().elementAt(1)+" || 방종류 :"+total.getRoomtype_v().elementAt(1)+ "\n"
							 + total.getRoomp_nv().elementAt(1) +"박" + (total.getRoomp_nv().elementAt(1)+1) + "일 , 가격 :  "+total.getRoomp_v().elementAt(1) +"원 -->"+"총"+total.getRoomp_rv().elementAt(1) +"원"
							 + "\n"+"숙소명 :"+total.getRoom_v().elementAt(2)+" || 방종류 :"+total.getRoomtype_v().elementAt(2)+ "\n"
							 + total.getRoomp_nv().elementAt(2) +"박" + (total.getRoomp_nv().elementAt(2)+1) + "일 , 가격 :  "+total.getRoomp_v().elementAt(2) +"원 -->"+"총"+total.getRoomp_rv().elementAt(2) +"원"
							 + "\n전체 비용 : " + tot1 +"원");
			     textArea.setFont(new Font("맑은 고딕",Font.BOLD,14));}
			
			 else if(total.getRoomtype_v().size() == 4){
				 int tot2 = total.getRoomp_rv().elementAt(0) + total.getRoomp_rv().elementAt(1) + total.getRoomp_rv().elementAt(2) + total.getRoomp_rv().elementAt(3);
			     textArea.setText("숙소명 :"+total.getRoom_v().elementAt(0)+" || 방종류 :"+total.getRoomtype_v().elementAt(0)+ "\n"
			    		 + total.getRoomp_nv().elementAt(0) +"박" + (total.getRoomp_nv().elementAt(0)+1) + "일 , 가격 :  "+total.getRoomp_v().elementAt(0) +"원 -->"+"총"+total.getRoomp_rv().elementAt(0) +"원"
							 + "\n"+"숙소명 :"+total.getRoom_v().elementAt(1)+" || 방종류 :"+total.getRoomtype_v().elementAt(1)+ "\n"
							 + total.getRoomp_nv().elementAt(1) +"박" + (total.getRoomp_nv().elementAt(1)+1) + "일 , 가격 :  "+total.getRoomp_v().elementAt(1) +"원 -->"+"총"+total.getRoomp_rv().elementAt(1) +"원"
							 + "\n"+"숙소명 :"+total.getRoom_v().elementAt(2)+" || 방종류 :"+total.getRoomtype_v().elementAt(2)+ "\n"
							 + total.getRoomp_nv().elementAt(2) +"박" + (total.getRoomp_nv().elementAt(2)+1) + "일 , 가격 :  "+total.getRoomp_v().elementAt(2) +"원 -->"+"총"+total.getRoomp_rv().elementAt(2) +"원"
							 + "\n"+"숙소명 :"+total.getRoom_v().elementAt(3)+" || 방종류 :"+total.getRoomtype_v().elementAt(3)+ "\n"
							 + total.getRoomp_nv().elementAt(3) +"박" + (total.getRoomp_nv().elementAt(3)+1) + "일 ,가격 :  "+total.getRoomp_v().elementAt(3) +"원 -->"+"총"+total.getRoomp_rv().elementAt(3) +"원"
							 + "\n전체 비용 : " + tot2 +"원");
			     textArea.setFont(new Font("맑은 고딕",Font.BOLD,14));}
			
		
	}
	}}



