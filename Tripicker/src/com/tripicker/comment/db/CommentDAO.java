package com.tripicker.comment.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;



public class CommentDAO {
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private String sql = "";
	CommentDTO cdto = null;
	
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
		
		//댓글쓰기
		public void insertComment(CommentDTO cdto){	
			
			try{
				con = getCon();
//				sql = "insert into comment(commentNum ,boardNum , nickname ,content)" 
//							+ "values(?,?,?,?)";
				
				sql = "insert into comment(boardNum , nickname ,content)" 
							+ "values(?,?,?,?)";
				pstmt = con.prepareStatement(sql);  				
//				pstmt.setInt(1, cdto.getCommentNum());
				pstmt.setInt(2, cdto.getBoardNum());
				pstmt.setString(3, cdto.getNickname());
				pstmt.setString(4, cdto.getContent());
			
				pstmt.executeUpdate();
				System.out.println("DAO: insertComment 댓글 쓰기 완료");
				
			}catch(Exception e){
				e.printStackTrace();
			}finally {
				closeDB();
			}
		}
		
		//댓글 리스트 읽어오기
		public ArrayList<CommentDTO> commentList(Integer commentnum){
					
					
		ArrayList<CommentDTO> lists = new ArrayList<CommentDTO>();
			
					try{
						con = getCon();
						sql = "select * from comment where boardNum=?";
						pstmt = con.prepareStatement(sql);
						pstmt.setInt(1, commentnum);  //pstmt에서 댓글번호에 맞는 게시글 찾아온다음
						
						rs = pstmt.executeQuery(); // sql 실행값을 rs에 저장
						
						while(rs.next()){
							cdto = new CommentDTO();
							cdto.setCommentNum(rs.getInt("commentNum"));
							cdto.setBoardNum(rs.getInt("boardNum"));;
							cdto.setNickname(rs.getString("nickname"));;
							cdto.setContent(rs.getString("content"));
							cdto.setcReg_date(rs.getTimestamp("cReg_date"));

							lists.add(cdto);
						}
					}catch(Exception e){
						e.printStackTrace();
					}finally {
						closeDB();
					}
					return lists;
				}
		//댓글수정
		public int updateComment(CommentDTO cdto) {
			int result = -1;
			
			try {
				con = getCon();
				sql = "select commentNum from comment where nickname=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, cdto.getNickname());
				
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					if(cdto.getCommentNum()==rs.getInt("commentNum")) {
						sql = "update comment set content=? where nickname=?";
						pstmt = con.prepareStatement(sql);
						
						pstmt.setString(1, cdto.getContent());
						pstmt.setString(2, cdto.getNickname());
						
						result = pstmt.executeUpdate();
						
						System.out.println("댓글 수정 완료");
						// result = 1;
					}else {//��й�ȣ ����
						result = 0;
					}
					
				}else {
					result = -1;
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			
			return 0;
		}
		
		//댓글 삭제
		public int deleteComment(int commentnum,String nickname){
			int result = -1;
			
			try {
				con = getCon();
				sql = "select commentNum from comment where nickname=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, commentnum);

				rs = pstmt.executeQuery();

				if(rs.next()){
					if(cdto.getCommentNum()==rs.getInt("commentNum")){
						sql ="delete from comment where nickname=?";
						pstmt = con.prepareStatement(sql);
						
						pstmt.setInt(1, commentnum);
						result = pstmt.executeUpdate();		
					}else{
						result = 0;
					}
				}else{
					result = -1;
				}
				
				System.out.println(" DAO : 댓글 삭제 완료! "+result);
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				closeDB();
			}		
			
			return result;
		}
		
		//getComment
		public CommentDTO getComment(String nickname) {
			
			CommentDTO cdto = null;
			
			try {
				con = getCon();
				sql = "select * from comment where nickname=?";
				pstmt = con.prepareStatement(sql);
				
				pstmt.setString(1, nickname);
				rs = pstmt.executeQuery();

				if(rs.next()) {
					
					cdto = new CommentDTO();
					
					cdto.setCommentNum(rs.getInt("commentNum"));
					cdto.setBoardNum(rs.getInt("boardNum"));
					cdto.setContent(rs.getString("content"));
					cdto.setNickname(rs.getString("nickname"));
					cdto.setcReg_date(rs.getTimestamp("cReg_date"));
					
				}
				
				System.out.println("DB 댓글 조회: "+cdto);
				
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				closeDB();
			}
			
			return cdto;
		}
		
}
