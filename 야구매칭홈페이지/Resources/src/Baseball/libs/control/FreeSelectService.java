package Baseball.libs.control;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Vector;

import Baseball.libs.db.DBClose;
import Baseball.libs.db.DBConnection;
import Baseball.libs.model.CommentBean;
import Baseball.libs.model.FreeDAO;
import Baseball.libs.model.GesipanBean;


public class FreeSelectService {
	private Connection conn;
	public FreeSelectService(){
		this.conn = DBConnection.getConnection();
	}
	
	public int getFreePageCount(int pageSize){
		int pageCount = 0;
		try {
			pageCount = FreeDAO.getFreePageCount(this.conn, pageSize);
		} catch (SQLException e) {
			System.out.println(e);
		}
		DBClose.close(conn);
		return pageCount;
	}
	
	public Vector<GesipanBean> Free_all_select(){
		Vector<GesipanBean> vector = null;
		try {
			vector = FreeDAO.Free_getAll(this.conn);
		} catch (SQLException e) {
			System.out.println(e);
		}
		DBClose.close(conn);
		return vector;
	}
	
	public GesipanBean Free_select(int idx){
		GesipanBean gb = null;
		try {
			gb = FreeDAO.getOne(this.conn, idx);
		} catch (SQLException e) {
			System.out.println(e);
		}
		DBClose.close(conn);
		return gb;
	}
	
	public Vector<CommentBean> freeComment_select(int idx){
		Vector<CommentBean> vector = null; 
		try {
			vector = FreeDAO.getCommentAll(this.conn, idx);
		} catch (SQLException e) {
			System.out.println(e);
		}
		DBClose.close(conn);
		return vector;
	}
}
