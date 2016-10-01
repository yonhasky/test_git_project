<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
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

	<nav class="navbar navbar-default navbar-fixed-top">
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#myNavbar">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="success.jsp">MCS</a>
		</div>
		<div class="collapse navbar-collapse" id="myNavbar">

			<ul class="nav navbar-nav navbar-right">
				<li>
					<!-- Button trigger modal -->
					<button type="button" class="btn btn-primary " data-toggle="modal"
						data-target="#myModal" style="margin: 8px"><%=session.getAttribute("id")%>님&nbsp;<%=session.getAttribute("part")%>등급</a>
					</button> <!-- Modal -->


				</li>
				<li><a href="about.jsp">ABOUT</a></li>
				<li><a href="mentoring.jsp">멘토링</a></li>
				<li><a href="study.jsp">그룹스터디</a></li>
				<li><a href="kin.jsp">지식IN</a></li>
				<li><a href="notice.jsp">고객센터</a></li>

			</ul>
		</div>
	</div>

	</nav>

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



		<h2>MCS</h2>
		<h4><%=session.getAttribute("id")%>님&nbsp;<%=session.getAttribute("part")%>등급
		</h4>
		<br>
		<div class="row slideanim">
			<div class="col-sm-4">
				<a href="studentUpdate.jsp"> <span
					class="glyphicon glyphicon-user logo-small"></span>
					<h4>회원정보수정</h4></a>
			</div>
			<div class="col-sm-4">
				<a data-toggle="modal" data-target="#upPwModal"> <span
					class="glyphicon glyphicon-lock logo-small"></span>
					<h4>비밀번호 변경</h4></a>

				<!-- Button trigger modal -->
				<!-- Modal -->
				<div class="modal fade" id="upPwModal" tabindex="-1" role="dialog"
					aria-labelledby="myModalLabel">
					<div class="modal-dialog" role="document" style="margin-top: 100px">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
								<h4 class="modal-title" id="myModalLabel">비밀번호 변경</h4>
							</div>
							<div class="modal-body">
								<form class="form-horizontal" method="post"
									action="controller?action=newPasswd">
									<div class="form-group">
										<label for="inputEmail3" class="col-sm-2 control-label">PW</label>
										<div class="col-sm-10">
											<input type="text" class="form-control" id="pw" name="pw"
												onblur="isPw()">
										</div>
									</div>
									<div class="form-group">
										<label for="inputPassword3" class="col-sm-2 control-label">pwConfirm</label>
										<span id="pwConfirm" class="col-xs-4 "
											style="margin-left: 10px"></span>
									</div>
									<div class="form-group">
										<label for="inputEmail3" class="col-sm-2 control-label">NEW
											PW</label>
										<div class="col-sm-10">
											<input type="text" class="form-control" id="newPw"
												name="newPw">
										</div>
									</div>

									<div class="form-group">
										<div class="col-sm-offset-2 col-sm-10">
											<button type="submit" id="btnPw" class="btn btn-default"
												style="float: left">비밀번호 변경</button>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>








			</div>
			<div class="col-sm-4">
				<a data-toggle="modal" data-target="#deleteModal"> <span
					class="glyphicon glyphicon-trash logo-small"></span>
					<h4>회원 탈퇴</h4></a>


				<!-- Button trigger modal -->
				<!-- Modal -->
				<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog"
					aria-labelledby="myModalLabel">
					<div class="modal-dialog" role="document" style="margin-top: 100px">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
								<h4 class="modal-title" id="myModalLabel">회원 탈퇴</h4>
							</div>
							<div class="modal-body">
								<form class="form-horizontal" method="post"
									action="controller?action=deleteStudent">
									<div class="form-group">
										<label for="inputEmail3" class="col-sm-2 control-label">PW</label>
										<div class="col-sm-10">
											<input type="text" class="form-control" id="pwDelete"
												name="pwDelete" onblur="isPwDelete()">
										</div>
									</div>
									<div class="form-group">
										<label for="inputPassword3" class="col-sm-2 control-label">pwConfirm</label>
										<div class="col-sm-10"><span id="pwConfirmDelete" class="col-xs-4 "
											style="margin-left: 10px"></span></div>
									</div>

									<div class="form-group">
										<div class="col-sm-offset-2 col-sm-10">
											<button type="submit" id="btnPwDelete"
												class="btn btn-default" style="float: left">회원 탈퇴</button>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>




			</div>
		</div>
		<br> <br>
		<div class="row slideanim">
			<div class="col-sm-4">
				<a href="#"> <span
					class="glyphicon glyphicon-education logo-small"></span>
					<h4>나의 스터디</h4></a>
			</div>
			<div class="col-sm-4">
				<a href="#"> <span
					class="glyphicon glyphicon-heart-empty logo-small"></span>
					<h4>나의 멘토링</h4>
				</a>
			</div>
			<div class="col-sm-4">
				<a href="#"> <span
					class="glyphicon glyphicon-info-sign logo-small"></span>
					<h4>나의 지식인</h4></a>
			</div>

		</div>
		<br> <br>
		<div class="row slideanim">
			<div class="col-sm-4">
				<a href="#"> <span
					class="glyphicon glyphicon-question-sign logo-small"></span>
					<h4>나의 문의내역</h4></a> </a>
			</div>
			<div class="col-sm-4">
				<a href="#"> <span
					class="glyphicon glyphicon-envelope logo-small"></span>
					<h4>쪽지관리</h4></a>
			</div>
			<div class="col-sm-4">
				<a href="#"> <span class="glyphicon glyphicon-plane logo-small"></span>
					<h4>SU-Wings</h4></a>
			</div>
		</div>
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

