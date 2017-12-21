package Baseball.libs.control;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Vector;

import Baseball.libs.db.DBClose;
import Baseball.libs.db.DBConnection;
import Baseball.libs.model.GudanBean;
import Baseball.libs.model.GudanDAO;



public class SelectGudanController {
	private Connection conn;
	public SelectGudanController(){
		this.conn = DBConnection.getConnection();
	}
	
	public String getGposts(String id){
		String gposts = null;
		try {
			gposts = GudanDAO.selectGposts(this.conn, id);
		} catch (SQLException e) {
			System.out.println(e);
		}
		DBClose.close(conn);
		return gposts;
	}
	
	
	public GudanBean getGudan(String gname){
		GudanBean gu = null;
		try {
			gu = GudanDAO.selectGudan(this.conn, gname);
		} catch (SQLException e) {
			System.out.println(e);
		}
		DBClose.close(conn);
		return gu;
	}	
	
	public boolean gnamecheck(String gname){
		boolean exists = true;
		try{
			exists = GudanDAO.gnamecheck(conn, gname);
		}catch(SQLException ex){
			System.out.println(ex);
		}
		DBClose.close(conn);
		return exists;
	}
	public Vector<GudanBean> getAllgudan(){
		Vector<GudanBean> vector = null;
		try {
			vector = GudanDAO.selectAllGudan(this.conn);
		} catch (SQLException e) {
			System.out.println(e);
		}
		DBClose.close(conn);
		return vector;
	}
}
