package com.tripicker.user.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

//회원정보 처리 DAO
public class UserDAO {
		
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
		
	//joinUser(UserDTO) - 회원가입처리
	public void joinUser(UserDTO user) {
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
	}//joinUser(UserDTO)
	
	
	//checkDupleId(id) - 아이디 중복체크
	public String checkDupleId(String id){
		// 아이디 중복여부 확인값 (ok:아이디 중복안됨)
		String result= "";
		System.out.println("DAO : 받아온 아이디값 - "+id);
		try {			
			con = getCon();		
			sql = "SELECT id FROM user WHERE id=?";	
			//sql = "SELECT COUNT(id) FROM user WHERE id=?";
			pstmt = con.prepareStatement(sql);			
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();			
			if(rs.next()) {//해당 아이디 존재
				System.out.println("D : idCheck() - 아이디중복");
				result= ""; 
			}else {//해당 아이디 없음
				result = "ok"; 
			}			
			return result;
			
		} catch (Exception sqle) {
			throw new RuntimeException(sqle.getMessage());
		} finally {
			closeDB();			
		}
	}//checkDupleId(id)
	
	//checkDupleNickname(nickname) - 닉네임 중복체크
	public String checkDupleNickname(String nickname) {
		String result = "";
		System.out.println("DAO : 받아온 아이디값 - "+nickname);
		
		try {
			con = getCon();
			sql = "SELECT nickname FROM user WHERE nickname=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, nickname);
			
			rs = pstmt.executeQuery();
			if(!rs.next()) {//해당 닉네임 없음
				result = "ok";
			}			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
		return result;
	}//checkDupleNickname(nickname)
	
	//checkDupleEmail(email) - 이메일 중복체크
	public String checkDupleEmail(String email) {
		String result = "";		
		
		try {			
			con = getCon();
			sql = "SELECT email FROM user WHERE email=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email);
			
			rs = pstmt.executeQuery();
			if(!rs.next()) {//해당 이메일 없음
				result = "ok";
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
						
		return result;
	}
	//checkDupleEmail(email)
	
	
	//loginCheck(id,pass) - 로그인
	public int loginCheck(String id, String pass) {				
		int result = -1;
		System.out.println(id+"/"+pass);
		try {
			con = getCon();
			sql = "SELECT pass, ('rank'), nickname FROM user WHERE id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);			
			rs = pstmt.executeQuery();
			
			System.out.println(" DAO - loginCheck 실행 ");			
			
			if(rs.next()) {//아이디 있음
				if(rs.getString("pass").equals(pass)) {//아이디, 비밀번호 확인
					result = 1;
				}else {//아이디 o, 비밀번호 x
					result = 0;
				}
			}else {//아이디 없음
				result = -1;
			}
		} catch (Exception e) {			
			e.printStackTrace();
		} finally {
			closeDB();
		}
				
		return result;
	}
	//loginCheck(id,pass)
	
	//getSessionInfo(rank) - 세션값 설정에 필요한 정보 조회(등급,닉네임,아이디)
	public UserDTO getSessionInfo(String id) {	
		UserDTO  udto = new UserDTO();
				
		try {
			con = getCon();
			sql = "SELECT `rank`,nickname FROM user WHERE id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			System.out.println("DAO : user 아이디 셋 완료");
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				udto.setId(id);
				udto.setRank(rs.getInt("rank"));
				udto.setNickname(rs.getString("nickname"));
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
		return udto;
	}	
	//getSessionInfo(rank) - 세션값 설정에 필요한 정보 조회(등급,닉네임,아이디)
	
	
	
	

}
