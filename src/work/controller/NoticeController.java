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
	 * ���̵� �ߺ� ��û ���� �޼��� : ajax �񵿱� ��û
	 * 
	 * --��û������ ���� : ���̵�, ���䵥���� Ÿ�� ���� ���� --��û������ ���� --�𵨿��� ���̵� �ߺ����� ��û �Ƿ� --��û
	 * ����� ���� ������ ����
	 * 
	 * ##id ���� ������ 1. ���̵� ���Է� : required 2. ��밡�� : false 3. �ߺ� : true 4. ���Ұ� :
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
			request.setAttribute("message", "�������� �ʴ� ���� ������ �����Դϴ�.");
			request.getRequestDispatcher("error.jsp")
					.forward(request, response);
		}
	}

	
	
	/**
	 * idCheck ���� ������ : json ���� ó�� �޼��� json : {"valid","true"}
	 */
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
				request.setAttribute("message", "�Խñ� ��� ���� �߻�");
				request.getRequestDispatcher("error.jsp").forward(request, response);
			}
			
		} else {
			request.setAttribute("message", "�ʼ� �Է¶��� ä���ּ���");
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
			System.out.println("VIEWCOOKIE ����");
			Cookie newCookie = new Cookie("VCOOKIE","|"+noticeNum+"|"); 
			response.addCookie(newCookie);
			dto = noticeService.selectNotice(noticeNum, 0);
		} else {
			System.out.println("VIEWCOOKIE ����");
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
			request.setAttribute("message", "�Խñ� ��ȸ ����.");
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
			request.setAttribute("message", "�Խñ� ���� ����.");
			request.getRequestDispatcher("Controller?action=boardList&pageNum=1").forward(request, response);	
		} else {
			request.setAttribute("message", "�Խñ� ���� ����.");
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
	}
	
	protected void noticeDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String noticeNum = request.getParameter("nNo");
		int row = noticeService.deleteNotice(noticeNum);
		System.out.println(noticeNum);
		if(row == 1) {
			request.setAttribute("message", "�Խñ� ���� ����.");
			request.getRequestDispatcher("Controller?action=noticeList&pageNum=1").forward(request, response);	
		} else {
			request.setAttribute("message", "�Խñ� ���� ����.");
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
			// �������� �ʴ� ��û ����

			}

		} else {
			// �߸��� ��û��� ���� ������ �̵�
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
