package Baseball.libs.control;

import java.sql.Connection;
import java.sql.SQLException;

import Baseball.libs.db.DBClose;
import Baseball.libs.db.DBConnection;
import Baseball.libs.model.GesipanBean;
import Baseball.libs.model.GesipanDAO;
import Baseball.libs.model.NoticeDAO;

public class NoticeUpdateService {
	private Connection conn;
	public NoticeUpdateService(){
		this.conn = DBConnection.getConnection();
	}	
	
	public int Noticeupdate(int idx, GesipanBean gb){
		int row = 0;
		try {
			row = NoticeDAO.Noticeupdate(this.conn, idx, gb); 
		} catch (SQLException e) {
			System.out.println(e);
		}
		DBClose.close(conn);
		return row; 
	}
	
	public int updateNoticeReadcount(int idx){
		int row = 0;
		try {
			GesipanDAO.updateNoticeReadcount(conn, idx);
		} catch (SQLException e) {
			System.out.println(e);
		}
		DBClose.close(conn);
		return row;
	}	
	
}
