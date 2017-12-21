package Team3.Model;
import java.text.NumberFormat;
import java.util.Vector;

import javax.swing.table.DefaultTableModel;


@SuppressWarnings("serial")
public class MyTable extends DefaultTableModel {
   private Total total;
   public MyTable(Total total) {
      this.total = total;
      this.setDataVector(getTwoVector(), getColumnVector());
   }
   private Vector<Object> getTwoVector(){
	  NumberFormat nf = NumberFormat.getNumberInstance();
      Vector<Object> v = new Vector<Object>(1,1); 
      for(int i =0; i < this.total.getTravel_v().size(); i++){
         Vector<String> twoVector = new Vector<String>(5);
         twoVector.addElement(String.valueOf(this.total.getTravel_v().elementAt(i)));
         twoVector.addElement(String.valueOf(this.total.getTraveltype_v().elementAt(i)));
         twoVector.addElement(String.valueOf(this.total.getTravelp_nv().elementAt(i) + "명"));
         twoVector.addElement(String.valueOf(nf.format(this.total.getTravelp_v().elementAt(i)) + "원"));
         twoVector.addElement(String.valueOf(nf.format(this.total.getTravelp_rv().elementAt(i)) + "원"));
         v.addElement(twoVector);
      }
      return v;
   }
   private Vector<String> getColumnVector(){
      String [] columnArray = {"관광지 이름", "입장유형", "인원수", "입장가격", "총 비용"};
      Vector<String> columnVector = new Vector<String>(5);
      for(String str : columnArray) columnVector.addElement(str);
      return columnVector;
   }
   
}