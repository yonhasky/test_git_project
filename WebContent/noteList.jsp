<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"
    import="java.util.ArrayList"
    import="work.model.dto.Note"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.css">
<script src="js/ajax.js"></script>


<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<link href="css/common.css" rel="stylesheet" type="text/css">

</head>
<body>
<jsp:include page="topMenuSuccess.jsp"/>
	<div class="jumbotron text-center">
		<h1>MC in SYU</h1>
		<p>Mentoring Campus in Sahmyook University</p>
	</div>
	<div id="services" class="container-fluid text-center">
		
		
		<div class="glyphicon glyphicon-envelope logo-small">NOTES</div>
		<h4>���л� �� ������ ���� �޼����� �ְ� ��������!</h4>
	
	</div>
	
	<div class="row container-fluid text-center">
		<div class=" col-xs-offset-2 col-xs-8"
			style="border: 6px black solid; padding-top: 60px">
			<div class="col-xs-2">
				<h2> <img src="images/email.png"/>������</h2>
				<div id="deleteStudy"></div>
			</div>
			<div class=" col-xs-10">

				<table class="table col-xs-12" style="margin-top: 20px;">
					<tr>
						<td class="memberList col-xs-2">���� ���</td>
						
						<td class="memberList col-xs-7">�޴� ���</td>
						
						<td class="memberList col-xs-2">����</td>
						<td class="memberList col-xs-1">���� ��¥</td>				
					</tr>
					<% ArrayList list = (ArrayList)request.getAttribute("list");
						Note dto = null;
						for(int i = 0 ; i <list.size(); i++) { 
							dto = (Note)list.get(i);%>
					<tr>
						<td class="memberList2"><%=dto.getnSender() %></td>
						<td class="memberList2"><%=dto.getnReciever() %></td>
						<td><a href="#" data-toggle="modal"
						data-target="#noteModal<%=dto.getnNo()%>"><%=dto.getnTitle() %></a></td>
						
						<td class="memberList2"><%=dto.getnDate() %></td>
					</tr>
					<%} %>			
				</table>
				<% 	 	for(int i = 0 ; i <list.size(); i++) { 
							dto = (Note)list.get(i);%>
				<div class="modal fade" id="noteModal<%=dto.getnNo()%>" tabindex="-1" role="dialog"
						aria-labelledby="myModalLabel" style="margin:30px;">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
									<h4 class="modal-title" id="myModalLabel"><div class="col-xs-12 glyphicon glyphicon-education logo-small"></div><h4>���� ����</h4>
								</div>
								
								<div class="modal-body">
									<form class="form-horizontal" id="entryForm" name="entryForm" method="post" action="StudyController?action=addStudyMatch&stNo=">
										<div class="form-group">
											<label for="stmTitle" class="col-xs-3 control-label">���� ���</label>
											<div class="col-xs-8">
												<input type="text" class="form-control" id="stmTitle" name="stmTitle" value="<%=dto.getnReciever()%>" readonly>
											</div>
										</div>
										<div class="form-group">
											<label for="stmHost" class="col-xs-3 control-label">�޴� ���</label>
											<div class="col-xs-8">
												<input type="text" class="form-control" id="stmHost" name="stmHost" value="<%=dto.getnSender() %>" readonly>
											</div>
										</div>
										<div class="form-group">
											<label for="stmPeriod" class="col-xs-3 control-label">���� ��¥</label>
											<div class="col-xs-8">
												<input type="text" class="form-control" id="stmPeriod" name="stmPeriod" value="<%=dto.getnDate() %>" readonly>
											</div>
										</div>
										<div class="form-group">
											<label for="stmHost" class="col-xs-3 control-label">����</label>
											<div class="col-xs-8">
												<input type="text" class="form-control" id="stmEntry" name="stmEntry" value="<%=dto.getnTitle() %>" readonly>												
											</div>
										</div>
										<div class="form-group">
											<label for="stmEntryComments" class="col-xs-3 control-label">����</label>
											<div class="col-xs-8" style={margin:1px}>
												<%=dto.getnContent()%>			
											</div>
										</div>
								
										<div class="form-group">
											<div class="col-sm-offset-2 col-sm-9">
												<button type="button" class="btn btn-warning" data-dismiss="modal">�ݱ�</button>
											</div>
										</div>
									</form>
								</div>

								<div class="modal-footer">
									<div class="col-xs-12 glyphicon glyphicon-remove">�� ������ Ȯ���ϰ� Ȯ���ϰ� ��û���ּ���.</div><br/>
									<div class="col-xs-12 glyphicon glyphicon-remove">�Ҽ����� �µ��� ���ϰ�� �������� ���� �� �ֽ��ϴ�!</div>
								</div>
							</div>
						</div>
					</div>
					<%} %>			
			</div>
		</div>
		
	</div>

<jsp:include page="footer.jsp"/>
</body>
</html>