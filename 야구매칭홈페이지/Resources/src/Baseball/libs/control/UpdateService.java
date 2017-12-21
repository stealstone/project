package Baseball.libs.control;

import java.sql.Connection;
import java.sql.SQLException;
import java.text.ParseException;

import Baseball.libs.db.DBClose;
import Baseball.libs.db.DBConnection;
import Baseball.libs.model.GesipanBean;
import Baseball.libs.model.GesipanDAO;

public class UpdateService {
	private Connection conn;
	public UpdateService(){
		this.conn = DBConnection.getConnection();
	}
	
	
	public int updateNoticeReadcount(int idx){
		int row = 0;
		try {
			GesipanDAO.updateNoticeReadcount(conn, idx);
		} catch (SQLException e) {
			System.out.println(e);
		}
		DBClose.close(conn);
		return row;
	}
	
	public int updateReadcount(int idx){
		int row = 0;
		try {
			GesipanDAO.updateReadcount(conn, idx);
		} catch (SQLException e) {
			System.out.println(e);
		}
		DBClose.close(conn);
		return row;
	}
	public int update(GesipanBean gb) throws ParseException{
		int row = 0;
		try {
			row = GesipanDAO.update(this.conn, gb); 
		} catch (SQLException e) {
			System.out.println(e);
		}
		DBClose.close(conn);
		return row; 
	}
}
