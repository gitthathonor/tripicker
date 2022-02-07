package com.tripicker.mypage.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.tripicker.user.db.UserDTO;

public class MyPageDAO {
	
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private String sql = "";
	
	// DB연결
	private Connection getCon() throws Exception {
		Context initCTX = new InitialContext();    
		DataSource ds = (DataSource)initCTX.lookup("java:comp/env/jdbc/mysqldb");
		//DataSource ds = (DataSource)initCTX.lookup("java:comp/env/jdbc/mysqldb");

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
	
	//getUser(id)
		public MyPageDTO getUser(String id) {
			MyPageDTO dto = null;
			
			try {
				con=getCon();
				sql = "SELECT * FROM user WHERE id =?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, id);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					dto = new MyPageDTO();
					
					dto.setId(rs.getString("id"));
					dto.setPass(rs.getString("pass"));
					dto.setName(rs.getString("name"));
					dto.setNickname(rs.getString("nickname"));
					dto.setAge(rs.getInt("age"));
					dto.setGender(rs.getString("gender"));
					dto.setEmail(rs.getString("email"));
					dto.setAddr(rs.getString("addr"));
					
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				closeDB();
			}
			return dto;
		}
		//getUser(id)
	
}
