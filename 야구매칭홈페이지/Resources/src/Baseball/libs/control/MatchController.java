package Baseball.libs.control;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Vector;

import Baseball.libs.db.DBClose;
import Baseball.libs.db.DBConnection;
import Baseball.libs.model.AdminMatchingBean;
import Baseball.libs.model.MatchDAO;


public class MatchController {
	private Connection conn;
	public MatchController(){
		this.conn = DBConnection.getConnection();
	}
	
	public Vector<AdminMatchingBean> getAllmatch(){
		Vector<AdminMatchingBean> vector = null;
		try {
			vector = MatchDAO.selectAllMatch(this.conn);
		} catch (SQLException e) {
			System.out.println(e);
		}
		DBClose.close(conn);
		return vector;
	}
}
