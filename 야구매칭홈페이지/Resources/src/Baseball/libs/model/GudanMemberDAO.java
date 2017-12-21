package Baseball.libs.model;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import oracle.jdbc.OracleTypes;

public class GudanMemberDAO {
	
	public static int JoinDelete(Connection conn, String gid, int guno)
			throws SQLException{
			String sql = "{call gudanmember_com_delete(?,?)}";
			CallableStatement cstmt = conn.prepareCall(sql);
			cstmt.setString(1, gid.trim());
			cstmt.setInt(2, guno);
			int row = cstmt.executeUpdate();
			if(cstmt != null) cstmt.close();
			return row;
		}
	
	public static int JoinUpdate(Connection conn, String gid, int guno, String comfirm)
			throws SQLException{
			String sql = "{call gudanmember_com_update(?,?,?)}";
			CallableStatement cstmt = conn.prepareCall(sql);
			cstmt.setString(1, gid.trim());
			cstmt.setInt(2, guno);
			cstmt.setString(3, comfirm);
			int row = cstmt.executeUpdate();
			if(cstmt != null) cstmt.close();
			return row;
		}
	
	public static Vector<String> GudanMember(Connection conn, int guno, String comfirm)
			throws SQLException{
			String sql = "{call gudanmember_id_select(?,?,?)}";
			CallableStatement cstmt = conn.prepareCall(sql);
			cstmt.setInt(1, guno);
			cstmt.setString(2, comfirm);
			cstmt.registerOutParameter(3, OracleTypes.CURSOR);
			cstmt.execute();
			ResultSet rs = (ResultSet)cstmt.getObject(3);
			Vector<String> vector = new Vector<String>(1,1);
			if(!rs.next()){
				vector = null;
			}else {
				do{
				String id = rs.getString(1);
				vector.addElement(id);
				}while(rs.next());
			}
			if(rs != null) rs.close();
			if(cstmt != null) cstmt.close();
			return vector;
	}
	
	public static int selectGuno(Connection conn, String id)
			throws SQLException{
			String sql = "{call gudanmember_gu_select(?,?)}";
			CallableStatement cstmt = conn.prepareCall(sql);
			cstmt.setString(1, id);
			cstmt.registerOutParameter(2, OracleTypes.CURSOR);
			cstmt.execute();
			ResultSet rs = (ResultSet)cstmt.getObject(2);
			rs.next();
			int guno = rs.getInt(1);
			if(rs != null) rs.close();
			if(cstmt != null) cstmt.close();
			return guno;
	}
	
	public static int gmemberinsert(Connection conn, GudanMemberBean gudanMemeber)
			throws SQLException{
			String sql = "{call gudanmember_insert(?,?,?,?)}";
			CallableStatement cstmt = conn.prepareCall(sql);
			cstmt.setString(1, gudanMemeber.getMemId());
			cstmt.setString(2, "w");
			cstmt.setString(3, "");
			cstmt.setInt(4, gudanMemeber.getGuno());
			int row = cstmt.executeUpdate();
			if(cstmt != null) cstmt.close();
			return row;
		}
}
