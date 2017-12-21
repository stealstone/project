package Team3.Controller;
import java.awt.Font;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.text.NumberFormat;
import java.util.Vector;

import javax.swing.JFileChooser;
import javax.swing.JFrame;
import javax.swing.JOptionPane;

import Team3.Model.Total;

@SuppressWarnings("unused")
public class SaveController implements ActionListener {
	private JFrame f;
	private JFileChooser jc;
	private Total total;
	private int flag;
	public SaveController(JFrame f,Total total) {
		this.f = f;
		this.total = total;
		this.jc = new JFileChooser(".");
	}

	@Override
	public void actionPerformed(ActionEvent e) {
		if(this.jc.showSaveDialog(f) == JFileChooser.APPROVE_OPTION){
			this.saveFile(this.jc.getSelectedFile());
			JOptionPane.showMessageDialog(this.f, "파일이 잘 저장됐습니다");
		}
		
	}
	private void saveFile(File file){
		NumberFormat nf = NumberFormat.getNumberInstance();
		BufferedWriter bw = null;
		try{
			bw = new BufferedWriter(new FileWriter(file));
			bw.write("                                              <<여행 경비 종합>>\n");
			bw.write("선택하신 역 : " + this.total.getStation_v().elementAt(0));
			bw.write("\n----------------------------------------------------------------------------------------------------------------------------\n");
			bw.write("관광지 이름           ||         입장유형 			||    인원수    ||      입장가격      ||    총 비용    ||\n");
			bw.write("----------------------------------------------------------------------------------------------------------------------------\n");
			bw.flush();
			for(int i =0; i < this.total.getTravel_v().size(); i++){
		         bw.write(String.format("%-20s",this.total.getTravel_v().elementAt(i)) + "\t");
		         bw.write(String.format("%-25s",this.total.getTraveltype_v().elementAt(i) + "\t"));
		         bw.write(String.format("%-10s",this.total.getTravelp_nv().elementAt(i) + "명"));
		         bw.write(String.format("\t" + "%10s", nf.format(this.total.getTravelp_v().elementAt(i)) + "원"));
		         bw.write(String.format("\t" + "%10s", nf.format(this.total.getTravelp_rv().elementAt(i)) + "원"));
		         bw.write("\n");
			}
			bw.write("\n");
			bw.write("----------------------------------------------------------------------------------------------------------------------------\n");
			bw.write("음식 이름              ||         음식점 이름		||  주문한 량  ||  음식 1인분 가격  ||   총 비용    ||\n");
			bw.write("----------------------------------------------------------------------------------------------------------------------------\n");
			for(int i =0; i < this.total.getFood_v().size(); i++){
		         bw.write(String.format("%-20s",this.total.getFood_v().elementAt(i)+ "\t"));
		         bw.write(String.format("%-25s",this.total.getFoodtype_v().elementAt(i) + "\t"));
		         bw.write(String.format("%-10s",this.total.getFoodp_nv().elementAt(i) + "인분"));
		         bw.write(String.format("\t" +"%10s", nf.format(this.total.getFoodp_v().elementAt(i)) + "원"));
		         bw.write(String.format("\t" +"%10s", nf.format(this.total.getFoodp_rv().elementAt(i)) + "원"));
		         bw.write("\n");
			}
			bw.write("\n");
			bw.write("----------------------------------------------------------------------------------------------------------------------------\n");
			bw.write("숙박지 유형           ||           숙박지이름             ||   숙박일수   ||    숙박 1일비용    ||   총 비용    ||\n");
			bw.write("----------------------------------------------------------------------------------------------------------------------------\n");
			for(int i =0; i < this.total.getRoom_v().size(); i++){
				 bw.write(String.format("%-20s",this.total.getRoom_v().elementAt(i)));
				 bw.write(String.format("%-25s",this.total.getRoomtype_v().elementAt(i)));
				 bw.write(String.format("%-10s",(this.total.getRoomp_nv().elementAt(i) + "박" + (this.total.getRoomp_nv().elementAt(i)+1) + "일")));
				 bw.write(String.format("\t" + "%10s", nf.format(this.total.getRoomp_v().elementAt(i)) + "원"));
				 bw.write(String.format("\t" + "%10s", nf.format(this.total.getRoomp_rv().elementAt(i)) + "원"));
				 bw.write("\n");
		      }
			bw.write("----------------------------------------------------------------------------------------------------------------------------\n");
			int TravelTot = 0;
		      int FoodTot = 0;
		      int RoomTot = 0;
		      for(int i = 0; i < this.total.getTravelp_rv().size() ; i++){
		    	  TravelTot += this.total.getTravelp_rv().elementAt(i);}
		      for(int i = 0; i < this.total.getFoodp_rv().size() ; i++){
					FoodTot += this.total.getFoodp_rv().elementAt(i);}
		      for(int i = 0; i < this.total.getRoomp_rv().size() ; i++){
					RoomTot += this.total.getRoomp_rv().elementAt(i);}
		      

			  bw.write("							                                            총 금액 : " + nf.format(TravelTot + FoodTot + RoomTot) + "원");
		}catch(IOException ex){
			System.out.println(ex);
		}finally{
			try{
				bw.close();
			}catch(IOException ex){}
		}

	}

}