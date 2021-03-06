<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="work.model.dto.Student"%>
<%@ page import="work.util.Utility"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>MCS-멘토링 상세조회</title>
<!-- Theme Made By www.w3schools.com - No Copyright -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<link href="css/common.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
	function firstChange() {
		var x = document.form.first.options.selectedIndex;
		var groups = document.form.first.options.length;
		var group = new Array(groups);
		for (i = 0; i < groups; i++)
			group[i] = new Array();

		group[0][0] = new Option("대학분류", "");

		group[1][0] = new Option("학과선택", "");
		group[1][1] = new Option("영어영문학부", "영어영문학부");
		group[1][2] = new Option("중국어학과", "중국어학과");
		group[1][3] = new Option("일본어학과", "일본어학과");
		group[1][4] = new Option("유아교육과", "유아교육과");
		group[1][5] = new Option("경영정보학과", "경영정보학과");
		group[1][6] = new Option("경영학과", "경영학과");

		group[2][0] = new Option("학과선택", "");
		group[2][1] = new Option("물리치료학과", "물리치료학과");
		group[2][2] = new Option("식품영양학과", "식품영양학과");
		group[2][3] = new Option("사회복지학과", "사회복지학과");
		group[2][4] = new Option("상담심리학과", "상담심리학과");
		group[2][5] = new Option("보건관리학과", "보건관리학과");
		group[2][6] = new Option("생활체육학과", "생활체육학과");
		group[2][7] = new Option("간호학과", "간호학과");

		group[3][0] = new Option("학과선택", "");
		group[3][1] = new Option("생명과학과", "생명과학과");
		group[3][2] = new Option("동물생명자원학과", "동물생명자원학과");
		group[3][3] = new Option("환경디자인원예학과", "환경디자인원예학과");
		group[3][4] = new Option("컴퓨터학부", "컴퓨터학부");
		group[3][5] = new Option("컴퓨터-메카트로닉스공학부", "컴퓨터-메카트로닉스공학부");
		group[3][6] = new Option("화학생명과학과", "화학생명과학과");
		group[3][7] = new Option("화학과", "화학과");

		group[4][0] = new Option("학과선택", "");
		group[4][1] = new Option("기초의약과학과", "기초의약과학과");
		group[4][2] = new Option("약학과", "약학과");

		group[5][0] = new Option("학과선택", "");
		group[5][1] = new Option("미술컨텐츠학과", "미술컨텐츠학과");
		group[5][2] = new Option("커뮤니케이션디자인학과", "커뮤니케이션디자인학과");
		group[5][3] = new Option("건축학과", "건축학과");
		group[5][4] = new Option("아트앤디자인학과", "아트앤디자인학과");
		group[5][5] = new Option("음악학과", "음악학과");

		group[6][0] = new Option("학과선택", "");
		group[6][1] = new Option("신학과", "신학과");

		temp = document.form.second;
		for (m = temp.options.length - 1; m > 0; m--)
			temp.options[m] = null
		for (i = 0; i < group[x].length; i++) {
			temp.options[i] = new Option(group[x][i].text, group[x][i].value)
		}
		temp.options[0].selected = true
	}

	function secondChange() {
		var first = document.form.first.options.selectedIndex;
		var x = document.form.second.options.selectedIndex;
		var groups = document.form.second.options.length;
		var group = new Array(groups);
		for (i = 0; i < groups; i++)
			group[i] = new Array();
		if (first == 1) {
			group[0][0] = new Option("", "");
			group[1][0] = new Option("영어영문학전공", "영어영문학전공");
			group[1][1] = new Option("영어통번역전공", "영어통번역전공");
			group[2][0] = new Option("", "");
			group[3][0] = new Option("", "");
			group[4][0] = new Option("", "");
			group[5][0] = new Option("", "");

		} else if (first == 2) {
			group[0][0] = new Option("", "");
			group[1][0] = new Option("", "");
			group[2][0] = new Option("", "");
			group[3][0] = new Option("", "");
			group[4][0] = new Option("", "");
			group[5][0] = new Option("", "");
			group[6][0] = new Option("", "");

		} else if (first == 3) {
			group[0][0] = new Option("", "");
			group[1][0] = new Option("", "");
			group[2][0] = new Option("", "");
			group[3][0] = new Option("", "");
			group[4][0] = new Option("컴퓨터시스템 전공", "컴퓨터시스템 전공");
			group[4][1] = new Option("소프트웨어 전공", "소프트웨어 전공");
			group[4][2] = new Option("응용컴퓨팅 전공", "응용컴퓨팅 전공");
			group[5][0] = new Option("", "");
			group[6][0] = new Option("", "");

		} else if (first == 4) {
			group[0][0] = new Option("", "");
			group[1][0] = new Option("", "");

		} else if (first == 5) {
			group[0][0] = new Option("", "");
			group[1][0] = new Option("", "");
			group[2][0] = new Option("", "");
			group[3][0] = new Option("", "");
			group[4][0] = new Option("", "");

		} else if (first == 6) {
			group[0][0] = new Option("", "");

		}

		temp = document.form.third;
		for (m = temp.options.length - 1; m > 0; m--)
			temp.options[m] = null
		for (i = 0; i < group[x].length; i++) {
			temp.options[i] = new Option(group[x][i].text, group[x][i].value)
		}
		temp.options[0].selected = true
	}
</script>
<style>
.btn-warning {
	background-color: #F7BE81;
}

.btn-major {
	background-color: #f4511e;
	color: white;
	font-weight: bold;
}

.table>tbody>tr {
	border: 20px;
}

img {
	width: 15px;
}
}
</style>
</head>
<body>
	<%@ include file="topMenuSuccess.jsp"%>

	<div class="jumbotron text-center">

		<h1>Mentoring</h1>
		<p>Mentoring Campus in Sahmyook University</p>
		<form name="form" class="form-inline">
			<span class="form-group"> <span class="col-xs-12"> <select
					class="form-control" name="first" onchange="firstChange();" size=1>
						<OPTION value=''>대학분류</OPTION>
						<OPTION value=''>인문사회대학</OPTION>
						<OPTION value=''>보건복지대학</OPTION>
						<OPTION value=''>과학기술대학</OPTION>
						<OPTION value=''>약학대학</OPTION>
						<OPTION value=''>문화예술대학</OPTION>
						<OPTION value=''>신학대학</OPTION>

				</SELECT> <SELECT class="form-control" name="second"
					onchange="secondChange();" size=1>
						<OPTION value=''>학과분류</OPTION>
				</SELECT>
			</span>
			</span> <input type="text" class="form-control" size="50" placeholder="검색"
				required>
			<button type="button" class="btn btn-danger">검색</button>
		</form>
	</div>

	<!-- Container (Portfolio Section) -->
	<div id="portfolio" class="container-fluid text-center ">
		<div class="row">

			<h2>Mentoring</h2>
			<h4>졸업한 선배님들과의 멘토링</h4>

			<div class="row col-xs-offset-2 col-xs-8"
				style="border: 10px #f4511e solid; height: 500px; padding-top: 60px">
				<div class="col-xs-3">
					<div class="col-xs-12 glyphicon glyphicon-education logo-small"></div>

					<img src="${dto.img}" alt="..." class="img-circle"
						style="width: 100%; height: 200px;">
					<ul class="pager">
						<c:forEach var="list" items="${requestScope.list}">

							<c:if
								test="${sessionScope.id eq list.mEntry and list.mStatus eq '수락'}">
								<li role="presentation" class="active" data-toggle="modal"
									data-target="#noteModal"><a href="#">쪽지보내기</a></li>
							</c:if>
						</c:forEach>

						<!-- Modal -->
						<div class="modal fade" id="noteModal" tabindex="-1" role="dialog"
							aria-labelledby="myModalLabel" style="margin: 30px;">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
										<br /> <img alt="images/grade.png" src="images/email.png">
										<h4 class="modal-title" id="myModalLabel">쪽지보내기</h4>
									</div>

									<div class="modal-body">
										<form class="form-horizontal" name="entryForm" method="post"
											action="">
											<div class="form-group">
												<label for="stmHost" class="col-xs-3 control-label">받는
													사람</label>
												<div class="col-xs-8">
													<input type="text" class="form-control" id="stmHost"
														name="stmHost" value="<%=request.getParameter("id")%>"
														readonly>
												</div>
											</div>
											<div class="form-group">
												<label for="stmHost" class="col-xs-3 control-label">보내는
													사람</label>
												<div class="col-xs-8">
													<input type="text" class="form-control" id="stmEntry"
														name="stmEntry"
														value="<%=session.getAttribute("id") + "["
					+ session.getAttribute("name") + "]"%>"
														readonly>
												</div>
											</div>
											<div class="form-group">
												<label for="stmPeriod" class="col-xs-3 control-label">제목</label>
												<div class="col-xs-8">
													<input type="text" class="form-control" id="stmPeriod"
														name="stmPeriod">
												</div>
											</div>
											<div class="form-group">
												<label for="nContent" class="col-xs-3 control-label">내용</label>
												<div class="col-xs-8">
													<textarea class="form-control" rows="10" id="nContent"
														name="nContent"> </textarea>
												</div>
											</div>

											<div class="form-group">
												<div class="col-sm-offset-2 col-sm-9">
													<button type="button" class="btn btn-info"
														onclick="if(confirm('쪽지를 보내시겠습니까?')){document.noteForm.submit()}">보내기</button>
													<button type="button" class="btn btn-info"
														data-dismiss="modal">취 소</button>
												</div>
											</div>
										</form>
									</div>

									<div class="modal-footer">
										<div class="col-xs-12 glyphicon glyphicon-remove"
											style="float: left">스터디에 관해 궁금한 점을 보내주세요.</div>
										<br />
										<div class="col-xs-12 glyphicon glyphicon-remove"
											style="float: left">장난으로 보낼 경우 불이익을 받을 수 있습니다!</div>
									</div>
								</div>
							</div>
						</div>



						<li role="presentation" class="active" data-toggle="modal"
							data-target="#myModal1" style="margin: 8px"><a>멘토링신청</a></li>

						<!-- Modal -->
						<div class="modal fade" id="myModal1" tabindex="-1" role="dialog"
							aria-labelledby="myModalLabel">
							<div class="modal-dialog" role="document">
								<div class="modal-content" style="margin-top: 60px;">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
										<br />
										<h4 class="modal-title" id="myModalLabel">멘토링신청</h4>
									</div>
									<div id="about" class="container-fluid">
										<div class="row">
											<div class="modal-body">
												<div class="col-sm-4">
													<span class="glyphicon glyphicon-user logo"></span>
												</div>
												<div class="col-sm-8">
													<form name="form" class="form-horizontal" method="post"
														action="MentoringController?action=mentoringInsert">
														<div class="form-group">
															<label for="inputPassword3"
																class="col-xs-4 control-label">멘토 ID</label>
															<div class="col-xs-8">
																<input type="text" class="form-control" id="id"
																	name="id" value=<%=request.getParameter("id")%>
																	readonly>
															</div>
														</div>
														<div class="form-group">
															<label for="inputEmail3" class="col-xs-4 control-label">ID</label>
															<span class="col-xs-8"> <input type="text"
																class="form-control" id="mEntry" name="mEntry"
																maxlength="12" value=<%=session.getAttribute("id")%>
																readonly>
														</div>
														<div class="form-group">
															<label for="inputEmail3" class="col-xs-4 control-label">학번</label>
															<span class="col-xs-8"> <input type="text"
																class="form-control" id="mGrade" name="mGrade"
																maxlength="12" value=<%=session.getAttribute("grade")%>
																readonly>
														</div>
														<div class="form-group">
															<label for="inputEmail3" class="col-xs-4 control-label">전공</label>
															<span class="col-xs-8"> <input type="text"
																class="form-control" id="mMajor" name="mMajor"
																maxlength="12" value=<%=session.getAttribute("major")%>
																readonly>
														</div>

														<div class="form-group">
															<label for="inputPassword3"
																class="col-xs-4 control-label">이름</label>
															<div class="col-xs-8">
																<input type="text" class="form-control" id="mName"
																	name="mName" value=<%=session.getAttribute("name")%>
																	readonly>
															</div>
														</div>


														<div class="form-group">
															<label for="inputPassword3"
																class="col-xs-4 control-label">내용</label>
															<div class="col-xs-8">
																<input type="text" class="form-control" id="mComment"
																	name="mComment">
															</div>
														</div>
														<div class="modal-footer">

															<div class="form-group">
																<div class="col-sm-offset-2 col-sm-4">
																	<button id="btnJoin" type="submit"
																		class="btn btn-default btn-lg" name="submit">Sign
																		in</button>
																</div>
															</div>
														</div>
													</form>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</ul>
				</div>
				<div class="col-xs-offset-1 col-xs-8">
					<ul class="nav nav-tabs nav-justified">
						<li role="presentation" class="active"><a
							style="font-weight: bold; font-size: 20px">${dto.name} 선배님</a></li>
						<li role="presentation"><a
							style="font-weight: bold; font-size: 15px; color: #f4511e">${dto.major}</a></li>
						<li role="presentation"><a
							style="font-weight: bold; font-size: 15px; color: #f4511e"> <c:choose>
									<c:when test="${dto.division ne null}">
							${dto.division}</c:when>
									<c:otherwise>세부전공없음</c:otherwise>
								</c:choose></a></li>
					</ul>
					<table class="table" style="margin-top: 20px;">
						<tr>
							<td><img alt="images/grade.png" src="images/grade.png"></td>
							<td>${dto.grade}</td>
							<td><img alt="images/gDate.png" src="images/gDate.png"></td>
							<td>${dto.gDate}</td>
						</tr>
						<tr>
							<td><img alt="images/job.png" src="images/job.png"></td>
							<td>${dto.job}</td>
							<td><img alt="images/company.png" src="images/company.png"></td>
							<td>${dto.company}</td>
						</tr>
						<tr>
							<td><img alt="images/career.png" src="images/career.png"></td>
							<td>경력 ${dto.career}</td>
							<td><img alt="images/grade.png" src="images/gender.png"></td>
							<td>${dto.gender}</td>
						</tr>
						<tr>
							<td><img alt="images/grade.png" src="images/birth.png"></td>
							<td>${2016-dto.birth}살</td>
							<td><img alt="images/grade.png" src="images/email.png"></td>
							<td>${dto.email}</td>
						</tr>
						<tr>
							<td><img alt="images/grade.png" src="images/phone.png"></td>
							<td><c:forEach var="list" items="${requestScope.list}">
									<c:if
										test="${sessionScope.id eq list.mEntry and list.mStatus eq '수락'}">
								${dto.mobile}</c:if>
								</c:forEach></td>
							<td><img alt="images/grade.png" src="images/grade.png"></td>
							<td>삼육대학교</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</div>

	<div class="row container-fluid text-center">
		<div class=" col-xs-offset-2 col-xs-8"
			style="border: 6px black solid; padding-top: 60px">
			<div class="col-xs-3">
				<div class="col-xs-12 glyphicon glyphicon-education logo-small"></div>
				<br> <br>
				<h3>멘토링 신청내역</h3>
			</div>
			<div class=" col-xs-9">
				<table class="table" style="margin-top: 20px;">
					<tr>
						<td class="memberList">이름</td>
						<td class="memberList">제목</td>
						<td class="memberList">학과</td>
						<td class="memberList">학번</td>
						<td class="memberList">신청일</td>
						<td class="memberList">상태</td>
						<td class="memberList"></td>
						<td class="memberList"></td>

					</tr>
					<c:forEach var="list" items="${requestScope.list}">
						<tr>
							<td class="memberList2">${list.mName}</td>
							<td class="memberList2">${list.mComment}</td>
							<td class="memberList2">${list.mMajor}</td>
							<td class="memberList2">${list.mGrade}</td>
							<td class="memberList2">${list.mDate}</td>
							<td class="memberList2">${list.mStatus}</td>
							<c:if test="${list.mEntry eq sessionScope.id}">
								<td class="memberList2"><a
									href="MentoringController?action=mentoringDetail&mNo=${list.mNo}"
									style="margin-right: 10px"><img src="images/update.png"></a>
									|<a
									href="MentoringController?action=mentoringDelete&mEntry=${list.mEntry}&mNo=${list.mNo}&mHost=${list.mHost}"
									style="margin-left: 10px"><img src="images/delete.png"></a></td>
							</c:if>
							<c:if test="${sessionScope.id eq dto.id}">
								<td class="memberList2"><a
									href="MentoringController?action=mentoringAccept&mNo=${list.mNo}"><img
										src="images/accept.png"></a></td>
							</c:if>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>

	<%@ include file="footer.jsp"%>
</body>
</html>