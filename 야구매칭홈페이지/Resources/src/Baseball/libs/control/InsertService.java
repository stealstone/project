package Baseball.libs.control;

import java.sql.Connection;
import java.sql.SQLException;
import java.text.ParseException;

import Baseball.libs.db.DBClose;
import Baseball.libs.db.DBConnection;
import Baseball.libs.model.CommentBean;
import Baseball.libs.model.GesipanBean;
import Baseball.libs.model.GesipanDAO;

public class InsertService {
	private Connection conn;
	public InsertService(){
		this.conn = DBConnection.getConnection();
	}
	public int insert_comment(CommentBean cb)throws ParseException{
		int row = 0;
		try {
			row = GesipanDAO.insert_comment(this.conn, cb);
		} catch (SQLException e) {
			System.out.println(e);
		}
		DBClose.close(conn);
		return row;
	}
	
	public int insert(GesipanBean gb) throws ParseException{
		int row = 0;
		try {
			row = GesipanDAO.insert(this.conn, gb);
		} catch (SQLException e) {
			System.out.println(e);
		}
		DBClose.close(conn);
		return row;
	}
}
