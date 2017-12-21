package Team3.Controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

public class DBConnection {
	private static Properties props;
	private static Connection conn;

	public static void setProperty(String path) {
		props = new Properties();
		try{
			props.load(new FileInputStream(new File(path)));
		}catch(IOException ex){
			System.out.println(ex);
		}
	}
	
	public static void loadDriver(){
		try{
			Class.forName(props.getProperty("DBDRIVER"));
		}catch(ClassNotFoundException ex){
			System.out.println("Oracle Driver Class Not Found");
		}
	}
	
	public static Connection getConnection(){
		try{
			conn = DriverManager.getConnection(props.getProperty("DBURL"),
					                         props.getProperty("DBUSER"),
					                         props.getProperty("DBPWD"));
			System.out.println("Connection Success");
		}catch(SQLException ex){
			System.out.println("Server Connection Failure");
		}
		return conn;
	}
}





