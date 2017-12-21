package Baseball.libs.control;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Vector;

import Baseball.libs.db.DBClose;
import Baseball.libs.db.DBConnection;
import Baseball.libs.model.GudanMemberDAO;
import Baseball.libs.model.MemberBean;
import Baseball.libs.model.MemberDAO;


public class SelectGudanMemberController {
	private Connection conn;
	public SelectGudanMemberController(){
		this.conn = DBConnection.getConnection();
	}
	
	public Vector<MemberBean> getId(int guno, String comfirm){
		Vector<String> vector = null;
		MemberBean mb = new MemberBean();
		Vector<MemberBean> mbv = new Vector<MemberBean>(1,1);
		try {
			vector = GudanMemberDAO.GudanMember(this.conn, guno, comfirm);
			if(vector == null){
				mbv = null;
			}
			else{
			for(int i=0; i < vector.size(); i++){
				System.out.println(vector.get(i));
				mb = MemberDAO.JoinMember(this.conn, vector.get(i));
				mbv.addElement(mb);
			}
			}
		} catch (SQLException e) {
			System.out.println(e);
		}
		DBClose.close(conn);
		return mbv;
	}	
	
	public int getGuno(String id){
		int guno = 0;
		try {
			guno = GudanMemberDAO.selectGuno(this.conn, id);
		} catch (SQLException e) {
			System.out.println(e);
		}
		DBClose.close(conn);
		return guno;
	}	
}
