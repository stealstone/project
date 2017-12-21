package Baseball.libs.control;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Vector;
import Baseball.libs.db.DBClose;
import Baseball.libs.db.DBConnection;
import Baseball.libs.model.MemoBean;
import Baseball.libs.model.MemoDAO;

public class MemoSelectService {
	private Connection conn;
	public MemoSelectService(){
		this.conn = DBConnection.getConnection();
	}
	
	public int count(String myid){
		int count = 0;
		try {
			count = MemoDAO.count(conn, myid);
		} catch (SQLException e) {
			System.out.println(e);
		}
		DBClose.close(conn);
		return count;
	}
	public MemoBean getmemo(int idx, String myid){
		MemoBean mm = null;
		try {
			mm = MemoDAO.getOne(conn, idx, myid);
		} catch (SQLException e) {
			System.out.println(e);
		}
		DBClose.close(conn);
		return mm;
	}
	
	public int getPageCount(int pageSize, String myid){
		int pageCount = 0;
		try {
			pageCount = MemoDAO.getPageCount(this.conn, pageSize, myid);
		} catch (SQLException e) {
			System.out.println(e);
		}
		DBClose.close(conn);
		return pageCount;
	}
	
	public Vector<MemoBean> select_all(String myid){
		Vector<MemoBean> vector = null;
		try {
			vector = MemoDAO.getAll(this.conn, myid);
		} catch (SQLException e) {
			System.out.println(e);
		}
		DBClose.close(conn);
		return vector;
	}
}
