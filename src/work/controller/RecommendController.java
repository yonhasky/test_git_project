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

import work.model.dto.Recommend;
import work.model.dto.Student;
import work.model.service.MentoringService;
import work.model.service.NoticeService;
import work.model.service.RecommendService;
import work.model.service.StudentService;

/**
 * Servlet implementation class FrontController
 */
public class RecommendController extends HttpServlet {

	private MentoringService mentoringService = new MentoringService();
	private StudentService studentService = new StudentService();
	private NoticeService noticeService = new NoticeService();
	private RecommendService recommendService = new RecommendService();

	protected void idCheck(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String responseDataType = request.getParameter("responseDataType");

		switch (responseDataType) {
	
		case "json":
			responseJson(request, response);
			break;

		default:
			request.setAttribute("message", "�������� �ʴ� ���� ������ �����Դϴ�.");
			request.getRequestDispatcher("error.jsp")
					.forward(request, response);
		}
	}
	
	protected void responseJson(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// ��û ������ ���̵� ��������
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
	
	protected void recommendList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String pageNum = request.getParameter("pageNum");
		ArrayList<Recommend> list = recommendService.selectRecommendList(pageNum);
		if(list != null) {
			request.setAttribute("list", list);
			request.getRequestDispatcher("recommendList.jsp").forward(request, response);
		}
	}
	
	protected void recommendEntry(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		HttpSession session = request.getSession(false);
		ServletContext application = getServletContext();
		int sizeLimit = 16 * 1024 * 1024;
		String savePath = application.getRealPath("images");
		
		MultipartRequest multi = new MultipartRequest(request, savePath, sizeLimit, "utf-8", new DefaultFileRenamePolicy());
		
		String rTitle = multi.getParameter("rTitle");
		String rContent = multi.getParameter("rContent");
		String rAuthor = (String)session.getAttribute("uId");
		String rType = multi.getFilesystemName("rType");
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
				
		if(rTitle != null && rContent != null && rAuthor != null) {
			int row = 0;
			if( session != null && session.getAttribute("uGrade").equals("A")) {
				row = recommendService.insertRecommend(rTitle, rContent, rAuthor, rType, filePath1, filePath2);
			} 
			if(row == 1) {
				response.sendRedirect("Controller?action=recommendList&pageNum=1");
			} else {
				request.setAttribute("message", "�Խñ� ��� ���� �߻�");
				request.getRequestDispatcher("error.jsp").forward(request, response);
			}
			
		} else {
			request.setAttribute("message", "�ʼ� �Է¶��� ä���ּ���");
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
	}

	protected void recommendSearch(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String recommendNum = request.getParameter("rNo");
		String opt = request.getParameter("opt");
		Recommend dto = null;
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
			System.out.println("VIEWCOOKIE ����");
			Cookie newCookie = new Cookie("VCOOKIE","|"+recommendNum+"|"); 
			response.addCookie(newCookie);
			dto = recommendService.selectRecommend(recommendNum, 0);
		} else {
			System.out.println("VIEWCOOKIE ����");
			String value = viewCookie.getValue();
			  
			if(value.indexOf("|"+recommendNum+"|") <  0) { 
			   value = value+"|"+recommendNum+"|";
			   viewCookie.setValue(value);
			   response.addCookie(viewCookie);
			   dto = recommendService.selectRecommend(recommendNum, 0);
			} else {
			   dto = recommendService.selectRecommend(recommendNum, 1);
			} 	
		}
		
		if(dto != null) {
			request.setAttribute("dto", dto);
			
			if(opt == null) {
				request.getRequestDispatcher("recommendItem.jsp").forward(request, response);
			} else if(opt.equals("update")) {
				request.getRequestDispatcher("recommendUpdate.jsp").forward(request, response);
			}
		} else {
			request.setAttribute("message", "�Խñ� ��ȸ ����.");
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
	}

	protected void recommendUpdate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ServletContext application = getServletContext();
		int sizeLimit = 16 * 1024 * 1024;
		String savePath = application.getRealPath("images");
		MultipartRequest multi = new MultipartRequest(request, savePath, sizeLimit, "utf-8", new DefaultFileRenamePolicy());
		String recommendNum = request.getParameter("rNo");

		String rTitle = multi.getParameter("rTitle");
		String rContent = multi.getParameter("rContent");
		String rType = multi.getFilesystemName("rType");
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
		int row = recommendService.updateRecommend(rTitle, rContent, rType, recommendNum, filePath1, filePath2);
		
		if(row == 1) {
			request.setAttribute("message", "�Խñ� ���� ����.");
			request.getRequestDispatcher("Controller?action=boardList&pageNum=1").forward(request, response);	
		} else {
			request.setAttribute("message", "�Խñ� ���� ����.");
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
	}
	
	protected void recommendDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String recommendNum = request.getParameter("rNo");
		int row = recommendService.deleteRecommend(recommendNum);
		System.out.println(recommendNum);
		if(row == 1) {
			request.setAttribute("message", "�Խñ� ���� ����.");
			request.getRequestDispatcher("Controller?action=recommendList&pageNum=1").forward(request, response);	
		} else {
			request.setAttribute("message", "�Խñ� ���� ����.");
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
	}
	
	protected void recommendListSearch(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String sType = request.getParameter("sType");
		String sTitle = request.getParameter("sTitle");
		String pageNum = request.getParameter("pageNum");
		
		ArrayList<Recommend> list = recommendService.selectRecommendListSearch(pageNum, sType, sTitle);
		System.out.println(sType+","+sTitle+","+pageNum);
		System.out.println(list);

		if(list != null) {
			request.setAttribute("list", list);
			request.getRequestDispatcher("recommendList.jsp").forward(request, response);
		} else {
			request.setAttribute("message", "�˻������ �������� �ʽ��ϴ�");
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
	}

	/**
	 * get, post ��û�� ó���ϴ� ���� �޼ҵ�
	 * 
	 * @throws IOException
	 * @throws ServletException
	 */
	protected void process(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// ��û �ľ� : ��û�����Ϳ��� ��û�� ���� key ������ ��������
		String action = request.getParameter("action");
		System.out.println(action);
		if (action != null) {
			switch (action) {
			case "recommendList":
				recommendList(request, response);
				break;
				
			case "recommendEntry":
				recommendEntry(request, response);
				break;
				
			case "recommendSearch":
				recommendSearch(request, response);
				break;
				
			case "recommendUpdate":
				recommendUpdate(request, response);
				break;
				
			case "recommendDelete":
				recommendDelete(request, response);
				break;
				
			case "recommendListSearch":
				recommendListSearch(request, response);
				break;

			default:
				break;
			// �������� �ʴ� ��û ����

			}

		} else {
			// �߸��� ��û��� ���� ������ �̵�
		}

	}

	public RecommendController() {

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
			request.setAttribute("message", "�ùٸ��� ���� ��û�Դϴ�.");
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
