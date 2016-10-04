<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="work.model.dto.Student"%>
<%@ page import="work.model.dto.Mentoring"%>

<%@ page import="work.util.Utility"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<!-- Theme Made By www.w3schools.com - No Copyright -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/ajax.js"></script>

<link href="css/common.css" rel="stylesheet" type="text/css">



<style type="text/css">
.form-control {
	width: 300px
}
</style>

</head>
<body id="myPage" data-spy="scroll" data-target=".navbar"
	data-offset="60">

	<%@ include file="topMenu.jsp"%>

	<!-- Container (About Section) -->
	<div id="about" class="container-fluid">
		<div class="row">
			<div class="col-sm-4">
				<span class="glyphicon glyphicon-user logo"></span>
			</div>
			<div class="col-sm-8">
				<form name="form" class="form-horizontal" method="post"
					action="MentoringController?action=mentoringInsert">
					<div class="form-group">
						<label for="inputPassword3" class="col-xs-2 control-label">멘토
							ID</label>
						<div class="col-xs-5">
							<input type="text" class="form-control" id="id" name="id"
								value=<%=request.getParameter("id")%> readonly>
						</div>
					</div>
					<div class="form-group">
						<label for="inputEmail3" class="col-xs-2 control-label">ID</label>
						<span class="col-xs-4" style="width: 300px"> <input
							type="text" class="form-control" id="mEntry" name="mEntry"
							maxlength="12" value=<%=session.getAttribute("id")%> readonly>
					</div>
					<div class="form-group">
						<label for="inputEmail3" class="col-xs-2 control-label">학번</label>
						<span class="col-xs-4" style="width: 300px"> <input type="text"
							class="form-control" id="mGrade" name="mGrade" maxlength="12"
							value=<%=session.getAttribute("grade")%> readonly></div>
					<div class="form-group">
						<label for="inputEmail3" class="col-xs-2 control-label">전공</label>
						<span class="col-xs-4" style="width: 300px"> <input
							type="text" class="form-control" id="mMajor" name="mMajor"
							maxlength="12" value=<%=session.getAttribute("major")%> readonly>
					</div>

					<div class="form-group">
						<label for="inputPassword3" class="col-xs-2 control-label">이름</label>
						<div class="col-xs-5">
							<input type="text" class="form-control" id="mName" name="mName"
								value=<%=session.getAttribute("name")%> readonly>
						</div>
					</div>


					<div class="form-group">
						<label for="inputPassword3" class="col-xs-2 control-label">내용</label>
						<div class="col-xs-5">
							<input type="text" class="form-control" id="mComment"
								name="mComment">
						</div>
					</div>



					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-4">
							<button id="btnJoin" type="submit" class="btn btn-default btn-lg"
								name="submit">Sign in</button>

						</div>
					</div>

				</form>


			</div>

		</div>
	</div>

	<%@ include file="footer.jsp"%>

</body>
</html>