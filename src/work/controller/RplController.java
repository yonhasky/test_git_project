package work.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import work.model.dao.KinreplieDao;
import work.model.dto.Kinreplie;

/**
 * Servlet implementation class RplController
 */
public class RplController extends HttpServlet {
       
	private KinreplieDao dao = KinreplieDao.getInstance();
	
	/** 1. 답변 전체 리스트 (질문 + 답변 보이게) */
	protected void rplList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<Kinreplie> list = dao.selectRplList();
		
		if(list != null) {
			request.setAttribute("list", list);
			request.getRequestDispatcher("freeBoardList.jsp").forward(request, response);
		}
	}
	
	/** 2.답변 등록 */
	protected void rplEnroll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		HttpSession session = request.getSession(false);
		ServletContext application = getServletContext();
		int sizeLimit = 16 * 1024 * 1024;
		String savePath = application.getRealPath("images");
		
		MultipartRequest multi = new MultipartRequest(request, savePath, sizeLimit, "utf-8", new DefaultFileRenamePolicy());
		
		String kNo = multi.getParameter("kNo");
		String rTitle = multi.getParameter("rTitle");
		String rAuthor = (String)session.getAttribute("uId");
		String rContent = multi.getParameter("rContent");
		String kFile1 = multi.getFilesystemName("kFile1");
		String kFile2 = multi.getFilesystemName("kFile2");
		String filePath1 = null;
		String filePath2 = null;
		
		
		if(kFile1 != null) {
			filePath1 = "images"+"\\"+kFile1;
		} 
		if(kFile2 != null) {
			filePath2 = "images"+"\\"+kFile2;
		}
		Kinreplie dto = new Kinreplie(0, rTitle, rAuthor, null, rContent, 				null, filePath1, filePath2, null, Integer.parseInt(kNo));
				
		if(rTitle != null && rAuthor != null && rContent != null) {
			int row = 0;
			row = dao.insertRpl(dto);
			if(row == 1) {
				request.setAttribute("message", "질문등록 성공.");
				response.sendRedirect("Controller?action=rplList");
			} else {
				request.setAttribute("message", "게시글 등록 오류 발생");
				request.getRequestDispatcher("error.jsp").forward(request, response);
			}
			
		} else {
			request.setAttribute("message", "필수 입력란을 채워주세요");
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
	}
	
	/** 3.답변 삭제 */
	protected void rplDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String rNo = request.getParameter("rNo");
		String kNo = request.getParameter("kNo");
		int row = dao.deleteRpl(Integer.parseInt(kNo),Integer.parseInt(rNo));
		System.out.println(kNo + "," + rNo);
		if(row == 1) {
			request.setAttribute("message", "게시글 삭제 성공.");
			request.getRequestDispatcher("Controller?action=kinList").forward(request, response);	
		} else {
			request.setAttribute("message", "게시글 삭제 에러.");
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
	}
	
	/** 4.답변 수정 */
	protected void rplUpdate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ServletContext application = getServletContext();
		int sizeLimit = 16 * 1024 * 1024;
		String savePath = application.getRealPath("images");
		MultipartRequest multi = new MultipartRequest(request, savePath, sizeLimit, "utf-8", new DefaultFileRenamePolicy());
		
		String rTitle = multi.getParameter("rTitle");
		String rContent = multi.getParameter("rContent");
		String rFile1 = multi.getFilesystemName("rFile1");
		String rFile2 = multi.getFilesystemName("rFile2");
		String filePath1 = null;
		String filePath2 = null;
		
		
		if(rFile1 != null) {
			filePath1 = "images"+"\\"+rFile1;
		} 
		if(rFile2 != null) {
			filePath2 = "images"+"\\"+rFile2;
		}
		Kinreplie dto = new Kinreplie(0, rTitle, null, null, rContent, null, filePath1, filePath2, null, 0);
		int row = dao.updateRpl(dto);
		
		if(row == 1) {
			request.setAttribute("message", "게시글 수정 성공.");
			request.getRequestDispatcher("Controller?action=kinList").forward(request, response);	
		} else {
			request.setAttribute("message", "게시글 수정 에러.");
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
	}
	
	/** 5.답변수 증가 */
	protected void rplCount(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String kNo = request.getParameter("kNo");
		HttpSession session = request.getSession(false);
		Cookie[] cookies = request.getCookies();
		Cookie viewCookie =null;
		
		if(session.getAttribute("uId") != null) {
			if(cookies != null && cookies.length > 0) {		  
				for(int i = 0; i< cookies.length; i++) {
					if(cookies[i].getName().equals("VIEWCOOKIE")) { 
						viewCookie = cookies[i];
					}
				}  
			}
			if(viewCookie == null) {
				System.out.println("VIEWCOOKIE 없음");
				Cookie newCookie = new Cookie("VIEWCOOKIE","|"+kNo+"|"); //("VIEWCOOKIE"는 name, "|"+bbsno+"|" 는 value 다. 
				response.addCookie(newCookie);
				int rows = dao.updateRplCount(Integer.parseInt(kNo));			
				if(rows == 1) {
					request.setAttribute("message", "답변수 증가 완료");
					request.getRequestDispatcher("Controller?action=kinSearch&kNo"+kNo).forward(request, response);
				} else {
					request.setAttribute("message", "답변수 증가 실패.");
					request.getRequestDispatcher("Controller?action=kinSearch&kNo"+kNo).forward(request, response);
				}
			} else {
				System.out.println("VIEWCOOKIE 있음");
				String value = viewCookie.getValue();
				  
				if(value.indexOf("|"+kNo+"|") <  0) { // 입력한 번화와 일치하는 번호가 없으면 추가한다.
				   value = value+"|"+kNo+"|";
				   viewCookie.setValue(value);
				   response.addCookie(viewCookie);
				   int rows = dao.updateRplCount(Integer.parseInt(kNo));				
				   if(rows == 1) {
						request.setAttribute("message", "답변수 증가 완료");
						request.getRequestDispatcher("Controller?action=kinSearch&kNo"+kNo).forward(request, response);
				   } else {
						request.setAttribute("message", "답변수 증가 실패.");
						request.getRequestDispatcher("Controller?action=kinSearch&kNo"+kNo).forward(request, response);
				   }
				} else {
					request.setAttribute("message", "답변수 증가 중복은 불가능합니다.");
					request.getRequestDispatcher("Controller?action=kinSearch&kNo"+kNo).forward(request, response);
				} 	
			}
		} else {
			request.setAttribute("message", "추천 실패. 로그인 후 다시 시도해주세요.");
			request.getRequestDispatcher("Controller?action=kinSearch&kNo"+kNo).forward(request, response);
		}
	}
	
	
	
    protected void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		System.out.println("action : "+ action);
		
		switch(action) {
		case "rplList":
			rplList(request,response);
			break;
		case "rplEnroll":
			rplEnroll(request,response);
			break;
		case "rplDelete":
			rplDelete(request,response);
			break;
		case "rplUpdate":
			rplUpdate(request,response);
			break;
		case "rplCount":
			rplCount(request,response);
			break;
		default:
			break;
		}
	}
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("EUC-KR");
		process(request,response);
	}

}
