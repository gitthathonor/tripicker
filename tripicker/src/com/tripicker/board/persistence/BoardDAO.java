package com.tripicker.board.persistence;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.tripicker.board.model.BoardVO;

public class BoardDAO {

	// 1. 스스로 객체를 1개 생성합니다.
		private static BoardDAO instance = new BoardDAO();
		
		// 2. 외부에서 생성자를 호출할 수 없도록 생성자에 private제한을 붙임
		private BoardDAO() {
			try {
//				Class.forName("oracle.jdbc.driver.OracleDriver");
				
				// 커넥션풀을 얻는 방법
				InitialContext ctx = new InitialContext();
				ds = (DataSource)ctx.lookup("java:comp/env/jdbc/oracle");
				
			} catch(Exception e) {
				System.out.println("드라이버 호출 에러!");
			}
			
		}
		
		// 3. 외부에서 객체생성을 요구하면 getter메서드를 이용해서 1번의 객체를 반환
		public static BoardDAO getInstance() {
			return instance;
		}
		
		////////////////////////////////////////////////////
		// 멤버변수
		private DataSource ds; // 데이터베이스 연결풀을 저장해놓는 객체
		
		private Connection conn = null;
		private PreparedStatement pstmt = null;
		private ResultSet rs = null;
		
		// " 디비 자원해제 동작
		public void closeDB() {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	
		// 글등록 메서드
		public void regist(String writer, String title, String content) {

			// insert...
			String sql = "insert into board(bno, writer, title, content) values(board_seq.nextval, ?, ?, ?)";
			
			try {
				conn = ds.getConnection();
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, writer);
				pstmt.setString(2, title);
				pstmt.setString(3, content);
				
				pstmt.executeUpdate(); // 등록후에 끝.
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				closeDB();
			}
		}

		// 글목록 조회
		public List<BoardVO> getList(){
			
			List<BoardVO> list = new ArrayList<>();
			
			String sql = "select * from board order by bno desc";
			
			try {
				conn = ds.getConnection(); // 연결
				
				pstmt = conn.prepareStatement(sql); // sql준비
				
				rs = pstmt.executeQuery(); // sql문 실행
				
				while(rs.next()) {
					// 한바퀴 회전당 VO를 하나씩 생성
					BoardVO vo = new BoardVO();
					
					vo.setBno(rs.getInt("bno"));
					vo.setWriter(rs.getString("writer"));
					vo.setTitle(rs.getString("title"));
					vo.setContent(rs.getString("content"));
					vo.setRegdate(rs.getTimestamp("regdate")); // 날짜형은 Timestamp() or Date()
					vo.setHit(rs.getInt("hit"));
					
					list.add(vo);
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				closeDB();;
			}
			
			return list;
		}

		// 글 상세정보 메서드
		public BoardVO getContent(String bno) {
			BoardVO vo = null;
			
			String sql = "select * from board where bno = ?";
			
			try {
				conn = ds.getConnection();
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, bno);
				
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					String writer = rs.getString("writer");
					String title = rs.getString("title");
					String content = rs.getString("content");
					Timestamp regdate = rs.getTimestamp("regdate");
					int hit = rs.getInt("hit");
					
					
				}
				
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				closeDB();;
			}
			
			return vo;
		}

		// 글 수정하는 메서드
		public void update(String bno, String title, String content) {
			
			String sql ="update board set title = ?, content = ?, regdate = sysdate where bno = ?";
			
			try {
				conn = ds.getConnection();
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, title);
				pstmt.setString(2, content);
				pstmt.setString(3, bno);
				
				pstmt.executeUpdate();
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				closeDB();;
			}
			
		}
		
		// 글 삭제하는 메서드
		public void delete(String bno) {
			
			String sql="delete from board where bno = ?";
			
			try {
				conn = ds.getConnection();
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, bno);
				
				pstmt.executeUpdate(); // sql문 실행
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				closeDB();;
			}
			
		}

		// 조회수 증가 메서드
		public void upHit(String bno) {
			
			String sql ="update board set hit = hit + 1 where bno = ?";
			
			try {
				conn = ds.getConnection();
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, bno);
				
				pstmt.executeUpdate();
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				closeDB();;
			}
		}
}

