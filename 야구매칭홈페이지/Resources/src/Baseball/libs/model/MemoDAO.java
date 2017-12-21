package Baseball.libs.model;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;
import oracle.jdbc.OracleTypes;

public class MemoDAO {
	public static int count(Connection conn,String myid)
			throws SQLException{
			int count=0;
			String sql = "{call MESSAGE_COUNT(?,?)}";
			CallableStatement cstmt = conn.prepareCall(sql);
			cstmt.setString(1, myid);
			cstmt.registerOutParameter(2, OracleTypes.CURSOR);
			cstmt.execute();
			ResultSet rs = (ResultSet)cstmt.getObject(2);
			rs.next();			
			count = rs.getInt(1);
			if(rs !=null) rs.close();
			if(cstmt != null) cstmt.close();
			return count;
		}
	
	public static MemoBean getOne(Connection conn, int idx, String myid)
			throws SQLException{
			String sql = "{call MESSAGE_SELECT(?, ?, ?)}";
			CallableStatement cstmt = conn.prepareCall(sql);
			cstmt.setInt(1, idx);
			cstmt.setString(2, myid);
			cstmt.registerOutParameter(3, OracleTypes.CURSOR);
			cstmt.execute();
			ResultSet rs = (ResultSet)cstmt.getObject(3);
			rs.next();
			MemoBean mm = new MemoBean();
			mm.setIdx(rs.getInt(1));
			mm.setContent(rs.getString(2));
			mm.setDate(rs.getString(3));
			mm.setSendid(rs.getString(4));
			mm.setReceivid(rs.getString(5));
			if(rs !=null) rs.close();
			if(cstmt != null) cstmt.close();
			return mm;
		}
		public static int getPageCount(Connection conn, int pageSize, String myid)
			throws SQLException{
			int pageCount = 0;
			String sql = "{call MESSAGE_COUNT(?,?)}";
			CallableStatement cstmt = conn.prepareCall(sql);
			cstmt.setString(1, myid);
			cstmt.registerOutParameter(2, OracleTypes.CURSOR);
			cstmt.execute();
			ResultSet rs = (ResultSet)cstmt.getObject(2);
			rs.next();
			int rowCount = rs.getInt(1);
			pageCount = (rowCount % pageSize == 0) ? rowCount / pageSize : 
				                                                             rowCount / pageSize + 1;
			if(rs !=null) rs.close();
			if(cstmt != null) cstmt.close();
			return pageCount;
		}
		
		public static Vector<MemoBean> getAll(Connection conn, String myid)
				throws SQLException {
				String sql = "{call MESSAGE_ALL_SELECT(?, ?)}";
				CallableStatement cstmt = conn.prepareCall(sql);
				cstmt.setString(1, myid);
				cstmt.registerOutParameter(2, OracleTypes.CURSOR);
				cstmt.execute();
				ResultSet rs = (ResultSet)cstmt.getObject(2);
				Vector<MemoBean> vector = new Vector<MemoBean>(1,1);
				if(!rs.next()){  //쪽지가 한 개도 없다면
					vector = null;
				}else{
					do{
						MemoBean mm = new MemoBean();
						mm.setIdx(rs.getInt(1));
						mm.setContent(rs.getString(2));
						mm.setSendid(rs.getString(3));
						mm.setDate(rs.getString(4));
						mm.setReceivid(rs.getString(5));
						vector.addElement(mm);
					}while(rs.next());
				}
				if(rs !=null) rs.close();
				if(cstmt != null) cstmt.close();
				return vector;
		}
		
		public static int insert(Connection conn, MemoBean mb)
				throws SQLException{
				String sql = "{call MESSAGE_INSERT(?,?,?,?)}";
				CallableStatement cstmt = conn.prepareCall(sql);
				cstmt.setString(1, mb.getContent());
				cstmt.setString(2, mb.getSendid());
				cstmt.setString(3, mb.getDate());
				cstmt.setString(4, mb.getReceivid());								
				int row = cstmt.executeUpdate();
				if(cstmt != null) cstmt.close();
				return row;
		}
		
		public static void delete(Connection conn, Vector<Integer> idxs)
				throws SQLException{
				String sql = "{call MESSAGE_DELETE(?)}";
				CallableStatement cstmt = conn.prepareCall(sql);
				for(int i=0; i<idxs.size(); i++){					
					cstmt.setInt(1, idxs.get(i));
					cstmt.executeUpdate();
				}				
				if(cstmt != null) cstmt.close();				
		}
}
