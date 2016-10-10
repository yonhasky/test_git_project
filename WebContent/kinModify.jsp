<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="work.model.dto.Kin" %>
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
	if(confirm('게시글을 수정하시겠습니까?')) {
		document.updateForm.action = "Kcontroller?action=kinUpdate";
		document.updateForm.submit();
	}
}

function moveListPage() {
	if(confirm('글 수정을 취소시겠습니까?')) {
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
			
				<form class="navbar-form navbar-left" role="search">
					<div class="form-group" >
						<input type="text" class="form-control" placeholder="Search">
					</div>
					<button type="submit" class="btn btn-default">Submit</button>
				</form>

			</div>
			<div class="row slideanim">
				<div class="col-sm-12 col-xs-12">
					<div class="panel panel-default text-center">
						<div class="panel-heading">
							<h1>Basic</h1>
						</div>
						<h1 class="text-center"><span class="glyphicon glyphicon-list-alt"></span> 지식IN</h1><br/><br/>
						<h5 class="text-center"> 질문 수정</h5><br/>
						<form class="form-horizontal" name="updateForm" method="post" enctype="multipart/form-data">
						  <div class="form-group">
						    <label for="bTitle" class="col-sm-2 control-label">제목</label>
						    <div class="col-sm-8">
						      <input type="text" class="form-control" name="bTitle" id="bTitle" value="${dto.kTitle}">
						    </div>
						  </div>
						  
<!-- 						  <div class="form-group"> -->
<!-- 						    <label for="bPw" class="col-sm-2 control-label">암호</label> -->
<!-- 						    <div class="col-sm-8"> -->
<%-- 						      <input type="password" class="form-control" name="bPw" id="bPw" value="<%=dto.getbPw()%>"> --%>
<!-- 						    </div> -->
<!-- 						  </div> -->
						  
						  <div class="form-group">
						    <label for="bContent" class="col-sm-2 control-label">내용</label>
						    <div class="col-sm-8">
						   		<textarea class="form-control" name="bContent" rows="7">${dto.kContent}</textarea>   
						    </div>
						  </div>
						
						  <div class="form-group">
						    <label for="bFile1" class="col-sm-2 control-label">사진 업로드</label>
						    <div class="col-sm-3">
						    	<input type="file" class="form-control" name="bFile1" id="bFile1" value="${dto.kFile1}">
						    </div>
						    <div class="col-sm-3">
						    	<input type="file" class="form-control" name="bFile2" id="bFile2" value="${dto.kFile2}">
						    </div>
							
						  <div class="form-group">
						    <div class="col-sm-offset-7">
						      <button type="button" onclick="moveUpdatePage()" class="col-sm-2 btn btn-warning">수정</button>
						      <button type="button" onclick="moveListPage()" class="col-sm-2 btn btn-warning">취소</button>
						      <input type="hidden" name="kNo" value="${requestScope.kNo}">
						    </div>
						  </div>
						</form>
						<div class="panel-footer">
							<button class="btn btn-lg">등록하기</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>