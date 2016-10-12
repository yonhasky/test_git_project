<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>MCS ȸ������������</title>

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

		var pw = document.updatePw.pw.value;
		params += "&pw=" + pw;

		// ���䵥���� : Json
		params += "&responseDataType=json";

		//�������� �ݹ� �Լ� ���ε�
		var callback = responseJson;
		var method = "GET";
		// js/ajax.js ��ũ��Ʈ �̿���� ajax ���� ��û
		new ajax.xhr.Request(url, params, callback, method)
	}

	/** Json ���䵥���� ó�� callback �Լ�
	 {"valid","true"}

	 eval("1+2") =>���ڿ����� ��ȯ�Լ�
	 json ������ ���ڿ��� json��ü ��ȯ
	 eval("("+json������ ���乮�ڿ�+")")
	 */
	function responseJson(xhr) {
		if (xhr.readyState == 4 && xhr.status == 200) {
			var resultJson = eval("(" + xhr.responseText + ")");
			var result = resultJson.valid;
			if (result == 'true') {
				// messageUserId ����޼��� ���
				document.getElementById("pwConfirm").innerHTML = "<span class='glyphicon glyphicon-ok' aria-hidden='true'></span><span class='sr-only'>Error:</span>��ġ ";
				document.getElementById("btnPw").disabled = false;

			} else if (result == 'false') {
				document.getElementById("pwConfirm").innerHTML = "<span class='glyphicon glyphicon-remove' aria-hidden='true'></span><span class='sr-only'>Error:</span>����ġ ";
				document.getElementById("btnPw").disabled = true;
				document.getElementById("pw").focus();

			} else if (result == 'required') {
				document.getElementById("pwConfirm").innerHTML = "���Է�";
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

		// ���䵥���� : Json
		params += "&responseDataType=json";

		//�������� �ݹ� �Լ� ���ε�
		var callback = responseJson2;
		var method = "GET";
		// js/ajax.js ��ũ��Ʈ �̿���� ajax ���� ��û
		new ajax.xhr.Request(url, params, callback, method)
	}

	/** Json ���䵥���� ó�� callback �Լ�
	 {"valid","true"}

	 eval("1+2") =>���ڿ����� ��ȯ�Լ�
	 json ������ ���ڿ��� json��ü ��ȯ
	 eval("("+json������ ���乮�ڿ�+")")
	 */
	function responseJson2(xhr) {
		if (xhr.readyState == 4 && xhr.status == 200) {
			var resultJson = eval("(" + xhr.responseText + ")");
			var result = resultJson.valid;
			if (result == 'true') {
				// messageUserId ����޼��� ���
				document.getElementById("pwConfirmDelete").innerHTML = "<span class='glyphicon glyphicon-ok' aria-hidden='true'></span><span class='sr-only'>Error:</span>��ġ ";
				document.getElementById("btnPwDelete").disabled = false;

			} else if (result == 'false') {
				document.getElementById("pwConfirmDelete").innerHTML = "<span class='glyphicon glyphicon-remove' aria-hidden='true'></span><span class='sr-only'>Error:</span>����ġ ";
				document.getElementById("btnPwDelete").disabled = true;
				document.getElementById("pwDelete").focus();

			} else if (result == 'required') {
				document.getElementById("pwConfirmDelete").innerHTML = "���Է�";
				document.getElementById("btnPwDelete").disabled = true;
				document.getElementById("pwDelete").focus();

			}
		}

	}
</script>
</head>
<body id="myPage">

	<%@ include file="topMenuSuccess.jsp"%>


	<div class="jumbotron text-center">



		<h1>MC in SYU</h1>
		<p>Mentoring Campus in Sahmyook University</p>
		
	</div>



	<!-- Container (Services Section) -->
	<div id="services" class="container-fluid text-center">



		<h2>MEMBER Information</h2>
		<h4><%=session.getAttribute("id")%>��&nbsp;
		<%if(session.getAttribute("part").equals("S")) {%>
			���л� ��� 
		<%} else if(session.getAttribute("part").equals("G")) {%>
			������ ���
		<%} else { %>
			������ ���
		<%} %>
		</h4>
		<br>
		<div class="row slideanim">
			<div class="col-sm-4">
				<a href="controller?action=studentInfo"> <span
					class="glyphicon glyphicon-user logo-small"></span>
					<h4>ȸ����������</h4></a>
			</div>
			<div class="col-sm-4">
				<a data-toggle="modal" data-target="#upPwModal"> <span
					class="glyphicon glyphicon-lock logo-small"></span>
					<h4>��й�ȣ ����</h4></a>

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
								<h4 class="modal-title" id="myModalLabel">��й�ȣ ����</h4>
							</div>
							<div class="modal-body">
								<form class="form-horizontal" name="updatePw" method="post"
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
												style="float: left">��й�ȣ ����</button>
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
					<h4>ȸ�� Ż��</h4></a>


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
								<h4 class="modal-title" id="myModalLabel">ȸ�� Ż��</h4>
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
										<div class="col-sm-10">
											<span id="pwConfirmDelete" class="col-xs-4 "
												style="margin-left: 10px"></span>
										</div>
									</div>

									<div class="form-group">
										<div class="col-sm-offset-2 col-sm-10">
											<button type="submit" id="btnPwDelete"
												class="btn btn-default" style="float: left">ȸ�� Ż��</button>
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
				<a href="MentoringController?action=myMentoring"> <span
					class="glyphicon glyphicon-education logo-small"></span>
					<h4>���� ���丵</h4></a>
			</div>

			<div class="col-sm-4">
				<a href="StudyController?action=searchNoteList"> <span
					class="glyphicon glyphicon-envelope logo-small"></span>
					<h4>��������</h4></a>
			</div>
			
			<div class="col-sm-4">
				<a href="https://suwings.syu.ac.kr/sso/login.jsp"> <span
					class="glyphicon glyphicon-plane logo-small"></span>
					<h4>SU-Wings</h4></a>
			</div>
		</div>
	</div>

<jsp:include page="footer.jsp"/>
</body>
</html>

