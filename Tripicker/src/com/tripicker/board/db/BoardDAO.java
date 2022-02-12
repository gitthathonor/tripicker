package com.tripicker.board.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BoardDAO {
	
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private String sql = "";
	private ResultSet rs = null;
	
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
	
	
	//insertBoard(bdto)
	public BoardDTO insertBoard(BoardDTO bdto) {
		
		try {
			con = getCon();
			sql = "INSERT INTO board( boardPass, nickname, boardTitle, boardContent, "
					+ "boardFile, tag, likeCount, readCount, bReg_date) "
					+ "VALUES(?,?,?,?,?,?,?,?,now())";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bdto.getBoardPass());
			pstmt.setString(2, bdto.getNickname());
			pstmt.setString(3, bdto.getBoardTitle());
			pstmt.setString(4, bdto.getBoardContent());
			pstmt.setString(5, bdto.getBoadFile());
			pstmt.setString(6, bdto.getTag());
			pstmt.setInt(7, 0);
			pstmt.setInt(8, 0);
			
			pstmt.executeUpdate();
			System.out.println("DAO : insertBoard 게시글 저장 완료");
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
		return bdto;
	}
	//insertBoard(bdto)
	
	
	
	
	
	
	
	

}
