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

import work.model.dao.KinDao;
import work.model.dao.KinreplieDao;
import work.model.dto.Kin;
import work.model.dto.Kinreplie;

/**
 * Servlet implementation class KinController
 */
public class KinController extends HttpServlet {
	
	private KinDao dao = KinDao.getInstance();
	private KinreplieDao dao2 = KinreplieDao.getInstance();
	
    /** 1. ��ü ����Ʈ ��ȸ */
    protected void kinList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String pageNum = request.getParameter("pageNum");
		ArrayList<Kin> list = dao.selectKinList(pageNum);
		if(list != null) {
			request.setAttribute("list", list);
			request.getRequestDispatcher("kinList.jsp").forward(request, response);
		}
	}
    
    /** 2. ī�װ��� ����Ʈ ��ȸ */
    protected void kinListByType(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String category = request.getParameter("category");
    	ArrayList<Kin> list = dao.selectKinListByType(category);
		
		if(list != null) {
			request.setAttribute("list", list);
			request.getRequestDispatcher("freeBoardList.jsp").forward(request, response);
		}
	}
    
    /** 3. ����Ʈ �κ� �˻� ��ȸ */
    protected void kinListSearch(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String keywordType = request.getParameter("keywordType");
    	String keyword = request.getParameter("keyword");
    	String pageNum = request.getParameter("pageNum");
    	ArrayList<Kin> list = dao.selectKinListSearch(pageNum, keywordType, keyword);
		
    	if(keywordType == null && keywordType.trim().length() < 1 ||
    			keyword == null && keyword.trim().length() < 1) {
    		kinList(request, response);
    	}
    	
		if(list != null) {
			request.setAttribute("list", list);
			request.getRequestDispatcher("freeBoardList.jsp").forward(request, response);
		}
	}
    
    /** 4.������ ��ȸ */
    protected void kinSearch(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String kNo = request.getParameter("kNo");
		String opt = request.getParameter("opt");
		System.out.println("kNo : " + kNo);
		System.out.println("opt : " + opt);
		Kin dto = null;
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
			Cookie newCookie = new Cookie("VCOOKIE","|"+kNo+"|"); 
			response.addCookie(newCookie);
			dto = dao.selectKin(Integer.parseInt(kNo), 0);
		} else {
			System.out.println("VIEWCOOKIE ����");
			String value = viewCookie.getValue();
			  
			if(value.indexOf("|"+kNo+"|") <  0) { 
			   value = value+"|"+kNo+"|";
			   viewCookie.setValue(value);
			   response.addCookie(viewCookie);
			   dto = dao.selectKin(Integer.parseInt(kNo), 0);
			} else {
			   dto = dao.selectKin(Integer.parseInt(kNo), 1);
			} 	
		}
		
		if(dto != null) {
			request.setAttribute("dto", dto);
			
			if(opt == null) {
				ArrayList<Kinreplie> list = dao2.selectRplList(Integer.parseInt(kNo));
				if(list != null) {
					request.setAttribute("list", list);
					System.out.println("�亯����Ʈ : " + list);
					request.getRequestDispatcher("kinItem.jsp").forward(request, response);
				} else {
					request.getRequestDispatcher("kinItem.jsp").forward(request, response);
				}
			} else if(opt.equals("update")) {
				request.getRequestDispatcher("kinUpdate.jsp").forward(request, response);
			}
		} else {
			request.setAttribute("message", "�Խñ� ��ȸ ����.");
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
	}
    
    /** 5.���� ��� */
    protected void kinEnroll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		HttpSession session = request.getSession(false);
		ServletContext application = getServletContext();
		int sizeLimit = 16 * 1024 * 1024;
		String savePath = application.getRealPath("images");
		
		MultipartRequest multi = new MultipartRequest(request, savePath, sizeLimit, "EUC-KR", new DefaultFileRenamePolicy());
		
		String kType = multi.getParameter("kType");
		String kTitle = multi.getParameter("kTitle");
		String kAuthor = "test";
//				(String)session.getAttribute("uId");
		String kContent = multi.getParameter("kContent");
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
		Kin dto = new Kin(0, kType, kTitle, "test", null, kContent,
				0, 0, 0, filePath1, filePath2, 0);
		
		
		if(kType != null && kTitle != null && kAuthor != null && kContent != null) {
			int row = 0;
			row = dao.insertKin(dto);
			
//			System.out.println(row);
			if(row == 1) {
				request.setAttribute("message", "������� ����.");
				response.sendRedirect("Kcontroller?action=kinList&pageNum=1");
			} else {
				request.setAttribute("message", "�Խñ� ��� ���� �߻�");
				request.getRequestDispatcher("error.jsp").forward(request, response);
			}
			
		} else {
			request.setAttribute("message", "�ʼ� �Է¶��� ä���ּ���");
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
	}
	
    /** 6.������ ���� */
    protected void kinUpdate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ServletContext application = getServletContext();
		int sizeLimit = 16 * 1024 * 1024;
		String savePath = application.getRealPath("images");
		MultipartRequest multi = new MultipartRequest(request, savePath, sizeLimit, "EUC-KR", new DefaultFileRenamePolicy());
		
		String kNo = multi.getParameter("kNo");
		String kTitle = multi.getParameter("kTitle");
		String kType = multi.getParameter("kType");
		String kContent = multi.getParameter("kContent");
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
		Kin dto = new Kin(Integer.parseInt(kNo), kType, kTitle, "test", null, kContent,
				0, 0, 0, filePath1, filePath2, 0);
		System.out.println("dto : " + dto);
		int row = dao.updateKin(dto);
		
		if(row == 1) {
			request.setAttribute("message", "�Խñ� ���� ����.");
			request.getRequestDispatcher("Kcontroller?action=kinList&pageNum=1").forward(request, response);	
		} else {
			request.setAttribute("message", "�Խñ� ���� ����.");
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
	}
    
    /** 7.���� ���� */
    protected void kinDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String kNo = request.getParameter("kNo");
		int row = dao.deleteKin(Integer.parseInt(kNo));
		if(row == 1) {
			request.setAttribute("message", "�Խñ� ���� ����.");
			request.getRequestDispatcher("Kcontroller?action=kinList&pageNum=1").forward(request, response);	
		} else {
			request.setAttribute("message", "�Խñ� ���� ����.");
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
	}
    
    /** 8.���� ��õ�� ���� */
    protected void kinRecommend(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
				System.out.println("VIEWCOOKIE ����");
				Cookie newCookie = new Cookie("VIEWCOOKIE","|"+kNo+"|"); //("VIEWCOOKIE"�� name, "|"+bbsno+"|" �� value ��. 
				response.addCookie(newCookie);
				int rows = dao.updateRecKin(Integer.parseInt(kNo));			
				if(rows == 1) {
					request.setAttribute("message", "��õ �Ϸ�");
					request.getRequestDispatcher("Kcontroller?action=kinSearch&kNo"+kNo).forward(request, response);
				} else {
					request.setAttribute("message", "��õ ����.");
					request.getRequestDispatcher("Kcontroller?action=kinSearch&kNo"+kNo).forward(request, response);
				}
			} else {
				System.out.println("VIEWCOOKIE ����");
				String value = viewCookie.getValue();
				  
				if(value.indexOf("|"+kNo+"|") <  0) { // �Է��� ��ȭ�� ��ġ�ϴ� ��ȣ�� ������ �߰��Ѵ�.
				   value = value+"|"+kNo+"|";
				   viewCookie.setValue(value);
				   response.addCookie(viewCookie);
				   int rows = dao.updateRecKin(Integer.parseInt(kNo));				
				   if(rows == 1) {
						request.setAttribute("message", "��õ �Ϸ�");
						request.getRequestDispatcher("Kcontroller?action=kinSearch&kNo"+kNo).forward(request, response);
				   } else {
						request.setAttribute("message", "��õ ����.");
						request.getRequestDispatcher("Kcontroller?action=kinSearch&kNo"+kNo).forward(request, response);
				   }
				} else {
					request.setAttribute("message", "��õ �ߺ��� �Ұ����մϴ�.");
					request.getRequestDispatcher("Kcontroller?action=kinSearch&kNo"+kNo).forward(request, response);
				} 	
			}
		} else {
			request.setAttribute("message", "��õ ����. �α��� �� �ٽ� �õ����ּ���.");
			request.getRequestDispatcher("Kcontroller?action=kinSearch&kNo"+kNo).forward(request, response);
		}
	}
    

    protected void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		System.out.println("action : "+ action);
		
		switch(action) {
		case "kinList":
			kinList(request,response);
			break;
		case "kinListByType":
			kinListByType(request,response);
			break;
		case "kinListSearch":
			kinListSearch(request,response);
			break;
		case "kinSearch":
			kinSearch(request,response);
			break;
		case "kinEnroll":
			kinEnroll(request,response);
			break;
		case "kinUpdate":
			kinUpdate(request,response);
			break;
		case "kinDelete":
			kinDelete(request,response);
			break;
		case "kinRecommend":
			kinRecommend(request,response);
			break;
		default:
			break;
		}
	}
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("EUC-KR");
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
