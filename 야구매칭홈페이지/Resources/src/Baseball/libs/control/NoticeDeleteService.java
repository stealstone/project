package Baseball.libs.control;

import java.sql.Connection;
import java.sql.SQLException;
import Baseball.libs.db.DBClose;
import Baseball.libs.db.DBConnection;
import Baseball.libs.model.NoticeDAO;

public class NoticeDeleteService {
	private Connection conn;
	
	public NoticeDeleteService(){
		this.conn = DBConnection.getConnection();
	}
	
	public int Noticedelete(int idx){
		int row = 0;
		try {
			row = NoticeDAO.Noticedelete(this.conn, idx);
		} catch (SQLException e) {
			System.out.println(e);			
		}
		DBClose.close(conn);
		return row;
	}
}
