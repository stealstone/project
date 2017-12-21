package Baseball.libs.control;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Vector;

import Baseball.libs.db.DBClose;
import Baseball.libs.db.DBConnection;
import Baseball.libs.model.GudanDAO;


public class UpdateGudanController {
	private Connection conn;
	public UpdateGudanController(){
		this.conn = DBConnection.getConnection();
	}
	
	public void gudanTotWin(String gname){
		
		try {
			GudanDAO.gudanTotWin(conn, gname);
		} catch (SQLException e) {
			System.out.println(e);
		}  
		DBClose.close(conn);
		
	}
	public void gudanTotLose(String gname){
		try {
			GudanDAO.gudanTotLose(conn, gname);
		} catch (SQLException e) {
			System.out.println(e);
		}  
		DBClose.close(conn);
		
	}
	public void gudanTotDraw(String gname){		
		try {
			GudanDAO.gudanTotDraw(conn, gname);
		} catch (SQLException e) {
			System.out.println(e);
		}  
		DBClose.close(conn);		
	}
	
	public int introUpdate(String gid, String gposts){
		int row = 0;
		try {
			row = GudanDAO.introUpdate(conn, gid, gposts);
		} catch (SQLException e) {
			System.out.println(e);
		}  
		DBClose.close(conn);
		return row;
	}
	
	public int pageInsert(String gname, String gpage, String emblem){
		int row = 0;
		try {
			row = GudanDAO.pageInsert(conn, gname, gpage, emblem);
		} catch (SQLException e) {
			System.out.println(e);
		}
		DBClose.close(conn);
		return row;
	}
	public int pointUpdate(Vector<String> vector){
		int row = 1;
		try {
			GudanDAO.pointUpdate(conn, vector);
		} catch (SQLException e) {
			System.out.println(e);
			row = 0;
		}
		DBClose.close(conn);
		return row;
	}
}
