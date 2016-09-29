package work.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import work.model.dto.Student;
import work.model.service.MentoringService;
import work.model.service.StudentService;

/**
 * Servlet implementation class FrontController
 */
@WebServlet("/Controller")
public class FrontController extends HttpServlet {

	private MentoringService mentoringService = new MentoringService();
	private StudentService studentService = new StudentService();

	
	
	
	protected void join(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String id = request.getParameter("id");
		String pw = request.getParameter("userPw");
		String name = request.getParameter("name");
		String mobile1 = request.getParameter("mobile1");
		String mobile2 = request.getParameter("mobile2");
		String mobile3 = request.getParameter("mobile3");
		String mobile = mobile1 + "-" + mobile2 + "-" + mobile3;
		String email1 = request.getParameter("email1");
		String email2 = request.getParameter("email2");
		String email = email1 + email2;
		String gender = request.getParameter("gender");
		String birth = request.getParameter("birth");
		String major = request.getParameter("major");
		String division = request.getParameter("division");
		String grade = request.getParameter("grade");
		String img = request.getParameter("grade");
		String gDate = request.getParameter("gDate");
		String company = request.getParameter("company");
		String job = request.getParameter("job");
		String career = request.getParameter("career");
		String part = request.getParameter("part");

		if (id == null || id.trim().length() == 0 || pw == null
				|| pw.trim().length() == 0 || name == null
				|| name.trim().length() == 0 || mobile == null
				|| mobile.trim().length() == 0 || email == null
				|| email.trim().length() == 0 || gender == null
				|| major == null) {
			request.setAttribute("message", "정보를 제대로 입력해 주세요");
			request.getRequestDispatcher("loginError.jsp").forward(request,
					response);
			System.out.println("aaaa");
		} else {
			// Model 요청의뢰
			Student dto = new Student(id, birth, name, mobile, email, gender,
					birth, major, division, grade, img, gDate, company, job,
					career, part);
			int insert = studentService.StudentInsert(dto);
			System.out.println(insert);
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

			case "join":
				join(request, response);
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
