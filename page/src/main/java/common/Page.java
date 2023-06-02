package common;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @어노테이션
 * - 사전적 의미로는 주석이라는 뜻을 가지고 있음
 * - 소스코드에 추가해서 사용할 수 있는 메타 데이터의 일종
 * - 컴파일 과정과 실행 과정에서 코드를 어떻게 처리해야하는지 알려주기 위한 정보 
 * 
 * -> 문법 체크
 * -> 런타임 시 특정 기능을 실행
 * -> 개발환경이나 빌드 시 코드를 자동으로 생성할 수 있도록 정보를 제공
 * 
 * 
 * @WebServlet
 * - 사용자의 요청 URL과 매핑
 */

/**
 * Servlet implementation class Page
 */
@WebServlet("/Page")
public class Page extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Page() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    
    /**
     * Get 방식으로 요청 시 실행
     * 
     * 사용자의 요청 정보를 객체(request/response)로 저장하여 파라미터로 전달
     * HttpServletRequest는 인터페이스 타입!
     */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	
	/**
	 * Post 방식으로 요청 시 실행
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
