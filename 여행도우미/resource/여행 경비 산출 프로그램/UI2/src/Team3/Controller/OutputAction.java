package Team3.Controller;
import java.awt.Font;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.text.NumberFormat;
import java.util.Vector;

import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JTable;
import javax.swing.JTextArea;
import javax.swing.SwingConstants;
import javax.swing.table.DefaultTableCellRenderer;
import javax.swing.table.TableColumnModel;
import javax.swing.table.TableModel;

import Team3.Model.MyTable;
import Team3.Model.MyTable1;
import Team3.Model.MyTable2;
import Team3.Model.Total;


@SuppressWarnings("unused")
public class OutputAction implements ActionListener{
   private JTable table, table1, table2;
   private JFrame f;
   private Total total;
   private JLabel label;
   private JTextArea textArea;
   
   public OutputAction(JTable table, JTable table1, JTable table2,JLabel label, Total total,JTextArea textArea) {
      this.table = table;
      this.table1 = table1;
      this.table2 = table2;
      this.total = total;
      this.label = label;
      this.textArea = textArea;

      }
   @Override
   public void actionPerformed(ActionEvent evt){
	  NumberFormat nf = NumberFormat.getNumberInstance();
	   
      this.label.setText(total.getStation_v().toString());  
      this.table.setModel(new MyTable(this.total));
      this.table1.setModel(new MyTable1(this.total));
      this.table2.setModel(new MyTable2(this.total));
      
      /*******테이블 가운데 정렬*********/
      DefaultTableCellRenderer dtcr = new DefaultTableCellRenderer(); 
      dtcr.setHorizontalAlignment(SwingConstants.LEFT);
    	     
      TableColumnModel tcm = table.getColumnModel();
      TableColumnModel tcm1 = table1.getColumnModel();
      TableColumnModel tcm2 = table2.getColumnModel();
      for(int i = 0 ; i < tcm.getColumnCount() ; i++){
	      tcm.getColumn(i).setCellRenderer(dtcr);
	      tcm1.getColumn(i).setCellRenderer(dtcr);
	      tcm2.getColumn(i).setCellRenderer(dtcr);
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
      
      textArea.setFont(new Font("맑은 고딕",Font.BOLD,20));
	  textArea.setText("총 금액 : " + nf.format(TravelTot + FoodTot + RoomTot) + "원");
	}
}
   