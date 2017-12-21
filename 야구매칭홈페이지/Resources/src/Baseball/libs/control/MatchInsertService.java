package Baseball.libs.control;

import java.sql.Connection;
import java.sql.SQLException;
import java.text.ParseException;

import Baseball.libs.db.DBClose;
import Baseball.libs.db.DBConnection;
import Baseball.libs.model.MatchBean;
import Baseball.libs.model.MatchDAO;

public class MatchInsertService {
	private Connection conn;
	public MatchInsertService(){
		this.conn = DBConnection.getConnection();
	}
	
	public int insert(MatchBean mb) throws ParseException{
		int row = 0;
		try {
			row = MatchDAO.insert(this.conn, mb);
		} catch (SQLException e) {
			System.out.println(e);
		}
		DBClose.close(conn);
		return row;
	}
}
