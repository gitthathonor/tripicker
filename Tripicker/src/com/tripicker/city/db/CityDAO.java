package com.tripicker.city.db;

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


public class CityDAO {
	
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
	
	public void insertCityInfo(CityDTO cdto) {
		ArrayList<CityDTO> cdtoArr = new ArrayList<>();
		try {
			// DB연결
			con = getCon();
			// sql 작성
			sql = "select * from city";
			// pstmt
			pstmt = con.prepareStatement(sql);
			// rs
			rs = pstmt.executeQuery();

			if (!rs.next()) {
				for (int i = 1; i < 10; i++) {
					String url = "https://travel.naver.com/domestic/0" + i + "/summary";

					Document doc;

					doc = Jsoup.connect(url).get();

					Elements cityName = doc.getElementsByClass("name-Xm7WQ");
					Elements cityEngName = doc.getElementsByClass("nameEn-33oNZ");
					Elements cityInfo = doc.getElementsByClass("text");
					// Elements cityImgUrl =
					// doc.getElementsByClass("figure-3ftWB");

					System.out.println(cityName.text());
					System.out.println(cityEngName.text());
					System.out.println(cityInfo.text());
					// System.out.println(cityImgUrl.text());

					cdto.setCityCode(i);
					cdto.setCityName(cityName.text());
					cdto.setCityEngName(cityEngName.text());
					cdto.setCityInfo(cityInfo.text());
					// cdto.setCityImgUrl(cityImgUrl.text());

					cdtoArr.add(cdto);

					sql = "insert into city(cityCode,cityName,cityEngName,cityInfo) values(?,?,?,?)";

					pstmt = con.prepareStatement(sql);

					pstmt.setInt(1, cdto.getCityCode());
					pstmt.setString(2, cdto.getCityName());
					pstmt.setString(3, cdto.getCityEngName());
					pstmt.setString(4, cdto.getCityInfo());

					pstmt.executeUpdate();
				}

				for (int i = 10; i < 18; i++) {
					String url = "https://travel.naver.com/domestic/" + i + "/summary";

					Document doc;

					doc = Jsoup.connect(url).get();

					Elements cityName = doc.getElementsByClass("name-Xm7WQ");
					Elements cityEngName = doc.getElementsByClass("nameEn-33oNZ");
					Elements cityInfo = doc.getElementsByClass("text");
					

					System.out.println(cityName.text());
					System.out.println(cityEngName.text());
					System.out.println(cityInfo.text());

					cdto.setCityCode(i);
					cdto.setCityName(cityName.text());
					cdto.setCityEngName(cityEngName.text());
					cdto.setCityInfo(cityInfo.text());
					

					cdtoArr.add(cdto);

					sql = "insert into city(cityCode,cityName,cityEngName,cityInfo) values(?,?,?,?)";

					pstmt = con.prepareStatement(sql);

					pstmt.setInt(1, cdto.getCityCode());
					pstmt.setString(2, cdto.getCityName());
					pstmt.setString(3, cdto.getCityEngName());
					pstmt.setString(4, cdto.getCityInfo());

					pstmt.executeUpdate();
				}

			}
			
			System.out.println("DAO : insertCityInfo() 성공!");

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("DAO : insertCityInfo() 오류!");
		} finally {
			closeDB();
		}
		
	} //insertCityInfo(); : 네이버 웹 크롤링 해서 DB에 정보 저장
	
	///// CityDTO 객체 가져오는 메서드/////
	public CityDTO getCity(int cityCode) {
		CityDTO cdto = new CityDTO();
		// DB연결
		try {
			con = getCon();
			// sql 구문작성
			sql = "select * from city where cityCode = ?";

			// pstmt
			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, cityCode);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				cdto.setCityCode(rs.getInt("cityCode"));
				cdto.setCityName(rs.getString("cityName"));
				cdto.setCityEngName(rs.getString("cityEngName"));
				cdto.setCityInfo(rs.getString("cityInfo"));
			}
			
			System.out.println("DAO : getCity() 성공!");

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("DAO : getCity()오류!");
		} finally {
			closeDB();
		}
		return cdto;
	}

}
