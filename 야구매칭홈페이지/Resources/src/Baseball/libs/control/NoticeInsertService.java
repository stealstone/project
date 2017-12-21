package Baseball.libs.control;

import java.sql.Connection;
import java.sql.SQLException;

import Baseball.libs.db.DBClose;
import Baseball.libs.db.DBConnection;
import Baseball.libs.model.GesipanBean;
import Baseball.libs.model.NoticeDAO;

public class NoticeInsertService {
	private Connection conn;
	public NoticeInsertService(){
		this.conn = DBConnection.getConnection();
	}
	
	public int Noticeinsert(GesipanBean gb){
		int row = 0;
		try {
			row = NoticeDAO.Noticeinsert(this.conn, gb);
		} catch (SQLException e) {
			System.out.println(e);
		}
		DBClose.close(conn);
		return row;
	}
}
