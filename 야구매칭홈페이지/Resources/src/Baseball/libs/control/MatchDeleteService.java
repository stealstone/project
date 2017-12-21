package Baseball.libs.control;

import java.sql.Connection;
import java.sql.SQLException;

import Baseball.libs.db.DBClose;
import Baseball.libs.db.DBConnection;
import Baseball.libs.model.MatchDAO;

public class MatchDeleteService {
	
	private Connection conn; 
	public MatchDeleteService(){
		this.conn = DBConnection.getConnection();
	}
	
	public void delete(int mano){		 
		try {
			MatchDAO.delete(this.conn, mano);
		} catch (SQLException e) {
			System.out.println(e);
		}
		DBClose.close(this.conn);		
	}	
}
