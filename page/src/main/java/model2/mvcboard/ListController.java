package model2.mvcboard;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.Criteria;
import dto.PageDto;

public class ListController extends HttpServlet{

	public ListController() {
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 새로운 테이블 생성
		// dao, dto 생성
		
		// 리스트를 조회
		// req 영역에 저장
		// 화면 전환 (페이지 이동)
		
		String sField = req.getParameter("searchField"); 
		String sWord =	req.getParameter("searchWord"); 
		int pageNo = req.getParameter("pageNo") == null? 1 :
		Integer.parseInt(req.getParameter("pageNo")); 
		int sAmount = req.getParameter("searchAmount") == null? 2 :
		Integer.parseInt(req.getParameter("searchAmount"));
		
		Criteria cr = new Criteria(sField, sWord, pageNo, sAmount);
		
		MVCBoardDao mDao = new MVCBoardDao();
		List<MVCBoardDto> list = mDao.getBoardList(cr);
		int total =	mDao.getTotalCnt(cr);
		PageDto pDto = new PageDto(total, cr);
		
		req.setAttribute("sField", sField);
		req.setAttribute("sWord", sWord);
		req.setAttribute("pageNo", pageNo);
		req.setAttribute("sAmount",	sAmount);
		

		req.setAttribute("cr", cr);
		req.setAttribute("mDao", mDao);
		req.setAttribute("list", list);
		req.setAttribute("total", total);
		req.setAttribute("pDto", pDto);	
		
		
		req.getRequestDispatcher("/14MVCBoard/List.jsp").forward(req, resp);
	}
	

}
