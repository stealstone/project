package Baseball.libs.control;

import java.sql.Connection;
import java.sql.SQLException;

import Baseball.libs.db.DBClose;
import Baseball.libs.db.DBConnection;
import Baseball.libs.model.MemberJoinBean;
import Baseball.libs.model.MemberDAO;


public class InsertController {
	private Connection conn;
	public InsertController(){
		this.conn = DBConnection.getConnection();
	}
	public int insert(MemberJoinBean member){
		int row = 0;
		try {
			row = MemberDAO.insert(this.conn, member);
		} catch (SQLException e) {
			System.out.println(e);
		}
		DBClose.close(conn);
		return row;
	}
}
