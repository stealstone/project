package Baseball.libs.control;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Vector;

import Baseball.libs.db.DBClose;
import Baseball.libs.db.DBConnection;
import Baseball.libs.model.MemberDAO;


public class DeleteController {
private Connection conn;
	
	public DeleteController(){
		this.conn = DBConnection.getConnection();
	}
	
	public int memberDelete(Vector<String> vector){
		int row = 1;
		try {
			MemberDAO.Memberdelete(conn, vector);
		} catch (SQLException e) {
			System.out.println(e);
			row = 0;
		}
		DBClose.close(conn);
		return row;
	}
}
