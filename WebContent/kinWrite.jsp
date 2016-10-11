<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
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
function moveEntryPage() {
	if(confirm('�Խñ��� ����Ͻðڽ��ϱ�?')) {
		document.entryForm.action = "Kcontroller?action=kinEnroll";
		document.entryForm.submit();
	}
}

function moveListPage() {
	if(confirm('�� �ۼ��� ��ҽðڽ��ϱ�?')) {
		document.entryForm.action = "Kcontroller?action=kinList&pageNum=1";
		document.entryForm.submit();
	}
}
</script>

</head>
<body>
<%@ include file="topMenuSuccess.jsp"%>
	<div class="jumbotron text-center">
		<h1>���� IN</h1>
		<p>���� & �亯</p>
	</div>

	<!-- Container (Pricing Section) -->
	<div id="pricing" class="container-fluid">
		<div class="row">
			<div class="text-center">

			</div>
			<div class="row slideanim">
				<div class="col-sm-12 col-xs-12">
					<div class="panel panel-default text-center">
						<div class="panel-heading">
							<h1 class="text-center"><span class="glyphicon glyphicon-list-alt"></span> ����IN</h1><br/><br/>
						</div>
						
						<form class="form-horizontal" name="entryForm" method="post" enctype="multipart/form-data">
						  <div class="form-group">
						    <label for="kTitle" class="col-sm-2 control-label">����</label>
						    <div class="col-sm-8">
						      <input type="text" class="form-control" name="kTitle" id="kTitle" placeholder="Input Title">
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
						    <label for="kContent" class="col-sm-2 control-label">����</label>
						    <div class="col-sm-8">
						   		<textarea class="form-control" name="kContent" rows="7"></textarea>   
						    </div>
						  </div>
						  
						  <div class="form-group">
						    <label for="kFile" class="col-sm-2 control-label">���� ���ε�</label>
						    <div class="col-sm-3">
						    	<input type="file" class="form-control" name="kFile1" id="kFile1">
						    </div>
						    <div class="col-sm-3">
						    	<input type="file" class="form-control" name="kFile2" id="kFile2">
						    </div>
						    <div class="form-group">
						 	</div>
						 </div>
						</form>
						
						<div class="panel-footer">
							<button class="btn btn-lg" onclick="moveEntryPage()">����ϱ�</button>
							<button class="btn btn-lg" onclick="moveListPage()">���</button>
						</div>
					</div>
				</div>
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