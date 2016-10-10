package work.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import work.model.dto.Study;
import work.model.service.StudyService;

/**
 * Servlet implementation class StudyController
 */
public class StudyController extends HttpServlet {
	private StudyService service = new StudyService();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StudyController() { }
    
	protected void addStudy(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		
		ServletContext application = getServletContext();
		int sizeLimit = 16 * 1024 * 1024;
		String savePath = application.getRealPath("uploadimages");
		
		MultipartRequest multi = new MultipartRequest(request, savePath, sizeLimit, "euc-kr", new DefaultFileRenamePolicy());
	
		if (session != null && session.getAttribute("id") != null) {
			int stNo = 0;
			String stTitle = multi.getParameter("stTitle");
			String stAuthor = (String)session.getAttribute("id")+"["+(String) session.getAttribute("name")+"]";
			String stDate = "";
			String stPeriod1 = multi.getParameter("stYear1") + "-";
			stPeriod1 += multi.getParameter("stMonth1") + "-";
			stPeriod1 += multi.getParameter("stDay1");

			String stPeriod2 = multi.getParameter("stYear2") + "-";
			stPeriod2 += multi.getParameter("stMonth2") + "-";
			stPeriod2 += multi.getParameter("stDay2");
			
			String stPeriod = stPeriod1 + " ~ " + stPeriod2;

			String stOverview = multi.getParameter("stOverview");
			String stContent = multi.getParameter("stContent");
			String stFile1 = multi.getFilesystemName("stFile1");
			String stFile2 = multi.getFilesystemName("stFile2");
			String filePath1 = null;
			String filePath2 = null;
			
			if(stFile1 != null) {
				filePath1 = "uploadimages"+"\\"+stFile1;
			} 
			if(stFile2 != null) {
				filePath2 = "uploadimages"+"\\"+stFile2;
			}
			
			int stHit = 0;
			String stStatus = "A";
			Study dto = new Study(stNo, stTitle, stAuthor, stDate, stPeriod, stOverview, stContent, filePath1, filePath2,
					stHit, stStatus, 0);
			
			if(service.insertStudy(dto) == 1) {
				response.sendRedirect("StudyController?action=searchStudyList&pageNum=1");
			} else {
				request.setAttribute("message", "스터디 등록 중 오류가 발생하였습니다. 다시 시도해주세요.");
	    		request.getRequestDispatcher("error.jsp").forward(request, response);
			}
		} else {
			request.setAttribute("message", "로그인 후 이용 바랍니다.");
    		request.getRequestDispatcher("error.jsp").forward(request, response);
		}
    }
    
    protected void removeStudy(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    }
    
    protected void modifyStudy(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    }
    
    protected void searchStudy(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	HttpSession session = request.getSession(false);
    	if(session != null && session.getAttribute("id") != null) {
    		String stNo = request.getParameter("stNo");
    		ArrayList list = service.selectStudy(stNo);
   
    		if(list != null) {
    			request.setAttribute("list", list);
    			request.getRequestDispatcher("studyDetail.jsp").forward(request, response);
    		} else {
    			request.setAttribute("message", "스터디 조회 중 오류가 발생하였습니다. 다시 시도해주세요.");
	    		request.getRequestDispatcher("error.jsp").forward(request, response);
    		}
    	}
    }
    
    protected void searchStudyList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	HttpSession session = request.getSession(false);
    	if(session != null && session.getAttribute("id") != null) {
    		String pageNum = request.getParameter("pageNum");
    		ArrayList<Study> list = service.selectStudyList(pageNum);
    		request.setAttribute("list", list);
    		request.getRequestDispatcher("studyList.jsp").forward(request, response);
    	} else {
    		request.setAttribute("message", "로그인 후 이용 바랍니다.");
    		request.getRequestDispatcher("error.jsp").forward(request, response);
    	}
    }
    
    
    protected void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String action = request.getParameter("action");
    	System.out.println("action : " + action);
    	
    	switch(action) {
    	case "addStudy":
    		addStudy(request, response);
    		break;
    	case "removeStudy":
    		removeStudy(request, response);
    		break;
    	case "modifyStudy":
    		modifyStudy(request, response);
    		break;
    	case "searchStudy":
    		searchStudy(request, response);
    		break;
    	case "searchStudyList":
    		searchStudyList(request, response);
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
		process(request, response);
	}

}
