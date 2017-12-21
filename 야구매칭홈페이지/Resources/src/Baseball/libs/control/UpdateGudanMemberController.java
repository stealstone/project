package Baseball.libs.control;

import java.sql.Connection;
import java.sql.SQLException;

import Baseball.libs.db.DBClose;
import Baseball.libs.db.DBConnection;
import Baseball.libs.model.GudanMemberDAO;

public class UpdateGudanMemberController {
	private Connection conn;
	public UpdateGudanMemberController(){
		this.conn = DBConnection.getConnection();
	}
	
	public int JoinDelete( String gid, int guno){
		int row = 0;
		try {
			row = GudanMemberDAO.JoinDelete(this.conn, gid, guno);
		} catch (SQLException e) {
			System.out.println(e);
		}
		DBClose.close(conn);
		return row;
	}
	
	public int JoinUpdate( String gid, int guno, String comfirm){
		int row = 0;
		try {
			row = GudanMemberDAO.JoinUpdate(this.conn, gid, guno, comfirm);
		} catch (SQLException e) {
			System.out.println(e);
		}
		DBClose.close(conn);
		return row;
	}
}
