package Baseball.libs.control;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Vector;
import Baseball.libs.db.DBClose;
import Baseball.libs.db.DBConnection;
import Baseball.libs.model.MemoDAO;

public class MemoDeleteService {
	private Connection conn;
	
	public MemoDeleteService(){
		this.conn = DBConnection.getConnection();
	}
	
	public int delete(Vector<Integer> idxs){
		int row = 1;
		try {
			MemoDAO.delete(conn, idxs);
		} catch (SQLException e) {
			System.out.println(e);
			row = 0;
		}
		DBClose.close(conn);
		return row;
	}
}
