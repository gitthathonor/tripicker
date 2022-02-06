package com.tripicker.plan.db;

import java.sql.Connection;
import java.util.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class PlanDAO {

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
	
	
	public void insertDate(PlanDTO pdto) {
		try {
			con = getCon();
			sql = "insert into plan(planNum,id,startDate,lastDate,period,pCityName,pSpotName)"
					+ "values(?,?,?,?,?,?,?)";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, pdto.getPlanNum());
			pstmt.setString(2, pdto.getId());
			pstmt.setDate(3, pdto.getStartDate());
			pstmt.setDate(4, pdto.getLastDate());
			pstmt.setString(5, pdto.getPeriod());
			pstmt.setString(6, pdto.getpCityName());
			pstmt.setString(7, pdto.getpSpotName());
			
			pstmt.executeUpdate();
			
			System.out.println("DAO : 여행 일자 정보 성공!");
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("DAO : 여행 일자 정보 실패!");
		} finally {
			closeDB();
		}
	} //insertDate();
	
	
	
}
