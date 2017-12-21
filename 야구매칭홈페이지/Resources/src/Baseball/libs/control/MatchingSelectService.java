package Baseball.libs.control;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Date;
import java.util.Vector;

import Baseball.libs.db.DBClose;
import Baseball.libs.db.DBConnection;
import Baseball.libs.model.MatchingBean;
import Baseball.libs.model.MatchingDAO;

public class MatchingSelectService {
	private Connection conn;
	public MatchingSelectService(){
		this.conn = DBConnection.getConnection();
	}
	
	public String getmember2(int idx){
		String member2=null;
		try {
			member2 = MatchingDAO.getmember2(this.conn,idx);
		} catch (SQLException e) {
			System.out.println(e);
		}
		DBClose.close(this.conn);
		return member2;
	}
	
	public String getmember1(int idx){
		String member1=null;
		try {
			member1 = MatchingDAO.getmember(this.conn,idx);
		} catch (SQLException e) {
			System.out.println(e);
		}
		DBClose.close(this.conn);
		return member1;
	}
	public int getAlreadyApply(int magno,String gudan){
			int num = 0;		
			try {
				num = MatchingDAO.getAlreadyApply(this.conn,magno,gudan);
			} catch (SQLException e) {
				System.out.println(e);
			}
			DBClose.close(this.conn);
			return num;
		}
		
	public int getIncount(int magno){
		int num = 0;		
		try {
			num = MatchingDAO.getIncount(this.conn,magno);
		} catch (SQLException e) {
			System.out.println(e);
		}
		DBClose.close(this.conn);
		return num;
	}
	public int getmatched(int magno){
		int num = 0;		
		try {
			num = MatchingDAO.getMatched(this.conn,magno);
		} catch (SQLException e) {
			System.out.println(e);
		}
		DBClose.close(conn);
		return num;
	}
	
	public int count_select(String maforteam, Date madate){
		int count = 0;
		try {
			count = MatchingDAO.count_select(this.conn,maforteam,madate);
		} catch (SQLException e) {
			System.out.println(e);
		}
		DBClose.close(conn);
		return count;
	}
	
	public MatchingBean getMatchingTomagno(int magno){
		MatchingBean mb = null;
		try {
			mb = MatchingDAO.getMatchingTomagno(this.conn,magno);
		} catch (SQLException e) {
			System.out.println(e);
		}
		DBClose.close(conn);
		return mb;
	}
	
	public MatchingBean getMatching(int idx){
		MatchingBean mb = null;
		try {
			mb = MatchingDAO.getMatching(this.conn,idx);
		} catch (SQLException e) {
			System.out.println(e);
		}
		DBClose.close(conn);
		return mb;
	}
	
	public Vector<MatchingBean> getMatchings(int idx){
		Vector<MatchingBean> vector = null;
		try {
			vector = MatchingDAO.getMatchings(this.conn,idx);
		} catch (SQLException e) {
			System.out.println(e);
		}
		DBClose.close(conn);
		return vector;
	}
}
