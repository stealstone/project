package Baseball.libs.control;

import java.sql.Connection;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.Date;

import Baseball.libs.db.DBClose;
import Baseball.libs.db.DBConnection;
import Baseball.libs.model.MatchingDAO;

public class MatchingDeleteService {
	private Connection conn;
	public MatchingDeleteService(){
		this.conn = DBConnection.getConnection();
	}
	public int delete2(Date madate, String maforteam) throws ParseException{
		int row=0;
		try {
			row = MatchingDAO.delete2(this.conn, madate, maforteam);
		} catch (SQLException e) {
			System.out.println(e);
		}
		DBClose.close(conn);
		return row;
	}	
	
	public int delete(int gesipanId) throws ParseException{
		int row=0;
		try {
			row = MatchingDAO.delete(this.conn, gesipanId);
		} catch (SQLException e) {
			System.out.println(e);
		}
		DBClose.close(conn);
		return row;
	}	
}
