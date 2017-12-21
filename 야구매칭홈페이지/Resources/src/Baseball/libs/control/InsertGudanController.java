package Baseball.libs.control;

import java.sql.Connection;
import java.sql.SQLException;

import Baseball.libs.db.DBClose;
import Baseball.libs.db.DBConnection;
import Baseball.libs.model.GudanDAO;
import Baseball.libs.model.GudanJoinBean;


public class InsertGudanController {
	private Connection conn;
	public InsertGudanController(){
		this.conn = DBConnection.getConnection();
	}
	public int insert(GudanJoinBean Gudan){
		int row = 0;
		try {
			row = GudanDAO.insert(this.conn, Gudan);
		} catch (SQLException e) {
			System.out.println(e);
		}
		DBClose.close(conn);
		return row;
	}
}