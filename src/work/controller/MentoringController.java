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

import work.model.dto.Mentoring;
import work.model.dto.Student;
import work.model.service.MentoringService;

/**
 * Servlet implementation class MentotingController
 */
public class MentoringController extends HttpServlet {
	private MentoringService mentoringService = new MentoringService();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MentoringController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * ���丵 ��û
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void mentoringInsert(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		int mNo = 0;
		String mHost = request.getParameter("id");
		String mEntry = request.getParameter("mEntry");
		String mName = request.getParameter("mName");
		String mMajor = request.getParameter("mMajor");
		String mGrade = request.getParameter("mGrade");
		String mComment = request.getParameter("mComment");
		String mDate = request.getParameter("mDate");
		String mStatus = "��û";

		if (mComment == null || mComment.trim().length() == 0) {
			request.setAttribute("message", "������ ����� �Է��� �ּ���");
			request.getRequestDispatcher("loginError.jsp").forward(request,
					response);
		} else {
			// Model ��û�Ƿ�
			Mentoring dto = new Mentoring(mNo, mHost, mEntry, mName, mMajor,
					mGrade, mComment, mDate, mStatus);
			int insert = mentoringService.Mentoringinsert(dto);
			// ��û����޾Ƽ� �������� ����
			if (insert != 0) {
				// �����������̵�:����
				request.setAttribute("insert", insert);
				request.getRequestDispatcher(
						"controller?action=graduationDetail&id=" + mHost)
						.forward(request, response);
			} else {
				// �����������̵�:����
				// �α��� ����-> HttpSession ���� ���� ����
				StringBuilder error = new StringBuilder();
				error.append("���� ������ �ٽ� Ȯ�ιٶ��ϴ�");
				error.append("<br>");
				error.append("ȸ�� ��� ������ �߸��Է��ϼ̽��ϴ�.");

				request.setAttribute("message", "ȸ������ ������ �������մϴ�.");
				request.getRequestDispatcher("loginError.jsp").forward(request,
						response);
			}
			// �����������̵�: ����, ����, ��Ÿ
		}
	}

	/**
	 * ȸ�� ����ȸ
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void mentoringDetail(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		int mNo = Integer.parseInt(request.getParameter("mNo"));

		if (mNo == 0) {
			request.setAttribute("message", "�α��� �� �����");
			request.getRequestDispatcher("loginError.jsp").forward(request,
					response);
		}

		Mentoring dto = mentoringService.mentroingSelectOne(mNo);

		request.setAttribute("dto", dto);
		request.getRequestDispatcher("mentoringUpdate.jsp").forward(request,
				response);

	}

	/**
	 * ȸ�� - ȸ����������
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void mentoringUpdate(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		int mNo = Integer.parseInt(request.getParameter("mNo"));
		String mHost = request.getParameter("id");
		String mEntry = request.getParameter("mEntry");
		String mName = request.getParameter("mName");
		String mMajor = request.getParameter("mMajor");
		String mGrade = request.getParameter("mGrade");
		String mComment = request.getParameter("mComment");
		String mDate = request.getParameter("mDate");
		String mStatus = request.getParameter("mStatus");

		if (mComment == null || mComment.trim().length() == 0) {
			request.setAttribute("message", "ȸ�������� ����� �Է����ּ���");
			request.getRequestDispatcher("joinError.jsp").forward(request,
					response);
		} else {
			Mentoring dto = new Mentoring(mNo, mHost, mEntry, mName, mMajor,
					mGrade, mComment, mDate, mStatus);
			int updateStudent = mentoringService.boardupdateUser(dto);

			if (updateStudent != 0) {
				// �����������̵�:����
				request.getRequestDispatcher(
						"controller?action=graduationDetail&id=" + mHost)
						.forward(request, response);
			} else {
				// �����������̵�:����
				// �α��� ����-> HttpSession ���� ���� ����
				StringBuilder error = new StringBuilder();
				error.append("���� ������ �ٽ� Ȯ�ιٶ��ϴ�");
				error.append("<br>");
				error.append("ȸ�� ��� ������ �߸��Է��ϼ̽��ϴ�.");

				request.setAttribute("message", "ȸ������ ������ �������մϴ�.");
				request.getRequestDispatcher("joinError.jsp").forward(request,
						response);
			}
		}
	}

	/**
	 * ȸ�� - ȸ����������
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void mentoringAccept(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);

		int mNo = Integer.parseInt(request.getParameter("mNo"));
		String mHost = (String) session.getAttribute("id");
		if (session.getAttribute("part").equals("G")) {

			int updateStudent = mentoringService.mentoringAccept(mNo);

			if (updateStudent != 0) {
				// �����������̵�:����
				request.getRequestDispatcher(
						"controller?action=graduationDetail&id=" + mHost)
						.forward(request, response);
			} else {
				request.setAttribute("message", "ȸ������ ������ �������մϴ�.");
				request.getRequestDispatcher("joinError.jsp").forward(request,
						response);
			}
		} else {
			// �����������̵�:����
			// �α��� ����-> HttpSession ���� ���� ����
			StringBuilder error = new StringBuilder();
			error.append("���� ������ �ٽ� Ȯ�ιٶ��ϴ�");
			error.append("<br>");
			error.append("ȸ�� ��� ������ �߸��Է��ϼ̽��ϴ�.");

			request.setAttribute("message", "ȸ������ ������ �������մϴ�.");
			request.getRequestDispatcher("joinError.jsp").forward(request,
					response);
		}
	}

	/**
	 * ���丵 ���� 1.ȸ�� ������ ����
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void mentoringDelete(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession(false);

		String id = (String) session.getAttribute("id");
		String mEntry = request.getParameter("mEntry");
		int mNo = Integer.parseInt(request.getParameter("mNo"));
		String mHost = request.getParameter("mHost");

		if (session.getAttribute("id").equals(mEntry)) {
			int delete = mentoringService.deleteMentoring(mNo);

			if (delete != 0) {
				// �����������̵�:����
				request.getRequestDispatcher(
						"controller?action=graduationDetail&id=" + mHost)
						.forward(request, response);
			} else {
				// �����������̵�:����
				// �α��� ����-> HttpSession ���� ���� ����
				StringBuilder error = new StringBuilder();
				error.append("��й�ȣ�� �ٽ� Ȯ�ιٶ��ϴ�");
				error.append("<br>");
				error.append("��й�ȣ�� �߸��Է��ϼ̽��ϴ�.");

				request.setAttribute("message", "��й�ȣ ������ �������մϴ�.");
				request.getRequestDispatcher("userInputError.jsp").forward(
						request, response);
			}

		} else {
			// �����������̵�:����
			// �α��� ����-> HttpSession ���� ���� ����
			StringBuilder error = new StringBuilder();
			error.append("��й�ȣ�� �ٽ� Ȯ�ιٶ��ϴ�");
			error.append("<br>");
			error.append("��й�ȣ�� �߸��Է��ϼ̽��ϴ�.");

			request.setAttribute("message", error.toString());
			request.getRequestDispatcher("userDropError.jsp").forward(request,
					response);
		}
		// �����������̵�: ����, ����, ��Ÿ
	}

	/**
	 * ���丵���� 2 ������ ���丵����
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void mentoringDelete2(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession(false);
		int mNo = Integer.parseInt(request.getParameter("mNo"));

		if (session.getAttribute("part").equals("A")) {
			int delete = mentoringService.deleteMentoring(mNo);

			if (delete != 0) {
				// �����������̵�:����
				request.getRequestDispatcher(
						"MentoringController?action=mentoringList").forward(
						request, response);
			} else {
				// �����������̵�:����
				// �α��� ����-> HttpSession ���� ���� ����
				StringBuilder error = new StringBuilder();
				error.append("��й�ȣ�� �ٽ� Ȯ�ιٶ��ϴ�");
				error.append("<br>");
				error.append("��й�ȣ�� �߸��Է��ϼ̽��ϴ�.");

				request.setAttribute("message", "��й�ȣ ������ �������մϴ�.");
				request.getRequestDispatcher("userInputError.jsp").forward(
						request, response);
			}

		} else {
			// �����������̵�:����
			// �α��� ����-> HttpSession ���� ���� ����
			StringBuilder error = new StringBuilder();
			error.append("��й�ȣ�� �ٽ� Ȯ�ιٶ��ϴ�");
			error.append("<br>");
			error.append("��й�ȣ�� �߸��Է��ϼ̽��ϴ�.");

			request.setAttribute("message", error.toString());
			request.getRequestDispatcher("userDropError.jsp").forward(request,
					response);
		}
		// �����������̵�: ����, ����, ��Ÿ
	}

	/**
	 * ȸ�� �ڽ��� ���丵 ��ȸ
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void myMentoring(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession(false);
		String id = (String) session.getAttribute("id");

		if (session != null && session.getAttribute("id") != null) {
			if(session.getAttribute("part").equals("G")){
				ArrayList<Mentoring> list = mentoringService.memtoringSelectList(id);
				request.setAttribute("list", list);	
				request.getRequestDispatcher("myMentoring.jsp").forward(request,
						response);
			}else if(session.getAttribute("part").equals("s")){
			
			ArrayList<Mentoring> list = mentoringService.myList(id);

			request.setAttribute("list", list);
			request.getRequestDispatcher("myMentoring.jsp").forward(request,
					response);
		} else {
			request.setAttribute("message", "���ٱ����� �����մϴ�");
			request.getRequestDispatcher("loginError.jsp").forward(request,
					response);

		}

	}
	}

	/**
	 * ������ - ���丵����Ʈ ��ȸ
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void mentoringList(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession(false);

		if (session != null && session.getAttribute("id") != null) {
			if (session != null && session.getAttribute("part").equals("A")) {
				ArrayList<Mentoring> list = mentoringService
						.memtoringSelectList();

				request.setAttribute("list", list);
				request.getRequestDispatcher("admMentoringList.jsp").forward(
						request, response);

			} else {
				request.setAttribute("message", "���ٱ����� �����մϴ�");
				request.getRequestDispatcher("loginError.jsp").forward(request,
						response);
			}
		} else {
			request.setAttribute("message", "���ٱ����� �����մϴ�");
			request.getRequestDispatcher("loginError.jsp").forward(request,
					response);
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
		if (action != null) {
			switch (action) {
			case "mentoringInsert":
				mentoringInsert(request, response);
				break;
			case "mentoringDetail":
				System.out.println("gg");
				mentoringDetail(request, response);
				break;
			case "mentoringUpdate":
				mentoringUpdate(request, response);
				break;
			case "mentoringDelete":
				mentoringDelete(request, response);
				break;
			case "myMentoring":
				myMentoring(request, response);
				break;
			case "mentoringList":
				mentoringList(request, response);
				break;
			case "mentoringDelete2":
				mentoringDelete2(request, response);
				break;
			case "mentoringAccept":
				mentoringAccept(request, response);
				break;
			default:
				break;
			// �������� �ʴ� ��û ����

			}

		} else {
			// �߸��� ��û��� ���� ������ �̵�
		}

	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("euc-kr");

		process(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("euc-kr");

		process(request, response);
	}

}
