package Team3.Model;
import java.text.NumberFormat;
import java.util.Vector;

import javax.swing.table.DefaultTableModel;


@SuppressWarnings("serial")
public class MyTable1 extends DefaultTableModel {
   private Total total;
   public MyTable1(Total total) {
      this.total = total;
      this.setDataVector(getTwoVector(), getColumnVector());
   }
   private Vector<Object> getTwoVector(){
	  NumberFormat nf = NumberFormat.getNumberInstance();
      Vector<Object> v = new Vector<Object>(1,1); 
      for(int i =0; i < this.total.getFood_v().size(); i++){
         Vector<String> twoVector = new Vector<String>(5);
         twoVector.addElement(String.valueOf(this.total.getFood_v().elementAt(i)));
         twoVector.addElement(String.valueOf(this.total.getFoodtype_v().elementAt(i)));
         twoVector.addElement(String.valueOf(this.total.getFoodp_nv().elementAt(i) + "인분"));
         twoVector.addElement(String.valueOf(nf.format(this.total.getFoodp_v().elementAt(i)) + "원"));
         twoVector.addElement(String.valueOf(nf.format(this.total.getFoodp_rv().elementAt(i))+ "원"));
         v.addElement(twoVector);
      }
      return v;
   }
	private Vector<String> getColumnVector(){
		String [] columnArray = {"음식 이름", "음식점 이름", "주문한 량", "음식 1인분 가격", "총 비용"};
		Vector<String> columnVector = new Vector<String>(5);
		for(String str : columnArray) columnVector.addElement(str);
		return columnVector;
	}
	
}