package work.controller;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
	 * 멘토링 신청
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
		String mStatus = "신청";

		if (mComment == null || mComment.trim().length() == 0) {
			request.setAttribute("message", "정보를 제대로 입력해 주세요");
			request.getRequestDispatcher("loginError.jsp").forward(request,
					response);
		} else {
			// Model 요청의뢰
			Mentoring dto = new Mentoring(mNo, mHost, mEntry, mName, mMajor,
					mGrade, mComment, mDate, mStatus);
			int insert = mentoringService.Mentoringinsert(dto);
			// 요청결과받아서 응답위한 설정
			if (insert != 0) {
				// 응답페이지이동:성공
				request.setAttribute("insert", insert);
				request.getRequestDispatcher(
						"controller?action=graduationDetail&id=" + mHost)
						.forward(request, response);
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
	 * get, post 요청을 처리하는 서비스 메소드
	 * 
	 * @throws IOException
	 * @throws ServletException
	 */
	protected void process(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// 요청 파악 : 요청데이터에서 요청을 위한 key 데이터 가져오기
		String action = request.getParameter("action");
		if (action != null) {
			switch (action) {
			case "mentoringInsert":
				mentoringInsert(request, response);
				break;

			default:
				break;
			// 지원하지 않는 요청 오류

			}

		} else {
			// 잘못된 요청방식 오류 페이지 이동
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
