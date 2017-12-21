package Baseball.libs.control;

import java.sql.Connection;
import java.sql.SQLException;
import java.text.ParseException;

import Baseball.libs.db.DBClose;
import Baseball.libs.db.DBConnection;
import Baseball.libs.model.MatchingBean;
import Baseball.libs.model.MatchingDAO;

public class MatchingInsertService {
	private Connection conn;
	public MatchingInsertService(){
		this.conn = DBConnection.getConnection();
	}
	
	public void insert_finished(MatchingBean mb,int mano) throws ParseException{
		try { 
			MatchingDAO.insert_finished(this.conn, mb,mano);
		} catch (SQLException e) {
			System.out.println(e);
		}
		DBClose.close(conn);
	}
	public int insert(MatchingBean mb) throws ParseException{
		int row = 0;
		try {
			row = MatchingDAO.insert(this.conn, mb);
		} catch (SQLException e) {
			System.out.println(e);
		}
		DBClose.close(conn);
		return row;
	}
}
