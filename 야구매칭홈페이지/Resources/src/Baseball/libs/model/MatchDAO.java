package Baseball.libs.model;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.util.Vector;

import oracle.jdbc.OracleTypes;

public class MatchDAO {
	
	public static Vector<MatchBean> selectResult (Connection conn, String gname)
			throws SQLException{
			String sql = "{call match_gname_all_select(?, ?)}";
			CallableStatement cstmt = conn.prepareCall(sql);
			cstmt.setString(1, gname);
			cstmt.registerOutParameter(2, OracleTypes.CURSOR);
			cstmt.execute();
			ResultSet rs = (ResultSet)cstmt.getObject(2);
			Vector<MatchBean> vector = new Vector<MatchBean>(1,1);						
			if(!rs.next()){
				vector = null;
			}else {
				do{
					
					MatchBean mb = new MatchBean();
					mb.setMatdate(rs.getDate(1));
					mb.setMaforteams(rs.getString(2));
					mb.setMaresult(rs.getString(3));
					vector.addElement(mb);
				}while(rs.next());
			}
			if(rs !=null) rs.close();
			if(cstmt != null) cstmt.close();
			return vector;
		}
	
	public static int count_mano(Connection conn, int mano) throws SQLException{
		String sql = "{call match_count_mano(?,?)}";
		CallableStatement cstmt = conn.prepareCall(sql);		
		cstmt.setInt(1, mano);
		cstmt.registerOutParameter(2, OracleTypes.CURSOR);
		cstmt.execute();
		ResultSet rs = (ResultSet)cstmt.getObject(2);
		rs.next();
		int count = rs.getInt(1);	
		if(rs !=null) rs.close();
		if(cstmt != null) cstmt.close();
		return count;
	}
	
	public static MatchBean select_mano(Connection conn, int mano)
			throws SQLException{
			String sql = "{call match_select_mano(?, ?)}";
			CallableStatement cstmt = conn.prepareCall(sql);
			cstmt.setInt(1, mano);
			cstmt.registerOutParameter(2, OracleTypes.CURSOR);
			cstmt.execute();
			ResultSet rs = (ResultSet)cstmt.getObject(2);
			rs.next();
			MatchBean mb = new MatchBean();
			mb.setMatdate(rs.getDate("matdate"));
			mb.setMatgname(rs.getString("matgname"));
			mb.setMaforteams(rs.getString("matforteams"));
			mb.setMaresult(rs.getString("matresult"));						

			if(rs !=null) rs.close();
			if(cstmt != null) cstmt.close();
			return mb;
		}
	
	public static void delete(Connection conn, int mano) throws SQLException{
		String sql = "{call match_delete_mano(?)}";
		CallableStatement cstmt = conn.prepareCall(sql);
		cstmt.setInt(1, mano);
		cstmt.executeUpdate();
		if(cstmt != null) cstmt.close();
	}
	
	public static int insert(Connection conn, MatchBean mb)
			throws SQLException, java.text.ParseException{
			String sql = "{call MATCH_INSERT(?,?,?,?)}";
			CallableStatement cstmt = conn.prepareCall(sql);
			java.util.Date d = mb.getMatdate();
			cstmt.setDate(1, new java.sql.Date(d.getTime()));
			cstmt.setString(2, mb.getMatgname());
			cstmt.setString(3, mb.getMaforteams());
			cstmt.setString(4, mb.getMaresult());	
			
			int row = cstmt.executeUpdate();
			if(cstmt != null) cstmt.close();
			System.out.println(row);
			return row;	
		}
		public static Vector<AdminMatchingBean> selectAllMatch(Connection conn)
			throws SQLException{
		String sql = "{call match_admin_select(?)}";
		CallableStatement cstmt = conn.prepareCall(sql);
		cstmt.registerOutParameter(1, OracleTypes.CURSOR);
		cstmt.execute();
		ResultSet rs = (ResultSet)cstmt.getObject(1);
		Vector<AdminMatchingBean> vector = new Vector<AdminMatchingBean>(1,1);
		if(!rs.next()){
			vector = null;				
		}else{  
			do{
				AdminMatchingBean mu = new AdminMatchingBean(rs.getInt(1),
											 	 rs.getString(2),
											 	 rs.getString(3),
											 	 rs.getString(4),
											 	 rs.getString(5));											 
				vector.add(mu);
			}while(rs.next());
		}			
		if(rs != null) rs.close();
		if(cstmt != null) cstmt.close();
		return vector;
	}	
}
