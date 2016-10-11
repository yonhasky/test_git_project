<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<%@ page import="work.model.dto.Kin" %>
<%@ page import="work.model.dto.Kinreplie" %>
<%@ page import="java.util.ArrayList" %>
				
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>지식인</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<link href="css/common.css" rel="stylesheet" type="text/css">

<script>
function moveListPage() {
	document.entryForm.action = "Kcontroller?action=kinList&pageNum=1";
	document.entryForm.submit();
}
</script>
</head>
<body>
<%@ include file="topMenuSuccess.jsp"%>
	<div class="jumbotron text-center">
		<h1>지식 IN</h1>
		<p>질문 & 답변</p>
		<form class="form-inline">
			<input type="text" class="form-control" size="50" placeholder="검색"
				required>
			<button type="button" class="btn btn-danger">검색</button>
		</form>
	</div>

	<!-- Container (Pricing Section) -->
	<div id="pricing" class="container-fluid">
		<div class="row">
			<div class="text-center">
			
				<h1 class="text-center"><span class="glyphicon glyphicon-list-alt"></span> 지식IN</h1><br/><br/>
						<h5 class="text-center"> 질문 </h5><br/>
				<hr/>
				<% 
					String message = (String)request.getAttribute("message");
					if(message != null) {
				%>
				<script>
					alert('<%=message%>');
				</script>
				<%
					}
					Kin dto = (Kin)request.getAttribute("dto");
				%>
				<form class="form-horizontal" name="entryForm" method="post">
				  <div class="form-group">
				    <label for="kTitle" class="col-sm-2 control-label">제목</label>
				    <div class="col-sm-8">
				      <label class="text-center"><%=dto.getkTitle()%></label>
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="kContent" class="col-sm-2 control-label">작성자</label>
				    <div class="col-sm-8">
				      <label class="text-center"><%=dto.getkAuthor()%></label>
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="kDate" class="col-sm-2 control-label">작성일</label>
				    <div class="col-sm-8">
				      <label class="text-center"><%=dto.getkDate()%></label>
				    </div>
				  </div>
				   <div class="form-group">
				    <label for="kType" class="col-sm-2 control-label">타입</label>
				    <div class="col-sm-8">
				      <label class="text-center"><%=dto.getkType()%></label>
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="kContent" class="col-sm-2 control-label">내용</label>
				    <div class="col-sm-7">
				   		<textarea class="form-control" name="bContent" rows="7" readonly><%=dto.getkContent()%></textarea>   
				    </div>
				  </div>
<!-- 				  <div class="form-group"> -->
<!-- 				    <label for="bContent" class="col-sm-2 control-label">사진</label>&nbsp &nbsp &nbsp -->
<%-- 				  <%if(dto.getkFile1() != null) { %> --%>
<%-- 				  <img src="<%=dto.getkFile1()%>" width="200px" height="150px" onclick="if(confirm('해당 항목을 추천하시겠습니까?')){document.location.href='Controller?action=boardRecommend&rNum=1&boardNum=<%=request.getParameter("boardNum")%>'}"/> --%>
<%-- 				  <label><span class="glyphicon glyphicon-thumbs-up"></span>추천수<%=dto.getkRecommends()%></label> --%>
<%-- 				  <%}%> --%>
<%-- 				  <%if(dto.getbFile2() != null) { %> --%>
<%-- 				  <img src="<%=dto.getbFile2()%>" width="200px" height="150px" onclick="if(confirm('해당 항목을 추천하시겠습니까?')){document.location.href='Controller?action=boardRecommend&rNum=2&boardNum=<%=request.getParameter("boardNum")%>'}"/> --%>
<%-- 				  <label><span class="glyphicon glyphicon-thumbs-up"></span>추천수<%=dto.getbRecommend2()%></label> --%>
<%-- 				  <%}%> --%>
<!-- 				  </div> -->
				 
				  <div class="form-group">
				    <label for="kDate" class="col-sm-2 control-label">조회수</label>
				    <div class="col-sm-8">
				      <label class="text-center"><%=dto.getkHit()%></label>
				    </div>
				  </div>
				  
				  <div class="form-group">
				    <label for="kDate" class="col-sm-2 control-label">답변수</label>
				    <div class="col-sm-8">
				      <label class="text-center"><%= dto.getkRpl() %></label>
				    </div>
				  </div>
				  
				  <div class="form-group">
				    <div class="col-sm-offset-8">
<%-- 				      <%if(session.getAttribute("uGrade") != null || session.getAttribute("uId") != null) {%> --%>
<%-- 				      <%if(session.getAttribute("uGrade").equals("A") || (session.getAttribute("uId").equals(dto.getkAuthor()))) { %> --%>

<%-- 				      <%} --%>
<%-- 				        }%>  --%>
							
				    </div>
				  </div>
				</form>
				<div class="panel-footer">
							<button class="btn btn-lg" onclick="if(confirm('답변을 등록하시겠습니까?')){document.location.href='Kcontroller?action=kinSearchRpl&kNo=<%=request.getParameter("kNo")%>'}">답변하기</button>
							<button class="btn btn-lg" onclick="if(confirm('게시글을 수정하시겠습니까?')){document.location.href='Kcontroller?action=kinSearch&opt=update&kNo=<%=request.getParameter("kNo")%>'}">수정</button>
							<button class="btn btn-lg" onclick="if(confirm('게시글을 삭제하시겠습니까?')){document.location.href='Kcontroller?action=kinDelete&kNo=<%=request.getParameter("kNo")%>'}">삭제</button>
							</div>
				<br/>
				<!-- ---------------------------------------------------------------- -->
				
					
				<% ArrayList<Kinreplie> list = (ArrayList)request.getAttribute("list");
				if(list != null) {%>
				<c:forEach var="dto" items="${requestScope.list}">
					<table class="table table-hover">
							<tr>
								<th >제목</th>
								<th >답변자</th>
								<th >답변내용</th>
								<th >답변일</th>
							</tr>
							<tr>
								<td>${dto.rTitle}</td>
								<td>${dto.rAuthor}</td>
								<td>${dto.rContent}</td>
								<td>${dto.rDate}</td>
							</tr>
					</table>
					<div class="panel-footer">
					<button class="btn btn-lg" onclick="if(confirm('답변을 수정하시겠습니까?')){document.location.href='Rcontroller?action=rplSearch&opt=update&kNo=${dto.kNo}&rNo=${dto.rNo}'}">수정</button>
					<button class="btn btn-lg" onclick="if(confirm('답변을 삭제하시겠습니까?')){document.location.href='Kcontroller?action=rplDelete&kNo=${dto.kNo}&rNo=${dto.rNo}'}">삭제</button>
					</div>
					<br/>
				</c:forEach>
				<%} %>
				  
						<div class="panel-footer">
							<button class="btn btn-lg" onclick="moveListPage()">목록</button>
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