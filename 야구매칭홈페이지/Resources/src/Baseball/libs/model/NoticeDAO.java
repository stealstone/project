package Baseball.libs.model;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import oracle.jdbc.OracleTypes;

public class NoticeDAO {
	
	//공지사항 게시판 페이지
	public static int getNoticePageCount(Connection conn, int pageSize)
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
	
	public static Vector<GesipanBean> Notice_getAll(Connection conn)
			throws SQLException {
			String sql = "{call NOGALL_SELECT(?)}";
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
					vector.addElement(gb);
				}while(rs.next());
			}
			if(rs !=null) rs.close();
			if(cstmt != null) cstmt.close();
			return vector;
	}
	
	public static GesipanBean getOne(Connection conn, int idx)
			throws SQLException{
			String sql = "{call noticegp_select(?, ?)}";
			CallableStatement cstmt = conn.prepareCall(sql);			
			cstmt.setInt(1, idx);
			cstmt.registerOutParameter(2, OracleTypes.CURSOR);
			cstmt.execute();
			ResultSet rs = (ResultSet)cstmt.getObject(2);
			rs.next();
			GesipanBean gb = new GesipanBean();
			gb.setDate(rs.getDate(1));
			gb.setSubject(rs.getString(2));
			gb.setViews(rs.getInt(3));
			gb.setPosts(rs.getString(4));

			if(rs !=null) rs.close();
			if(cstmt != null) cstmt.close();
			return gb;
	}
	
	public static int Noticeinsert(Connection conn, GesipanBean gb)
			throws SQLException{
			String sql = "{call NOTICEGP_INSERT(?,?,?,?)}";
			CallableStatement cstmt = conn.prepareCall(sql);
						
			java.sql.Date sqlDate = new java.sql.Date(gb.getDate().getTime());
			cstmt.setDate(1,sqlDate);
			cstmt.setString(2, gb.getSubject());
			cstmt.setInt(3, 0);
			cstmt.setString(4, gb.getPosts());	
			
			int row = cstmt.executeUpdate();
			if(cstmt != null) cstmt.close();
			return row;
	}
	
	public static int Noticedelete(Connection conn, int idx)
			throws SQLException{
			String sql = "{call NOTICEGP_DELETE(?)}";
			CallableStatement cstmt = conn.prepareCall(sql);
			cstmt.setInt(1, idx);
			int row = cstmt.executeUpdate();					
			if(cstmt != null) cstmt.close();
			return row;
	}	
	
	public static int Noticeupdate(Connection conn, int idx ,GesipanBean gb)
			throws SQLException{
			String sql = "{call NOTICEGP_UPDATE(?,?,?,?)}";
			CallableStatement cstmt = conn.prepareCall(sql);
			
			cstmt.setInt(1,idx);
			java.sql.Date sqlDate = new java.sql.Date(gb.getDate().getTime());
			cstmt.setDate(2,sqlDate);
			cstmt.setString(3, gb.getSubject());			
			cstmt.setString(4, gb.getPosts());	
			
			int row = cstmt.executeUpdate();
			if(cstmt != null) cstmt.close();
			return row;
	}
}
