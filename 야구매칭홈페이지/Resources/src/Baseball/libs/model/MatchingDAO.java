package Baseball.libs.model;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.util.Vector;

import oracle.jdbc.OracleTypes;

public class MatchingDAO {
		
	
		public static int insert_finished(Connection conn, MatchingBean mb,int mano)
				throws SQLException{
				String sql = "{call matching_update(?,?,?,?,?,?,?,?)}";
				CallableStatement cstmt = conn.prepareCall(sql);
				cstmt.setInt(1, mano);
				java.util.Date d = mb.getMadate();
				cstmt.setDate(2, new java.sql.Date(d.getTime()));
				cstmt.setString(3, mb.getMastart());
				cstmt.setString(4, mb.getMaclose());
				cstmt.setString(5, mb.getMaplace());
				cstmt.setString(6, mb.getMaforteam());
				cstmt.setString(7, "finished");
				cstmt.setString(8, mb.getMaresult());
				int row = cstmt.executeUpdate();
				if(cstmt != null) cstmt.close();
				return row;
			}
		
		public static String getmember2(Connection conn, int idx)
			throws SQLException {	
		String member2 = null;
		String sql = "{call matching_select(?,?)}";
		CallableStatement cstmt = conn.prepareCall(sql);
		cstmt.setInt(1, idx);
		cstmt.registerOutParameter(2, OracleTypes.CURSOR);
		cstmt.execute();
		ResultSet rs = (ResultSet)cstmt.getObject(2);
		
		if(!rs.next()){  //게시판 글이 한 개도 없다면
			
		}else{
			do{
				String temp = rs.getString("macondition");						
				if(temp.equals("matched")){					
					member2=rs.getString("magname");					
				}				
			}while(rs.next());
		}
		if(rs !=null) rs.close();
		if(cstmt != null) cstmt.close();
		System.out.println("mem2"+member2);
		return member2;
		}
	
		public static String getmember(Connection conn, int idx)
			throws SQLException {	
		String member1 = null;
		String sql = "{call matching_select(?,?)}";
		CallableStatement cstmt = conn.prepareCall(sql);
		cstmt.setInt(1, idx);
		cstmt.registerOutParameter(2, OracleTypes.CURSOR);
		cstmt.execute();
		ResultSet rs = (ResultSet)cstmt.getObject(2);
		
		if(!rs.next()){  //게시판 글이 한 개도 없다면
			
		}else{
			do{
				String temp = rs.getString("macondition");						
				if(temp.equals("matched")){					
					member1=rs.getString("maforteam");					
				}				
			}while(rs.next());
		}
		if(rs !=null) rs.close();
		if(cstmt != null) cstmt.close();
		System.out.println("mem1"+member1);
		return member1;
		}
		
	public static int getAlreadyApply(Connection conn, int idx,String gudan)
			throws SQLException {
		int num = 0;
		String sql = "{call matching_select(?,?)}";
		CallableStatement cstmt = conn.prepareCall(sql);
		cstmt.setInt(1, idx);
		cstmt.registerOutParameter(2, OracleTypes.CURSOR);
		cstmt.execute();
		ResultSet rs = (ResultSet)cstmt.getObject(2);
		if(!rs.next()){  //게시판 글이 한 개도 없다면
			
		}else{
			do{				
				if(rs.getString("maforteam").equals(gudan)){
					num = 1;
				}
			}while(rs.next());
		}
		if(rs !=null) rs.close();
		if(cstmt != null) cstmt.close();
		return num;
		}
	public static int getIncount(Connection conn, int idx)
			throws SQLException {
			String sql = "{call matching_incount(?,?,?)}";
			CallableStatement cstmt = conn.prepareCall(sql);
			cstmt.setInt(1, idx);
			String temp="matched";
			cstmt.setString(2, temp);
			cstmt.registerOutParameter(3, OracleTypes.CURSOR);
			cstmt.execute();
			ResultSet rs = (ResultSet)cstmt.getObject(3);
			rs.next();
			int num = rs.getInt(1);
			if(rs !=null) rs.close();
			if(cstmt != null) cstmt.close();
			return num;
		}

	public static int getMatched(Connection conn, int idx)
			throws SQLException {
			int num = 0;
			String sql = "{call matching_select(?,?)}";
			CallableStatement cstmt = conn.prepareCall(sql);
			cstmt.setInt(1, idx);
			cstmt.registerOutParameter(2, OracleTypes.CURSOR);
			cstmt.execute();
			ResultSet rs = (ResultSet)cstmt.getObject(2);
			Vector<MatchingBean> vector = new Vector<MatchingBean>(1,1);
			if(!rs.next()){  //게시판 글이 한 개도 없다면
				vector = null;
			}else{
				do{
					MatchingBean mb = new MatchingBean();
					mb.setMano(rs.getInt("mano"));
					mb.setMadate(rs.getDate(2));
					mb.setMastart(rs.getString("mastart"));
					mb.setMaclose(rs.getString("maclose"));	
					mb.setMaplace(rs.getString("maplace"));
					mb.setMaforteam(rs.getString("maforteam"));
					mb.setMagname(rs.getString("magname"));		
					if(rs.getString("macondition").equals("matched")){
						num = 1;
					}
					mb.setMaresult(rs.getString("maresult"));					
					vector.addElement(mb);
				}while(rs.next());
			}
			if(rs !=null) rs.close();
			if(cstmt != null) cstmt.close();
			System.out.println(num);
			return num;
		}
	public static int count_select(Connection conn, String myteam, Date madate) throws SQLException{
		String sql = "{call matching_count_select(?,?,?)}";
		CallableStatement cstmt = conn.prepareCall(sql);		
		cstmt.setString(1, myteam);
		java.util.Date d = madate;
		cstmt.setDate(2, new java.sql.Date(d.getTime()));
		cstmt.registerOutParameter(3, OracleTypes.CURSOR);
		cstmt.execute();
		ResultSet rs = (ResultSet)cstmt.getObject(3);
		rs.next();
		int count = rs.getInt(1);	
		if(rs !=null) rs.close();
		if(cstmt != null) cstmt.close();
		return count;
	}
	
	
	public static int delete2(Connection conn, Date madate,String maforteam) throws SQLException{
		String sql = "{call matching_delete2(?,?)}";
		CallableStatement cstmt = conn.prepareCall(sql);
		java.util.Date d = madate;
		cstmt.setDate(1, new java.sql.Date(d.getTime()));
		cstmt.setString(2, maforteam);
		int row = cstmt.executeUpdate();
		if(cstmt != null) cstmt.close();
		return row;
	}
	
	public static int delete(Connection conn, int gesipanId) throws SQLException{
		String sql = "{call matching_delete(?)}";
		CallableStatement cstmt = conn.prepareCall(sql);
		cstmt.setInt(1, gesipanId);
		int row = cstmt.executeUpdate();
		if(cstmt != null) cstmt.close();
		return row;
	}
	public static MatchingBean getMatchingTomagno(Connection conn, int magno)
			throws SQLException{
			String sql = "{call matching_select_getone2(?, ?)}";
			CallableStatement cstmt = conn.prepareCall(sql);
			cstmt.setInt(1, magno);
			cstmt.registerOutParameter(2, OracleTypes.CURSOR);
			cstmt.execute();
			ResultSet rs = (ResultSet)cstmt.getObject(2);
			rs.next();
			MatchingBean mb = new MatchingBean();
			
			mb.setMano(rs.getInt("mano"));					
			mb.setMadate(rs.getDate(2));			
			mb.setMastart(rs.getString("mastart"));
			mb.setMaclose(rs.getString("maclose"));
			mb.setMaplace(rs.getString("maplace"));
			mb.setMaforteam(rs.getString("maforteam"));
			mb.setMagname(rs.getString("magname"));
			mb.setMacondition(rs.getString("macondition"));			
			mb.setMaresult(rs.getString("maresult"));			
			
			if(rs !=null) rs.close();
			if(cstmt != null) cstmt.close();
			return mb;
		}
	
	public static MatchingBean getMatching(Connection conn, int idx)
			throws SQLException{
			String sql = "{call matching_select_getone(?, ?)}";
			CallableStatement cstmt = conn.prepareCall(sql);
			cstmt.setInt(1, idx);
			cstmt.registerOutParameter(2, OracleTypes.CURSOR);
			cstmt.execute();
			ResultSet rs = (ResultSet)cstmt.getObject(2);
			rs.next();
			MatchingBean mb = new MatchingBean();
			
			mb.setMagno(rs.getInt("magno"));			
			mb.setMadate(rs.getDate(2));
			mb.setMastart(rs.getString("mastart"));
			mb.setMaclose(rs.getString("maclose"));
			mb.setMaplace(rs.getString("maplace"));
			mb.setMaforteam(rs.getString("maforteam"));
			mb.setMagname(rs.getString("magname"));
			mb.setMacondition(rs.getString("macondition"));			
			mb.setMaresult(rs.getString("maresult"));
						
			if(rs !=null) rs.close();
			if(cstmt != null) cstmt.close();
			return mb;
		}
	
	
	public static int update(Connection conn, int idx, MatchingBean mb)
			throws SQLException{
			String sql = "{call matching_update(?,?,?,?,?,?,?,?)}";
			CallableStatement cstmt = conn.prepareCall(sql);
			cstmt.setInt(1, idx);
			java.util.Date d = mb.getMadate();
			cstmt.setDate(2, new java.sql.Date(d.getTime()));
			cstmt.setString(3, mb.getMastart());
			cstmt.setString(4, mb.getMaclose());
			cstmt.setString(5, mb.getMaplace());
			cstmt.setString(6, mb.getMaforteam());
			cstmt.setString(7, mb.getMacondition());
			cstmt.setString(8, mb.getMaresult());
			int row = cstmt.executeUpdate();
			if(cstmt != null) cstmt.close();
			return row;
		}
	public static Vector<MatchingBean> getMatchings(Connection conn, int idx)
			throws SQLException {
			String sql = "{call matching_select(?,?)}";
			CallableStatement cstmt = conn.prepareCall(sql);
			cstmt.setInt(1, idx);
			cstmt.registerOutParameter(2, OracleTypes.CURSOR);
			cstmt.execute();
			ResultSet rs = (ResultSet)cstmt.getObject(2);
			Vector<MatchingBean> vector = new Vector<MatchingBean>(1,1);
			if(!rs.next()){  //게시판 글이 한 개도 없다면
				vector = null;
			}else{
				do{
					MatchingBean mb = new MatchingBean();
					mb.setMano(rs.getInt("mano"));
					mb.setMadate(rs.getDate(2));
					mb.setMastart(rs.getString("mastart"));
					mb.setMaclose(rs.getString("maclose"));	
					mb.setMaplace(rs.getString("maplace"));
					mb.setMaforteam(rs.getString("maforteam"));
					mb.setMagname(rs.getString("magname"));		
					mb.setMacondition(rs.getString("macondition"));
					mb.setMaresult(rs.getString("maresult"));					
					vector.addElement(mb);
				}while(rs.next());
			}
			if(rs !=null) rs.close();
			if(cstmt != null) cstmt.close();
			return vector;
		}
	
	public static int insert(Connection conn, MatchingBean mb)
			throws SQLException, java.text.ParseException{
			String sql = "{call MATCHING_INSERT(?,?,?,?,?,?,?)}";
			CallableStatement cstmt = conn.prepareCall(sql);
			cstmt.setInt(1, mb.getMagno());
			java.util.Date d = mb.getMadate();
			cstmt.setDate(2, new java.sql.Date(d.getTime()));			
			cstmt.setString(3, mb.getMastart());
			cstmt.setString(4, mb.getMaclose());			
			cstmt.setString(5,mb.getMaplace());					
			cstmt.setString(6, mb.getMaforteam());		
			cstmt.setString(7, mb.getMagname());			
		
			int row = cstmt.executeUpdate();
			if(cstmt != null) cstmt.close();
			return row;	
		}
}
