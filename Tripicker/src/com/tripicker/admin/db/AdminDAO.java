package com.tripicker.admin.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;

import com.tripicker.city.db.CityDTO;


public class AdminDAO {
	
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private String sql = "";

	private Connection getCon() throws Exception{
		
			Context initCTX = new InitialContext();
			DataSource ds = (DataSource) initCTX.lookup("java:comp/env/jdbc/mysqldb");
			con = ds.getConnection();			
		return con;
	} // getCon()

	public void closeDB() {
		try {
			if (rs != null) {
				rs.close();
			}
			if (pstmt != null) {
				pstmt.close();
			}
			if (con != null) {
				con.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	} // closeDB()
	
	public ArrayList getMemberList(int startRow,int PageSize){
		ArrayList memberList = new ArrayList();
		try {
			con=getCon();
			
			sql= "select * from user where id!='admin' order by reg_date desc limit ?,?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, startRow-1);
			pstmt.setInt(2, PageSize);
			
			rs=pstmt.executeQuery();
			
			while(rs.next()){
				AdminDTO adto = new AdminDTO();
				adto.setAddr(rs.getString("addr"));
				adto.setEmail(rs.getString("email"));
				adto.setId(rs.getString("id"));
				adto.setName(rs.getString("name"));
				adto.setNickname(rs.getString("nickname"));
				adto.setPass(rs.getString("pass"));
				adto.setGrade(rs.getInt("grade"));
				adto.setReg_date(rs.getDate("reg_date"));
				
				System.out.println("회원리스트:"+adto.toString());
				memberList.add(adto);
			}
			System.out.println("AdminDAO : memberList출력(reg_date asc순)");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return memberList;
	}//ArrayList getMemberList()
	
	
	public int memberListCount(){
		int cnt=0;
		try {
			con=getCon();			
			sql="select count(*) from user";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()){
				cnt=rs.getInt(1);
				System.out.println("AdminDAO : memberListCount "+cnt);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			closeDB();
		}
		return cnt;
	}//memberListCount()
	
	public void rankUpdate(String gradeID, int grade){
		try {
			System.out.println(grade +"," +gradeID);
			con=getCon();
			sql="update user set grade=? where id=?";
			
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, grade);
			pstmt.setString(2, gradeID);
			int result = pstmt.executeUpdate();
			
			System.out.println("result : "+result);
			System.out.println(grade +"," +gradeID);
			System.out.println("AdminDAO : rank 변경완료");
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeDB();
		}
				
	}//rankUpdate(String rankID, int rank)
	
	
	
	
	
	
	
	public void AdminMemberDelete(String id){
		try {
			con=getCon();
			sql="delete from user where id=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.executeUpdate();
			System.out.println("AdminDAO : 회원 강제 탈퇴 완료");
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeDB();
		}
	}//deleteMember(String id)
}
