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
								<li role="presentation" class="active"><a href="#">쪽지보내기</a></li>
							</c:if>
						</c:forEach>


						<li role="presentation" class="active"><a
							href="mentoringInsert.jsp?id=${dto.id}">멘토링신청</a></li>
					</ul>
				</div>
				<div class="col-xs-offset-1 col-xs-8">
					<ul class="nav nav-tabs nav-justified">
						<li role="presentation" class="active"><a
							style="font-weight: bold; font-size: 20px">${dto.name} 선배님</a></li>
						<li role="presentation"><a
							style="font-weight: bold; font-size: 15px; color: #f4511e">${dto.major}</a></li>
						<li role="presentation"><a
							style="font-weight: bold; font-size: 15px; color: #f4511e">
							<c:choose><c:when test="${dto.division ne null}">
							${dto.division}</c:when>
							<c:otherwise>세부전공없음</c:otherwise></c:choose></a></li>
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