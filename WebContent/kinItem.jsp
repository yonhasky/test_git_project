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
function moveListPage() {
	document.entryForm.action = "Kcontroller?action=kinList&pageNum=1";
	document.entryForm.submit();
}
</script>
</head>
<body>
<%-- 	<%@ include file="topMenu.jsp"%> --%>

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
				    <label for="bTitle" class="col-sm-2 control-label">����</label>
				    <div class="col-sm-8">
				      <label class="text-center"><%=dto.getkTitle()%></label>
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="bContent" class="col-sm-2 control-label">�ۼ���</label>
				    <div class="col-sm-8">
				      <label class="text-center"><%=dto.getkAuthor()%></label>
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="bDate" class="col-sm-2 control-label">�ۼ���</label>
				    <div class="col-sm-8">
				      <label class="text-center"><%=dto.getkDate()%></label>
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="bContent" class="col-sm-2 control-label">����</label>
				    <div class="col-sm-7">
				   		<textarea class="form-control" name="bContent" rows="7" readonly><%=dto.getkContent()%></textarea>   
				    </div>
				  </div>
<!-- 				  <div class="form-group"> -->
<!-- 				    <label for="bContent" class="col-sm-2 control-label">����</label>&nbsp &nbsp &nbsp -->
<%-- 				  <%if(dto.getkFile1() != null) { %> --%>
<%-- 				  <img src="<%=dto.getkFile1()%>" width="200px" height="150px" onclick="if(confirm('�ش� �׸��� ��õ�Ͻðڽ��ϱ�?')){document.location.href='Controller?action=boardRecommend&rNum=1&boardNum=<%=request.getParameter("boardNum")%>'}"/> --%>
<%-- 				  <label><span class="glyphicon glyphicon-thumbs-up"></span>��õ��<%=dto.getkRecommends()%></label> --%>
<%-- 				  <%}%> --%>
<%-- 				  <%if(dto.getbFile2() != null) { %> --%>
<%-- 				  <img src="<%=dto.getbFile2()%>" width="200px" height="150px" onclick="if(confirm('�ش� �׸��� ��õ�Ͻðڽ��ϱ�?')){document.location.href='Controller?action=boardRecommend&rNum=2&boardNum=<%=request.getParameter("boardNum")%>'}"/> --%>
<%-- 				  <label><span class="glyphicon glyphicon-thumbs-up"></span>��õ��<%=dto.getbRecommend2()%></label> --%>
<%-- 				  <%}%> --%>
<!-- 				  </div> -->
				 
				  
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
				  
				  <div class="form-group">
				    <div class="col-sm-offset-8">
<%-- 				      <%if(session.getAttribute("uGrade") != null || session.getAttribute("uId") != null) {%> --%>
<%-- 				      <%if(session.getAttribute("uGrade").equals("A") || (session.getAttribute("uId").equals(dto.getkAuthor()))) { %> --%>
				      <button type="button" onclick="if(confirm('�Խñ��� �����Ͻðڽ��ϱ�?')){document.location.href='Kcontroller?action=kinSearch&opt=update&kNo=<%=request.getParameter("kNo")%>'}" class="col-sm-2 btn btn-warning">����</button>
				      <button type="button" onclick="if(confirm('�Խñ��� �����Ͻðڽ��ϱ�?')){document.location.href='Kcontroller?action=kinDelete&kNo=<%=request.getParameter("kNo")%>'}" class="col-sm-2 btn btn-warning">����</button>
<%-- 				      <%} --%>
<%-- 				        }%>  --%>
				      <button type="button" onclick="moveListPage()" class="col-sm-2 btn btn-info">���</button>
				    </div>
				  </div>
				</form>
						
						<div class="panel-footer">
							<button class="btn btn-lg">����ϱ�</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>