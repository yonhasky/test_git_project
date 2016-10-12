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
function moveListPage() {
	document.entryForm.action = "RecommendController?action=recommendList&pageNum=1";
	document.entryForm.submit();
}
</script>
</head>
<body>
<%@ include file="topMenuSuccess.jsp"%>
<div id="portfolio" class="container-fluid text-center bg-grey">
		<div class="row">
<h1 class="text-center"><span class="glyphicon glyphicon-list-alt"></span> Recommend</h1><br/><br/>
<h5 class="text-center">주제에 상관없이 자유롭게 대화해주세요</h5><br/>
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
	Recommend dto = (Recommend)request.getAttribute("dto");
%>
<form class="form-horizontal" name="entryForm" method="post">
  <div class="form-group">
    <label for="rTitle" class="col-sm-2 control-label">제목</label>
    <div class="col-sm-8">
      <label class="text-center"><%=dto.getrTitle()%></label>
    </div>
  </div>
  <div class="form-group">
    <label for="rContent" class="col-sm-2 control-label">작성자</label>
    <div class="col-sm-8">
      <label class="text-center"><%=dto.getrAuthor()%></label>
    </div>
  </div>
  <div class="form-group">
    <label for="rDate" class="col-sm-2 control-label">작성일</label>
    <div class="col-sm-8">
      <label class="text-center"><%=dto.getrDate()%></label>
    </div>
  </div>
  <div class="form-group">
    <label for="rContent" class="col-sm-2 control-label">내용</label>
    <div class="col-sm-7">
   		<textarea class="form-control" name="rContent" rows="7" readonly><%=dto.getrContent()%></textarea>   
    </div>
  </div>
  <div class="form-group">
    <label for="rContent" class="col-sm-2 control-label">사진</label>&nbsp &nbsp &nbsp
  <%if(dto.getrFile1() != null) { %>
  <img src="<%=dto.getrFile1()%>" width="200px" height="150px" onclick="if(confirm('해당 항목을 추천하시겠습니까?')){document.location.href='RecommendController?action=boardRecommend&rNum=1&boardNum=<%=request.getParameter("boardNum")%>'}"/>
  <%}%>
  <%if(dto.getrFile2() != null) { %>
  <img src="<%=dto.getrFile2()%>" width="200px" height="150px" onclick="if(confirm('해당 항목을 추천하시겠습니까?')){document.location.href='RecommendController?action=boardRecommend&rNum=2&boardNum=<%=request.getParameter("boardNum")%>'}"/>
  <%}%>
  </div>
 
  
  <div class="form-group">
    <label for="bDate" class="col-sm-2 control-label">조회수</label>
    <div class="col-sm-8">
      <label class="text-center"><%=dto.getrHit()%></label>
    </div>
  </div>
  <div class="form-group">
    <div class="col-sm-offset-8"> 
      <%if(session.getAttribute("uGrade") != null || session.getAttribute("uId") != null) {%>
      <%if(session.getAttribute("uGrade").equals("A") || (session.getAttribute("uId").equals(dto.getrAuthor()))) { %>
      <button type="button" onclick="if(confirm('게시글을 수정하시겠습니까?')){document.location.href='RecommendController?action=recommendSearch&opt=update&boardNum=<%=request.getParameter("boardNum")%>'}" class="col-sm-2 btn btn-warning">수정</button>
      <button type="button" onclick="if(confirm('게시글을 삭제하시겠습니까?')){document.location.href='RecommendController?action=recommendDelete&boardNum=<%=request.getParameter("boardNum")%>'}" class="col-sm-2 btn btn-warning">삭제</button>
      <%}
        }%> 
      <button type="button" onclick="moveListPage()" class="col-sm-2 btn btn-info">목록</button>
    </div>
  </div>
</form>
<jsp:include page="footer.jsp"/>
</div>
	</div>
</body>
</html>