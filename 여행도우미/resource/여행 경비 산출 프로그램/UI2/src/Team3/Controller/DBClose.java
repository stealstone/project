package Team3.Controller;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBClose {
	public static void close(Connection conn){
		try{
			if(conn != null) conn.close();
			System.out.println("Close Success");
		}catch(SQLException ex){
			System.out.println(ex);
		}
	}
	public static void close(Connection conn, Statement stmt){
		try{
			if(stmt != null) stmt.close();
			if(conn != null) conn.close();
			System.out.println("Close Success");
		}catch(SQLException ex){
			System.out.println(ex);
		}
	}
	public static void close(Connection conn, Statement stmt, ResultSet rs){
		try{
			if(rs != null) rs.close();
			if(stmt != null) stmt.close();
			if(conn != null) conn.close();
			System.out.println("Close Success");
		}catch(SQLException ex){
			System.out.println(ex);
		}
	}
}
