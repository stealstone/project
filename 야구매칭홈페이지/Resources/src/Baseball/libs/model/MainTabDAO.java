package Baseball.libs.model;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import oracle.jdbc.OracleTypes;

public class MainTabDAO {
	public static Vector<MainTabBean> select_machTab(Connection conn)
			throws SQLException{
			String sql = "{call MAGFIVE_SELECT(?)}";
			CallableStatement cstmt = conn.prepareCall(sql);			
			cstmt.registerOutParameter(1, OracleTypes.CURSOR);
			cstmt.execute();
			ResultSet rs = (ResultSet)cstmt.getObject(1);
			Vector<MainTabBean> vector = new Vector<MainTabBean>(1,1);
			if(!rs.next()){
				vector = null;
			}else{
				do{
					MainTabBean mtb = new MainTabBean();
					mtb.setIndex(rs.getInt(1));
					mtb.setTitle(rs.getString(2));				
					String date = String.valueOf(rs.getDate(3));
					mtb.setDate(date);
					vector.add(mtb);
				}while(rs.next());
			}
			
			if(rs != null) rs.close();
			if(cstmt != null) cstmt.close();
			return vector;
	}
	
	public static Vector<MainTabBean> select_noteTab(Connection conn)
			throws SQLException{
			String sql = "{call NOGFIVE_SELECT(?)}";
			CallableStatement cstmt = conn.prepareCall(sql);			
			cstmt.registerOutParameter(1, OracleTypes.CURSOR);
			cstmt.execute();
			ResultSet rs = (ResultSet)cstmt.getObject(1);
			Vector<MainTabBean> vector = new Vector<MainTabBean>(1,1);
			if(!rs.next()){
				vector = null;
			}else{
				do{
					MainTabBean mtb = new MainTabBean();
					mtb.setIndex(rs.getInt(1));
					mtb.setTitle(rs.getString(2));				
					String date = String.valueOf(rs.getDate(3));
					mtb.setDate(date);
					vector.add(mtb);
				}while(rs.next());
			}
			
			if(rs != null) rs.close();
			if(cstmt != null) cstmt.close();
			return vector;
	}
	
	public static Vector<MainTabBean> select_proTab(Connection conn)
			throws SQLException{
			String sql = "{call PRGFIVE_SELECT(?)}";
			CallableStatement cstmt = conn.prepareCall(sql);			
			cstmt.registerOutParameter(1, OracleTypes.CURSOR);
			cstmt.execute();
			ResultSet rs = (ResultSet)cstmt.getObject(1);
			Vector<MainTabBean> vector = new Vector<MainTabBean>(1,1);
			if(!rs.next()){
				vector = null;
			}else{
				do{
					MainTabBean mtb = new MainTabBean();
					mtb.setIndex(rs.getInt(1));
					mtb.setTitle(rs.getString(2));				
					String date = String.valueOf(rs.getDate(3));
					mtb.setDate(date);
					vector.add(mtb);
				}while(rs.next());
			}
			
			if(rs != null) rs.close();
			if(cstmt != null) cstmt.close();
			return vector;
	}
	
	public static Vector<MainTabBean> select_freeTab(Connection conn)
			throws SQLException{
			String sql = "{call FRGFIVE_SELECT(?)}";
			CallableStatement cstmt = conn.prepareCall(sql);			
			cstmt.registerOutParameter(1, OracleTypes.CURSOR);
			cstmt.execute();
			ResultSet rs = (ResultSet)cstmt.getObject(1);
			Vector<MainTabBean> vector = new Vector<MainTabBean>(1,1);
			if(!rs.next()){
				vector = null;
			}else{
				do{
					MainTabBean mtb = new MainTabBean();
					mtb.setIndex(rs.getInt(1));
					mtb.setTitle(rs.getString(2));				
					String date = String.valueOf(rs.getDate(3));
					mtb.setDate(date);
					vector.add(mtb);
				}while(rs.next());
			}
			
			if(rs != null) rs.close();
			if(cstmt != null) cstmt.close();
			return vector;
	}
}
