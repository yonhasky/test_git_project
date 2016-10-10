<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"
    import="java.util.ArrayList"
    import="work.model.dto.Notice"%>
<!DOCTYPE html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>�Խñ�</title>
<link rel="stylesheet" href="css/bootstrap.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<link href="css/common.css" rel="stylesheet" type="text/css">
	<%@ include file="topMenu.jsp"%>
<script>
function moveListPage() {
	document.entryForm.action = "NoticeController?action=noticeList&pageNum=1";
	document.entryForm.submit();
}
</script>
</head>
<body>
<div id="portfolio" class="container-fluid text-center bg-grey">
		<div class="row">
<h1 class="text-center"><span class="glyphicon glyphicon-list-alt"></span> Notice</h1><br/><br/>
<h5 class="text-center">������ ������� �����Ӱ� ��ȭ���ּ���</h5><br/>
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
	Notice dto = (Notice)request.getAttribute("dto");
%>
<form class="form-horizontal" name="entryForm" method="post">
  <div class="form-group">
    <label for="nTitle" class="col-sm-2 control-label">����</label>
    <div class="col-sm-8">
      <label class="text-center"><%=dto.getnTitle()%></label>
    </div>
  </div>
  <div class="form-group">
    <label for="nContent" class="col-sm-2 control-label">�ۼ���</label>
    <div class="col-sm-8">
      <label class="text-center"><%=dto.getnAuthor()%></label>
    </div>
  </div>
  <div class="form-group">
    <label for="nDate" class="col-sm-2 control-label">�ۼ���</label>
    <div class="col-sm-8">
      <label class="text-center"><%=dto.getnDate()%></label>
    </div>
  </div>
  <div class="form-group">
    <label for="nContent" class="col-sm-2 control-label">����</label>
    <div class="col-sm-7">
   		<textarea class="form-control" name="nContent" rows="7" readonly><%=dto.getnContent()%></textarea>   
    </div>
  </div>
  <div class="form-group">
    <label for="nContent" class="col-sm-2 control-label">����</label>&nbsp &nbsp &nbsp
  <%if(dto.getnFile1() != null) { %>
  <img src="<%=dto.getnFile1()%>" width="200px" height="150px" onclick="if(confirm('�ش� �׸��� ��õ�Ͻðڽ��ϱ�?')){document.location.href='NoticeController?action=boardRecommend&rNum=1&boardNum=<%=request.getParameter("boardNum")%>'}"/>
  <%}%>
  <%if(dto.getnFile2() != null) { %>
  <img src="<%=dto.getnFile2()%>" width="200px" height="150px" onclick="if(confirm('�ش� �׸��� ��õ�Ͻðڽ��ϱ�?')){document.location.href='NoticeController?action=boardRecommend&rNum=2&boardNum=<%=request.getParameter("boardNum")%>'}"/>
  <%}%>
  </div>
 
  
  <div class="form-group">
    <label for="bDate" class="col-sm-2 control-label">��ȸ��</label>
    <div class="col-sm-8">
      <label class="text-center"><%=dto.getnHit()%></label>
    </div>
  </div>
  <div class="form-group">
    <div class="col-sm-offset-8"> 
      <%if(session.getAttribute("uGrade") != null || session.getAttribute("uId") != null) {%>
      <%if(session.getAttribute("uGrade").equals("A") || (session.getAttribute("uId").equals(dto.getnAuthor()))) { %>
      <button type="button" onclick="if(confirm('�Խñ��� �����Ͻðڽ��ϱ�?')){document.location.href='NoticeController?action=noticeSearch&opt=update&boardNum=<%=request.getParameter("boardNum")%>'}" class="col-sm-2 btn btn-warning">����</button>
      <button type="button" onclick="if(confirm('�Խñ��� �����Ͻðڽ��ϱ�?')){document.location.href='NoticeController?action=noticeDelete&boardNum=<%=request.getParameter("boardNum")%>'}" class="col-sm-2 btn btn-warning">����</button>
      <%}
        }%> 
      <button type="button" onclick="moveListPage()" class="col-sm-2 btn btn-info">���</button>
    </div>
  </div>
</form>
<jsp:include page="footer.jsp"/>
</div>
	</div>
</body>
</html>