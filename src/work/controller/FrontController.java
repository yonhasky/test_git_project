package work.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import work.model.dto.Mentoring;
import work.model.dto.Student;
import work.model.service.MentoringService;
import work.model.service.StudentService;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class FrontController
 */
@WebServlet("/Controller")
public class FrontController extends HttpServlet {

	private MentoringService mentoringService = new MentoringService();
	private StudentService studentService = new StudentService();

	/**
	 * ������ ȸ������
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void gJoin(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		ServletContext application = getServletContext();

		int sizeLimit = 16 * 1024 * 1024;
		String savePath = application.getRealPath("img");

		MultipartRequest multi = new MultipartRequest(request, savePath,
				sizeLimit, "euc-kr", new DefaultFileRenamePolicy());

		String id = multi.getParameter("id");
		String pw = multi.getParameter("pwConfirm");
		String name = multi.getParameter("name");
		String mobile1 = multi.getParameter("mobile1");
		String mobile2 = multi.getParameter("mobile2");
		String mobile3 = multi.getParameter("mobile3");
		String mobile = mobile1 + "-" + mobile2 + "-" + mobile3;
		String email1 = multi.getParameter("email1");
		String email2 = multi.getParameter("email2");
		String email = email1 + email2;
		String gender = multi.getParameter("gender");
		int birth = Integer.parseInt(multi.getParameter("birth"));
		String major = multi.getParameter("second");
		String division = multi.getParameter("third");
		String grade = multi.getParameter("grade")+"�й�";
		String img = multi.getFilesystemName("img");
		String gDate1 = multi.getParameter("gDate1");
		String gDate2 = multi.getParameter("gDate2");
		String gDate = gDate1 + "��" + gDate2 + "�� ����";
		String company = multi.getParameter("company");
		String job = multi.getParameter("job");
		String career1 = multi.getParameter("career1");
		String career2 = multi.getParameter("career2");
		String career = career1 + "��" + career2+ "����";
		String part = "G";
		
		if(gender.equals("M")){
			gender = "����";
		}else if(gender.equals("F")){
			gender = "����";
		}
		

		if (img != null) {
			img = "img" + "\\" + img;
		}else {
			img = "img/default.jpg";   //���� �̼��ý� �⺻����
		}
		if (id == null || id.trim().length() == 0 || pw == null
				|| pw.trim().length() == 0 || name == null
				|| name.trim().length() == 0 || mobile == null
				|| mobile.trim().length() == 0 || email == null
				|| email.trim().length() == 0 || gender == null) {
			request.setAttribute("message", "������ ����� �Է��� �ּ���");
			request.getRequestDispatcher("loginError.jsp").forward(request,
					response);
		} else {
			// Model ��û�Ƿ�
			Student dto = new Student(id, pw, name, mobile, email, birth,
					gender, major, division, grade, img, gDate, company, job,
					career, part);
			int insert = studentService.StudentInsert(dto);
			// ��û����޾Ƽ� �������� ����
			if (insert != 0) {
				// �����������̵�:����
				request.setAttribute("insert", insert);
				request.getRequestDispatcher("index.jsp").forward(request,
						response);
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
	 * ���л� ȸ������
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void sJoin(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		ServletContext application = getServletContext();

		int sizeLimit = 16 * 1024 * 1024;
		String savePath = application.getRealPath("img");

		MultipartRequest multi = new MultipartRequest(request, savePath,
				sizeLimit, "euc-kr", new DefaultFileRenamePolicy());

		String id = multi.getParameter("id");
		String pw = multi.getParameter("pwConfirm");
		String name = multi.getParameter("name");
		String mobile1 = multi.getParameter("mobile1");
		String mobile2 = multi.getParameter("mobile2");
		String mobile3 = multi.getParameter("mobile3");
		String mobile = mobile1 + "-" + mobile2 + "-" + mobile3;
		String email1 = multi.getParameter("email1");
		String email2 = multi.getParameter("email2");
		String email = email1 + email2;
		String gender = multi.getParameter("gender");
		int birth = Integer.parseInt(multi.getParameter("birth"));
		String major = multi.getParameter("second");
		String division = multi.getParameter("third");
		String grade = multi.getParameter("grade")+"�й�";
		String img = multi.getFilesystemName("img");
		String part = "S";
		String gDate = null;
		String company = null;
		String job = null;
		String career = null;
		
		if(gender.equals("M")){
			gender = "����";
		}else if(gender.equals("F")){
			gender = "����";
		}
		
		if (img != null) {
			img = "img" + "\\" + img;
		}else {
			img = "img/default.jpg";   //���� �̼��ý� �⺻����
		}

		if (id == null || id.trim().length() == 0 || pw == null
				|| pw.trim().length() == 0 || name == null
				|| name.trim().length() == 0 || mobile == null
				|| mobile.trim().length() == 0 || email == null
				|| email.trim().length() == 0 || gender == null
				|| major == null) {
			request.setAttribute("message", "������ ����� �Է��� �ּ���");
			request.getRequestDispatcher("loginError.jsp").forward(request,
					response);
		} else {
			// Model ��û�Ƿ�
			Student dto = new Student(id, pw, name, mobile, email, birth,
					gender, major, division, grade, img, gDate, company, job,
					career, part);
			int insert = studentService.StudentInsert(dto);
			// ��û����޾Ƽ� �������� ����
			if (insert != 0) {
				// �����������̵�:����
				request.setAttribute("insert", insert);
				request.getRequestDispatcher("index.jsp").forward(request,
						response);
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

	/**
	 * ��й�ȣ üũ
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void pwCheck(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String responseDataType = request.getParameter("responseDataType");

		switch (responseDataType) {

		case "json":
			responseJson2(request, response);
			break;

		default:
			request.setAttribute("message", "�������� �ʴ� ���� ������ �����Դϴ�.");
			request.getRequestDispatcher("error.jsp")
					.forward(request, response);
		}
	}

	/**
	 * pwCheck ���� ������ : json ���� ó�� �޼��� json : {"valid","true"}
	 */
	protected void responseJson2(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// ��û ������ ���̵� ��������
		HttpSession session = request.getSession(false);

		String id = (String) session.getAttribute("id");
		String pw = request.getParameter("pw");
		
		PrintWriter out = response.getWriter();
		response.setContentType("text/plain");
		response.setHeader("Cache-Control", "no-cache");

		if (pw != null && pw.trim().length() > 0) {

			if (studentService.isPw(id, pw)) {
				out.write("{'valid':'true'}");
			} else {
				out.write("{'valid':'false'}");
			}

		} else {
			out.write("{'valid':'required'}");
		}
	}

	/**
	 * ��й�ȣ üũ(ȸ������)
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void pwCheckDelete(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String responseDataType = request.getParameter("responseDataType");

		switch (responseDataType) {

		case "json":
			responseJson3(request, response);
			break;

		default:
			request.setAttribute("message", "�������� �ʴ� ���� ������ �����Դϴ�.");
			request.getRequestDispatcher("error.jsp")
					.forward(request, response);
		}
	}

	/**
	 * pwCheck ���� ������ : json ���� ó�� �޼��� json : {"valid","true"}
	 */
	protected void responseJson3(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// ��û ������ ���̵� ��������
		HttpSession session = request.getSession(false);

		String id = (String) session.getAttribute("id");
		String pw = request.getParameter("pwDelete");

		PrintWriter out = response.getWriter();
		response.setContentType("text/plain");
		response.setHeader("Cache-Control", "no-cache");

		if (pw != null && pw.trim().length() > 0) {

			if (studentService.isPw(id, pw)) {
				out.write("{'valid':'true'}");
			} else {
				out.write("{'valid':'false'}");
			}

		} else {
			out.write("{'valid':'required'}");
		}
	}

	/**
	 * �α��� ��û ���� �޼ҵ�
	 * 
	 * @throws IOException
	 * @throws ServletException
	 */
	protected void login(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// ��û������ ���� : �α��� ��û view login.jsp
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		// ��û������ ���� : �ʼ��׸�
		// ���Է½� ���������� �̵� ó��
		if (id == null || id.trim().length() == 0 || pw == null
				|| pw.trim().length() == 0) {
			request.setAttribute("message", "���̵�� ��й�ȣ�� �Է����ּ���");

			RequestDispatcher nextView = request
					.getRequestDispatcher("loginError.jsp");
			nextView.forward(request, response);
		}

		// Model ��û�Ƿ�
		HashMap<String, String> loginMap = studentService.login(id, pw);
		// ��û����޾Ƽ� �������� ����
		if (loginMap != null) {
			// �����������̵�:����
			request.setAttribute("loginMap", loginMap);

			HttpSession session = request.getSession(true);
			session.setAttribute("id", id);
			session.setAttribute("pw", pw);
			session.setAttribute("name", loginMap.get("name"));
			session.setAttribute("grade", loginMap.get("grade"));
			session.setAttribute("major", loginMap.get("major"));
			session.setAttribute("part", loginMap.get("part"));

			if (session.getAttribute("part").equals("A")) {
				request.getRequestDispatcher("index.jsp").forward(request,
						response);

			} else {
				request.getRequestDispatcher("index.jsp").forward(request,
						response);
			}

		} else {
			// �����������̵�:����
			// �α��� ����-> HttpSession ���� ���� ����
			StringBuilder error = new StringBuilder();
	
			request.setAttribute("message", "�α��� ������ �������մϴ�.");
			request.getRequestDispatcher("errorLogin.jsp").forward(request,
					response);

		}
		// �����������̵�: ����, ����, ��Ÿ
	}

	/**
	 * ȸ�� �ڽ� ���� ��ȸ
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */

	protected void studentInfo(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);

		String id = (String) session.getAttribute("id");

		if (session == null || id == null) {
			request.setAttribute("message", "�α��� �� �����");
			request.getRequestDispatcher("studentUpdate.jsp").forward(request,
					response);
		}

		Student dto = studentService.selectOne(id);

		request.setAttribute("dto", dto);

		request.getRequestDispatcher("studentUpdate.jsp").forward(request,
				response);
		;
	}

	/**
	 * ȸ�� ��ü ��ȸ
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void studentList(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession(false);
		if (session != null && session.getAttribute("id") != null) {
			if (session.getAttribute("part").equals("A")) {
				ArrayList<Student> list = studentService.selectList();

				request.setAttribute("list", list);
				request.getRequestDispatcher("studentList.jsp").forward(
						request, response);
			} else {
				request.setAttribute("message", "���ٱ����� �����մϴ�");
				request.getRequestDispatcher("loginError.jsp").forward(request,
						response);

			}

		} else {
			request.setAttribute("message", "�α��� �� �����");
			request.getRequestDispatcher("loginError.jsp").forward(request,
					response);
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
	protected void studentDetail(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");

		if (id.trim().length() == 0) {
			request.setAttribute("message", "�α��� �� �����");
			request.getRequestDispatcher("loginError.jsp").forward(request,
					response);
		}

		Student dto = studentService.selectOne(id);

		request.setAttribute("dto", dto);
		request.getRequestDispatcher("studentDetail.jsp").forward(request,
				response);
		;
	}

	/**
	 * ���� ȸ�� ��ü ��ȸ
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void graduationList(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		String major = request.getParameter("second");
		HttpSession session = request.getSession(false);
		if (session != null && session.getAttribute("id") != null) {
			ArrayList<Student> list = studentService.graduationList(major);

			request.setAttribute("list", list);
			request.getRequestDispatcher("mentoringList.jsp").forward(request,
					response);
		} else {
			request.setAttribute("message", "���ٱ����� �����մϴ�");
			request.getRequestDispatcher("loginError.jsp").forward(request,
					response);
		}
	}

	/**
	 * ���� ȸ�� ����ȸ
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void graduationDetail(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");

		if (id.trim().length() == 0) {
			request.setAttribute("message", "�α��� �� �����");
			request.getRequestDispatcher("loginError.jsp").forward(request,
					response);
		}

		Student dto = studentService.selectOne(id);

		request.setAttribute("dto", dto);
		ArrayList<Mentoring> list = mentoringService.memtoringSelectList(id);
		request.setAttribute("list", list);		
		request.getRequestDispatcher("mentoringDetail.jsp").forward(request,
				response);
	}

	/**
	 * ������ - ȸ����������
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void updateStudentM(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		ServletContext application = getServletContext();

		int sizeLimit = 16 * 1024 * 1024;
		String savePath = application.getRealPath("img");

		MultipartRequest multi = new MultipartRequest(request, savePath,
				sizeLimit, "utf-8", new DefaultFileRenamePolicy());

		String id = multi.getParameter("id");
		String pw = multi.getParameter("pwConfirm");
		String name = multi.getParameter("name");
		String mobile1 = multi.getParameter("mobile1");
		String mobile2 = multi.getParameter("mobile2");
		String mobile3 = multi.getParameter("mobile3");
		String mobile = mobile1 + "-" + mobile2 + "-" + mobile3;
		String email1 = multi.getParameter("email1");
		String email2 = multi.getParameter("email2");
		String email = email1 + email2;
		String gender = multi.getParameter("gender");
		int birth = Integer.parseInt(multi.getParameter("birth"));
		String major = multi.getParameter("second");
		String division = multi.getParameter("third");
		String grade = multi.getParameter("grade");
		String img = multi.getFilesystemName("img");
		String gDate1 = multi.getParameter("gDate1");
		String gDate2 = multi.getParameter("gDate2");
		String gDate = gDate1 + gDate2;
		String company = multi.getParameter("company");
		String job = multi.getParameter("job");
		String career1 = multi.getParameter("career1");
		String career2 = multi.getParameter("career2");
		String career = career1 + career2;
		String part = multi.getParameter("part");

		if (img != null) {
			img = "img" + "\\" + img;
		}

		if (id == null || id.trim().length() == 0 || pw == null
				|| pw.trim().length() == 0 || name == null
				|| name.trim().length() == 0 || mobile == null
				|| mobile.trim().length() == 0 || email == null
				|| email.trim().length() == 0) {
			request.setAttribute("message", "ȸ�������� ����� �Է����ּ���");
			request.getRequestDispatcher("joinError.jsp").forward(request,
					response);
		} else {
			Student dto = new Student(id, pw, name, mobile, email, birth,
					gender, major, division, grade, img, gDate, company, job,
					career, part);
			int update = studentService.update(dto);

			if (update != 0) {
				// �����������̵�:����
				response.sendRedirect("Controller?action=studentList");
			} else {
				// �����������̵�:����
				// �α��� ����-> HttpSession ���� ���� ����
				StringBuilder error = new StringBuilder();
				error.append("ȸ�� ������ �ٽ� Ȯ�ιٶ��ϴ�");
				error.append("<br>");
				error.append("ȸ�� ������ �߸��Է��ϼ̽��ϴ�.");

				request.setAttribute("message", "ȸ�� ������ �������մϴ�.");
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
	protected void updateStudent(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		ServletContext application = getServletContext();

		int sizeLimit = 16 * 1024 * 1024;
		String savePath = application.getRealPath("img");

		MultipartRequest multi = new MultipartRequest(request, savePath,
				sizeLimit, "utf-8", new DefaultFileRenamePolicy());

		String id = multi.getParameter("id");
		String pw = multi.getParameter("pwConfirm");
		String name = multi.getParameter("name");
		String mobile1 = multi.getParameter("mobile1");
		String mobile2 = multi.getParameter("mobile2");
		String mobile3 = multi.getParameter("mobile3");
		String mobile = mobile1 + "-" + mobile2 + "-" + mobile3;
		String email1 = multi.getParameter("email1");
		String email2 = multi.getParameter("email2");
		String email = email1 + email2;
		String gender = multi.getParameter("gender");
		int birth = Integer.parseInt(multi.getParameter("birth"));
		String major = multi.getParameter("second");
		String division = multi.getParameter("third");
		String grade = multi.getParameter("grade");
		String img = multi.getFilesystemName("img");
		String gDate1 = multi.getParameter("gDate1");
		String gDate2 = multi.getParameter("gDate2");
		String gDate = gDate1 + gDate2;
		String company = multi.getParameter("company");
		String job = multi.getParameter("job");
		String career1 = multi.getParameter("career1");
		String career2 = multi.getParameter("career2");
		String career = career1 + career2;
		String part = multi.getParameter("part");

		System.out.println();
		if (img != null) {
			img = "img" + "\\" + img;
		}

		if (id == null || id.trim().length() == 0 || pw == null
				|| pw.trim().length() == 0 || name == null
				|| name.trim().length() == 0 || mobile == null
				|| mobile.trim().length() == 0 || email == null
				|| email.trim().length() == 0) {
			request.setAttribute("message", "ȸ�������� ����� �Է����ּ���");
			request.getRequestDispatcher("joinError.jsp").forward(request,
					response);
		} else {
			Student dto = new Student(id, pw, name, mobile, email, birth,
					gender, major, division, grade, img, gDate, company, job,
					career, part);
			int updateStudent = studentService.updateStudent(dto);

			if (updateStudent != 0) {
				// �����������̵�:����
				request.getRequestDispatcher("myPage.jsp").forward(request,
						response);
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
	 * ȸ��Ż�� 1.��й�ȣ Ȯ��
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void deleteStudent(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession(false);

		String id = (String) session.getAttribute("id");
		String pw = request.getParameter("pwDelete");

		if (session.getAttribute("pw").equals(pw)) {
			int delete = studentService.delete(id, pw);

			if (delete != 0) {
				// �����������̵�:����
				request.getRequestDispatcher("index.jsp").forward(request,
						response);
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
	 * ȸ��Ż�� 2. �����ڰ� ȸ�� Ż��
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void deleteM(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);

		String id = request.getParameter("id");

		if (session.getAttribute("part").equals("A")) {
			int delete = studentService.delete(id);

			if (delete != 0) {
				studentList(request, response);
			} else {
				// �����������̵�:����
				// �α��� ����-> HttpSession ���� ���� ����
				StringBuilder error = new StringBuilder();
				error.append("����������������� ���ɼ�");
				error.append("<br>");
				error.append("ȸ�� Ż�� �Ұ�");

				request.setAttribute("message", error.toString());
				request.getRequestDispatcher("studentList.jsp").forward(
						request, response);
			}
		} else {
			// �����������̵�:����
			// �α��� ����-> HttpSession ���� ���� ����
			StringBuilder error = new StringBuilder();
			error.append("���� ������ �ٽ� Ȯ�ιٶ��ϴ�");
			error.append("<br>");
			error.append("ȸ�� ��� ������ �߸��Է��ϼ̽��ϴ�.");

			request.setAttribute("message", "ȸ������ ������ �������մϴ�.");
			request.getRequestDispatcher("userDropError.jsp").forward(request,
					response);
		}

		// �����������̵�: ����, ����, ��Ÿ

	}

	/**
	 * ���ο� ��ȣ���� ��û ���� �޼ҵ�
	 * 
	 * @throws IOException
	 * @throws ServletException
	 */
	protected void newPasswd(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		String id = (String) session.getAttribute("id");
		String pw = request.getParameter("pw");
		String newPw = request.getParameter("newPw");

		int updateNewPw = studentService.updatePw(id, pw, newPw);
		if (updateNewPw > 0) {
			request.getRequestDispatcher("myPage.jsp").forward(request,
					response);

		} else {
			// �����������̵�:����
			// �α��� ����-> HttpSession ���� ���� ����
			StringBuilder error = new StringBuilder();
			error.append("���� ������ �ٽ� Ȯ�ιٶ��ϴ�");
			error.append("<br>");
			error.append("ȸ�� ��� ������ �߸��Է��ϼ̽��ϴ�.");

			request.setAttribute("message", "ȸ������ ������ �������մϴ�.");
			request.getRequestDispatcher("userUpPwError.jsp").forward(request,
					response);
		}
		// �����������̵�: ����, ����, ��Ÿ
	}

	/**
	 * �α׾ƿ� ��û ���� �޼ҵ�
	 * 
	 * @throws IOException
	 * @throws ServletException
	 */
	protected void logout(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);

		if (session != null && session.getAttribute("id") != null) {
			session.removeAttribute("id");
			session.removeAttribute("pw");
			session.removeAttribute("part");
			session.invalidate();

			response.sendRedirect("index.jsp");
		} else {
			// �����������̵�:����
			// �α��� ����-> HttpSession ���� ���� ����

			request.setAttribute("message", "�α��� ������ �������մϴ�.");
			request.getRequestDispatcher("logoutError.jsp").forward(request,
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
		System.out.println(action);
		if (action != null) {
			switch (action) {

			case "gJoin":
				gJoin(request, response);
				break;
			case "sJoin":
				sJoin(request, response);
				break;
			case "login":
				login(request, response);
				break;
			case "studentList":
				studentList(request, response);
				break;
			case "studentDetail":
				studentDetail(request, response);
				break;
			case "updateStudentM":
				updateStudentM(request, response);
				break;
			case "updateStudent":
				updateStudent(request, response);
				break;
			case "deleteStudent":
				deleteStudent(request, response);
				break;
			case "deleteM":
				deleteM(request, response);
				break;
			case "newPasswd":
				newPasswd(request, response);
				break;
			case "studentInfo":
				studentInfo(request, response);
				break;
			case "logout":
				logout(request, response);
				break;
			case "graduationList":
				graduationList(request, response);
				break;
			case "graduationDetail":
				graduationDetail(request, response);
				break;
			default:
				break;
			// �������� �ʴ� ��û ����

			}

		} else {
			// �߸��� ��û��� ���� ������ �̵�
		}

	}

	public FrontController() {

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
			case "pwCheck":
				pwCheck(request, response);
				break;
			case "pwCheckDelete":
				pwCheckDelete(request, response);
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
