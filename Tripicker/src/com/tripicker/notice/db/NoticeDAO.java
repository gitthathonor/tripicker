package com.tripicker.notice.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.tripicker.user.db.UserDTO;


public class NoticeDAO {
	// 공통으로 사용하는 변수

		// Connection con; 객체 X
		Connection con = null; // 객체 O - null
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
	

		// 공통으로 사용하는 디비연결동작
		private Connection getCon() {
			try {
				Context initCTX = new InitialContext();
				DataSource ds = (DataSource) initCTX.lookup("java:comp/env/jdbc/mysqldb");
				con = ds.getConnection();
			} catch (Exception e) {
				e.printStackTrace();
			}
			return con;
		} // getCon()
		

		// " 디비 자원해제 동작
		public void closeDB() {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (con != null)
					con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		//글쓰기
		public int insertNotice(NoticeDTO ndto){
			int result = 0;
			int nNum = 0;

			try {
				getCon(); // con 인스턴스 변수에 저장완료
				// 글번호 계산
				sql = "select max(nNum) from notice";
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
				if(rs.next()){
					nNum = rs.getInt(1)+1; //인덱스 사용 호출
					//rs.getInt("max(bno)"); // 컬럼명 사용 호출
				}
				System.out.println("DAO : 글번호 "+nNum);
				sql ="insert into notice(nNum, nTitle, nContent,"
						+ "nReadCount,re_ref,re_lev,re_seq,file, nReg_date) "
						+ "values(?,?,?,"
						+ "?,?,?,?,?, now())";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, nNum);
				pstmt.setString(2, ndto.getnTitle());
				pstmt.setString(3, ndto.getnContent());
				pstmt.setInt(4, 0); //조회수 0 
				pstmt.setInt(5, nNum); // 일반글 == re_ref
				pstmt.setInt(6, 0); // 일반글 lev = 0
				pstmt.setInt(7, 0); // 일반글 seq = 0
				pstmt.setString(8, ndto.getFile());
				// 실행			
				result = pstmt.executeUpdate();
				System.out.println("DAO : 글쓰기 완료! ");
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				closeDB();
			}
			return result;
		}//end of insertNotice


		
		// getNoticeCount()
		//게시글카운트
		public int getNoticeCount(){
			int cnt = 0;
			try{
				getCon();
				sql="select count(*) from notice";
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
				if(rs.next()){
					cnt = rs.getInt(1);
				}
				System.out.println("DAO: DB에 저장된 글의 수 "+cnt);
			} catch(Exception e) {
				e.printStackTrace();
			} finally{
				closeDB();
			}
			return cnt;
		}
		
		
		//게시글불러오기
		public List<NoticeDTO> getNoticeList() {
			//List<BoardDTO> boardList = new List<>(); 안됨 따라서 class로 업캐스팅해줘야함
			List<NoticeDTO> noticeList = new ArrayList<NoticeDTO>(); //업캐스팅
			try{
				getCon();
				sql="select * from notice";
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while(rs.next()){
					NoticeDTO ndto = new NoticeDTO();
					ndto.setnContent(rs.getString("nContent"));
					ndto.setnReg_date(rs.getDate("nReg_date"));
					ndto.setFile(rs.getString("file"));
					ndto.setnNum(rs.getInt("nNum"));
					ndto.setRe_lev(rs.getInt("re_lev"));
					ndto.setRe_ref(rs.getInt("re_ref"));
					ndto.setRe_seq(rs.getInt("re_seq"));
					ndto.setnReadCount(rs.getInt("nReadCount"));
					ndto.setnTitle(rs.getString("nTitle"));

					noticeList.add(ndto);
				}
				System.out.println("DAO: 게시글불러오기");
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				closeDB();
			}
			return noticeList;
		}//end of getNoticeList
		
		
	
		// getNoticeList(startRow,pageSize)
		public List getNoticeList(int startRow,int pageSize){
			List noticeList = new ArrayList();
//			List<Object> boardList = new ArrayList<Object>();
			
			try {
				// 1,2 디비연결
				con = getCon();
				// 3 sql 작성 & pstmt 객체 생성
				// 글 re_ref 최신글 위쪽(내림차순), re_seq (오름차순)
				// DB데이터를 원하는만큼씩 짤라내기 : limit 시작행-1,페이지크기 
				sql = "select * from notice order by re_ref desc, re_seq asc limit ?,?";
				pstmt = con.prepareStatement(sql);
				
				//?
				pstmt.setInt(1, startRow-1); // 시작행-1  (시작 ROW인덱스 번호)
				pstmt.setInt(2, pageSize); // 페이지크기  (한번에 출력되는 수)
				
				// 4 sql 실행
				rs = pstmt.executeQuery();
				// 5 데이터처리 (글 1개의 정보 -> DTO 1개 -> ArrayList 1칸)
				while(rs.next()){
					//데이터 있을때 마다 글 1개의 정보를 저장하는 객체 생성
					NoticeDTO ndto = new NoticeDTO();
					ndto.setnContent(rs.getString("nContent"));
					ndto.setnReg_date(rs.getDate("nReg_date"));
					ndto.setFile(rs.getString("file"));
					ndto.setnNum(rs.getInt("nNum"));
					ndto.setRe_lev(rs.getInt("re_lev"));
					ndto.setRe_ref(rs.getInt("re_ref"));
					ndto.setRe_seq(rs.getInt("re_seq"));
					ndto.setnReadCount(rs.getInt("nReadCount"));
					ndto.setnTitle(rs.getString("nTitle"));
					
					// DTO 객체를 ArrayList 한칸에 저장
					noticeList.add(ndto);				
					
				}//while
				
				System.out.println(" DAO : 글 정보 저장완료! "+noticeList.size());
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				closeDB();
			}
			
			return noticeList;
		}
		// getBoardList(startRow,pageSize)
		
		// updateReadcount 특정글만 조회수 1 증가
		public void updateReadcount(int nNum){
			try {
				//1.2. 디비연결
				con = getCon();
				// 3. sql 구문 & pstmt 객체
				// 조회수(readcount)를 기존값에서 1증가(update)
				sql = "update notice set nReadCount = nReadCount+1 where nNum=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, nNum);
				pstmt.executeUpdate();
				
				System.out.println("DAO : 조회수 1증가");
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				closeDB();
			}
			
		}
		// updateReadcount
		
		// getBoard 글 내용보기
		public NoticeDTO getNotice(int nNum){
			NoticeDTO ndto = null;
			
			try {
				// 1.2. 디비연결
				con = getCon();
				// 3. sql 작성(select) & pstmt 객체 생성
				// num에 해당하는 글정보를 가져오기
				sql = "select * from notice where nNum=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, nNum);
				
				// 4. sql 실행
				rs = pstmt.executeQuery();
				
				// 5. 데이터처리
				if(rs.next()){
					ndto = new NoticeDTO();
					ndto.setnContent(rs.getString("nContent"));
					ndto.setnReg_date(rs.getDate("nReg_date"));
					ndto.setFile(rs.getString("file"));
					ndto.setnNum(rs.getInt("nNum"));
					ndto.setRe_lev(rs.getInt("re_lev"));
					ndto.setRe_ref(rs.getInt("re_ref"));
					ndto.setRe_seq(rs.getInt("re_seq"));
					ndto.setnReadCount(rs.getInt("nReadCount"));
					ndto.setnTitle(rs.getString("nTitle"));
					
				}
				
				System.out.println(" DAO : 글정보 저장완료!");			
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				closeDB();
			}
			
			return ndto;
		}
		// getBoard(num)
		
		
		// updateBoard(ndto)
		public int updateNotice(NoticeDTO ndto){
			int result = -1;
			UserDTO udto = new UserDTO();
			
			try {
				//1.2. 디비연결
				con = getCon();
				//3. sql 구문 & pstmt 객체
				sql = "select pass from notice where nNum=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, ndto.getnNum());
				
				// 4. sql 실행
				rs = pstmt.executeQuery();
				
				// 5. 데이터 처리
				if(rs.next()){
					if(udto.getPass().equals(rs.getString("pass"))){
						// 게시판 글 있음 -> 수정
						// 3. sql 생성 & pstmt 객체 생성
						sql = "update notice set nTitle=?,nContent=? "
								+ "where nNum=?";
						pstmt = con.prepareStatement(sql);
						pstmt.setString(1, ndto.getnTitle());
						pstmt.setString(2, ndto.getnContent());
						pstmt.setInt(3, ndto.getnNum());
						
						// 4. sql 실행
						result = pstmt.executeUpdate();
						
					}else{
						// 게시판 글 비밀번호 오류
						result = 0;
					}				
				}else{
					// 게시판 글없음
					result = -1;
				}
				
				System.out.println(" DAO : 글 수정완료 "+result);
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				closeDB();
			}

			return result;
		}
		// updateBoard(ndto)
		
		
		
		
		//deleteBoard(num,pass)
		public int deleteNotice(int nNum,String pass){
			int result = -1;
			
			try {
				// 1.2. 디비연결
				con = getCon();
				// 3. sql 작성 & pstmt 객체 생성
				sql = "select pass from notice where nNum=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, nNum);
				
				// 4. sql 실행
				rs = pstmt.executeQuery();
				
				// 5. 데이터 처리
				if(rs.next()){
					if(pass.equals(rs.getString("pass"))){
						// 3. sql
						sql ="delete from notice where nNum=?";
						pstmt = con.prepareStatement(sql);
						
						pstmt.setInt(1, nNum);
						// 4. sql 실행
						result = pstmt.executeUpdate();		
					}else{
						result = 0;
					}
				}else{
					result = -1;
				}
				
				System.out.println(" DAO : 게시판 글 삭제 완료! "+result);
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				closeDB();
			}		
			
			return result;
		}
		// deleteBoard(num,pass)
		
		
		
		
		

	}//DAO
