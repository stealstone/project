package Baseball.libs.control;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Vector;

import Baseball.libs.db.DBClose;
import Baseball.libs.db.DBConnection;
import Baseball.libs.model.GesipanBean;
import Baseball.libs.model.NoticeDAO;

public class NoticeSelectService {
	private Connection conn;
	public NoticeSelectService(){
		this.conn = DBConnection.getConnection();
	}
	
	public int getNoticePageCount(int pageSize){
		int pageCount = 0;
		try {
			pageCount = NoticeDAO.getNoticePageCount(this.conn, pageSize);
		} catch (SQLException e) {
			System.out.println(e);
		}
		DBClose.close(conn);
		return pageCount;
	}
	
	public Vector<GesipanBean> Notice_all_select(){
		Vector<GesipanBean> vector = null;
		try {
			vector = NoticeDAO.Notice_getAll(this.conn);
		} catch (SQLException e) {
			System.out.println(e);
		}
		DBClose.close(conn);
		return vector;
	}
	
	public GesipanBean Notice_select(int idx){
		GesipanBean gb = null;
		try {
			gb = NoticeDAO.getOne(this.conn, idx);
		} catch (SQLException e) {
			System.out.println(e);
		}
		DBClose.close(conn);
		return gb;
	}
}
