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
<title>������</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<link href="css/common.css" rel="stylesheet" type="text/css">

<script>
function moveListPage() {
	document.rplForm.action = "Kcontroller?action=kinList&pageNum=1";
	document.rplForm.submit();
}

function moveEntryPage() {
	if(confirm('�亯�� ����Ͻðڽ��ϱ�?')) {
		document.rplForm.action = "Rcontroller?action=rplEnroll";
		document.rplForm.submit();
	}
}

function moveListPage() {
	if(confirm('�� �ۼ��� ��ҽðڽ��ϱ�?')) {
		document.rplForm.action = "Kcontroller?action=kinList&pageNum=1";
		document.rplForm.submit();
	}
}
</script>
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
			
				<h1 class="text-center"><span class="glyphicon glyphicon-list-alt"></span> ����IN</h1><br/><br/>
						<h5 class="text-center"> ���� </h5><br/>
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
				    <label for="kTitle" class="col-sm-2 control-label">����</label>
				    <div class="col-sm-8">
				      <label class="text-center"><%=dto.getkTitle()%></label>
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="kContent" class="col-sm-2 control-label">�ۼ���</label>
				    <div class="col-sm-8">
				      <label class="text-center"><%=dto.getkAuthor()%></label>
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="kDate" class="col-sm-2 control-label">�ۼ���</label>
				    <div class="col-sm-8">
				      <label class="text-center"><%=dto.getkDate()%></label>
				    </div>
				  </div>
				   <div class="form-group">
				    <label for="kType" class="col-sm-2 control-label">Ÿ��</label>
				    <div class="col-sm-8">
				      <label class="text-center"><%=dto.getkType()%></label>
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="kContent" class="col-sm-2 control-label">����</label>
				    <div class="col-sm-7">
				   		<textarea class="form-control" name="bContent" rows="7" readonly><%=dto.getkContent()%></textarea>   
				    </div>
				  </div>
				  
				  <div class="form-group">
				    <label for="kDate" class="col-sm-2 control-label">��ȸ��</label>
				    <div class="col-sm-8">
				      <label class="text-center"><%=dto.getkHit()%></label>
				    </div>
				  </div>
				  
				  <div class="form-group">
				    <label for="kDate" class="col-sm-2 control-label">�亯��</label>
				    <div class="col-sm-8">
				      <label class="text-center"><%= dto.getkRpl() %></label>
				    </div>
				  </div>
				  
				</form>
				
				
				<p>
				<hr/>
				<!-- ---------------------------------------------------------------- -->
				<h5 class="text-center"> �亯 </h5><br/>
				<form class="form-horizontal" name="rplForm" method="post" enctype="multipart/form-data">
					 
					  <div class="form-group">
				    <label for="kTitle" class="col-sm-2 control-label">����</label>
				    <div class="col-sm-8">
				      <label class="text-center"><%=dto.getkTitle()%></label>
				    </div>
				  </div>
						  <div class="form-group">
						    <label for="rContent" class="col-sm-2 control-label">����</label>
						    <div class="col-sm-8">
						   		<textarea class="form-control" name="rContent" rows="7"></textarea>   
						    </div>
						  </div>
						  
						  <div class="form-group">
						    <label for="rFile" class="col-sm-2 control-label">���� ���ε�</label>
						    <div class="col-sm-3">
						    	<input type="file" class="form-control" name="rFile1" id="rFile1">
						    </div>
						    <div class="col-sm-3">
						    	<input type="file" class="form-control" name="rFile2" id="rFile2">
						    </div>
						    <div class="form-group">
						 </div>
						 </div>
						  <div class="panel-footer">
						    <input type="hidden" name="kNo" value="<%=dto.getkNo()%>">
							<input type="hidden" name="kTitle" value="<%=dto.getkTitle()%>">
							<button class="btn btn-lg" onclick="moveEntryPage()">����ϱ�</button>
							<button class="btn btn-lg" onclick="moveListPage()">���</button>
							</div>
						</form>
							
						
						
						<div class="panel-footer">
							<button class="btn btn-lg" onclick="moveListPage()">���</button>
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