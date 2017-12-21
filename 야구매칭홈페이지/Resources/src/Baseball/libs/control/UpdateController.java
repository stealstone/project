package Baseball.libs.control;

import java.sql.Connection;
import java.sql.SQLException;

import Baseball.libs.db.DBClose;
import Baseball.libs.db.DBConnection;
import Baseball.libs.model.MemberDAO;

public class UpdateController {
	private Connection conn;
	public UpdateController(){
		this.conn = DBConnection.getConnection();
	}
	public int updateClub(String id, String rating, String club){
		int row = 0;
		try {
			row = MemberDAO.updateClub(conn, id, rating, club);
		} catch (SQLException e) {
			System.out.println(e);
		}
		DBClose.close(conn);
		return row;
	}
	public int updatePage(String id, String page){
		int row = 0;
		try {
			row = MemberDAO.updatePage(conn, id, page);
		} catch (SQLException e) {
			System.out.println(e);
		}
		DBClose.close(conn);
		return row;
	}
}







