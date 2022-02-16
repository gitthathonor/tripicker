package com.tripicker.board.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;

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
			pstmt.setString(5, bdto.getBoardFile());
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
	
	
	
	//boardList() - 페이징 처리
	public ArrayList<BoardDTO> boardList(int requestPage, int numOfTuplePerPage) {
		
		ArrayList<BoardDTO> dtos = new ArrayList<BoardDTO>();
		// LIMIT {OFFSET}, {LIMIT} -> 쿼리결과중 offset번째부터 limit개의 열 출력
		sql = "SELECT boardNum, boardTitle, nickname, boardFile, readCount, likeCount "
				+ "FROM board ORDER BY boardNum DESC LIMIT ?, ?";
		// page는 1부터 시작하지만, offset은 0부터 시작(0~9(10개), 10~19(10개)와같이 offset을 설정해)
		int offset = requestPage - 1;

		try {
			con = getCon();
			pstmt = con.prepareStatement(sql);
			// 0을 나누면 에러가 발생하므로 예외처리
			if (offset == 0) {
				pstmt.setInt(1, offset);
			} else {
				pstmt.setInt(1, offset * numOfTuplePerPage);
			}
			pstmt.setInt(2, numOfTuplePerPage);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				int boardNum = rs.getInt("boardNum");
				String boardTitle = rs.getString("boardTitle");
				String nickname = rs.getString("nickname");
				String boardFile = rs.getString("boardFile");
				int readCount = rs.getInt("readCount");
				int likeCount = rs.getInt("likeCount");

				BoardDTO dto = new BoardDTO(boardNum, boardTitle, nickname, boardFile, readCount, likeCount);
				dtos.add(dto);				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
		return dtos;
	}	
	//boardList()
	
		
	
	//countTuple() - boardMain 에서 조회시 가져와야할 열의 총 갯수를 리턴
	public int countTuple() {
		int count = 0;
		
		try {
			con = getCon();
			sql = "SELECT COUNT(*) FROM board";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				count = rs.getInt(1);
				System.out.println("list-count success");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
		return count;
	}
	//countTuple()
	
	
	
	//BoardDTO selContent() - 게시글 상세보기	
	public BoardDTO selContent(int contentNo) {
		BoardDTO bodto = null;
		System.out.println("글번호:"+contentNo);
		try {
			con = getCon();
			sql = "SELECT * FROM board WHERE boardNum = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, contentNo);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				int boardNum = rs.getInt("boardNum");
				String boardPass = rs.getString("boardPass");
				String nickname = rs.getString("nickname");
				String boardTitle = rs.getString("boardTitle");
				String boardContent = rs.getString("boardContent");
				//String boardContent = "헬로";
				String boardFile = rs.getString("boardFile");
				String tag = rs.getString("tag");
				
				bodto = new BoardDTO(boardNum, boardPass, nickname, boardTitle, boardContent, boardFile, tag);
				System.out.println("불러온 게시글 : "+ bodto);
			}		
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}		
		
		return bodto;
	}
	//BoardDTO selContent()
	
	
	public boolean delBoard(int no) {
		boolean result = false;
		
		try {
			con = getCon();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	
	
	

}
