package work.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import work.model.dto.Note;
import work.model.dto.Study;
import work.model.dto.StudyMatch;
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
		int sizeLimit = 64 * 1024 * 1024;
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
				request.setAttribute("message", "���͵� ��� �� ������ �߻��Ͽ����ϴ�. �ٽ� �õ����ּ���.");
	    		request.getRequestDispatcher("error.jsp").forward(request, response);
			}
		} else {
			request.setAttribute("message", "�α��� �� �̿� �ٶ��ϴ�.");
    		request.getRequestDispatcher("error.jsp").forward(request, response);
		}
    }
    
    protected void removeStudy(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String stNo = request.getParameter("stNo");
    	if(service.deleteStudy(stNo)==1) {
    		request.setAttribute("message","���͵� �����Ǿ����ϴ�.");
    		request.getRequestDispatcher("StudyController?action=searchStudyList&pageNum=1").forward(request, response);
    	} else {
    		request.setAttribute("message", "���͵� ������ �����߽��ϴ�. �ٽ� �õ����ּ���.");
    		request.getRequestDispatcher("error.jsp").forward(request, response);
    	}
 
    }
    
    protected void modifyStudy(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ServletContext application = getServletContext();
		int sizeLimit = 16 * 1024 * 1024;
		String savePath = application.getRealPath("uploadimages");
		
		MultipartRequest multi = new MultipartRequest(request, savePath, sizeLimit, "euc-kr", new DefaultFileRenamePolicy());
		
		String stNo = multi.getParameter("stno");
		String stTitle = multi.getParameter("stTitle");
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
		String stStatus = "A";
    
    	
    	if(service.updateStudy(stPeriod, stTitle, stOverview, stContent, filePath1, filePath2, stStatus, stNo) == 1) {
    		request.setAttribute("message", "������ �Ϸ�Ǿ����ϴ�.");
    		request.getRequestDispatcher("StudyController?action=searchStudy&stNo="+stNo).forward(request, response);
    	} else {
    		request.setAttribute("message", "���� �� ������ �߻��߽��ϴ�. �ٽ� �õ����ּ���.");
    		request.getRequestDispatcher("error.jsp").forward(request, response);
    	}
    }
    
    protected void searchStudy(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	HttpSession session = request.getSession(false);
    	if(session != null && session.getAttribute("id") != null) {
    		String stNo = request.getParameter("stNo");
    		String opt = request.getParameter("opt");
    		
    		ArrayList list = service.selectStudy(stNo);
   
    		if(list != null && opt == null) {
    			request.setAttribute("list", list);
    			request.getRequestDispatcher("studyDetail.jsp").forward(request, response);
    		} else if(list != null & opt.equals("update")) {
    			request.setAttribute("list", list);
    			request.getRequestDispatcher("studyUpdate.jsp").forward(request, response);
       		} else {

    			request.setAttribute("message", "���͵� ��ȸ �� ������ �߻��Ͽ����ϴ�. �ٽ� �õ����ּ���.");
	    		request.getRequestDispatcher("error.jsp").forward(request, response);
    		}
    	}
    }
    
    protected void searchStudyList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	HttpSession session = request.getSession(false);
    	if(session != null && session.getAttribute("id") != null) {
    		String pageNum = request.getParameter("pageNum");
    		System.out.println("pageNum : "+pageNum);
    		ArrayList<Study> list = service.selectStudyList(pageNum);
    		request.setAttribute("list", list);
    		request.getRequestDispatcher("studyList.jsp").forward(request, response);
    	} else {
    		request.setAttribute("message", "�α��� �� �̿� �ٶ��ϴ�.");
    		request.getRequestDispatcher("error.jsp").forward(request, response);
    	}
    }
    protected void searchKeywordList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	HttpSession session = request.getSession(false);
    	String keyword = request.getParameter("keyword");
    	String type = request.getParameter("type");
    	
    	if(session != null && session.getAttribute("id") != null) {
    		String pageNum = request.getParameter("pageNum");
    		ArrayList<Study> list = service.selectKeywordList(pageNum, type, keyword);
    		
    		request.setAttribute("list", list);
    		request.getRequestDispatcher("studyList.jsp").forward(request, response);
    	} else {
    		request.setAttribute("message", "�α��� �� �̿� �ٶ��ϴ�.");
    		request.getRequestDispatcher("error.jsp").forward(request, response);
    	}
    }
    
    protected void addStudyMatch(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String stNo = request.getParameter("stNo");
    	String stmTitle = request.getParameter("stmTitle");
    	String stmHost = request.getParameter("stmHost");
    	String stmEntry = request.getParameter("stmEntry");
    	String stmEntryComment = request.getParameter("stmEntryComment");
    	String stmEntryDate = null;
    	String stmEntryStatus = "W";
    	
    	StudyMatch dto = new StudyMatch(0, stmHost, stmEntry, stmEntryComment, stmEntryDate, stmEntryStatus);
    	int rows = service.addStudyMatch(dto, stNo, stmTitle);
    	if(rows == 1) {
    		request.setAttribute("message", "���͵� ��û�� �Ϸ�Ǿ����ϴ�");
    		request.getRequestDispatcher("StudyController?action=searchStudy&stNo="+stNo).forward(request, response);
    	} else if(rows == 2) {
    		request.setAttribute("message", "������ ���͵� �ߺ� ��û �Ұ����մϴ�.");
    		request.getRequestDispatcher("StudyController?action=searchStudy&stNo="+stNo).forward(request, response);
    	} else {
    		request.setAttribute("message", "���͵� ����� ������ �߻��߽��ϴ�.");
    		request.getRequestDispatcher("error.jsp").forward(request, response);
    	}
    }
    
    protected void sendNote(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	 int nNo = 0;
    	 String stNo = request.getParameter("stNo");
    	 String nSender = request.getParameter("nSender").substring(0, request.getParameter("nSender").indexOf('['));
    	 String nReciever = request.getParameter("nReciever").substring(0, request.getParameter("nReciever").indexOf('['));
    	 String nTitle = request.getParameter("nTitle");
    	 String nContent = request.getParameter("nContent");
    	 String nDate = "";
    	 String nStatus = "F";
    	 
    	 Note dto = new Note(nNo, nSender, nReciever, nTitle, nContent, nDate, nStatus);
    	 if(service.sendNote(dto) == 1) {
    		request.setAttribute("message", "���� ������ �Ϸ�Ǿ����ϴ�.");
     		request.getRequestDispatcher("StudyController?action=searchStudy&stNo="+stNo).forward(request, response);
    	 } else {
    		request.setAttribute("message", "���� ���ۿ� ������ �߻��߽��ϴ�. �ٽ� �õ����ּ���.");
      		request.getRequestDispatcher("StudyController?action=searchStudy&stNo="+stNo).forward(request, response);
    	 }
    }
    
    protected void updateStatus(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String status = request.getParameter("status");
    	String stNo = request.getParameter("stNo");
    	String stmEntry = request.getParameter("stmEntry");
    	stmEntry = new String(stmEntry.getBytes("8859_1"),"euc-kr");

    	String stTitle = request.getParameter("stTitle");
    	stTitle = new String(stTitle.getBytes("8859_1"),"euc-kr");

    	if(service.updateStatus(status, stNo, stmEntry, stTitle) == 1) {
    		request.setAttribute("message", "���͵� ��û ����/������ �Ϸ�Ǿ����ϴ�.");
     		request.getRequestDispatcher("StudyController?action=searchStudy&stNo="+stNo).forward(request, response);
    	} else {
    		request.setAttribute("message", "����Ƽ ��û ����/������ ������ �߻��߽��ϴ�. �ٽ� �õ����ּ���.");
      		request.getRequestDispatcher("StudyController?action=searchStudy&stNo="+stNo).forward(request, response);
    	}
    }
    
    protected void searchNoteList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	HttpSession session = request.getSession(false);
    	String receiver = (String)session.getAttribute("id");
    	
    	ArrayList<Note> list = service.searchNoteList(receiver);
    	System.out.println("list : " + list);
    	if(session != null && session.getAttribute("id") != null) {
    		if(list != null) {
	    		request.setAttribute("list", list);
	    		request.getRequestDispatcher("noteList.jsp").forward(request, response);
    		} 
    	}
    }
    protected void fileDown(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    		String path = request.getParameter("path");
    		String folder = path.substring(0,path.indexOf('\\'));
    		String fileName = path.substring(path.indexOf('\\')+1,path.length());
    		
    		ServletContext context = getServletContext(); // ������ ���� ȯ�������� ������
    		  
    		  // ���� ������ ����Ǿ� �ִ� ������ ���
    		String realFolder = context.getRealPath(folder);
    		  // �ٿ���� ������ ��ü ��θ� filePath�� ����
    		String filePath = realFolder + "\\" + fileName;
    		  try{
    			   // �ٿ���� ������ �ҷ���
    			   File file = new File(filePath);
    			   byte b[] = new byte[4096];
    			   
    			   // page�� ContentType���� �������� �ٲٱ� ���� �ʱ�ȭ��Ŵ
    			   response.reset();
    			   response.setContentType("application/octet-stream");
    			   
    			   // �ѱ� ���ڵ�
    			   String Encoding = new String(fileName.getBytes("UTF-8"), "8859_1");
    			   // ���� ��ũ�� Ŭ������ �� �ٿ�ε� ���� ȭ���� ��µǰ� ó���ϴ� �κ�
    			   response.setHeader("Content-Disposition", "attachment; filename = " + Encoding);
    			  
    			   // ������ ���� ������ �о���� ���ؼ� ����
    			   FileInputStream in = new FileInputStream(filePath);
    			  
    			   // ���Ͽ��� �о�� ���� ������ �����ϴ� ���Ͽ� ���ֱ� ���ؼ� ����
    			   ServletOutputStream out2 = response.getOutputStream();
    			   
    			   int numRead;
    			   // ����Ʈ �迭 b�� 0�� ���� numRead�� ���� ���Ͽ� ���� (���)
    			   while((numRead = in.read(b, 0, b.length)) != -1){
    			    out2.write(b, 0, numRead);
    			   }
    			   
    			   out2.flush();
    			   out2.close();
    			   in.close();
    			   
    			  } catch(Exception e){
    			  }
    		// �ٿ���� ������ ����Ǿ� �ִ� ���� �̸�
    		
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
    	case "addStudyMatch":
    		addStudyMatch(request, response);
    		break;
    	case "sendNote":
    		sendNote(request, response);
    		break;
    	case "searchKeywordList":
    		searchKeywordList(request, response);
    		break;
    	case "updateStatus":
    		updateStatus(request, response);
    		break;
    	case "searchNoteList":
    		searchNoteList(request, response);
    		break;
    	case "fileDown":
    		fileDown(request, response);
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
