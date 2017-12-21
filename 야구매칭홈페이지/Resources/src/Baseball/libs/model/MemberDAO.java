package Baseball.libs.model;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import Baseball.libs.model.MemberBean;
import oracle.jdbc.OracleTypes;

public class MemberDAO {
	
	public static MemberBean JoinMember(Connection conn, String id)
			throws SQLException{
			String sql = "{call member_info(?,?)}";
			CallableStatement cstmt = conn.prepareCall(sql);
			cstmt.setString(1, id);
			cstmt.registerOutParameter(2, OracleTypes.CURSOR);
			cstmt.execute();
			ResultSet rs = (ResultSet)cstmt.getObject(2);
			MemberBean mb = null;
			if(!rs.next()){  
				mb = null;
			}else{  
					mb  = new MemberBean(rs.getString(1),
									 	rs.getString(2),
									 	rs.getDate(3),
									 	rs.getString(4),
									 	rs.getString(5),
									 	rs.getString(6),
									 	rs.getString(7),
									 	rs.getString(8),
									 	rs.getString(9),
										rs.getString(10),
										rs.getString(11));
			}
			if(rs != null) rs.close();
			if(cstmt != null) cstmt.close();
			return mb;
	}
	
	public static String selectpage(Connection conn, String userid)
			throws SQLException{
			String sql = "{call member_gpage_select(?,?)}";
			CallableStatement cstmt = conn.prepareCall(sql);
			cstmt.setString(1, userid);
			cstmt.registerOutParameter(2, OracleTypes.CURSOR);
			cstmt.execute();
			ResultSet rs = (ResultSet)cstmt.getObject(2);
			rs.next();
			String page = rs.getString(1);
			if(rs != null) rs.close();
			if(cstmt != null) cstmt.close();
			return page;
	}
	
	public static int updatePage(Connection conn, String id, String page)
			throws SQLException{
			String sql = "{call member_gpage_update(?, ?)}";
			CallableStatement cstmt = conn.prepareCall(sql);
			cstmt.setString(1, id.trim());
			cstmt.setString(2, page.trim());
			int row = cstmt.executeUpdate();
			if(cstmt != null) cstmt.close();
			return row;
		}
	
	public static int updateClub(Connection conn, String id, String rating, String club)
			throws SQLException{
			String sql = "{call member_club_update(?, ?, ?)}";
			CallableStatement cstmt = conn.prepareCall(sql);
			cstmt.setString(1, id.trim());
			cstmt.setString(2, rating.trim());
			cstmt.setString(3, club.trim());
			int row = cstmt.executeUpdate();
			if(cstmt != null) cstmt.close();
			return row;
		}
	
	public static int insert(Connection conn, MemberJoinBean member)
			throws SQLException{
			String sql = "{call member_insert(?,?,?,?,?,?,?,?,?,?,?,?)}";
			CallableStatement cstmt = conn.prepareCall(sql);
			cstmt.setString(1, member.getUserid());
			cstmt.setString(2, member.getPasswd());
			cstmt.setString(3, member.getName());
			
			java.util.Date d = member.getBirthday();
			cstmt.setDate(4, new java.sql.Date(d.getTime()));
			
			//cstmt.setDate(4, member.getBirthday());
			cstmt.setString(5, member.getEmail());
			cstmt.setString(6, member.getAddress());
			cstmt.setString(7, member.getTell());
			cstmt.setString(8, member.getPosition());
			cstmt.setString(9, "");
			cstmt.setString(10, member.getGrade());
			cstmt.setString(11, member.getSex());
			cstmt.setString(12, "");
			int row = cstmt.executeUpdate();
			if(cstmt != null) cstmt.close();
			return row;
		}
	
	public static Vector<ZipcodeBean> select_zipcode(Connection conn, String dong)
			throws SQLException{
			String sql = "{call zipcode_select(?,?)}";
			CallableStatement cstmt = conn.prepareCall(sql);
			cstmt.setString(1, dong);
			cstmt.registerOutParameter(2, OracleTypes.CURSOR);
			cstmt.execute();
			ResultSet rs = (ResultSet)cstmt.getObject(2);
			Vector<ZipcodeBean> vector = new Vector<ZipcodeBean>(1,1);
			if(!rs.next()){  
				vector = null;
			}else{  
				do{
					ZipcodeBean zip = 
							new ZipcodeBean(rs.getString("sido"),
									        rs.getString("gugun"),
									        rs.getString("dong"));
					vector.addElement(zip);
				}while(rs.next());
			}
			if(rs != null) rs.close();
			if(cstmt != null) cstmt.close();
			return vector;
	}
		
	public static boolean idcheck(Connection conn, String id)
			throws SQLException{
			boolean exists = true;
			String sql = "{call id_check(?,?)}";
			CallableStatement cstmt = conn.prepareCall(sql);
			cstmt.setString(1, id.trim());
			cstmt.registerOutParameter(2, OracleTypes.CURSOR);
			cstmt.execute();
			ResultSet rs = (ResultSet)cstmt.getObject(2);
			if(rs.next()) exists = true;
			else exists = false;
			if(rs != null) rs.close();
			if(cstmt != null) cstmt.close();
			return exists;
	}
	
	public static int login(Connection conn, String userid, String passwd)
			throws SQLException{
			int flag = -1;
			String sql = "{call member_login(?,?)}";
			CallableStatement cstmt = conn.prepareCall(sql);
			cstmt.setString(1, userid.trim());
			cstmt.registerOutParameter(2, OracleTypes.CURSOR);
			cstmt.execute();
			ResultSet rs = (ResultSet)cstmt.getObject(2);
			if(!rs.next()){  
				flag = -1;
			}else{  
				String dbPwd = rs.getString(1);
				if(dbPwd.trim().equals(passwd.trim())){ 
					flag = 1;
				}else{  
					flag = 0;
				}
			}
			if(rs != null) rs.close();
			if(cstmt != null) cstmt.close();
			return flag;
	}
	
	
	public static MemberBean selectMember(Connection conn, String userid)
			throws SQLException{
			String sql = "{call member_info(?,?)}";
			CallableStatement cstmt = conn.prepareCall(sql);
			cstmt.setString(1, userid);
			cstmt.registerOutParameter(2, OracleTypes.CURSOR);
			cstmt.execute();
			ResultSet rs = (ResultSet)cstmt.getObject(2);
			MemberBean mem = null;
			if(!rs.next()){  
				mem = null;
			}else{  
				mem = new MemberBean(rs.getString(1),
									 rs.getString(2),
									 rs.getDate(3),
									 rs.getString(4),
									 rs.getString(5),
									 rs.getString(6),
									 rs.getString(7),
									 rs.getString(8),
									 rs.getString(9),
									 rs.getString(10),
									 rs.getString(11));			
			}
			if(rs != null) rs.close();
			if(cstmt != null) cstmt.close();
			return mem;
	}
	public static Vector<MemberBean> selectAllMember(Connection conn, String userid)
			throws SQLException{
			String sql = "{call member_admin_select(?,?)}";
			CallableStatement cstmt = conn.prepareCall(sql);
			cstmt.setString(1, userid);
			cstmt.registerOutParameter(2, OracleTypes.CURSOR);
			cstmt.execute();
			ResultSet rs = (ResultSet)cstmt.getObject(2);
			Vector<MemberBean> vector = new Vector<MemberBean>(1,1);
			if(!rs.next()){
				vector = null;				
			}else{  
				do{
					MemberBean mem = new MemberBean(rs.getString(1),
										 			rs.getString(2),
										 			rs.getString(3),
										 			rs.getString(4));
					vector.add(mem);
				}while(rs.next());
			}			
			if(rs != null) rs.close();
			if(cstmt != null) cstmt.close();
			return vector;
	}
	
	public static void Memberdelete(Connection conn, Vector<String> vector)
			throws SQLException{		
			
			//자유게시판 답글
			String sql = "{call FREEGPDG_UID_DELETE(?)}";			
			CallableStatement cstmt = conn.prepareCall(sql);
			
			for(int i=0; i<vector.size(); i++){					
				cstmt.setString(1, vector.get(i));
				cstmt.executeUpdate();				
			}			
			if(cstmt != null) cstmt.close();
			
			//자유게시판 게시글
			sql = "{call FREEGP_UID_DELETE(?)}";			
			cstmt = conn.prepareCall(sql);
			
			for(int i=0; i<vector.size(); i++){					
				cstmt.setString(1, vector.get(i));
				cstmt.executeUpdate();				
			}				
			if(cstmt != null) cstmt.close();
			
			//매칭답글
			sql = "{call MATCHINGDP_UID_DELETE(?)}";			
			cstmt = conn.prepareCall(sql);
			
			for(int i=0; i<vector.size(); i++){					
				cstmt.setString(1, vector.get(i));
				cstmt.executeUpdate();				
			}				
			if(cstmt != null) cstmt.close();			
			
			//메시지
			sql = "{call MESSAGEUSERID_DELETE(?,?)}";			
			cstmt = conn.prepareCall(sql);
			
			for(int i=0; i<vector.size(); i++){					
				cstmt.setString(1, vector.get(i));
				cstmt.setString(2, vector.get(i));
				cstmt.executeUpdate();				
			}				
			if(cstmt != null) cstmt.close();
						
			//구단명 가져오기
			Vector<String> gudan = new Vector<String>(1,1);
			sql = "{call MEMBERUSERID_SELECT(?,?)}";
			for(int i=0; i<vector.size(); i++){
				cstmt = conn.prepareCall(sql);	
				cstmt.setString(1, vector.get(i));
				cstmt.registerOutParameter(2, OracleTypes.CURSOR);
				cstmt.execute();
				ResultSet rs = (ResultSet)cstmt.getObject(2);
				while(rs.next()){
					gudan.addElement(rs.getString(1));
				}
				if(rs != null) rs.close();
				if(cstmt != null) cstmt.close();
			}
			
			//구단 번호 가져오기
			Vector<Integer> gudanNum = new Vector<Integer>(1,1);
			sql = "{call GUDAN_GUNO_SELECT(?,?)}";
			for(int i=0; i<gudan.size(); i++){
				cstmt = conn.prepareCall(sql);	
				cstmt.setString(1, gudan.get(i));
				cstmt.registerOutParameter(2, OracleTypes.CURSOR);
				cstmt.execute();
				ResultSet rs = (ResultSet)cstmt.getObject(2);
				while(rs.next()){
					gudanNum.addElement(rs.getInt(1));
				}
				if(rs != null) rs.close();
				if(cstmt != null) cstmt.close();
			}	
			
			// 구단 가입자 삭제			
			sql = "{call GUDANMEMBER_UID_DELETE(?)}";			
			cstmt = conn.prepareCall(sql);
			
			for(int i=0; i<gudanNum.size(); i++){					
				cstmt.setInt(1, gudanNum.get(i));				
				cstmt.executeUpdate();				
			}				
			if(cstmt != null) cstmt.close();
			
						
			//매치 테이블
			sql = "{call MATCH_UID_DELETE(?)}";			
			cstmt = conn.prepareCall(sql);
			
			for(int i=0; i<gudan.size(); i++){					
				cstmt.setString(1, gudan.get(i));
				cstmt.executeUpdate();				
			}				
			if(cstmt != null) cstmt.close();	
			
			
			//매칭 테이블
			sql = "{call MATCHING_UID_DELETE(?)}";			
			cstmt = conn.prepareCall(sql);
			
			for(int i=0; i<gudan.size(); i++){					
				cstmt.setString(1, gudan.get(i));
				cstmt.executeUpdate();				
			}				
			if(cstmt != null) cstmt.close();	
			
			
			//매칭게시판
			sql = "{call MATCHINGGP_UID_DELETE(?)}";			
			cstmt = conn.prepareCall(sql);
			
			for(int i=0; i<vector.size(); i++){					
				cstmt.setString(1, vector.get(i));
				cstmt.executeUpdate();				
			}				
			if(cstmt != null) cstmt.close();
			
			
			//구단 지우기
			sql = "{call GUDAN_UID_DELETE(?)}";			
			cstmt = conn.prepareCall(sql);
			
			for(int i=0; i<vector.size(); i++){					
				cstmt.setString(1, vector.get(i));
				cstmt.executeUpdate();				
			}				
			if(cstmt != null) cstmt.close();
			
			//멤버 지우기
			sql = "{call MEMBER_DELETE(?)}";			
			cstmt = conn.prepareCall(sql);
			
			for(int i=0; i<vector.size(); i++){					
				cstmt.setString(1, vector.get(i));
				cstmt.executeUpdate();				
			}				
			if(cstmt != null) cstmt.close();
			
			
			//구단 가입자 가져오기
			Vector<String> join = new Vector<String>(1,1);
			sql = "{call GUDAN_USERID_SELECT(?,?)}";
			for(int i=0; i<gudan.size(); i++){
				cstmt = conn.prepareCall(sql);	
				cstmt.setString(1, gudan.get(i));
				cstmt.registerOutParameter(2, OracleTypes.CURSOR);
				cstmt.execute();
				ResultSet rs = (ResultSet)cstmt.getObject(2);
				while(rs.next()){
					join.addElement(rs.getString(1));
				}
				if(rs != null) rs.close();
				if(cstmt != null) cstmt.close();
			}
			
			//구단 가입자 정보 업데이트
			sql = "{call MEMBER_CLID_UPDATE(?)}";
			cstmt = conn.prepareCall(sql);
			
			for(int i=0; i<join.size(); i++){					
				cstmt.setString(1, join.get(i));
				cstmt.executeUpdate();				
			}				
			if(cstmt != null) cstmt.close();			
			
	}
}
