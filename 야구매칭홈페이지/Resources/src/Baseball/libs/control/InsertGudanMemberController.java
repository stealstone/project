package Baseball.libs.control;

import java.sql.Connection;
import java.sql.SQLException;

import Baseball.libs.db.DBClose;
import Baseball.libs.db.DBConnection;
import Baseball.libs.model.GudanMemberBean;
import Baseball.libs.model.GudanMemberDAO;


public class InsertGudanMemberController {
	private Connection conn;
	public InsertGudanMemberController(){
		this.conn = DBConnection.getConnection();
	}
	public int gmemberinsert(GudanMemberBean gudanMember){
		int row = 0;
		try {
			row = GudanMemberDAO.gmemberinsert(this.conn, gudanMember);
		} catch (SQLException e) {
			System.out.println(e);
		}
		DBClose.close(conn);
		return row;
	}
}
