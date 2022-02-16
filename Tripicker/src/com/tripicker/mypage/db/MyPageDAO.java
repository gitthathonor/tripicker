package com.tripicker.mypage.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MyPageDAO {
	
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private String sql = "";
	
	// DB연결
	private Connection getCon() throws Exception {
		Context initCTX = new InitialContext();    
		DataSource ds = (DataSource)initCTX.lookup("java:comp/env/jdbc/mysqldb");
		
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
				sql = "SELECT * FROM user WHERE id=?";
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
					dto.setRank(rs.getInt("rank"));
					dto.setReg_date(rs.getDate("reg_date"));
					
				}
				System.out.println("SQL 구문 실행완료");
				System.out.println("회원정보: "+ dto);
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				closeDB();
			}
			return dto;
		}
		//getUser(id)
		
		
		//updateInfo
		public int updateInfo(MyPageDTO dto) {
			int result = 1;
			try {
				con=getCon();
				sql = "select pass from user where id =?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, dto.getId());
				rs = pstmt.executeQuery();
				
				if (rs.next()) {
					if (dto.getPass().equals(rs.getString("pass"))) {	// 비밀번호 맞는지 확인
						sql = "update user set name =?, nickname =?, age =?, gender =?, email =?, addr =? where id =?";
						pstmt = con.prepareStatement(sql);
						pstmt.setString(1, dto.getName());
						pstmt.setString(2, dto.getNickname());
						pstmt.setInt(3, dto.getAge());
						pstmt.setString(4, dto.getGender());
						pstmt.setString(5, dto.getEmail());
						pstmt.setString(6, dto.getAddr());
						pstmt.setString(7, dto.getId());
						
						result = pstmt.executeUpdate();
						System.out.println("회원정보 수정 완료");
					} else {	// 비번오류
						result = 0;
					}
				} else {	// 데이터 x
					result = -1;
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				closeDB();
			}
			
			
			return result;
		}
		//updateInfo
		
		
		//deleteInfo
		public int deleteInfo(MyPageDTO dto) {
			int result = 1;
			try {
				con = getCon();
				sql = "select pass from user where id =?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, dto.getId());
				rs = pstmt.executeQuery();
				if (rs.next()) {
					if (dto.getPass().equals(rs.getString("pass"))) {
						sql = "delete from user where id=?"; // 게시글도 지우려면 연결을 board로? 
						pstmt = con.prepareStatement(sql);
						pstmt.setString(1, dto.getId());
						result = pstmt.executeUpdate();
						System.out.println("회원삭제 완료");
					} else {	//비번오류
						result = 0;
					}
				} else {	//데이터x
					result = -1;
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				closeDB();
			}
			
			return result;
		}

		
		
		
		
		
	
}
