package Baseball.libs.control;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Vector;

import Baseball.libs.db.DBClose;
import Baseball.libs.db.DBConnection;
import Baseball.libs.model.MatchBean;
import Baseball.libs.model.MatchDAO;


public class MatchSelectService {
	private Connection conn;
	public MatchSelectService(){
		this.conn = DBConnection.getConnection();
	}
	
	public Vector<MatchBean> selectResult(String gname){
		Vector<MatchBean> vector = new Vector<MatchBean>(1,1);
		try {
			vector = MatchDAO.selectResult(this.conn, gname);
			
		} catch (SQLException e) {
			System.out.println(e);
		}
		DBClose.close(conn);
		return vector;
	}	
	
	public int count_mano(int mano){
		int count=0;
		try {
			count = MatchDAO.count_mano(this.conn,mano);
		} catch (SQLException e) {
			System.out.println(e);
		}
		DBClose.close(conn);
		return count;
	}
	
	
	public MatchBean select_mano(int mano){
		MatchBean mb = null;
		try {
			mb = MatchDAO.select_mano(this.conn,mano);
		} catch (SQLException e) {
			System.out.println(e);
		}
		DBClose.close(conn);
		return mb;
	}
}
