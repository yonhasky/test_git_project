package work.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
		if (session != null && session.getAttribute("id") != null) {
			int stNo = 0;
			String stTitle = request.getParameter("stTitle");
			String stAuthor = (String) session.getAttribute("id");
			String stDate = "";
			String stPeriod1 = request.getParameter("stYaer1") + "-";
			stPeriod1 += request.getParameter("stMonth1") + "-";
			stPeriod1 += request.getParameter("stDay1");

			String stPeriod2 = request.getParameter("stYaer1") + "-";
			stPeriod2 += request.getParameter("stMonth1") + "-";
			stPeriod2 += request.getParameter("stDay1");

			String stPeriod = stPeriod1 + " ~ " + stPeriod2;

			String stOverview = request.getParameter("stOverview");
			String stContent = request.getParameter("stContent");
			String stFile1 = request.getParameter("stFile1");
			String stFile2 = request.getParameter("stFile2");
			int stHit = 0;
			String stStatus = "A";
			Study dto = new Study(stNo, stTitle, stAuthor, stDate, stPeriod, stOverview, stContent, stFile1, stFile2,
					stHit, stStatus, 0);
			
			if(service.insertStudy(dto) == 1) {
				response.sendRedirect("StudyController?action=searchStudyList");
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
    	
    }
    
    protected void searchStudyList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	HttpSession session = request.getSession();
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
		process(request, response);
	}

}
