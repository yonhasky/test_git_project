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
	 * 졸업생 회원가입
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
		String grade = multi.getParameter("grade")+"학번";
		String img = multi.getFilesystemName("img");
		String gDate1 = multi.getParameter("gDate1");
		String gDate2 = multi.getParameter("gDate2");
		String gDate = gDate1 + "년" + gDate2 + "월 졸업";
		String company = multi.getParameter("company");
		String job = multi.getParameter("job");
		String career1 = multi.getParameter("career1");
		String career2 = multi.getParameter("career2");
		String career = career1 + "년" + career2+ "개월";
		String part = "G";
		
		if(gender.equals("M")){
			gender = "남자";
		}else if(gender.equals("F")){
			gender = "여자";
		}
		

		if (img != null) {
			img = "img" + "\\" + img;
		}else {
			img = "img/default.jpg";   //사진 미선택시 기본사진
		}
		if (id == null || id.trim().length() == 0 || pw == null
				|| pw.trim().length() == 0 || name == null
				|| name.trim().length() == 0 || mobile == null
				|| mobile.trim().length() == 0 || email == null
				|| email.trim().length() == 0 || gender == null) {
			request.setAttribute("message", "정보를 제대로 입력해 주세요");
			request.getRequestDispatcher("loginError.jsp").forward(request,
					response);
		} else {
			// Model 요청의뢰
			Student dto = new Student(id, pw, name, mobile, email, birth,
					gender, major, division, grade, img, gDate, company, job,
					career, part);
			int insert = studentService.StudentInsert(dto);
			// 요청결과받아서 응답위한 설정
			if (insert != 0) {
				// 응답페이지이동:성공
				request.setAttribute("insert", insert);
				request.getRequestDispatcher("index.jsp").forward(request,
						response);
			} else {
				// 응답페이지이동:실패
				// 로그인 성공-> HttpSession 으로 변경 예정
				StringBuilder error = new StringBuilder();
				error.append("가입 정보를 다시 확인바랍니다");
				error.append("<br>");
				error.append("회원 등록 정보를 잘못입력하셨습니다.");

				request.setAttribute("message", "회원가입 정보가 부적절합니다.");
				request.getRequestDispatcher("loginError.jsp").forward(request,
						response);
			}
			// 응답페이지이동: 성공, 실패, 기타
		}
	}

	/**
	 * 재학생 회원가입
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
		String grade = multi.getParameter("grade")+"학번";
		String img = multi.getFilesystemName("img");
		String part = "S";
		String gDate = null;
		String company = null;
		String job = null;
		String career = null;
		
		if(gender.equals("M")){
			gender = "남자";
		}else if(gender.equals("F")){
			gender = "여자";
		}
		
		if (img != null) {
			img = "img" + "\\" + img;
		}else {
			img = "img/default.jpg";   //사진 미선택시 기본사진
		}

		if (id == null || id.trim().length() == 0 || pw == null
				|| pw.trim().length() == 0 || name == null
				|| name.trim().length() == 0 || mobile == null
				|| mobile.trim().length() == 0 || email == null
				|| email.trim().length() == 0 || gender == null
				|| major == null) {
			request.setAttribute("message", "정보를 제대로 입력해 주세요");
			request.getRequestDispatcher("loginError.jsp").forward(request,
					response);
		} else {
			// Model 요청의뢰
			Student dto = new Student(id, pw, name, mobile, email, birth,
					gender, major, division, grade, img, gDate, company, job,
					career, part);
			int insert = studentService.StudentInsert(dto);
			// 요청결과받아서 응답위한 설정
			if (insert != 0) {
				// 응답페이지이동:성공
				request.setAttribute("insert", insert);
				request.getRequestDispatcher("index.jsp").forward(request,
						response);
			} else {
				// 응답페이지이동:실패
				// 로그인 성공-> HttpSession 으로 변경 예정
				StringBuilder error = new StringBuilder();
				error.append("가입 정보를 다시 확인바랍니다");
				error.append("<br>");
				error.append("회원 등록 정보를 잘못입력하셨습니다.");

				request.setAttribute("message", "회원가입 정보가 부적절합니다.");
				request.getRequestDispatcher("loginError.jsp").forward(request,
						response);
			}
			// 응답페이지이동: 성공, 실패, 기타
		}
	}

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

	/**
	 * 비밀번호 체크
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
			request.setAttribute("message", "지원하지 않는 응답 데이터 형식입니다.");
			request.getRequestDispatcher("error.jsp")
					.forward(request, response);
		}
	}

	/**
	 * pwCheck 응답 데이터 : json 응답 처리 메서드 json : {"valid","true"}
	 */
	protected void responseJson2(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// 요청 데이터 아이디 가져오기
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
	 * 비밀번호 체크(회원삭제)
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
			request.setAttribute("message", "지원하지 않는 응답 데이터 형식입니다.");
			request.getRequestDispatcher("error.jsp")
					.forward(request, response);
		}
	}

	/**
	 * pwCheck 응답 데이터 : json 응답 처리 메서드 json : {"valid","true"}
	 */
	protected void responseJson3(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// 요청 데이터 아이디 가져오기
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
	 * 로그인 요청 서비스 메소드
	 * 
	 * @throws IOException
	 * @throws ServletException
	 */
	protected void login(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// 요청데이터 추출 : 로그인 요청 view login.jsp
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		// 요청데이터 검증 : 필수항목
		// 미입력시 오류페이지 이동 처리
		if (id == null || id.trim().length() == 0 || pw == null
				|| pw.trim().length() == 0) {
			request.setAttribute("message", "아이디와 비밀번호를 입력해주세요");

			RequestDispatcher nextView = request
					.getRequestDispatcher("loginError.jsp");
			nextView.forward(request, response);
		}

		// Model 요청의뢰
		HashMap<String, String> loginMap = studentService.login(id, pw);
		// 요청결과받아서 응답위한 설정
		if (loginMap != null) {
			// 응답페이지이동:성공
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
			// 응답페이지이동:실패
			// 로그인 성공-> HttpSession 으로 변경 예정
			StringBuilder error = new StringBuilder();
	
			request.setAttribute("message", "로그인 정보가 부적절합니다.");
			request.getRequestDispatcher("errorLogin.jsp").forward(request,
					response);

		}
		// 응답페이지이동: 성공, 실패, 기타
	}

	/**
	 * 회원 자신 정보 조회
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
			request.setAttribute("message", "로그인 후 사용해");
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
	 * 회원 전체 조회
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
				request.setAttribute("message", "접근권한이 부족합니다");
				request.getRequestDispatcher("loginError.jsp").forward(request,
						response);

			}

		} else {
			request.setAttribute("message", "로그인 후 사용해");
			request.getRequestDispatcher("loginError.jsp").forward(request,
					response);
		}

	}

	/**
	 * 회원 상세조회
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
			request.setAttribute("message", "로그인 후 사용해");
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
	 * 멘토 회원 전체 조회
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
			request.setAttribute("message", "접근권한이 부족합니다");
			request.getRequestDispatcher("loginError.jsp").forward(request,
					response);
		}
	}

	/**
	 * 멘토 회원 상세조회
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
			request.setAttribute("message", "로그인 후 사용해");
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
	 * 관리자 - 회원정보변경
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
			request.setAttribute("message", "회원정보를 제대로 입력해주세요");
			request.getRequestDispatcher("joinError.jsp").forward(request,
					response);
		} else {
			Student dto = new Student(id, pw, name, mobile, email, birth,
					gender, major, division, grade, img, gDate, company, job,
					career, part);
			int update = studentService.update(dto);

			if (update != 0) {
				// 응답페이지이동:성공
				response.sendRedirect("Controller?action=studentList");
			} else {
				// 응답페이지이동:실패
				// 로그인 성공-> HttpSession 으로 변경 예정
				StringBuilder error = new StringBuilder();
				error.append("회원 정보를 다시 확인바랍니다");
				error.append("<br>");
				error.append("회원 정보를 잘못입력하셨습니다.");

				request.setAttribute("message", "회원 정보가 부적절합니다.");
				request.getRequestDispatcher("joinError.jsp").forward(request,
						response);
			}

		}

	}

	/**
	 * 회원 - 회원정보변경
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
			request.setAttribute("message", "회원정보를 제대로 입력해주세요");
			request.getRequestDispatcher("joinError.jsp").forward(request,
					response);
		} else {
			Student dto = new Student(id, pw, name, mobile, email, birth,
					gender, major, division, grade, img, gDate, company, job,
					career, part);
			int updateStudent = studentService.updateStudent(dto);

			if (updateStudent != 0) {
				// 응답페이지이동:성공
				request.getRequestDispatcher("myPage.jsp").forward(request,
						response);
			} else {
				// 응답페이지이동:실패
				// 로그인 성공-> HttpSession 으로 변경 예정
				StringBuilder error = new StringBuilder();
				error.append("가입 정보를 다시 확인바랍니다");
				error.append("<br>");
				error.append("회원 등록 정보를 잘못입력하셨습니다.");

				request.setAttribute("message", "회원가입 정보가 부적절합니다.");
				request.getRequestDispatcher("joinError.jsp").forward(request,
						response);
			}
		}
	}

	/**
	 * 회원탈퇴 1.비밀번호 확인
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
				// 응답페이지이동:성공
				request.getRequestDispatcher("index.jsp").forward(request,
						response);
			} else {
				// 응답페이지이동:실패
				// 로그인 성공-> HttpSession 으로 변경 예정
				StringBuilder error = new StringBuilder();
				error.append("비밀번호를 다시 확인바랍니다");
				error.append("<br>");
				error.append("비밀번호를 잘못입력하셨습니다.");

				request.setAttribute("message", "비밀번호 정보가 부적절합니다.");
				request.getRequestDispatcher("userInputError.jsp").forward(
						request, response);
			}

		} else {
			// 응답페이지이동:실패
			// 로그인 성공-> HttpSession 으로 변경 예정
			StringBuilder error = new StringBuilder();
			error.append("비밀번호를 다시 확인바랍니다");
			error.append("<br>");
			error.append("비밀번호를 잘못입력하셨습니다.");

			request.setAttribute("message", error.toString());
			request.getRequestDispatcher("userDropError.jsp").forward(request,
					response);
		}
		// 응답페이지이동: 성공, 실패, 기타
	}

	/**
	 * 회원탈퇴 2. 관리자가 회원 탈퇴
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
				// 응답페이지이동:실패
				// 로그인 성공-> HttpSession 으로 변경 예정
				StringBuilder error = new StringBuilder();
				error.append("제약조건위배되있을 가능성");
				error.append("<br>");
				error.append("회원 탈퇴 불가");

				request.setAttribute("message", error.toString());
				request.getRequestDispatcher("studentList.jsp").forward(
						request, response);
			}
		} else {
			// 응답페이지이동:실패
			// 로그인 성공-> HttpSession 으로 변경 예정
			StringBuilder error = new StringBuilder();
			error.append("가입 정보를 다시 확인바랍니다");
			error.append("<br>");
			error.append("회원 등록 정보를 잘못입력하셨습니다.");

			request.setAttribute("message", "회원가입 정보가 부적절합니다.");
			request.getRequestDispatcher("userDropError.jsp").forward(request,
					response);
		}

		// 응답페이지이동: 성공, 실패, 기타

	}

	/**
	 * 새로운 암호변경 요청 서비스 메소드
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
			// 응답페이지이동:실패
			// 로그인 성공-> HttpSession 으로 변경 예정
			StringBuilder error = new StringBuilder();
			error.append("가입 정보를 다시 확인바랍니다");
			error.append("<br>");
			error.append("회원 등록 정보를 잘못입력하셨습니다.");

			request.setAttribute("message", "회원가입 정보가 부적절합니다.");
			request.getRequestDispatcher("userUpPwError.jsp").forward(request,
					response);
		}
		// 응답페이지이동: 성공, 실패, 기타
	}

	/**
	 * 로그아웃 요청 서비스 메소드
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
			// 응답페이지이동:실패
			// 로그인 성공-> HttpSession 으로 변경 예정

			request.setAttribute("message", "로그인 정보가 부적절합니다.");
			request.getRequestDispatcher("logoutError.jsp").forward(request,
					response);
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
			// 지원하지 않는 요청 오류

			}

		} else {
			// 잘못된 요청방식 오류 페이지 이동
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
