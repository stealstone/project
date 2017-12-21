package Baseball.libs.control;

import java.sql.Connection;
import java.sql.SQLException;
import java.text.ParseException;

import Baseball.libs.db.DBClose;
import Baseball.libs.db.DBConnection;
import Baseball.libs.model.GesipanDAO;

public class DeleteService {
	private Connection conn;
	public DeleteService(){
		this.conn = DBConnection.getConnection();
	}
	
	public void deleteCommentGesipanid(int gesipanId){		
		try {
			GesipanDAO.deleteCommentGesipanid(this.conn, gesipanId);
		} catch (SQLException e) {
			System.out.println(e);
		}
		DBClose.close(this.conn);		
	}	
	public void deleteComment(int commentId){		
		try {
			GesipanDAO.deleteComment(this.conn, commentId);
		} catch (SQLException e) {
			System.out.println(e);
		}
		DBClose.close(this.conn);		
	}	
	
	public void delete(int gesipanId) throws ParseException{
		try {
			GesipanDAO.delete(this.conn, gesipanId);
		} catch (SQLException e) {
			System.out.println(e);
		}
		DBClose.close(this.conn);		
	}	
}
