package Baseball.libs.model;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Vector;

import com.sun.org.apache.xerces.internal.impl.xpath.regex.ParseException;

import Baseball.libs.model.CommentBean;
import Baseball.libs.model.GesipanBean;
import oracle.jdbc.OracleTypes;

public class GesipanDAO {

	public static int updateNoticeReadcount(Connection conn, int idx)
			throws SQLException{
			String sql = "{call noticegpvi_update(?)}";
			CallableStatement cstmt = conn.prepareCall(sql);
			cstmt.setInt(1, idx);
			int row = cstmt.executeUpdate();
			if(cstmt != null) cstmt.close();
			return row;
	}

	public static int getIncount(Connection conn, String gname,Date magsdate)
			throws SQLException{		
		String sql = "{call matchinggp_incount(?,?,?)}";
		CallableStatement cstmt = conn.prepareCall(sql);
		cstmt.setString(1, gname);
		java.util.Date d = magsdate;
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
	
	public static void deleteCommentGesipanid(Connection conn, int gesipanId) throws SQLException{
		String sql = "{call matchingdp_to_delete(?)}";
		CallableStatement cstmt = conn.prepareCall(sql);
		cstmt.setInt(1, gesipanId);
		cstmt.executeUpdate();
		if(cstmt != null) cstmt.close();
	}
	
	public static void deleteComment(Connection conn, int commentId) throws SQLException{
		String sql = "{call matchingdp_delete(?)}";
		CallableStatement cstmt = conn.prepareCall(sql);
		cstmt.setInt(1, commentId);
		cstmt.executeUpdate();
		if(cstmt != null) cstmt.close();
	}
	
	
	public static int getPageCount(Connection conn, int pageSize)
			throws SQLException{
			int pageCount = 0;
		String sql = "{call matchinggp_count(?)}";
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
	
	public static int insert_comment (Connection conn, CommentBean cb)
			throws SQLException, java.text.ParseException{
		String sql = "{call MATCHINGDP_INSERT(?,?,?,?)}";
		CallableStatement cstmt = conn.prepareCall(sql);
		cstmt.setInt(1, cb.getGesipanidx());	
		Date da = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");		
		String stringdate = sdf.format(da);	
		Date date = null;
		try {			 
			date = sdf.parse(stringdate);
		} catch (ParseException e) {
			e.printStackTrace();
		}		
	    java.sql.Date sqlDate = new java.sql.Date(date.getTime());
		cstmt.setDate(2,sqlDate);				
		cstmt.setString(3, cb.getReply());	
		cstmt.setString(4, cb.getId());		
		int row = cstmt.executeUpdate();
		if(cstmt != null) cstmt.close();
		return row;
	}
	
	
	public static Vector<CommentBean> getCommentAll(Connection conn, int idx)
			throws SQLException {
			String sql = "{call matchingdp_select(?,?)}";
			CallableStatement cstmt = conn.prepareCall(sql);
			cstmt.setInt(1, idx);
			cstmt.registerOutParameter(2, OracleTypes.CURSOR);
			
			cstmt.execute();
			ResultSet rs = (ResultSet)cstmt.getObject(2);
			
			Vector<CommentBean> vector = new Vector<CommentBean>(1,1);
			if(!rs.next()){  //게시판 글이 한 개도 없다면
				vector = null;
			}else{
				do{
					CommentBean cb = new CommentBean();
					cb.setIdx(rs.getInt("madno"));
					cb.setDate(rs.getDate(2));
					cb.setReply(rs.getString("madreply"));	
					cb.setId(rs.getString("madid"));				
					
					vector.addElement(cb);
				}while(rs.next());
			}
			if(rs !=null) rs.close();
			if(cstmt != null) cstmt.close();
			return vector;
		}
	
	public static int updateReadcount(Connection conn, int idx)
			throws SQLException{
			String sql = "{call matchinggp_update_readcount(?)}";
			CallableStatement cstmt = conn.prepareCall(sql);
			cstmt.setInt(1, idx);
			int row = cstmt.executeUpdate();
			if(cstmt != null) cstmt.close();
			return row;
		}
	
	public static int update(Connection conn, GesipanBean gb)
		throws SQLException{		
		String sql = "{call MATCHINGGP_UPDATE(?,?,?,?,?,?,?)}";
		CallableStatement cstmt = conn.prepareCall(sql);
		cstmt.setInt(1, gb.getIdx());		
		cstmt.setString(2, gb.getSubject());
		java.util.Date d = gb.getSdate();
		cstmt.setDate(3, new java.sql.Date(d.getTime()));
		cstmt.setString(4, gb.getStart());
		cstmt.setString(5, gb.getClose());
		cstmt.setString(6, gb.getPlace());		
		cstmt.setString(7, gb.getPosts());
		int row = cstmt.executeUpdate();
		if(cstmt != null) cstmt.close();
		return row;
	}
	public static void delete(Connection conn, int gesipanId) throws SQLException{
		String sql = "{call matchinggp_delete(?)}";
		CallableStatement cstmt = conn.prepareCall(sql);
		cstmt.setInt(1, gesipanId);
		cstmt.executeUpdate();
		if(cstmt != null) cstmt.close();
	}

	public static int insert(Connection conn, GesipanBean gb)
		throws SQLException, java.text.ParseException{
		String sql = "{call MATCHINGGP_INSERT(?,?,?,?,?,?,?,?,?,?)}";
		CallableStatement cstmt = conn.prepareCall(sql);
		cstmt.setString(1, gb.getSubject());		
		cstmt.setString(2, gb.getId());
		cstmt.setString(3, gb.getGname());
		Date da = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");		
		String stringdate = sdf.format(da);	
		Date date = null;
		try {			 
			date = sdf.parse(stringdate);
		} catch (ParseException e) {
			e.printStackTrace();
		}		
	    java.sql.Date sqlDate = new java.sql.Date(date.getTime());
		cstmt.setDate(4,sqlDate);					
		cstmt.setString(5, gb.getStart());
		cstmt.setString(6, gb.getClose());
		cstmt.setString(7, gb.getPlace());	
		java.util.Date d = gb.getSdate();
		cstmt.setDate(8, new java.sql.Date(d.getTime()));
		gb.setViews(1);
		cstmt.setInt(9, gb.getViews());
		cstmt.setString(10, gb.getPosts());		
		
	
		int row = cstmt.executeUpdate();
		if(cstmt != null) cstmt.close();
		return row;	
	}
	
	public static GesipanBean getOne(Connection conn, int idx)
			throws SQLException{
			String sql = "{call matchinggp_select(?, ?)}";
			CallableStatement cstmt = conn.prepareCall(sql);
			cstmt.setInt(1, idx);
			cstmt.registerOutParameter(2, OracleTypes.CURSOR);
			cstmt.execute();
			ResultSet rs = (ResultSet)cstmt.getObject(2);
			rs.next();
			GesipanBean gb = new GesipanBean();
			gb.setSubject(rs.getString("magsubject"));
			gb.setId(rs.getString("id"));
			gb.setGname(rs.getString("gname"));
			gb.setDate(rs.getDate(4));
			gb.setStart(rs.getString("magstart"));
			gb.setClose(rs.getString("magclose"));
			gb.setPlace(rs.getString("magplace"));
			gb.setSdate(rs.getDate(8));			
			gb.setViews(Integer.parseInt(rs.getString("magViews")));
			gb.setPosts(rs.getString("magposts"));

			if(rs !=null) rs.close();
			if(cstmt != null) cstmt.close();
			return gb;
		}
		
	public static Vector<GesipanBean> getAll(Connection conn)
			throws SQLException {
			String sql = "{call MATCHINGGP_all_select(?)}";
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
					gb.setIdx(rs.getInt("magno"));
					gb.setSubject(rs.getString("magsubject"));
					gb.setId(rs.getString("id"));					
					gb.setGname(rs.getString("gname"));
					gb.setDate(rs.getDate(5));
					gb.setStart(rs.getString("magstart"));
					gb.setClose(rs.getString("magclose"));
					gb.setPlace(rs.getString("magplace"));
					gb.setSdate(rs.getDate(9));
					gb.setViews(rs.getInt("magviews"));
					
					vector.addElement(gb);
				}while(rs.next());
			}
			if(rs !=null) rs.close();
			if(cstmt != null) cstmt.close();
			return vector;
		}
}