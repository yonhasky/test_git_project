<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="work.model.dto.Kinreplie" %>		
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
function moveUpdatePage() {
	if(confirm('답변을 수정하시겠습니까?')) {
		document.updateForm.action = "Rcontroller?action=rplUpdate";
		document.updateForm.submit();
	}
}

function moveListPage() {
	if(confirm('답변 수정을 취소시겠습니까?')) {
		document.updateForm.action = "Kcontroller?action=kinList&pageNum=1";
		document.updateForm.submit();
	}
}
</script>
</head>
<body>
<%@ include file="topMenuSuccess.jsp"%>
	<div class="jumbotron text-center">
		<h1>지식 IN</h1>
		<p>질문 & 답변</p>
<!-- 		<form class="form-inline"> -->
<!-- 			<input type="text" class="form-control" size="50" placeholder="검색" -->
<!-- 				required> -->
<!-- 			<button type="button" class="btn btn-danger">검색</button> -->
<!-- 		</form> -->
	</div>

	<!-- Container (Pricing Section) -->
	<div id="pricing" class="container-fluid">
		<div class="row">
			<div class="text-center">
			
				<h1 class="text-center"><span class="glyphicon glyphicon-list-alt"></span> 지식IN</h1><br/><br/>
				<h5 class="text-center"> 수정 </h5><br/>
				<%
					Kinreplie dto = (Kinreplie)request.getAttribute("dto");
				%>
				<form class="form-horizontal" name="updateForm" method="post" enctype="multipart/form-data">
				  <div class="form-group">
				    <label for="rTitle" class="col-sm-2 control-label">제목</label>
				    <div class="col-sm-8">
				      <input type="text" class="form-control" name="rTitle" id="rTitle" value="<%=dto.getrTitle()%>">
				    </div>
				  </div>
				  
				  <div class="form-group">
				    <label for="rContent" class="col-sm-2 control-label">작성자</label>
				    <div class="col-sm-8">
				      <label class="text-center" ><%=dto.getrAuthor()%></label>
				    </div>
				  </div>
				  
				  <div class="form-group">
				    <label for="rContent" class="col-sm-2 control-label">내용</label>
				    <div class="col-sm-8">
				   		<textarea class="form-control" name="rContent" rows="7"><%=dto.getrContent()%></textarea>   
				    </div>
				  </div>
				
					<div class="panel-footer">
				    <div class="col-sm-offset-7">
				      <button type="button" onclick="moveUpdatePage()" class="btn btn-lg">수정</button>
				      <button type="button" onclick="moveListPage()" class="btn btn-lg">취소</button>
				      <input type="hidden" name="kNo" value="<%=dto.getkNo()%>">
				      <input type="hidden" name="rNo" value="<%=dto.getrNo()%>">
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