package Baseball.libs.control;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Vector;

import Baseball.libs.db.DBClose;
import Baseball.libs.db.DBConnection;
import Baseball.libs.model.MemberBean;
import Baseball.libs.model.MemberDAO;
import Baseball.libs.model.ZipcodeBean;

public class SelectController {
	private Connection conn;
	public SelectController(){
		this.conn = DBConnection.getConnection();
	}
	
	public MemberBean mb_all_select(String id){
		MemberBean mb = null;
		try {
			mb = MemberDAO.JoinMember(this.conn, id);
		} catch (SQLException e) {
			System.out.println(e);
		}
		DBClose.close(conn);
		return mb;
	}
	
	public String getpage(String userid){
		String page = null;
		try {
			page = MemberDAO.selectpage(this.conn, userid);
		} catch (SQLException e) {
			System.out.println(e);
		}
		DBClose.close(conn);
		return page;
	}
	
	public Vector<ZipcodeBean> select_zipcode(String dong){
		Vector<ZipcodeBean> vector = null;
		try{
			vector = MemberDAO.select_zipcode(this.conn, dong);
		}catch(SQLException ex){
			System.out.println(ex);
		}
		DBClose.close(conn);
		return vector;
	}	
	
	public boolean idcheck(String id){
		boolean exists = true;
		try{
			exists = MemberDAO.idcheck(conn, id);
		}catch(SQLException ex){
			System.out.println(ex);
		}
		DBClose.close(conn);
		return exists;
	}
	
	public int login(String userid, String passwd){
		int flag = -1;
		try {
			flag = MemberDAO.login(this.conn, userid, passwd);
		} catch (SQLException e) {
			System.out.println(e);
		}
		DBClose.close(conn);
		return flag;
	}
	
	public MemberBean getmember(String userid){
		MemberBean mem = null;
		try {
			mem = MemberDAO.selectMember(this.conn, userid);
		} catch (SQLException e) {
			System.out.println(e);
		}
		DBClose.close(conn);
		return mem;
	}	
	public Vector<MemberBean> getAllmember(String userid){
		Vector<MemberBean> vector = null;		
		try {
			vector = MemberDAO.selectAllMember(this.conn, userid);
		} catch (SQLException e) {
			System.out.println(e);
		}
		DBClose.close(conn);
		return vector;
	}
}
