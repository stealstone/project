package Baseball.libs.control;

import java.sql.Connection;
import java.sql.SQLException;

import Baseball.libs.db.DBClose;
import Baseball.libs.db.DBConnection;
import Baseball.libs.model.FreeDAO;


public class FreeDeleteService {
	private Connection conn;
	
	public FreeDeleteService(){
		this.conn = DBConnection.getConnection();
	}
	
	public int Freedelete(int idx){
		int row = 0;
		try {
			row = FreeDAO.Freedelete(this.conn, idx);
		} catch (SQLException e) {
			System.out.println(e);			
		}
		DBClose.close(conn);
		return row;
	}
	
	public int FreeCommentdelete(int idx){
		int row = 0;
		try {
			row = FreeDAO.FreeCommentdelete(this.conn, idx);
		} catch (SQLException e) {
			System.out.println(e);			
		}
		DBClose.close(conn);
		return row;
	}
	
	public int FreeCommentAlldelete(int idx){
		int row = 0;
		try {
			row = FreeDAO.FreeCommentAlldelete(this.conn, idx);
		} catch (SQLException e) {
			System.out.println(e);			
		}
		DBClose.close(conn);
		return row;
	}
}
