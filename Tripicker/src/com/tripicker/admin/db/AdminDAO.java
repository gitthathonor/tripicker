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
	
	public ArrayList getMemberList(){
		ArrayList memberList = new ArrayList();
		try {
			con=getCon();
			sql= "select * from user where id != 'admin'";
			pstmt=con.prepareStatement(sql);
			
			rs=pstmt.executeQuery();
			
			while(rs.next()){
				AdminDTO adto = new AdminDTO();
				adto.setAddr(rs.getString("addr"));
				adto.setEmail(rs.getString("email"));
				adto.setId(rs.getString("id"));
				adto.setName(rs.getString("name"));
				adto.setNickname(rs.getString("nickname"));
				adto.setPass(rs.getString("pass"));
				adto.setRank(rs.getInt("rank"));
				adto.setReg_date(rs.getDate("reg_date"));
				
				memberList.add(adto);
			}
			System.out.println("AdminDAO : memberList출력");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return memberList;
	}//ArrayList getMemberList()
	
	
	public void rankUpdate(String rankID, int changeRank){
		
		try {
			con=getCon();
			sql="update user set rank=? where id=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, changeRank);
			pstmt.setString(2, rankID);
			pstmt.executeUpdate();
			System.out.println("AdminDAO : rank 변경완료");
		} catch (Exception e) {
			// TODO: handle exception
		}finally {
			closeDB();
		}
				
	}//rankUpdate(AdminDTO adto)
	
	
	
	
	
	
	
	public void AdminMemberDelete(String id){
		try {
			con=getCon();
			sql="delete from user where id=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.executeUpdate();
			System.out.println("AdminDAO : 회원 강제 탈퇴 완료");
		}catch (Exception e) {
			// TODO: handle exception 
		}finally {
			closeDB();
		}
	}//deleteMember(String id)
}
