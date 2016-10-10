<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="work.model.dto.Study"
		 import="work.model.dto.StudyMatch" 
	     import="java.util.ArrayList" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>���͵� �󼼺���</title>
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
	<%@ include file="topMenuSuccess.jsp"%>
	<%  ArrayList list = (ArrayList)request.getAttribute("list");
		Study dto = (Study)list.get(0); %>
	<div class="jumbotron text-center">

		<h1>Study</h1>
		<p>Study Campus in Sahmyook University</p>
		<form name="form" class="form-inline">
			<span class="form-group"> <span class="col-xs-12"> 
			<select	class="form-control" name="stType" size=1>
						<OPTION value="">�˻�</OPTION>
						<OPTION value="">����</OPTION>
						<OPTION value="">�ۼ���</OPTION>
						<OPTION value="">����</OPTION>
			</select>
			</span>
			</span>
			<input type="text" class="form-control" size="50" placeholder="�˻�" required>
			<button type="button" class="btn btn-danger">�˻�</button>
		</form>
	</div>
		
		<div id="portfolio" class="container-fluid text-center bg-grey">
		
		<div class="row">
			<h2>Study Room</h2>
			<h4>���л� �� ���������� ���� ���ι�</h4>
			
		<div class="row col-xs-offset-2 col-xs-8"
				style="border: 10px #f4511e solid; padding-top: 30px">
			<span class="glyphicon glyphicon-education logo-small"></span>
			<h2><%=dto.getStTitle() %></h2>
			<h4>���͵� ����Ⱓ  :  <%=dto.getStPeriod() %></h4>
			<h4><%=dto.getStOverview() %></h4>
			</div>
		<div>
			<div class="row col-xs-offset-2 col-xs-8"
				style="border: 10px #f4511e solid; padding-top: 30px">
				<div class="col-xs-offset-2 col-xs-8">
					<ul class="nav nav-tabs nav-justified">
						<li role="presentation" class="active"><span class="glyphicon glyphicon-education logo-small"></span><h2>���͵� �� ����</h2></li>
					</ul>
					<div class="col-xs-offset-10 col-xs-4">
						�ۼ��� : <%=dto.getStDate() %>     
					</div>
					<div class="col-xs-offset-10 col-xs-4">
						��ȸ�� : <%=dto.getStHit() %>
					</div>
				</div>
				<div>
					<table class="table" style="margin-top: 20px;">
						<tr>
							<td><img alt="images/gDate.png" src="images/gDate.png">���͵� ������</td>
							<td></td>
							<td><%=dto.getStAuthor()%></td>
							<td></td>
						</tr>
						<tr>
							<td><img alt="images/career.png" src="images/career.png">���͵� ����Ⱓ</td>
							<td></td>
							<td><%=dto.getStPeriod() %></td>
							<td></td>
						</tr>
						<tr>
							<td><img alt="images/grade.png" src="images/birth.png">���͵� ����</td>
							<td></td>
							<td><%=dto.getStOverview()%></td>
							<td></td>
						</tr>
						<tr>
							<td><img alt="images/grade.png" src="images/grade.png">���͵� �� ����</td>
							<td></td>
							<td><%=dto.getStContent()%></td>
							<td></td>
						</tr>
						<tr>
							<td><img alt="images/job.png" src="images/job.png">÷������1</td>
							<td></td>
							<td><img src="<%=dto.getStFile1()%>"></td>
							<td></td>
						</tr>
						<tr>
							<td><img alt="images/job.png" src="images/job.png">÷������2</td>
							<td></td>
							<td><img src="<%=dto.getStFile2()%>"></td>
							<td></td>
						</tr>
						<tr>
						<td>���� ����</td>
						<td></td>
						<%if(dto.getStStatus().equals("A")) {%>
							<td>[��û ����]</td>
						<%} else if(dto.getStStatus().equals("P")) {%>
							<td>[���� ��]</td>
						<%} else { %>
							<td>[����]</td>
						<%} %>
						<td></td>
						</tr>
					</table>
				</div>
			</div>
		</div>
		</div>
		<div class="col-xs-offset-6 col-xs-5">
		 
		<ul class="pager">
		<% if(dto.getStAuthor().equals(session.getAttribute("id"))){ %>
			<li role="presentation" class="active"><a href="#"><img
										src="images/delete.png">����</a></li>
			<li role="presentation" class="active"><a href="StudyController?action=searchStudyList&pageNum=1"><img alt="images/grade.png" src="images/grade.png">���</a></li>
		<%} else {%>
			<li role="presentation" class="active"><a><img alt="images/grade.png" src="images/email.png">����������</a></li>
			<%if(dto.getStStatus().equals("A")) {%>
			<li role="presentation" class="active"><a href="#"><img
										src="images/update.png">���͵��û</a></li>
			<%} %>
			<li role="presentation" class="active"><a href="StudyController?action=searchStudyList&pageNum=1"><img alt="images/grade.png" src="images/grade.png">���</a></li>
		<%} %>			
		</ul>
		</div>
	</div>


	<div class="row container-fluid text-center">
		<div class=" col-xs-offset-2 col-xs-8"
			style="border: 6px black solid; padding-top: 60px">
			<div class="col-xs-3">
				<div class="col-xs-12 glyphicon glyphicon-education logo-small"></div>
				<br> <br>
				<h2>���͵� ��û����</h2>
			</div>
			<div class=" col-xs-9">

				<table class="table col-xs-12" style="margin-top: 20px;">
					<tr>
						<td class="memberList col-xs-2">���͵� ��û��</td>
						
						<td class="memberList col-xs-7">���� �Ѹ���</td>
						
						<td class="memberList col-xs-2">���͵� ��û��</td>
						<td class="memberList col-xs-1">����</td>
							
					</tr>
					<% StudyMatch dto1 = null;
					   		for(int i = 1; i < list.size(); i++) {
					   			dto1 = (StudyMatch)list.get(i);%>
						<tr>
							<td class="memberList2 col-xs-2"><%=dto1.getStmEntry() %></td>
							
							<td class="memberList2 col-xs-7"><%=dto1.getStmEntryComment() %></td>
							
							<td class="memberList2 col-xs-2"><%=dto1.getStmEntryDate() %></td>
							<%if(dto1.getStmEntryStatus().equals("A")) {  %>
								<td class="memberList2 col-xs-1">����</td>
							<%} else { %>
								<td class="memberList2 col-xs-1">����</td>
						</tr>
						<%} %>
							<%if(dto1.getStmEntry().equals(session.getAttribute("id"))) { %>
							<a href="#"><img
									src="images/update.png"></a> | <a href="#"><img
									src="images/delete.png"></a>
							<%} %>
					<%} %>
				</table>
			</div>
		</div>
	</div>
	
	<%@ include file="footer.jsp"%>
</body>
</html>