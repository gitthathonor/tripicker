package com.tripicker.plan.action;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.json.simple.JSONObject;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.List;
import java.io.BufferedReader;
import java.io.IOException;

import com.tripicker.Action;
import com.tripicker.ActionForward;
import com.tripicker.plan.db.AreaDTO;
import com.tripicker.plan.db.PlanDAO;

public class spotSearch extends HttpServlet {

	private static String getTagValue(String tag, Element eElement) {
		Node nValue = null;
		try {
			NodeList nlList = eElement.getElementsByTagName(tag).item(0).getChildNodes();
			nValue = (Node) nlList.item(0);
			if (nValue == null)
				return null;
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("tag값이 없어요~");
		}
		return nValue.getNodeValue();
	} // getTagValue 메서드!!!!! tag를 지정해서, element 값들을 출력시킬 수 있다.

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("ajax : 지역기반 관광정보 요청");

		System.out.println("A : PlanSpotInsertAction_execute() 호출!");

		// 한글 인코딩
		request.setCharacterEncoding("UTF-8");

		// 서비스키
		String servicekey = "YF2x%2FO1BlpMsxJQE9EcsZinR9%2FtVU8Ho4qbE9OTsA3eU19TPByqfFMTzVq4oP8WQLesJOA4G13m7qRYpx9KqXQ%3D%3D";

		// 넘겨온 값들 받기
		String contentType = request.getParameter("contentType");
		String cat1 = request.getParameter("cat1");
		String cat2 = request.getParameter("cat2");
		String cat3 = request.getParameter("cat3");
		String areacode = request.getParameter("areacode");
		String sigungucode = request.getParameter("sigungucode");

		// URL 빌더로 요청할 주소 계산 및 데이터 받아오기
		StringBuilder urlBuilder = new StringBuilder(
				"http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList"); /* URL */
		urlBuilder.append("?" + URLEncoder.encode("serviceKey", "UTF-8") + "="
				+ servicekey); /* Service Key */
		urlBuilder.append("&" + URLEncoder.encode("pageNo", "UTF-8") + "="
				+ URLEncoder.encode("1", "UTF-8")); /* 현재 페이지 번호 */
		urlBuilder.append("&" + URLEncoder.encode("numOfRows", "UTF-8") + "="
				+ URLEncoder.encode("10", "UTF-8")); /* 한 페이지 결과 수 */
		urlBuilder.append("&" + URLEncoder.encode("MobileApp", "UTF-8") + "="
				+ URLEncoder.encode("AppTest", "UTF-8")); /* 서비스명=어플명 */
		urlBuilder.append("&" + URLEncoder.encode("MobileOS", "UTF-8") + "=" + URLEncoder.encode("ETC",
				"UTF-8")); /* IOS (아이폰), AND (안드로이드),WIN (원도우폰), ETC */
		urlBuilder.append("&" + URLEncoder.encode("arrange", "UTF-8") + "=" + URLEncoder.encode("A",
				"UTF-8")); /*
							 * (A=제목순, B=조회순, C=수정일순, D=생성일순) , 대표이미지가 반드시 있는 정렬
							 * (O=제목순, P=조회순, Q=수정일순, R=생성일순)
							 */
		urlBuilder.append("&" + URLEncoder.encode("cat1", "UTF-8") + "="
				+ URLEncoder.encode(cat1, "UTF-8")); /* 대분류 코드 */
		urlBuilder.append("&" + URLEncoder.encode("contentTypeId", "UTF-8") + "=" + URLEncoder.encode(contentType,
				"UTF-8")); /* 관광타입(관광지, 숙박 등) ID */
		urlBuilder.append(
				"&" + URLEncoder.encode("areaCode", "UTF-8") + "=" + URLEncoder.encode(areacode, "UTF-8")); /* 지역코드 */
		urlBuilder.append("&" + URLEncoder.encode("sigunguCode", "UTF-8") + "=" + URLEncoder.encode(sigungucode,
				"UTF-8")); /* 시군구코드(areaCode 필수) */
		urlBuilder.append("&" + URLEncoder.encode("cat2", "UTF-8") + "="
				+ URLEncoder.encode(cat2, "UTF-8")); /* 중분류 코드(cat1필수) */
		urlBuilder.append("&" + URLEncoder.encode("cat3", "UTF-8") + "="
				+ URLEncoder.encode(cat3, "UTF-8")); /* 소분류 코드(cat1,cat2필수) */
		urlBuilder.append("&" + URLEncoder.encode("listYN", "UTF-8") + "="
				+ URLEncoder.encode("Y", "UTF-8")); /* 목록 구분 (Y=목록, N=개수) */
		urlBuilder.append("&" + URLEncoder.encode("modifiedtime", "UTF-8") + "="
				+ URLEncoder.encode("", "UTF-8")); /* 콘텐츠 수정일 */
		URL url = new URL(urlBuilder.toString());
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		conn.setRequestProperty("Content-type", "application/json");
		System.out.println("Response code: " + conn.getResponseCode());
		BufferedReader rd;
		if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
			rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		} else {
			rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
		}
		StringBuilder sb = new StringBuilder();
		String line;
		while ((line = rd.readLine()) != null) {
			sb.append(line);
		}
		rd.close();
		conn.disconnect();
		System.out.println(sb.toString());

		// xml 데이터 parsing

		// 1. parsing할 주소를 설정!(serviceKey까지 같이 설정)
		String path = url.toString();

		NodeList items = null;

		// 2. 페이지에 접근해줄 Document 객체 생성

		try {
			DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
			DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
			Document doc = dBuilder.parse(path);

			// root tag
			doc.getDocumentElement().normalize();
			System.out.println("Root element : " + doc.getDocumentElement().getNodeName()); // Root
																							// element
																							// :
																							// response

			// 3. parsing할 정보가 있는 tag에 접근
			items = doc.getElementsByTagName("item");
			System.out.println("파싱할 리스트 수 : " + items.getLength());// 파싱할 리스트 수

			// 4. list에 담긴 데이터 console에 출력

		} catch (Exception e) {
			e.printStackTrace();
		}

		// AreaDTO에 넣을 컬럼값
		String areaname = "";
		String contentid = "";

		PlanDAO pdao = new PlanDAO();
		pdao.deleteAreaInfo();

		for (int i = 0; i < items.getLength(); i++) {
			Node nNode = items.item(i);
			if (nNode.getNodeType() == Node.ELEMENT_NODE) {

				Element eElement = (Element) nNode;
				AreaDTO adto = new AreaDTO();

				System.out.println("도시 코드 : " + getTagValue("areacode", eElement));
				System.out.println("시군구 코드 : " + getTagValue("sigungucode", eElement));
				System.out.println("대분류 : " + getTagValue("cat1", eElement));
				System.out.println("중분류 : " + getTagValue("cat2", eElement));
				System.out.println("소분류 : " + getTagValue("cat3", eElement));
				System.out.println("이름 : " + getTagValue("title", eElement));
				System.out.println("컨텐츠 ID : " + getTagValue("contentid", eElement));
				System.out.println("관광타입 : " + getTagValue("contenttypeid", eElement));

				// element값들 변수로 설정
				areacode = getTagValue("areacode", eElement);
				sigungucode = getTagValue("sigungucode", eElement);
				cat1 = getTagValue("cat1", eElement);
				cat2 = getTagValue("cat2", eElement);
				cat3 = getTagValue("cat3", eElement);
				areaname = getTagValue("title", eElement);
				contentid = getTagValue("contentid", eElement);
				contentType = getTagValue("contenttypeid", eElement);

				adto.setAreacode(areacode);
				adto.setSigungucode(sigungucode);
				adto.setCat1(cat1);
				adto.setCat2(cat2);
				adto.setCat3(cat3);
				adto.setAreaname(areaname);
				adto.setContentID(contentid);
				adto.setContentType(contentType);

				pdao.insertAreaInfo(adto);

			}
		}

		List<AreaDTO> areaList = pdao.getAreaList();

		JSONObject jobj = new JSONObject();
		jobj.get(areaList);
		
		
		response.setContentType("application/x-json; charset=utf-8");
		request.setAttribute("areaList", areaList);

	} // doGet()

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doPost(req, resp);
	}

}
