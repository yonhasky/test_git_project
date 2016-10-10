<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.ArrayList"
    import="work.model.dto.Kin" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>������</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<link href="css/common.css" rel="stylesheet" type="text/css">

</head>
<body>
	<%@ include file="topMenuSuccess.jsp"%>
	<div class="jumbotron text-center">
		<h1>���� IN</h1>
		<p>���� & �亯</p>
		<form class="form-inline">
			<input type="text" class="form-control" size="50" placeholder="�˻�"
				required>
			<button type="button" class="btn btn-danger">�˻�</button>
		</form>
	</div>
	
	<!-- Container (Pricing Section) -->
	<div id="pricing" class="container-fluid">
		<div class="row">
			<div class="text-center">

<!-- 				<form class="navbar-form navbar-left" role="search"> -->
<!-- 					<div class="form-group"> -->
<!-- 						<input type="text" class="form-control" placeholder="Search"> -->
<!-- 					</div> -->
<!-- 					<button type="submit" class="btn btn-default">Submit</button> -->
<!-- 				</form> -->

			</div>
			<div class="row slideanim">
				<div class="col-sm-12 col-xs-12">
					<div class="panel panel-default text-center">
						<div class="panel-heading">
							<h1 class="text-center"><span class="glyphicon glyphicon-list-alt"></span> ����IN</h1><br/><br/>
						</div>
						<form method="post"
							action="Kcontroller?action=kinListSearch&pageNum=1">
<!-- 							<div class="col-sm-offset-7"> -->
<!-- 								<select class="col-sm-4" name="sType"> -->
<!-- 									<option value="b_title">����</option> -->
<!-- 									<option value="b_author">�ۼ���</option> -->
<!-- 								</select> <input type="text" class="col-sm-4" name="sTitle" id="bTitle"> -->
<!-- 								<button type="submit" class="col-sm-2">�˻�</button> -->
<!-- 							</div> -->
						</form>
						<table class="table table-hover">
							<tr>
<!-- 								<th class="col-sm-1" align="center">����</th> -->
								<th align="center">No.1</th>
								<th align="center">����</th>
								<th align="center">������</th>
								<th align="center">�亯</th>
								<th align="center">�ۼ���</th>
							</tr>
							<c:forEach var="dto" items="${requestScope.list}">
								<tr>
								<td>${dto.kNo}</td>
								<td>(${dto.kType})<a href="Kcontroller?action=kinSearch&kNo=${dto.kNo}"> ${dto.kTitle}</a></td>
								<td>${dto.kAuthor}</td>
								<td>${dto.kRpl}</td>
								<td>${dto.kDate}</td>
								</tr>
							</c:forEach>
						</table>
<!-- 						<div class="col-sm-offset-10"> -->
<!-- 					     <button type="button" onclick="document.location.href='kinWrite.jsp'" class="col-sm-4 btn btn-lg">�۾���</button> -->
<!-- 						</div> -->
						<br/><br/>
						<nav align="center">
						  <ul class="pagination">
						    <li>
						      <a href="Kcontroller?action=kinList&pageNum=<%=Integer.parseInt(request.getParameter("pageNum"))-1%>" aria-label="Next">
						        <span aria-hidden="true">&laquo;</span>
						      </a>
						    </li>
						    <%
								ArrayList list = (ArrayList)request.getAttribute("list");
								Kin dto = null;
								for(int i = 0; i < list.size(); i++) {
									dto = (Kin)list.get(i);
								}	
							%>
							
						    <%for(int j = 0; j < dto.getkCount(); j++) { %>
						    	<li><a href="Kcontroller?action=kinList&pageNum=<%=j+1%>"><%=j+1%></a></li>
						    <%} %>
						    
						    <li>
						      <a href="Kcontroller?action=kinList&pageNum=<%=Integer.parseInt(request.getParameter("pageNum"))+1%>" aria-label="Next">
						        <span aria-hidden="true">&raquo;</span>
						      </a>
						    </li>
						  </ul>
						</nav>
							<div class="panel-footer">
								<button class="btn btn-lg" onclick="document.location.href='kinWrite.jsp'">����ϱ�</button>
							</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>