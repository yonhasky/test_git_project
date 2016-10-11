<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"
    import="java.util.ArrayList"
    import="work.model.dto.Recommend"%>
<!DOCTYPE html>
<html lang="en">
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
</head>
<body>
<%@ include file="topMenuSuccess.jsp"%>
<script>
<% if (request.getAttribute("message") != null) {%>
	alert('<%=request.getAttribute("message")%>');
<% } %>
</script>
<div id="portfolio" class="container-fluid text-center bg-grey">
		<div class="row">
<h1 class="text-center"><span class="glyphicon glyphicon-list-alt"></span> recommend</h1><br/><br/>
<form method="post" action="RecommendController?action=recommendListSearch&pageNum=1">
<div class="col-sm-offset-7">
	 <select class="col-sm-4" name="sType">
	 <option value="n_title">제목</option>
	 <option value="n_author">작성자</option>
	 </select>
	 <input type="text" class="col-sm-4" name="sTitle" id="sTitle">
	 <button type="submit" class="col-sm-2">검색</button>
</div>
</form>
<table class="table table-hover">
<tr>
<td class="col-sm-1" align="center">구분</td>
<td align="center">제목</td>
<td align="center">작성자</td>
<td align="center">작성일</td>
<td align="center">조회수</td>
</tr>
<%
	ArrayList list = (ArrayList)request.getAttribute("list");
	Recommend dto = null;
	for(int i = 0; i < list.size(); i++) {
		dto = (Recommend)list.get(i);
	
%>
<tr>

<td><%if(dto.getrType().equals("S")) { %><span class="glyphicon glyphicon-thumbs-up">[사이트 이용관련]</span>
<%} else if(dto.getrType().equals("B")) { %><span class="glyphicon glyphicon-thumbs-up">[버그]</span>
<%} else if(dto.getrType().equals("F")) { %><span class="glyphicon glyphicon-thumbs-up">[기능추가]</span><%} %></td>
<td><a href="RecommendController?action=recommendSearch&rNo=<%=dto.getrNo() %>"><%=dto.getrTitle() %></a></td>
<td><%=dto.getrAuthor() %></td>
<td><%=dto.getrDate() %></td>
<td><%=dto.getrHit() %></td> 
</tr>
<%}%>
</table>
<%if(session.getAttribute("uId") != null) { %>
<div class="col-sm-offset-10">
     <button type="button" onclick="document.location.href='recommendWrite.jsp'" class="col-sm-4 btn btn-info">글쓰기</button>
</div>
<%} %>
<br/><br/>
<nav align="center">
  <ul class="pagination">
    <li>
      <a href="RecommendController?action=recommendList&pageNum=<%=Integer.parseInt(request.getParameter("pageNum"))-1%>" aria-label="Next">
        <span aria-hidden="true">&laquo;</span>
      </a>
    </li>
    <%for(int i = 0; i < dto.getrCount(); i++) { %>
    	<li><a href="RecommendController?action=recommendList&pageNum=<%=i+1%>"><%=i+1%></a></li>
    <%} %>
    <li>
      <a href="RecommendController?action=recommendList&pageNum=<%=Integer.parseInt(request.getParameter("pageNum"))+1%>" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
      </a>
    </li>
  </ul>
</nav>
<jsp:include page="footer.jsp"/>
</div>
	</div>
</body>
</html>