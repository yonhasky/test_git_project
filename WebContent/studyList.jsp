<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="work.model.dto.Study"%>
<%@ page import="work.util.Utility"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>스터디 목록</title>
<!-- Theme Made By www.w3schools.com - No Copyright -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<link href="css/common.css" rel="stylesheet" type="text/css">
<style>
.btn-warning {
	background-color: #F7BE81;
}
.btn-major{
background-color:#f4511e;
color:white;
font-weight:bold;
}
</style>
</head>
<body>
<script>
<% if(request.getAttribute("message")!= null) {%>
alert('<%=request.getAttribute("message") %>');
<%}%>
</script>
	<%@ include file="topMenuSuccess.jsp"%>
	<div class="jumbotron text-center">

		<h1>Study</h1>
		<p>Study Campus in Sahmyook University</p>
		<form name="form" class="form-inline">
			<span class="form-group"> <span class="col-xs-12"> 
			<select	class="form-control" name="stType" size=1>
						<OPTION value="">검색</OPTION>
						<OPTION value="">제목</OPTION>
						<OPTION value="">작성자</OPTION>
						<OPTION value="">내용</OPTION>
			</select>
			</span>
			</span>
			<input type="text" class="form-control" size="50" placeholder="검색" required>
			<button type="button" class="btn btn-danger">검색</button>
		</form>
	</div>

	<!-- Container (Portfolio Section) -->
	<div id="portfolio" class="container-fluid text-center bg-grey">
		<div class="row">

			<h2>Study Room</h2>
			<h4>재학생 및 졸업생들을 위한 공부방</h4>
			<div class="row col-xs-12">
			<%
							ArrayList list = (ArrayList)request.getAttribute("list");
							Study dto = null;
							
							for(int i = 0; i < list.size(); i++) {
								dto = (Study)list.get(i);
			%>
				<div class="col-xs-5" style="background-color: white; margin: 30px">
					<div class="col-xs-3">
					
						<div class="col-xs-12 btn-group" role="group">
								<button type="button" class="btn btn-lg" aria-label="..">진행 상황</button>
						</div>
						
						<% if(dto.getStStatus().equals("A")) { %>
						<div class="col-xs-12 ">
							<img src="images/apply.jpg" alt="images/ceci1.jpg" class="img-circle"
								style="width: 80px; height: 80px; margin: 15px">
						</div>
						<%} else if(dto.getStStatus().equals("P")) { %>
						<div class="col-xs-12 ">
							<img src="images/process.jpg" alt="images/ceci1.jpg" class="img-circle"
								style="width: 80px; height: 80px; margin: 15px">
						</div>
						<%} else { %>
						<div class="col-xs-12 ">
							<img src="images/term.jpg" alt="images/ceci1.jpg" class="img-circle"
								style="width: 80px; height: 80px; margin: 15px">
						</div>
						<%} %>
					</div>
					<div class="col-xs-7 caption">
						<div class="btn-group btn-group-justified" role="group"
							aria-label="...">
							<div class="btn-group" role="group">
								<button type="button" class="btn btn-major">진행기간</button>
							</div>

							<div class="btn-group" role="group">
								<button type="button" class="btn btn-major"><%=dto.getStPeriod() %></button>
							</div>
						</div>
						
						<div class="col-xs-12">
							<h3><%=dto.getStTitle() %></h3>
							<p><%=dto.getStAuthor() %></p>
							<p><%=dto.getStDate() %></p>
						</div>
					</div>
					<button class="col-xs-2 btn"
						style="height: 190px; background-color: #f4511e">
						<a href="StudyController?action=searchStudy&stNo=<%=dto.getStNo()%>"
							class="glyphicon glyphicon-chevron-right logo-small"
							style="color: white" role="button"></a>
					</button>
				</div>
			<%} %>
			</div>
		</div>
		<div class="col-xs-1"></div>
		<div class="col-xs-8">
		<ul class="pagination">
    	<% if(dto.getStCount() != 0) { %>
    	<li>
      	<a href="StudyController?action=searchStudyList&pageNum=<%=Integer.parseInt(request.getParameter("pageNum"))-1 %>" aria-label="Previous">
        	<span aria-hidden="true">&laquo;</span>
      	</a>
    	</li>
    	<%} %>
    	<% for(int i = 0 ; i < dto.getStCount() ; i++) { %>
    	<li><a href="StudyController?action=searchStudyList&pageNum=<%=i+1%>"><%=i+1%></a></li>
    	<%} %>
    	<% if(dto.getStCount() != 0) { %>
    	<li>
      	<a href="StudyController?action=searchStudyList&pageNum=<%=Integer.parseInt(request.getParameter("pageNum"))+1%>" aria-label="Next">
        	<span aria-hidden="true">&raquo;</span>
      	</a>
    	</li>
    	<%} %>
    	</ul>
    	</div>
    	<div class="col-xs-2">
    		<button type="button" class="btn btn-info btn-lg" onclick="location.href='studyInsert.jsp'">스터디 등록</button>
    	</div>
	</div>


	<%@ include file="footer.jsp"%>
</body>
</html>