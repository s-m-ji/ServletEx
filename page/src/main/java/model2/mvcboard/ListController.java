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

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String sField = req.getParameter("searchField"); 
		String sWord =	req.getParameter("searchWord"); 
		String pageNo = req.getParameter("pageNo");
		String sAmount = req.getParameter("searchAmount");
		
		Criteria cr = new Criteria(sField, sWord, pageNo, sAmount);
		MVCBoardDao mDao = new MVCBoardDao();		
		List<MVCBoardDto> list = mDao.getBoardList(cr);
		int total =	mDao.getTotalCnt(cr);
		PageDto pDto = new PageDto(total, cr);
		
		req.setAttribute("pageNo", cr.getPageNo());
		req.setAttribute("sAmount",	cr.getAmount());		
		req.setAttribute("list", list);
		req.setAttribute("total", total);
		req.setAttribute("pDto", pDto);	
		
		req.getRequestDispatcher("../14MVCBoard/List.jsp").forward(req, resp);
	}
	

}
