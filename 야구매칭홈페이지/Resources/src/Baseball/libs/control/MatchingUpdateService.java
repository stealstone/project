package Baseball.libs.control;

import java.sql.Connection;
import java.sql.SQLException;
import java.text.ParseException;

import Baseball.libs.db.DBClose;
import Baseball.libs.db.DBConnection;
import Baseball.libs.model.MatchingBean;
import Baseball.libs.model.MatchingDAO;

public class MatchingUpdateService {
	private Connection conn;
	public MatchingUpdateService(){
		this.conn = DBConnection.getConnection();
	}
	
	
	public int update(int idx, MatchingBean mb) throws ParseException{
		int row = 0;
		try {
			row = MatchingDAO.update(this.conn, idx, mb); 
		} catch (SQLException e) {
			System.out.println(e);
		}
		DBClose.close(conn);
		return row; 
	}
}
