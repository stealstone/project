package Baseball.libs.control;

import java.sql.Connection;
import java.sql.SQLException;

import Baseball.libs.db.DBClose;
import Baseball.libs.db.DBConnection;
import Baseball.libs.model.CommentBean;
import Baseball.libs.model.FreeDAO;
import Baseball.libs.model.GesipanBean;

public class FreeInsertService {
	private Connection conn;
	public FreeInsertService(){
		this.conn = DBConnection.getConnection();
	}
	
	public int Freeinsert(GesipanBean gb){
		int row = 0;
		try {
			row = FreeDAO.Freeinsert(this.conn, gb);
		} catch (SQLException e) {
			System.out.println(e);
		}
		DBClose.close(conn);
		return row;
	}	
	
	public int insert_comment(CommentBean cb){
		int row = 0;
		try {
			row = FreeDAO.FreeCommentInsert(this.conn, cb);
		} catch (SQLException e) {
			System.out.println(e);
		}
		DBClose.close(conn);
		return row;
	}
}
