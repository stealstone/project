package Baseball.libs.model;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import oracle.jdbc.OracleTypes;

public class FreeDAO {
	
	//공지사항 게시판 페이지
	public static int getFreePageCount(Connection conn, int pageSize)
				throws SQLException{
				int pageCount = 0;
			String sql = "{call NOTICEGP_count(?)}";
			CallableStatement cstmt = conn.prepareCall(sql);
			cstmt.registerOutParameter(1, OracleTypes.CURSOR);
			cstmt.execute();
			ResultSet rs = (ResultSet)cstmt.getObject(1);
			rs.next();
			int rowCount = rs.getInt(1);
			pageCount = (rowCount % pageSize == 0) ? rowCount / pageSize : 
				                                                             rowCount / pageSize + 1;
			if(rs !=null) rs.close();
			if(cstmt != null) cstmt.close();
			return pageCount;
	}
	
	public static Vector<GesipanBean> Free_getAll(Connection conn)
			throws SQLException {
			String sql = "{call FREEGP_ALL_SELECT(?)}";
			CallableStatement cstmt = conn.prepareCall(sql);
			cstmt.registerOutParameter(1, OracleTypes.CURSOR);
			cstmt.execute();
			ResultSet rs = (ResultSet)cstmt.getObject(1);
			Vector<GesipanBean> vector = new Vector<GesipanBean>(1,1);
			if(!rs.next()){  //게시판 글이 한 개도 없다면
				vector = null;
			}else{
				do{
					GesipanBean gb = new GesipanBean();
					gb.setIdx(rs.getInt(1));
					gb.setDate(rs.getDate(2));
					gb.setSubject(rs.getString(3));
					gb.setViews(rs.getInt(4));
					gb.setId(rs.getString(5));
					vector.addElement(gb);
				}while(rs.next());
			}
			if(rs !=null) rs.close();
			if(cstmt != null) cstmt.close();
			return vector;
	}
	
	public static GesipanBean getOne(Connection conn, int idx)
			throws SQLException{
			String sql = "{call FREEGP_SELECT(?, ?)}";
			CallableStatement cstmt = conn.prepareCall(sql);			
			cstmt.setInt(1, idx);
			cstmt.registerOutParameter(2, OracleTypes.CURSOR);
			cstmt.execute();
			ResultSet rs = (ResultSet)cstmt.getObject(2);
			rs.next();
			GesipanBean gb = new GesipanBean();
			gb.setIdx(rs.getInt(1));
			gb.setId(rs.getString(2));
			gb.setDate(rs.getDate(3));
			gb.setSubject(rs.getString(4));
			gb.setViews(rs.getInt(5));
			gb.setPosts(rs.getString(6));
			if(rs !=null) rs.close();
			if(cstmt != null) cstmt.close();
			return gb;
	}
	
	public static int Freeinsert(Connection conn, GesipanBean gb)
			throws SQLException{
			String sql = "{call FREEGP_INSERT(?,?,?,?,?)}";
			CallableStatement cstmt = conn.prepareCall(sql);
			
			cstmt.setString(1, gb.getId());
			java.sql.Date sqlDate = new java.sql.Date(gb.getDate().getTime());
			cstmt.setDate(2,sqlDate);
			cstmt.setString(3, gb.getSubject());
			cstmt.setInt(4, 0);
			cstmt.setString(5, gb.getPosts());	
			
			int row = cstmt.executeUpdate();
			if(cstmt != null) cstmt.close();
			return row;
	}
	
	public static int Freedelete(Connection conn, int idx)
			throws SQLException{
			String sql = "{call FREEGP_DELETE(?)}";
			CallableStatement cstmt = conn.prepareCall(sql);
			cstmt.setInt(1, idx);
			int row = cstmt.executeUpdate();					
			if(cstmt != null) cstmt.close();
			return row;
	}	
	
	public static int Freeupdate(Connection conn, int idx ,GesipanBean gb)
			throws SQLException{
			String sql = "{call FREEGP_UPDATE(?,?,?,?)}";
			CallableStatement cstmt = conn.prepareCall(sql);
			
			cstmt.setInt(1,idx);			
			cstmt.setString(2, gb.getSubject());
			java.sql.Date sqlDate = new java.sql.Date(gb.getDate().getTime());
			cstmt.setDate(3,sqlDate);
			cstmt.setString(4, gb.getPosts());	
			
			int row = cstmt.executeUpdate();
			if(cstmt != null) cstmt.close();
			return row;
	}
	
	public static int updateFreeReadcount(Connection conn, int idx)
			throws SQLException{
			String sql = "{call FREEGP_UPDATE_READCOUNT(?)}";
			CallableStatement cstmt = conn.prepareCall(sql);
			cstmt.setInt(1, idx);
			int row = cstmt.executeUpdate();
			if(cstmt != null) cstmt.close();
			return row;
	}
	
	public static Vector<CommentBean> getCommentAll(Connection conn, int idx)
			throws SQLException {
			String sql = "{call FREEGPDG_SELECT_ALL(?,?)}";
			CallableStatement cstmt = conn.prepareCall(sql);
			cstmt.setInt(1, idx);
			cstmt.registerOutParameter(2, OracleTypes.CURSOR);
			cstmt.execute();
			ResultSet rs = (ResultSet)cstmt.getObject(2);
			Vector<CommentBean> vector = new Vector<CommentBean>(1,1);
			if(!rs.next()){  //댓글이 한 개도 없다면
				vector = null;
			}else{
				do{
					CommentBean cb = new CommentBean();
					cb.setIdx(rs.getInt(1));
					cb.setDate(rs.getDate(2));
					cb.setReply(rs.getString(3));
					cb.setId(rs.getString(4));
					vector.addElement(cb);
				}while(rs.next());
			}
			if(rs !=null) rs.close();
			if(cstmt != null) cstmt.close();
			return vector;
	}	
	
	public static int FreeCommentInsert(Connection conn, CommentBean cb)
			throws SQLException{
			String sql = "{call FREEGPDG_INSERT(?,?,?,?)}";
			CallableStatement cstmt = conn.prepareCall(sql);
			
			cstmt.setInt(1, cb.getGesipanidx());
			java.sql.Date sqlDate = new java.sql.Date(cb.getDate().getTime());
			cstmt.setDate(2,sqlDate);
			cstmt.setString(3, cb.getReply());
			cstmt.setString(4, cb.getId());	
			
			int row = cstmt.executeUpdate();
			if(cstmt != null) cstmt.close();
			return row;
	}	
	
	public static int FreeCommentdelete(Connection conn, int idx)
			throws SQLException{
			String sql = "{call FREEGPDG_DELETE(?)}";
			CallableStatement cstmt = conn.prepareCall(sql);
			cstmt.setInt(1, idx);			
			int row = cstmt.executeUpdate();					
			if(cstmt != null) cstmt.close();
			return row;
	}	
	
	public static int FreeCommentAlldelete(Connection conn, int idx)
			throws SQLException{
			String sql = "{call FREEGPDG_DELETE_ALL(?)}";
			CallableStatement cstmt = conn.prepareCall(sql);
			cstmt.setInt(1, idx);			
			int row = cstmt.executeUpdate();					
			if(cstmt != null) cstmt.close();
			return row;
	}	
}
