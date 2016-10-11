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
<title>MCS 회원마이페이지</title>

<!-- Theme Made By www.w3schools.com - No Copyright -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.css">
<script src="js/ajax.js"></script>


<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<link href="css/common.css" rel="stylesheet" type="text/css">


<script type="text/javascript">
	function isPw() {
		//web.xml
		var url = "controller";

		var params = "";
		params += "action=pwCheck";

		var pw = document.getElementById("pw").value;
		params += "&pw=" + pw;

		// 응답데이터 : Json
		params += "&responseDataType=json";

		//응답위한 콜백 함수 바인딩
		var callback = responseJson;
		var method = "GET";
		// js/ajax.js 스크립트 이용햐소 ajax 서버 요청
		new ajax.xhr.Request(url, params, callback, method)
	}

	/** Json 응답데이터 처리 callback 함수
	 {"valid","true"}

	 eval("1+2") =>문자열수식 변환함수
	 json 형식의 문자열을 json객체 변환
	 eval("("+json형식의 응답문자열+")")
	 */
	function responseJson(xhr) {
		if (xhr.readyState == 4 && xhr.status == 200) {
			var resultJson = eval("(" + xhr.responseText + ")");
			var result = resultJson.valid;
			if (result == 'true') {
				// messageUserId 결과메세지 출력
				document.getElementById("pwConfirm").innerHTML = "<span class='glyphicon glyphicon-ok' aria-hidden='true'></span><span class='sr-only'>Error:</span>일치 ";
				document.getElementById("btnPw").disabled = false;

			} else if (result == 'false') {
				document.getElementById("pwConfirm").innerHTML = "<span class='glyphicon glyphicon-remove' aria-hidden='true'></span><span class='sr-only'>Error:</span>불일치 ";
				document.getElementById("btnPw").disabled = true;
				document.getElementById("pw").focus();

			} else if (result == 'required') {
				document.getElementById("pwConfirm").innerHTML = "미입력";
				document.getElementById("btnPw").disabled = true;
				document.getElementById("pw").focus();

			}
		}

	}

	function isPwDelete() {
		//web.xml
		var url = "controller";

		var params = "";
		params += "action=pwCheckDelete";

		var pwDelete = document.getElementById("pwDelete").value;
		params += "&pwDelete=" + pwDelete;

		// 응답데이터 : Json
		params += "&responseDataType=json";

		//응답위한 콜백 함수 바인딩
		var callback = responseJson2;
		var method = "GET";
		// js/ajax.js 스크립트 이용햐소 ajax 서버 요청
		new ajax.xhr.Request(url, params, callback, method)
	}

	/** Json 응답데이터 처리 callback 함수
	 {"valid","true"}

	 eval("1+2") =>문자열수식 변환함수
	 json 형식의 문자열을 json객체 변환
	 eval("("+json형식의 응답문자열+")")
	 */
	function responseJson2(xhr) {
		if (xhr.readyState == 4 && xhr.status == 200) {
			var resultJson = eval("(" + xhr.responseText + ")");
			var result = resultJson.valid;
			if (result == 'true') {
				// messageUserId 결과메세지 출력
				document.getElementById("pwConfirmDelete").innerHTML = "<span class='glyphicon glyphicon-ok' aria-hidden='true'></span><span class='sr-only'>Error:</span>일치 ";
				document.getElementById("btnPwDelete").disabled = false;

			} else if (result == 'false') {
				document.getElementById("pwConfirmDelete").innerHTML = "<span class='glyphicon glyphicon-remove' aria-hidden='true'></span><span class='sr-only'>Error:</span>불일치 ";
				document.getElementById("btnPwDelete").disabled = true;
				document.getElementById("pwDelete").focus();

			} else if (result == 'required') {
				document.getElementById("pwConfirmDelete").innerHTML = "미입력";
				document.getElementById("btnPwDelete").disabled = true;
				document.getElementById("pwDelete").focus();

			}
		}

	}
</script>
</head>
<body id="myPage">

	<%@ include file="topMenuAdm.jsp"%>


	<div class="jumbotron text-center">



		<h1>MC in SYU</h1>
		<p>Mentoring Campus in Sahmyook University</p>
		<form class="form-inline">
			<input type="text" class="form-control" size="50" placeholder="검색"
				required>
			<button type="button" class="btn btn-danger">검색</button>
		</form>
	</div>



	<!-- Container (Services Section) -->
	<div id="services" class="container-fluid text-center">

		<table class="table table-striped" align="center" id="tblSort">
			<thead>
				<tr align="center">
					<td class="memberList" onclick="sortTable('tblSort', 0)"
						style="cursor: pointer; width: 60px;">상세</td>
					<td class="memberList" onclick="sortTable('tblSort', 1)"
						style="cursor: pointer">아이디</td>
					<td class="memberList" onclick="sortTable('tblSort', 2)"
						style="cursor: pointer">비밀번호</td>
					<td class="memberList" onclick="sortTable('tblSort', 3)"
						style="cursor: pointer">이름</td>
					<td class="memberList" onclick="sortTable('tblSort', 4)"
						style="cursor: pointer">연락처</td>
					<td class="memberList" onclick="sortTable('tblSort', 5)"
						style="cursor: pointer">이메일</td>
					<td class="memberList" onclick="sortTable('tblSort', 6)"
						style="cursor: pointer">생년</td>
					<td class="memberList" onclick="sortTable('tblSort', 7, 'int')"
						style="cursor: pointer">성별</td>
					<td class="memberList" onclick="sortTable('tblSort', 8)"
						style="cursor: pointer">전공</td>
					<td class="memberList" onclick="sortTable('tblSort', 9)"
						style="cursor: pointer">세부전공</td>
					<td class="memberList" onclick="sortTable('tblSort', 10)"
						style="cursor: pointer">학번</td>
					<td class="memberList" onclick="sortTable('tblSort', 11)"
						style="cursor: pointer">이미지</td>
					<td class="memberList" onclick="sortTable('tblSort', 12)"
						style="cursor: pointer">졸업일</td>
					<td class="memberList" onclick="sortTable('tblSort', 13)"
						style="cursor: pointer">회사</td>
					<td class="memberList" onclick="sortTable('tblSort', 14)"
						style="cursor: pointer">직종</td>
					<td class="memberList" onclick="sortTable('tblSort', 15)"
						style="cursor: pointer">경력</td>
					<td class="memberList" onclick="sortTable('tblSort', 16)"
						style="cursor: pointer">등급</td>
				</tr>
			</thead>


			<tbody>
				<c:forEach var="dto" items="${requestScope.list}">

					<tr align="center">
						<td class="memberList2"><a
							href="Controller?action=studentDetail&id=${dto.id}" style="margin-right:6px"><img
								src="images/update.png"></a> |<a
							href="controller?action=deleteM&id=${dto.id}" style="margin-left:6px"><img
								src="images/delete.png"></a></td>
						<td class="memberList2">${dto.id}</td>
						<td class="memberList2">${dto.pw}</td>
						<td class="memberList2">${dto.name}</td>
						<td class="memberList2">${dto.mobile}</td>
						<td class="memberList2">${dto.email}</td>
						<td class="memberList2">${dto.birth}</td>
						<td class="memberList2">${dto.gender}</td>
						<td class="memberList2">${dto.major}</td>
						<td class="memberList2">${dto.division}</td>
						<td class="memberList2">${dto.grade}</td>
						<td class="memberList2">${dto.img}</td>
						<td class="memberList2">${dto.gDate}</td>
						<td class="memberList2">${dto.company}</td>
						<td class="memberList2">${dto.job}</td>
						<td class="memberList2">${dto.career}</td>
						<td class="memberList2">${dto.part}</td>
					</tr>

				</c:forEach>
			</tbody>
		</table>

	</div>


	<footer class="container-fluid text-center"> <a href="#myPage"
		title="To Top"> <span class="glyphicon glyphicon-chevron-up"></span>
	</a>
	<p>
		Made By group ACE &nbsp;&nbsp; designed By group ACE <br>Tel:02-112-1122
		&nbsp;&nbsp; e-mail: syu@ac.kr <br> <a href="#">www.ACEteam.com</a>
	</p>
	</footer>



</body>
</html>

