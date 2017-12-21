package Baseball.libs.control;

import java.sql.Connection;
import java.sql.SQLException;

import Baseball.libs.db.DBClose;
import Baseball.libs.db.DBConnection;
import Baseball.libs.model.FreeDAO;
import Baseball.libs.model.GesipanBean;



public class FreeUpdateService {
	private Connection conn;
	public FreeUpdateService(){
		this.conn = DBConnection.getConnection();
	}	
	
	public int Freeupdate(int idx, GesipanBean gb){
		int row = 0;
		try {
			row = FreeDAO.Freeupdate(this.conn, idx, gb); 
		} catch (SQLException e) {
			System.out.println(e);
		}
		DBClose.close(conn);
		return row; 
	}
	
	public int updateFreeReadcount(int idx){
		int row = 0;
		try {
			FreeDAO.updateFreeReadcount(conn, idx);
		} catch (SQLException e) {
			System.out.println(e);
		}
		DBClose.close(conn);
		return row;
	}
}
