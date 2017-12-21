package Team3.Model;
import java.text.NumberFormat;
import java.util.Vector;

import javax.swing.table.DefaultTableModel;


@SuppressWarnings("serial")
public class MyTable2 extends DefaultTableModel {
   private Total total;
   public MyTable2(Total total) {
      this.total = total;
      this.setDataVector(getTwoVector(), getColumnVector());
   }
   private Vector<Object> getTwoVector(){
	  NumberFormat nf = NumberFormat.getNumberInstance();
      Vector<Object> v = new Vector<Object>(1,1); 
      for(int i =0; i < this.total.getRoom_v().size(); i++){
         Vector<String> twoVector = new Vector<String>(5);
         twoVector.addElement(String.valueOf(this.total.getRoom_v().elementAt(i)));
         twoVector.addElement(String.valueOf(this.total.getRoomtype_v().elementAt(i)));
         twoVector.addElement(String.valueOf(this.total.getRoomp_nv().elementAt(i) + "박" + (this.total.getRoomp_nv().elementAt(i)+1) + "일"));
         twoVector.addElement(String.valueOf(nf.format(this.total.getRoomp_v().elementAt(i)) + "원"));
         twoVector.addElement(String.valueOf(nf.format(this.total.getRoomp_rv().elementAt(i)) + "원"));
         v.addElement(twoVector);
      }
      return v;
   }
	private Vector<String> getColumnVector(){
		String [] columnArray = {"숙박유형", "숙박지이름", "숙박일수", "숙박 1일비용", "총 비용"};
		Vector<String> columnVector = new Vector<String>(5);
		for(String str : columnArray) columnVector.addElement(str);
		return columnVector;
	}
	
}