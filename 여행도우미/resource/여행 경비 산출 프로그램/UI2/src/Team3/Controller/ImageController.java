package Team3.Controller;
import java.awt.event.ItemEvent;
import java.awt.event.ItemListener;

import java.sql.ResultSet;
import java.sql.Statement;

import javax.swing.ImageIcon;
import javax.swing.JLabel;
import javax.swing.JPanel;

import Team3.Model.Databases;

public class ImageController implements ItemListener {
	
	@SuppressWarnings("unused")
	private JPanel p;
	private ImageIcon icon;
	private JLabel jlbel;
	private int flag;
	private String query;
	private Databases db;
	
	public ImageController(JPanel p, ImageIcon icon, JLabel jlbel, Databases db,int flag) {
		this.jlbel = jlbel;
		this.p = p;
		this.icon = icon;
		this.flag = flag;
		this.db = db;
	}
	
	@SuppressWarnings("unused")
	@Override
	public void itemStateChanged(ItemEvent event) {
        Object item = event.getItem();
       
        if (event.getStateChange() == ItemEvent.SELECTED) {
        	/*------db에서 이미지 가져오기---------(너비 455*600)*/
        	try{
            	Statement stmt = db.getConn().createStatement();   
            	String temp = item.toString();   
            	/* flag 1 : 역 패널
            	 * flag 2 : 관광명소 패널
            	 * flag 3 : 음식점 패널
            	 * flag 4 : 숙박 패널
            	 */
            switch(this.flag){	            	
            	case 1 :	this.query = "select STATION_IMAGE from STATION where STATION_NAME = '" + item.toString()+"'"; break;
            	case 2 :	this.query = "select SIGHT_IMAGE from SIGHT where SIGHT_NAME = '" + item.toString()+"'"; break;
            	case 3 : this.query = "select RESTAURANT_IMAGE from RESTAURANT where RESTAURANT_NAME = '" + item.toString()+"'"; break;
            	case 4 : this.query = "select ROOM_IMAGE from ROOM where ROOM_NAME = '" + item.toString()+"'"; break;
            }               	
            ResultSet rs = stmt.executeQuery(this.query);
            byte[] bytes = new byte[1024];            
            if (rs.next()) {
            	bytes = rs.getBytes(1);
            }          
            if(bytes != null){        	          	        	           	   
        	    this.icon = new ImageIcon(bytes);        	    
        	    this.jlbel.setIcon(icon);
            }
            }catch (Exception e) {  
    		e.printStackTrace();
			}        	
        }
	}
}