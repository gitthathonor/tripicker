package com.tripicker.plan.db;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

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
	
	// id별 계획 넘버(planSeqNum)
	
	
	
	public void insertDate(PlanDTO pdto, String id) {
		int planSeqNum = 0;
		try {
			con = getCon();
			
			sql = "select max(planSeqNum) from plan where id = ?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				planSeqNum = rs.getInt(1)+1;
			}
			
			System.out.println("DAO : 본인 계획 번호" + planSeqNum);
			
			sql = "insert into plan(planNum,id,startDate,lastDate,period,pCityName,pSpotName,planSeqNum)"
					+ "values(?,?,?,?,?,?,?,?)";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, pdto.getPlanNum());
			pstmt.setString(2, pdto.getId());
			pstmt.setDate(3, pdto.getStartDate());
			pstmt.setDate(4, pdto.getLastDate());
			pstmt.setString(5, pdto.getPeriod());
			pstmt.setString(6, pdto.getpCityName());
			pstmt.setString(7, pdto.getpSpotName());
			pstmt.setInt(8, planSeqNum);
			
			pstmt.executeUpdate();
			
			System.out.println("DAO : 여행 일자 정보 성공!");
			
			sql = "set @count=0;";
			pstmt = con.prepareStatement(sql);
			pstmt.executeUpdate();
			
			sql = "UPDATE plan SET planNum=@count:=@count+1;";
			pstmt = con.prepareStatement(sql);
			pstmt.executeUpdate();
			
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("DAO : 여행 일자 정보 실패!");
		} finally {
			closeDB();
		}
	} //insertDate();
	
	
	
	public void insertAreaInfo(AreaDTO adto) {
		try {
			con = getCon();
			sql = "insert into area(areacode,sigungucode,cat1,cat2,cat3,areaname,contentID,contentType)"
					+ "values(?,?,?,?,?,?,?,?)";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, adto.getAreacode());
			pstmt.setString(2, adto.getSigungucode());
			pstmt.setString(3, adto.getCat1());
			pstmt.setString(4, adto.getCat2());
			pstmt.setString(5, adto.getCat3());
			pstmt.setString(6, adto.getAreaname());
			pstmt.setString(7, adto.getContentID());
			pstmt.setString(8, adto.getContentType());
			
			// pstmt 실행
			pstmt.executeUpdate();
			
			System.out.println("DAO : area정보들 DB 저장 성공!");
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("DAO : area정보들 저장 실패!");
		} finally {
			closeDB();
		}
		
	} //area DB에 검색된 도시 정보들 저장
	
	
	public void deleteAreaInfo() {
		try {
			con = getCon();
			sql = "select * from area";
			
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				sql = "delete from area";
				pstmt = con.prepareStatement(sql);
				
				pstmt.executeUpdate();
			}
			
			System.out.println("DAO : area정보들 삭제!");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("DAO : area정보들 삭제 실패!");
		} finally {
			closeDB();
		}
	} //area DB 정보 삭제
	
	
	
	public List<AreaDTO> getAreaList() {
		List<AreaDTO> areaList = new ArrayList<>();
		
		try {
			con = getCon();
			sql = "select * from area";
			
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				AreaDTO adto = new AreaDTO();
				adto.setContentID(rs.getString("contentID"));
				adto.setAreaname(rs.getString("areaname"));
				
				areaList.add(adto);
			}
			
			
		} catch(Exception e) {
			e.printStackTrace();
			
		} finally {
			closeDB();
		}
		
		return areaList;
	} //getAreaList(); => 도시 검색 후 출력
	
	
	
	public int deletePlan() {
		int result = 0;
		
		return result;
	}
	
	public int updatePlan() {
		int result = 0;
		
		return result;
	}
	
}
