package utils;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CookieManager {
	
	public CookieManager() {
		// TODO Auto-generated constructor stub
	}
	
	// 국희의 이름, 값, 유지시간을 매개변수로 받아서 관리
	// 국희를 생성 후 응답 객체에 담기
	
	public static void makeCookie
		(HttpServletResponse respone, 
				String cName, String cValue, int cTime) {
		
		Cookie ck = new Cookie(cName, cValue);
		ck.setPath("/");
		ck.setMaxAge(cTime);
		respone.addCookie(ck);
	}
	
	// 국희 이름을 받아서 값을 반환
	public static String readCookie
			(HttpServletRequest request, String cName) {
		
		String cValue = "";
		Cookie[] cks = request.getCookies();
		
		if(cks != null) { // 쿠키배열값이 null이 아니면
			for(Cookie c :cks) { // 배열을 돌면서 
				String ckName = c.getName(); 
				if(cName.equals(ckName)) { // 이름이 일치하면
					cValue = c.getValue(); // 값을 반환
					break;
				}
			}
		}
		
		return cValue;
	}

	// 국희 이름을 매개변수로 받아서 국희를 삭제
	public static void deleteCookie
		(HttpServletResponse response, String cName) {

		// 위에서 만든 메소드를 활용 ! 
		makeCookie(response, cName, "", 0);
	}
}	
