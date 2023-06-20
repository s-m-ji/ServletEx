package el;

public class MymyELClass {

	public MymyELClass() {
		// TODO Auto-generated constructor stub
	}
	
	public static String getGender(String jumin) {
		String str = "";
		try {
			int dash = str.indexOf("-");
			String num = str.substring(dash+1, dash+2);
			if(num.equals("1") || num.equals("3")) {
				str = "Male";
			} else if(num.equals("2") || num.equals("3")) {
				str = "Female";
			} else { throw new Exception(); }
		} catch (Exception e) {
			str = "뿌우 ^3^";
		}
		return str;
	}
	
	public static String isNumber(String str) {
		String res = "";
		/*
		 * try { Integer.parseInt(str); res = "숫자입니다"; } catch (Exception e) { res =
		 * "문자가 포함되어있습니다"; } return res;
		 */
		
		char[] cArr = str.toCharArray();
		for(char c : cArr) { 
			if(c >= 48 && c <= 57 ) res = "숫자입니다";
			else res = "문자가 포함되어있습니다";
		}
		return res;
	}
	/*
	 * int asciiV0 = (int) '0'; int asciiV9 = (int) '9';
	 * System.out.println("숫자 0의 아스키 코드: " + asciiV0);
	 * System.out.println("숫자 9의 아스키 코드: " + asciiV9);
	 */
	
	public static String gugu(int num) {
		String str = "<table border='1'>";
		for(int i=2; i<=num; i++) {
			str += "<tr>";
			for(int j=2; j<=9; j++) {
				str += "<td>"+i+"*"+j+"="+i*j+"</td>";
			}
			str += "</tr>";
		}
		str += "</table>";
		return str;
	}
	
	public static void main(String[] args) {
		
	}

}
