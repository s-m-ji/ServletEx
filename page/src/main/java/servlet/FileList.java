package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.Criteria;
import dto.PageDto;
import fileupload.FileDao;
import fileupload.FileDto;

// @WebServlet("/12.파일업로드/folder/file")
// 헷갈리면 주소 표시줄에 나온 url을 루트 경로부터 천천히 보면 되겠음.. 단순하게 생각 !
@WebServlet("/12.파일업로드/file")
// @WebServlet("/test")

public class FileList extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse resp) throws ServletException, IOException {
		
		String sField = request.getParameter("searchField"); 
		String sWord =	request.getParameter("searchWord"); 
		int pageNo = request.getParameter("pageNo") == null? 1 :
		Integer.parseInt(request.getParameter("pageNo")); 
		int sAmount = request.getParameter("searchAmount") == null? 2 :
		Integer.parseInt(request.getParameter("searchAmount"));
		
		Criteria cr = new Criteria(sField, sWord, pageNo, sAmount);
		FileDao fDao =	new FileDao();
		List<FileDto> list = fDao.getFileList(cr);
		int total =	fDao.getTotalCnt(cr);
		PageDto pDto = new PageDto(total, cr);
		
		
		request.setAttribute("sField", sField);
		request.setAttribute("sWord", sWord);
		request.setAttribute("pageNo", pageNo);
		request.setAttribute("sAmount",	sAmount);
		
		request.setAttribute("cr", cr);
		request.setAttribute("fDao", fDao);
		request.setAttribute("list", list);
		request.setAttribute("total", total);
		request.setAttribute("pDto", pDto);
		
		// request.getRequestDispatcher("./../FileList.jsp").forward(request, resp);
		
		request.getRequestDispatcher("FileList.jsp").forward(request, resp);
	}
	
	public FileList() {
		// TODO Auto-generated constructor stub
	}

}
