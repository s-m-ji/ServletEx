package el;

import java.util.List;

public class MyELClass {

	public MyELClass() {
		
	}
	
	// 주민번호를 입력 받아 성별을 반환하는 메소드
	public static String getGender(String str) {
		String res = "";
		try {
			int startIdx = str.indexOf("-") + 1 ;
			int endIdx = startIdx + 1 ;
			String gender = str.substring(startIdx, endIdx);
			if(gender.equals("1") || gender.equals("3")) {
				res = "男";
			} else if(gender.equals("2") || gender.equals("4")) {
				res = "女";
			} else {
				// 예외를 발생시켜주는 코드 : 여기서 throw한 예외는 아래에서 catch에서 처리함
				throw new Exception();
			}
			
		} catch (Exception e) {
			res = "주민 번호 확인!";
		}
		return res;
	}
	
	// 입력받은 문자열이 숫자인지 판별하는 정적 메소드
	public static boolean isNumber(String value) {
		/* 첫번째 방법 
		 try { Integer.parseInt(value);
		  		return true; 
		  	} catch (Exception e) { 
		 		return false; 
		 	}
		*/
		 
		
		/* 두번째 방법 */
		// 입력된 문자열을 char배열로 반환 받아서 체크
			char[] chArr = value.toCharArray();
			for(int i=0; i<chArr.length; i++) {
				// 문자가 포함되어있으면 return false
				// '0': 48 ~ '9': 57 (숫자 캐릭터인지 체크)
				if(!(chArr[i] >= '0' && chArr[i] <= '9')) {
					System.out.println("문자가 포함되어있음");
					return false;
				}
			} return true; // for문을 다 돌았으나 문자가 없었으므로 true
		
	}
	
	// 입력받은 정수까지 구구단을 html 테이블로 출력하는 정적 메소드
	// 1단부터 입력받은 n단까지 출력 
	public static String showGugu(int num) {
		StringBuffer sb = new StringBuffer();
		sb.append("<table border='1'>");
		for(int i=2; i<=num; i++) {
			sb.append("<tr>");
			sb.append("<td colspan='9'><b>"+i+"단</b></td>");
			for(int j=1; j<=9; j++) {
				sb.append("<td>");
				sb.append(i + "*" + j + "=" + i*j);
				sb.append("</td>");
			}
			sb.append("</tr>");
		}
		sb.append("</table>");
		return sb.toString();
	}
	
	
	public static void main(String[] args) {
		MyELClass mEL = new MyELClass();
		System.out.println(mEL.getGender("990909-1234567"));
		System.out.println(MyELClass.isNumber("a123"));
		System.out.println(MyELClass.showGugu(3));
	}
}
