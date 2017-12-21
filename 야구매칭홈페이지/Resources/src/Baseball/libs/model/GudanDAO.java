package Baseball.libs.model;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import oracle.jdbc.OracleTypes;

public class GudanDAO {
	
	public static String selectGposts(Connection conn, String id)
			throws SQLException{
			String sql = "{call gudan_gposts_select(?,?)}";
			CallableStatement cstmt = conn.prepareCall(sql);
			cstmt.setString(1, id);
			cstmt.registerOutParameter(2, OracleTypes.CURSOR);
			cstmt.execute();
			ResultSet rs = (ResultSet)cstmt.getObject(2);
			rs.next();
			String gposts = rs.getString(1);
			if(rs != null) rs.close();
			if(cstmt != null) cstmt.close();
			return gposts;
	}
	
	public static int introUpdate(Connection conn, String gid, String gposts)
			throws SQLException{
			String sql = "{call gudan_gposts_update(?,?)}";
			CallableStatement cstmt = conn.prepareCall(sql);
			cstmt.setString(1, gid.trim());
			cstmt.setString(2, gposts.trim());
			int row = cstmt.executeUpdate();
			if(cstmt != null) cstmt.close();
			return row;
		}
	
	public static GudanBean selectGudan(Connection conn, String gname)
			throws SQLException{
			String sql = "{call gudan_info(?,?)}";
			CallableStatement cstmt = conn.prepareCall(sql);
			cstmt.setString(1, gname);
			cstmt.registerOutParameter(2, OracleTypes.CURSOR);
			cstmt.execute();
			ResultSet rs = (ResultSet)cstmt.getObject(2);
			GudanBean gu = null;
			if(!rs.next()){  
				gu = null;
			}else{  
				gu = new GudanBean(	 rs.getInt(1),
									 rs.getString(2),
									 rs.getString(3),
									 rs.getString(4),
									 rs.getString(5),
									 rs.getString(6),
									 rs.getInt(7),
									 rs.getString(8),
									 rs.getString(9));			
			}
			if(rs != null) rs.close();
			if(cstmt != null) cstmt.close();
			return gu;
	}
	
	public static int insert(Connection conn, GudanJoinBean gudan)
			throws SQLException{
			String sql = "{call gudan_insert(?,?,?,?,?,?,?,?)}";
			CallableStatement cstmt = conn.prepareCall(sql);
			cstmt.setString(1, gudan.getGudan());
			cstmt.setString(2, gudan.getLoc());
			cstmt.setString(3, gudan.getGpage());
			cstmt.setString(4, gudan.getGid());
			cstmt.setString(5, gudan.getIntro());
			cstmt.setInt(6, gudan.getTot());
			cstmt.setString(7, gudan.getRating());
			cstmt.setString(8, gudan.getEmblem());
			int row = cstmt.executeUpdate();
			if(cstmt != null) cstmt.close();
			return row;
		}
	
	//true :이미 사용중인 아이디. false : 없는 계정
	public static boolean gnamecheck(Connection conn, String gname)
			throws SQLException{
			boolean exists = true;
			String sql = "{call gname_check(?,?)}";
			CallableStatement cstmt = conn.prepareCall(sql);
			cstmt.setString(1, gname.trim());
			cstmt.registerOutParameter(2, OracleTypes.CURSOR);
			cstmt.execute();
			ResultSet rs = (ResultSet)cstmt.getObject(2);
			if(rs.next()) exists = true;
			else exists = false;
			if(rs != null) rs.close();
			if(cstmt != null) cstmt.close();
			return exists;
	}
	
	public static int pageInsert(Connection conn, String gname, String gpage, String emblem)
			throws SQLException{
			String sql = "{call gudan_two_update(?,?,?)}";
			CallableStatement cstmt = conn.prepareCall(sql);
			cstmt.setString(1, gname.trim());
			cstmt.setString(2, gpage.trim());
			cstmt.setString(3, emblem.trim());
			int row = cstmt.executeUpdate();
			if(cstmt != null) cstmt.close();
			return row;
		}	
	public static Vector<GudanBean> selectAllGudan(Connection conn)
			throws SQLException{
		String sql = "{call gudan_admin_select(?)}";
		CallableStatement cstmt = conn.prepareCall(sql);
		cstmt.registerOutParameter(1, OracleTypes.CURSOR);
		cstmt.execute();
		ResultSet rs = (ResultSet)cstmt.getObject(1);
		Vector<GudanBean> vector = new Vector<GudanBean>(1,1);
		if(!rs.next()){
			vector = null;				
		}else{  
			do{
				GudanBean gu = new GudanBean(rs.getString(1),
											 rs.getString(2),
											 rs.getString(3),
											 rs.getInt(4));											 
				vector.add(gu);
			}while(rs.next());
		}			
		if(rs != null) rs.close();
		if(cstmt != null) cstmt.close();
		return vector;
	}	
	
	public static void pointUpdate(Connection conn, Vector<String> vector)
			throws SQLException{
			String sql = "{call gudan_totpoint_update(?)}";
			CallableStatement cstmt = conn.prepareCall(sql);
			for(int i=0; i<vector.size(); i++){
				cstmt.setString(1, vector.get(i));
				cstmt.executeUpdate();
			}
			if(cstmt != null) cstmt.close();			
		}
	
	public static void gudanTotWin(Connection conn, String gname)
			throws SQLException{
			String sql = "{call GUDAN_TOTPOINT_UPDATE_WIN(?)}";
			CallableStatement cstmt = conn.prepareCall(sql);
			cstmt.setString(1, gname.trim());		
			cstmt.executeUpdate();
			if(cstmt != null) cstmt.close();
		}
	public static void gudanTotLose(Connection conn, String gname)
			throws SQLException{
			String sql = "{call GUDAN_TOTPOINT_UPDATE_LOSE(?)}";
			CallableStatement cstmt = conn.prepareCall(sql);
			cstmt.setString(1, gname.trim());
			cstmt.executeUpdate();
			if(cstmt != null) cstmt.close();
		}
	public static void gudanTotDraw(Connection conn, String gname)
			throws SQLException{
			String sql = "{call GUDAN_TOTPOINT_UPDATE_DRAW(?)}";
			CallableStatement cstmt = conn.prepareCall(sql);
			cstmt.setString(1, gname.trim());
			cstmt.executeUpdate();
			if(cstmt != null) cstmt.close();
		}
	
	
}
