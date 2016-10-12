<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="work.model.dto.Kin" %>		
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
function moveUpdatePage() {
	if(confirm('�Խñ��� �����Ͻðڽ��ϱ�?')) {
		document.updateForm.action = "Kcontroller?action=kinUpdate";
		document.updateForm.submit();
	}
}

function moveListPage() {
	if(confirm('�� ������ ��ҽðڽ��ϱ�?')) {
		document.updateForm.action = "Kcontroller?action=kinList&pageNum=1";
		document.updateForm.submit();
	}
}
</script>
</head>
<body>
<%@ include file="topMenuSuccess.jsp"%>
	<div class="jumbotron text-center">
		<h1>���� IN</h1>
		<p>���� & �亯</p>
<!-- 		<form class="form-inline"> -->
<!-- 			<input type="text" class="form-control" size="50" placeholder="�˻�" -->
<!-- 				required> -->
<!-- 			<button type="button" class="btn btn-danger">�˻�</button> -->
<!-- 		</form> -->
	</div>

	<!-- Container (Pricing Section) -->
	<div id="pricing" class="container-fluid">
		<div class="row">
			<div class="text-center">
			
				<h1 class="text-center"><span class="glyphicon glyphicon-list-alt"></span> ����IN</h1><br/><br/>
				<h5 class="text-center"> ���� </h5><br/>
				<%
					Kin dto = (Kin)request.getAttribute("dto");
				%>
				<form class="form-horizontal" name="updateForm" method="post" enctype="multipart/form-data">
				  <div class="form-group">
				    <label for="kTitle" class="col-sm-2 control-label">����</label>
				    <div class="col-sm-8">
				      <input type="text" class="form-control" name="kTitle" id="kTitle" value="<%=dto.getkTitle()%>">
				    </div>
				  </div>
				  
				  <div class="form-group">
				    <label for="kContent" class="col-sm-2 control-label">�ۼ���</label>
				    <div class="col-sm-8">
				      <label class="text-center" ><%=dto.getkAuthor()%></label>
				    </div>
				  </div>
				  
				  <div class="form-group">
						    <label for="kType" class="col-sm-2 control-label">Ÿ��</label>
						    <div class="col-sm-8">
						      <select name="kType">
							    <option value="���">���</option>
							    <option value="���Ƹ�">���Ƹ�</option>
							    <option value="����">����</option>
							    <option value="�б���Ȱ">�б���Ȱ</option>
							    <option value="���">���</option>
							    <option value="������">������</option>
							</select>
						    </div>
						  </div>
						  
				  <div class="form-group">
				    <label for="bContent" class="col-sm-2 control-label">����</label>
				    <div class="col-sm-8">
				   		<textarea class="form-control" name="kContent" rows="7"><%=dto.getkContent()%></textarea>   
				    </div>
				  </div>
				
<!-- 				  <div class="form-group"> -->
<!-- 				    <label for="bFile1" class="col-sm-2 control-label">���� ���ε�</label> -->
<!-- 				    <div class="col-sm-3"> -->
<%-- 				    	<input type="file" class="form-control" name="bFile1" id="bFile1" value="<%=dto.getbFile1()%>"> --%>
<!-- 				    </div> -->
<!-- 				    <div class="col-sm-3"> -->
<%-- 				    	<input type="file" class="form-control" name="bFile2" id="bFile2" value="<%=dto.getbFile2()%>"> --%>
<!-- 				    </div> -->
<!-- 				    <div class="col-sm-offset-2 col-sm-3"> -->
<%-- 				    	<input type="file" class="form-control" name="bFile3" id="bFile3" value="<%=dto.getbFile3()%>"> --%>
<!-- 				    </div> -->
<!-- 				  </div>	 -->
				  
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
					<div class="panel-footer">
				    <div class="col-sm-offset-7">
				      <button type="button" onclick="moveUpdatePage()" class="btn btn-lg">����</button>
				      <button type="button" onclick="moveListPage()" class="btn btn-lg">���</button>
				      <input type="hidden" name="kNo" value="<%=request.getParameter("kNo")%>">
				    </div>
				  </div>
				</form>
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