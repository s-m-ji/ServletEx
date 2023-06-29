package controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;

import common.FileUtil;
import common.JSPFunction;
import dao.BoardDao;
import dto.BoardDto;
import dto.Criteria;
import dto.PageDto;


@WebServlet("*.do")
public class Controller extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String uri = request.getRequestURI();
		System.out.println("***** doGet 요청 uri : " + uri);
		
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("userId");
		
		BoardDao mDao = new BoardDao();
		
		// ==================== 게시글 목록 조회 ====================
		if(uri.indexOf("list")>0) {
		
		String sField = request.getParameter("searchField"); 
		String sWord =	request.getParameter("searchWord"); 
		String pageNo = request.getParameter("pageNo");
		String sAmount = request.getParameter("searchAmount");
		
		Criteria cr = new Criteria(sField, sWord, pageNo, sAmount);
		List<BoardDto> list = mDao.getBoardList(cr);
		int total =	mDao.getTotalCnt(cr);
		PageDto pDto = new PageDto(total, cr);
		
		request.setAttribute("pageNo", cr.getPageNo());
		request.setAttribute("sAmount",	cr.getAmount());		
		request.setAttribute("list", list);
		request.setAttribute("total", total);
		request.setAttribute("pDto", pDto);	
		
		request.getRequestDispatcher("../Board/List.jsp").forward(request, response);
		}
		
		// ==================== 게시글 등록 ====================
		else if(uri.indexOf("write")>0) {
			
			request.setAttribute("userId", userId);	
			request.getRequestDispatcher("../Board/Write.jsp").forward(request, response);
		
		} 
		
		// ==================== 도서 상세 조회 ====================
		else if(uri.indexOf("view")>0) {
			System.out.println("----------- BookController 진입 / view");
			request.setAttribute("mDto", mDao.getBoardView(request.getParameter("idx")));
			request.getRequestDispatcher("../Board/View.jsp").forward(request, response);
		
		} 
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI();
		System.out.println("***** doPost 요청 uri : " + uri);
		
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("userId");
		
		// ==================== 게시글 등록 ====================
		if(uri.indexOf("write")>0) {
			String saveDirectory = "C:/upload";
			saveDirectory = "C:\\Users\\user\\git\\ServletEx\\page\\src\\main\\webapp\\upload";
			MultipartRequest mr = FileUtil.uploadFile(request, saveDirectory, 1024 * 1000);
			if(mr == null) {
				// 파일 업로드 실패
				JSPFunction.alertBack("❌ 파일 업로드 실패 ❌", response);
				return;
			}
			
			// 파일 업로드 외 form 값을 dto에 저장
			BoardDto mDto = new BoardDto();
			mDto.setName(mr.getParameter("name"));
			mDto.setTitle(mr.getParameter("title"));
			mDto.setContent(mr.getParameter("content"));
			mDto.setPass(mr.getParameter("pass"));
			
			// 원래 첨부파일(이름+확장자)
			String ofileName = mr.getFilesystemName("file");
			if(ofileName != null) {
				// 첨부파일의 이름만
				String fileName = ofileName.substring(0, ofileName.lastIndexOf("."));
				
				// 첨부파일의 확장자
				String exp = ofileName.substring(ofileName.lastIndexOf("."));
				
				// H: 0~23시, S: millisecond초
				String date = new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());
				
				// 수정된 파일
				String nfileName = fileName +"_"+ date + exp;

				/* 파일명 변경 */
				File oldFile = new File(saveDirectory + File.separator + ofileName);
				File newFile = new File(saveDirectory + File.separator + nfileName);
				oldFile.renameTo(newFile);
				
				mDto.setOfile(ofileName); // 원본 파일명
				mDto.setSfile(nfileName); // 저장된 파일명
			}
			
			System.out.println("ofileName : " + ofileName);
			
			BoardDao mDao = new BoardDao();
			int res = mDao.insertPost(mDto);
			if(res>0) {
				System.out.println("---------- 게시글 작성 완료");
				JSPFunction.alertLocation("📝 게시글 작성 완료 📝", "../Board/list.do", response);
			} else {
				JSPFunction.alertBack("❌ 게시글 작성 실패 (res>0 false)", response);
				System.err.println("---------- 게시글 작성 실패 (res>0 false)");
			}
		
		}
		
		} 
	}

