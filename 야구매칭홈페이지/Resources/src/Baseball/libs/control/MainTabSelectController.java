package Baseball.libs.control;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Vector;

import Baseball.libs.db.DBClose;
import Baseball.libs.db.DBConnection;
import Baseball.libs.model.MainTabBean;
import Baseball.libs.model.MainTabDAO;

public class MainTabSelectController {
	private Connection conn;
	public MainTabSelectController(){
		this.conn = DBConnection.getConnection();
	}
	
	public Vector<MainTabBean> select_machtab(){
		Vector<MainTabBean> vector = null;
		try{
			vector = MainTabDAO.select_machTab(this.conn);
		}catch(SQLException ex){
			System.out.println(ex);
		}
		DBClose.close(conn);
		return vector;
	}
	
	public Vector<MainTabBean> select_notetab(){
		Vector<MainTabBean> vector = null;
		try{
			vector = MainTabDAO.select_noteTab(this.conn);
		}catch(SQLException ex){
			System.out.println(ex);
		}
		DBClose.close(conn);
		return vector;
	}	
	
	public Vector<MainTabBean> select_protab(){
		Vector<MainTabBean> vector = null;
		try{
			vector = MainTabDAO.select_proTab(this.conn);
		}catch(SQLException ex){
			System.out.println(ex);
		}
		DBClose.close(conn);
		return vector;
	}	
	
	public Vector<MainTabBean> select_freetab(){
		Vector<MainTabBean> vector = null;
		try{
			vector = MainTabDAO.select_freeTab(this.conn);
		}catch(SQLException ex){
			System.out.println(ex);
		}
		DBClose.close(conn);
		return vector;
	}	
}
