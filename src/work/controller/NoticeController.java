package work.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import work.model.dto.Notice;
import work.model.dto.Student;
import work.model.service.MentoringService;
import work.model.service.NoticeService;
import work.model.service.RecommendService;
import work.model.service.StudentService;

/**
 * Servlet implementation class FrontController
 */
public class NoticeController extends HttpServlet {

	private MentoringService mentoringService = new MentoringService();
	private StudentService studentService = new StudentService();
	private NoticeService noticeService = new NoticeService();
	private RecommendService recommendService = new RecommendService();

	
	

	/**
	 * 아이디 중복 요청 서비스 메서드 : ajax 비동기 요청
	 * 
	 * --요청데이터 추출 : 아이디, 응답데이터 타입 정보 추출 --요청데이터 검증 --모델에게 아이디 중복유무 요청 의뢰 --요청
	 * 결과에 따른 데이터 응답
	 * 
	 * ##id 응답 데이터 1. 아이디 미입력 : required 2. 사용가능 : false 3. 중복 : true 4. 허용불가 :
	 * deny
	 * */
	protected void idCheck(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String responseDataType = request.getParameter("responseDataType");

		switch (responseDataType) {
	
		case "json":
			responseJson(request, response);
			break;

		default:
			request.setAttribute("message", "지원하지 않는 응답 데이터 형식입니다.");
			request.getRequestDispatcher("error.jsp")
					.forward(request, response);
		}
	}

	
	
	/**
	 * idCheck 응답 데이터 : json 응답 처리 메서드 json : {"valid","true"}
	 */
	protected void responseJson(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// 요청 데이터 아이디 가져오기
		String id = request.getParameter("id");

		PrintWriter out = response.getWriter();
		response.setContentType("text/plain");
		response.setHeader("Cache-Control", "no-cache");

		if (id != null && id.trim().length() > 0) {
			
			if (studentService.isUser(id)) {
				out.write("{'valid':'true'}");
			} else {
				out.write("{'valid':'false'}");
			}

		} else {
			out.write("{'valid':'required'}");
		}
	}

	protected void noticeList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String pageNum = request.getParameter("pageNum");
		ArrayList<Notice> list = noticeService.selectNoticeList(pageNum);
		if(list != null) {
			request.setAttribute("list", list);
			request.getRequestDispatcher("noticeList.jsp").forward(request, response);
		}
	}
	
	protected void noticeEntry(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		HttpSession session = request.getSession(false);
		ServletContext application = getServletContext();
		int sizeLimit = 16 * 1024 * 1024;
		String savePath = application.getRealPath("images");
		
		MultipartRequest multi = new MultipartRequest(request, savePath, sizeLimit, "utf-8", new DefaultFileRenamePolicy());
		
		String nTitle = multi.getParameter("nTitle");
		String nContent = multi.getParameter("nContent");
		String nAuthor = (String)session.getAttribute("uId");
		String nType = multi.getFilesystemName("nType");
		String nFile1 = multi.getFilesystemName("nFile1");
		String nFile2 = multi.getFilesystemName("nFile2");
		String filePath1 = null;
		String filePath2 = null; 
		
		if(nFile1 != null) {
			filePath1 = "images"+"\\"+nFile1;
		} 
		if(nFile2 != null) {
			filePath2 = "images"+"\\"+nFile2;
		}
				
		if(nTitle != null && nContent != null && nAuthor != null) {
			int row = 0;
			if( session != null && session.getAttribute("uGrade").equals("A")) {
				row = noticeService.insertNotice(nTitle, nContent, nAuthor, nType, filePath1, filePath2);
			} 
			if(row == 1) {
				response.sendRedirect("Controller?action=noticeList&pageNum=1");
			} else {
				request.setAttribute("message", "게시글 등록 오류 발생");
				request.getRequestDispatcher("error.jsp").forward(request, response);
			}
			
		} else {
			request.setAttribute("message", "필수 입력란을 채워주세요");
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
	}

	protected void noticeSearch(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String noticeNum = request.getParameter("nNo");
		String opt = request.getParameter("opt");
		Notice dto = null;
		Cookie[] cookies = request.getCookies();
		Cookie viewCookie = null;
		
		if(cookies != null && cookies.length > 0) {		  
			for(int i = 0; i< cookies.length; i++) {
				if(cookies[i].getName().equals("VCOOKIE")) { 
					viewCookie = cookies[i];
				}
			}  
		}
		
		if(viewCookie == null) {
			System.out.println("VIEWCOOKIE 없음");
			Cookie newCookie = new Cookie("VCOOKIE","|"+noticeNum+"|"); 
			response.addCookie(newCookie);
			dto = noticeService.selectNotice(noticeNum, 0);
		} else {
			System.out.println("VIEWCOOKIE 있음");
			String value = viewCookie.getValue();
			  
			if(value.indexOf("|"+noticeNum+"|") <  0) { 
			   value = value+"|"+noticeNum+"|";
			   viewCookie.setValue(value);
			   response.addCookie(viewCookie);
			   dto = noticeService.selectNotice(noticeNum, 0);
			} else {
			   dto = noticeService.selectNotice(noticeNum, 1);
			} 	
		}
		
		if(dto != null) {
			request.setAttribute("dto", dto);
			
			if(opt == null) {
				request.getRequestDispatcher("noticeItem.jsp").forward(request, response);
			} else if(opt.equals("update")) {
				request.getRequestDispatcher("noticeUpdate.jsp").forward(request, response);
			}
		} else {
			request.setAttribute("message", "게시글 조회 에러.");
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
	}

	protected void noticeUpdate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ServletContext application = getServletContext();
		int sizeLimit = 16 * 1024 * 1024;
		String savePath = application.getRealPath("images");
		MultipartRequest multi = new MultipartRequest(request, savePath, sizeLimit, "utf-8", new DefaultFileRenamePolicy());
		String noticeNum = request.getParameter("nNo");

		String nTitle = multi.getParameter("nTitle");
		String nContent = multi.getParameter("nContent");
		String nType = multi.getFilesystemName("nType");
		String nFile1 = multi.getFilesystemName("nFile1");
		String nFile2 = multi.getFilesystemName("nFile2");
		String filePath1 = null;
		String filePath2 = null; 
		
		if(nFile1 != null) {
			filePath1 = "images"+"\\"+nFile1;
		} 
		if(nFile2 != null) {
			filePath2 = "images"+"\\"+nFile2;
		}
		int row = noticeService.updateNotice(nTitle, nContent, nType, noticeNum, filePath1, filePath2);
		
		if(row == 1) {
			request.setAttribute("message", "게시글 수정 성공.");
			request.getRequestDispatcher("Controller?action=boardList&pageNum=1").forward(request, response);	
		} else {
			request.setAttribute("message", "게시글 수정 에러.");
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
	}
	
	protected void noticeDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String noticeNum = request.getParameter("nNo");
		int row = noticeService.deleteNotice(noticeNum);
		System.out.println(noticeNum);
		if(row == 1) {
			request.setAttribute("message", "게시글 삭제 성공.");
			request.getRequestDispatcher("Controller?action=noticeList&pageNum=1").forward(request, response);	
		} else {
			request.setAttribute("message", "게시글 삭제 에러.");
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
	}
	
	protected void noticeListSearch(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String sType = request.getParameter("sType");
		String sTitle = request.getParameter("sTitle");
		String pageNum = request.getParameter("pageNum");
		
		ArrayList<Notice> list = noticeService.selectNoticeListSearch(pageNum, sType, sTitle);
		System.out.println(sType+","+sTitle+","+pageNum);
		System.out.println(list);

		if(list != null) {
			request.setAttribute("list", list);
			request.getRequestDispatcher("noticeList.jsp").forward(request, response);
		} else {
			request.setAttribute("message", "검색결과가 존재하지 않습니다");
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
	}

	/**
	 * get, post 요청을 처리하는 서비스 메소드
	 * 
	 * @throws IOException
	 * @throws ServletException
	 */
	protected void process(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// 요청 파악 : 요청데이터에서 요청을 위한 key 데이터 가져오기
		String action = request.getParameter("action");
		System.out.println(action);
		if (action != null) {
			switch (action) {

				
			case "noticeList":
				noticeList(request, response);
				break;
				
			case "noticeEntry":
				noticeEntry(request, response);
				break;
				
			case "noticeSearch":
				noticeSearch(request, response);
				break;
				
			case "noticeUpdate":
				noticeUpdate(request, response);
				break;
				
			case "noticeDelete":
				noticeDelete(request, response);
				break;
				
			case "noticeListSearch":
				noticeListSearch(request, response);
				break;

			default:
				break;
			// 지원하지 않는 요청 오류

			}

		} else {
			// 잘못된 요청방식 오류 페이지 이동
		}

	}

	public NoticeController() {

	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		process(request, response);
		
		String action = request.getParameter("action");
		if (action != null) {
			switch (action) {
			case "idCheck":
				idCheck(request, response);
				break;

			}
		} else {
			request.setAttribute("message", "올바르지 않은 요청입니다.");
			request.getRequestDispatcher("error.jsp")
					.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("euc-kr");
		process(request, response);
	}

}
