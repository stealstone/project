package Baseball.libs.control;

import java.sql.Connection;
import java.sql.SQLException;

import Baseball.libs.db.DBClose;
import Baseball.libs.db.DBConnection;
import Baseball.libs.model.MemoBean;
import Baseball.libs.model.MemoDAO;

public class MemoInsertService {
	private Connection conn;
	
	public MemoInsertService(){
		this.conn = DBConnection.getConnection();
	}
	
	public int insert(MemoBean mb){
		int row = 0;
		try {
			row = MemoDAO.insert(conn, mb);
		} catch (SQLException e) {
			System.out.println(e);
		}
		DBClose.close(conn);
		return row;
	}
}
