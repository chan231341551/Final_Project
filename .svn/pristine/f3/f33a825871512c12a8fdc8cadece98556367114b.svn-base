package kr.or.ddit.commons.org;

import java.sql.Connection;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

// DB 연결을 위한 추상 클래스
public abstract class AbstractDataBase {

	public AbstractDataBase(){
	  
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			System.out.println("--------1/6 ");
		} catch (Exception e) {
			System.out.println("--------1/6 실패");
		} 
	}
 
	public Connection getConnection() throws SQLException {
	  
		String url="jdbc:oracle:thin:@localhost:1521:xe";
		String user="pc17";
		String passwd="java";
		Connection conn=DriverManager.getConnection(url,user,passwd);
		System.out.println("--------2/6 ");
		return conn;
	  
	 }//getConnection
 
	public void close(Connection conn, PreparedStatement psmt, ResultSet select) {
		if(select!=null){
			try {
				select.close();
			} catch (SQLException e) {}
		}
		
		if(psmt!=null){
			try {
				psmt.close();
			} catch (SQLException e) {}
		}
	
		if(conn!=null){
			try {
				conn.close();
	   
			} catch (SQLException e) {}
		}
	}//close

}