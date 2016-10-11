<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"
    import="java.util.ArrayList"
    import="work.model.dto.Recommend"%>
<!DOCTYPE html>
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>건의사항</title>

<link rel="stylesheet" href="css/bootstrap.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<link href="css/common.css" rel="stylesheet" type="text/css">
<script>
function moveUpdatePage() {
	if(confirm('게시글을 수정하시겠습니까?')) {
		document.updateForm.action = "RecommendController?action=recommendUpdate";
		document.updateForm.submit();
	}
}

function moveListPage() {
	if(confirm('글 수정을 취소시겠습니까?')) {
		document.updateForm.action = "RecommendController?action=recommendList&pageNum=1";
		document.updateForm.submit();
	}
}
</script>
</head>
<body>
	<%@ include file="topMenuSuccess.jsp"%>

<div id="portfolio" class="container-fluid text-center bg-grey">
		<div class="row">
<h1 class="text-center"><span class="glyphicon glyphicon-list-alt"></span> 공지사항 수정</h1><br/><br/>
<h5 class="text-center">주제에 상관없이 자유롭게 대화해주세요</h5><br/>
<%
	Recommend dto = (Recommend)request.getAttribute("dto");
%>
<form class="form-horizontal" name="updateForm" method="post" enctype="multipart/form-data">
  <div class="form-group">
    <label for="bTitle" class="col-sm-2 control-label">제목</label>
    <div class="col-sm-8">
      <input type="text" class="form-control" name="nTitle" id="bTitle" value="<%=dto.getrTitle()%>">
    </div>
  </div>
  
  <div class="form-group">
    <label for="bContent" class="col-sm-2 control-label">내용</label>
    <div class="col-sm-8">
   		<textarea class="form-control" name="bContent" rows="7"><%=dto.getrContent()%></textarea>   
    </div>
  </div>

  <div class="form-group">
    <label for="bFile1" class="col-sm-2 control-label">사진 업로드</label>
    <div class="col-sm-3">
    	<input type="file" class="form-control" name="nFile1" id="bFile1" value="<%=dto.getrFile1()%>">
    </div>
    <div class="col-sm-3">
    	<input type="file" class="form-control" name="nFile2" id="bFile2" value="<%=dto.getrFile2()%>">
    </div>
  </div>	
	
  <div class="form-group">
    <div class="col-sm-offset-7">
      <button type="button" onclick="moveUpdatePage()" class="col-sm-2 btn btn-warning">수정</button>
      <button type="button" onclick="moveListPage()" class="col-sm-2 btn btn-warning">취소</button>
      <input type="hidden" name="boardNum" value="<%=request.getParameter("boardNum")%>">
    </div>
  </div>
</form>
<jsp:include page="footer.jsp"/>
</div>
	</div>
</body>
</html>