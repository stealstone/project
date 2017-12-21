package Baseball.libs.control;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Date;
import java.util.Vector;

import Baseball.libs.db.DBClose;
import Baseball.libs.db.DBConnection;
import Baseball.libs.model.CommentBean;
import Baseball.libs.model.GesipanBean;
import Baseball.libs.model.GesipanDAO;

public class SelectService {
	private Connection conn;
	public SelectService(){
		this.conn = DBConnection.getConnection();
	}	
	
	public int getIncount(String gname, Date magsdate){
		int count = 0;
		try {
			count = GesipanDAO.getIncount(this.conn, gname, magsdate);
		} catch (SQLException e) {
			System.out.println(e);
		}
		DBClose.close(conn);
		return count;
	}
	
	
	public int getPageCount(int pageSize){
		int pageCount = 0;
		try {
			pageCount = GesipanDAO.getPageCount(this.conn, pageSize);
		} catch (SQLException e) {
			System.out.println(e);
		}
		DBClose.close(conn);
		return pageCount;
	}
	
	public Vector<CommentBean> matchingdp_select(int idx){
		Vector<CommentBean> vector = null; 
		try {
			vector = GesipanDAO.getCommentAll(this.conn, idx);
		} catch (SQLException e) {
			System.out.println(e);
		}
		DBClose.close(conn);
		return vector;
	}
	
	public GesipanBean getGesipan(int idx){
		GesipanBean gb = null;
		try {
			gb = GesipanDAO.getOne(this.conn, idx);
		} catch (SQLException e) {
			System.out.println(e);
		}
		DBClose.close(conn);
		return gb; 
	}
	
	public Vector<GesipanBean> gp_all_select(){
		Vector<GesipanBean> vector = null;
		try {
			vector = GesipanDAO.getAll(this.conn);
		} catch (SQLException e) {
			System.out.println(e);
		}
		DBClose.close(conn);
		return vector;
	}
	
	public Vector<GesipanBean> matchinggp_all_select(){
		Vector<GesipanBean> vector = null;
		try {
			vector = GesipanDAO.getAll(this.conn);
		} catch (SQLException e) {
			System.out.println(e);
		}
		DBClose.close(conn);
		return vector;
	}
}
