package Team3.Controller;
import java.awt.Font;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Vector;

import javax.swing.JFileChooser;
import javax.swing.JFrame;
import javax.swing.JOptionPane;

import Team3.Model.Total;


@SuppressWarnings("unused")
public class SaveController1 implements ActionListener {
	private JFrame f;
	private JFileChooser jc1;
	private Total total;
	
	public SaveController1(JFrame f,Total total) {
		this.f = f;
		this.total = total;
		this.jc1 = new JFileChooser(".");
	}

	@Override
	public void actionPerformed(ActionEvent e) {
		if(this.jc1.showSaveDialog(f) == JFileChooser.APPROVE_OPTION){
			this.saveFile1(this.jc1.getSelectedFile());
			JOptionPane.showMessageDialog(this.f, "파일이 잘 저장됐습니다");
		}
	}
	private void saveFile1(File file){
		BufferedWriter bw1 = null;
		try{
			bw1 = new BufferedWriter(new FileWriter(file));
			bw1.write("관광지 이름,입장유형,인원수,입장가격,총 비용\n");
			bw1.flush();
			for(int i =0; i < this.total.getTravel_v().size(); i++){
				bw1.write(this.total.getTravel_v().elementAt(i) + ",");
		         bw1.write(this.total.getTraveltype_v().elementAt(i) + ",");
		         bw1.write(this.total.getTravelp_nv().elementAt(i) + "명,");
		         bw1.write(this.total.getTravelp_v().elementAt(i) + "원,");
		         bw1.write(this.total.getTravelp_rv().elementAt(i) + "원");
		         bw1.write("\n");
			}
			bw1.write("음식 이름,음식점 이름,주문한 량,음식 1인분 가격,총 비용\n");
			for(int i =0; i < this.total.getFood_v().size(); i++){
		         bw1.write(this.total.getFood_v().elementAt(i)+ ",");
		         bw1.write(this.total.getFoodtype_v().elementAt(i) + ",");
		         bw1.write(this.total.getFoodp_nv().elementAt(i) + "인분,");
		         bw1.write(this.total.getFoodp_v().elementAt(i) + "원,");
		         bw1.write(this.total.getFoodp_rv().elementAt(i) + "원");
		         bw1.write("\n");
			}
			bw1.write("숙박지 유형,숙박지이름,숙박일수,숙박 1일비용,총 비용\n");
			for(int i =0; i < this.total.getRoom_v().size(); i++){
				 bw1.write(this.total.getRoom_v().elementAt(i)+ ",");
				 bw1.write(this.total.getRoomtype_v().elementAt(i)+ ",");
				 bw1.write(this.total.getRoomp_nv().elementAt(i) + "박" + (this.total.getRoomp_nv().elementAt(i)+1) + "일,");
				 bw1.write(this.total.getRoomp_v().elementAt(i) + "원,");
				 bw1.write(this.total.getRoomp_rv().elementAt(i) + "원");
				 bw1.write("\n");
			}
			int TravelTot = 0;
		      int FoodTot = 0;
		      int RoomTot = 0;
		      for(int i = 0; i < this.total.getTravelp_rv().size() ; i++){
		    	  TravelTot += this.total.getTravelp_rv().elementAt(i);}
		      for(int i = 0; i < this.total.getFoodp_rv().size() ; i++){
					FoodTot += this.total.getFoodp_rv().elementAt(i);}
		      for(int i = 0; i < this.total.getRoomp_rv().size() ; i++){
					RoomTot += this.total.getRoomp_rv().elementAt(i);}
			bw1.write(" , , , 총금액,"+ (TravelTot + FoodTot + RoomTot) + "원");
	}catch(IOException ex){
		System.out.println(ex);
	}finally{
		try{
			bw1.close();
		}catch(IOException ex){}
	} 
	}
}
		
