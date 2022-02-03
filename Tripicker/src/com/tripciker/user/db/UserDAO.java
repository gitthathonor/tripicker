package com.tripciker.user.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class UserDAO {
	
	// 회원정보 처리 DAO
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private String sql = "";
	
	// DB연결
	private Connection getCon() throws Exception {
		Context initCTX = new InitialContext();    
		DataSource ds = (DataSource)initCTX.lookup("java:comp/env/jdbc/team_project");
		con = ds.getConnection();
		System.out.println("DB연결");
		return con;
	}
	
	// DB자원 해제
	public void closeDB() {
		try {
			if(rs != null) {rs.close();}
			if(pstmt != null) {pstmt.close();}
			if(con != null) {con.close();}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	
	//insertUser(UserDTO) - 회원가입처리 메서드
	public void insertUser(UserDTO user) {
		try {
			con = getCon();
			sql = "INSERT INTO user(id,pass,name,nickname,age,gender,email,addr,reg_date) VALUES(?,?,?,?,?,?,?,?,now())";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, user.getId());
			pstmt.setString(2, user.getPass());
			pstmt.setString(3, user.getName());
			pstmt.setString(4, user.getNickname());
			pstmt.setInt(5, user.getAge());
			pstmt.setString(6, user.getGender());
			pstmt.setString(7, user.getEmail());
			pstmt.setString(8, user.getAddr());
						
			pstmt.executeUpdate();
			System.out.println("DAO : 회원가입 SQL문 완료");
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeDB();
		}
	}
	//insertUser(UserDTO) - 회원가입처리 메서드
	
	
	
	
	

}
