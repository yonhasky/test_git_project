<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="work.model.dto.Study"
		 import="work.model.dto.StudyMatch" 
	     import="java.util.ArrayList" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>스터디 상세보기</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<link href="css/common.css" rel="stylesheet" type="text/css">
<style>
.btn-warning {
	background-color: #F7BE81;
}
.btn-major{
background-color:#f4511e;
color:white;
font-weight:bold;
}
</style>
</head>
<body>
<% if(request.getAttribute("message")!= null) {%>
<script>
alert('<%=request.getAttribute("message") %>');
</script>
<%}%>
	<%@ include file="topMenuSuccess.jsp"%>
	<%  Study dto = null;
		ArrayList list = (ArrayList)request.getAttribute("list");
		dto = (Study)list.get(0); %>
	<div class="jumbotron text-center">

		<h1>Study</h1>
		<p>Study Campus in Sahmyook University</p>
		<form name="form" class="form-inline">
			<span class="form-group"> <span class="col-xs-12"> 
			<select	class="form-control" name="stType" size=1>
						<OPTION value="">검색</OPTION>
						<OPTION value="">제목</OPTION>
						<OPTION value="">작성자</OPTION>
						<OPTION value="">내용</OPTION>
			</select>
			</span>
			</span>
			<input type="text" class="form-control" size="50" placeholder="검색" required>
			<button type="button" class="btn btn-danger">검색</button>
		</form>
	</div>
		
		<div id="portfolio" class="container-fluid text-center bg-grey">
		
		<div class="row">
			<h2>Study Room</h2>
			<h4>재학생 및 졸업생들을 위한 공부방</h4>
			
		<div class="row col-xs-offset-2 col-xs-8"
				style="border: 10px #f4511e solid; padding-top: 30px">
			<span class="glyphicon glyphicon-education logo-small"></span>
			<h2><%=dto.getStTitle() %></h2>
			<h4>스터디 수행기간  :  <%=dto.getStPeriod() %></h4>
			<h4><%=dto.getStOverview() %></h4>
			</div>
		<div>
			<div class="row col-xs-offset-2 col-xs-8"
				style="border: 10px #f4511e solid; padding-top: 30px">
				<div class="col-xs-offset-2 col-xs-8">
					<ul class="nav nav-tabs nav-justified">
						<li role="presentation" class="active"><span class="glyphicon glyphicon-education logo-small"></span><h2>스터디 상세 내역</h2></li>
					</ul>
					<div class="col-xs-offset-10 col-xs-4">
						작성일 : <%=dto.getStDate() %>     
					</div>
					<div class="col-xs-offset-10 col-xs-4">
						조회수 : <%=dto.getStHit() %>
					</div>
				</div>
				<div>
					<table class="table" style="margin-top: 20px;">
						<tr>
							<td><img alt="images/gDate.png" src="images/gDate.png">스터디 주최자</td>
							<td></td>
							<td><%=dto.getStAuthor()%></td>
							<td></td>
						</tr>
						<tr>
							<td><img alt="images/career.png" src="images/career.png">스터디 수행기간</td>
							<td></td>
							<td><%=dto.getStPeriod() %></td>
							<td></td>
						</tr>
						<tr>
							<td><img alt="images/grade.png" src="images/birth.png">스터디 개요</td>
							<td></td>
							<td><%=dto.getStOverview()%></td>
							<td></td>
						</tr>
						<tr>
							<td><img alt="images/grade.png" src="images/grade.png">스터디 상세 내용</td>
							<td></td>
							<td><%=dto.getStContent()%></td>
							<td></td>
						</tr>
						<tr>
							<td><img alt="images/job.png" src="images/job.png">첨부파일1</td>
							<td></td>
							<%if(dto.getStFile1() != null) { %>
							<td><a href="StudyController?action=fileDown&path=<%=dto.getStFile1()%>">다운로드1[<%=dto.getStFile1().substring(dto.getStFile1().indexOf("\\")+1,dto.getStFile1().length()) %>]</a></td>
							<%} else {%>
							<td></td>
							<%} %>
							<td></td>
							
						</tr>
						<%if(dto.getStFile2() != null) { %>
						<tr>
							<td></td>
							<td><a href="StudyController?action=fileDown&path=<%=dto.getStFile2()%>">다운로드2[<%=dto.getStFile2().substring(dto.getStFile2().indexOf("\\")+1,dto.getStFile2().length()) %>]</a></td>
							<td></td>
							<td></td>
						</tr>
						<%} %>
						
						<tr>
						<td>진행 상태</td>
						<td></td>
						<%if(dto.getStStatus().equals("A")) {%>
							<td>[신청 가능]</td>
						<%} else if(dto.getStStatus().equals("P")) {%>
							<td>[진행 중]</td>
						<%} else { %>
							<td>[마감]</td>
						<%} %>
						<td></td>
						</tr>
					</table>
				</div>
			</div>
		</div>
		</div>
		<div class="col-xs-offset-6 col-xs-5">
		 
		<ul class="pager">
		<% 	String stAuthor = dto.getStAuthor();
			String userId = stAuthor.substring(0, stAuthor.indexOf('['));
			if(userId.equals(session.getAttribute("id"))){%>
			<li role="presentation" class="active"><a href="#" onclick="if(confirm('수정하시겠습니까?')){location.href='StudyController?action=searchStudy&opt=update&stNo=<%=dto.getStNo()%>'}"><img
										src="images/update.png">수정</a></li>
			<li role="presentation" class="active"><a href="#" onclick="if(confirm('스터디를 삭제하시겠습니까?')){location.href='StudyController?action=removeStudy&stNo=<%=dto.getStNo()%>'}"><img
			src="images/delete.png">삭제</a></li>
			<li role="presentation" class="active"><a href="StudyController?action=searchStudyList&pageNum=1"><img alt="images/grade.png" src="images/grade.png">목록</a></li>
		<%} else {%>
			
			<li role="presentation" class="active"><a href="#" data-toggle="modal"
						data-target="#noteModal" style="margin: 8px"><img alt="images/grade.png" src="images/email.png">쪽지보내기</a></li>
					
					<div class="modal fade" id="noteModal" tabindex="-1" role="dialog"
						aria-labelledby="myModalLabel" style="margin:30px;">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
									<br/><img alt="images/grade.png" src="images/email.png"><h4 class="modal-title" id="myModalLabel">쪽지보내기</h4>
								</div>
								
								<div class="modal-body">
									<form class="form-horizontal" id="noteForm" name="noteForm" method="post" action="StudyController?action=sendNote&stNo=<%=dto.getStNo()%>">
										<div class="form-group">
											<label for="nReceiver" class="col-xs-3 control-label">받는 사람</label>
											<div class="col-xs-8">
												<input type="text" class="form-control" id="nReciever" name="nReciever" value="<%=dto.getStAuthor()%>" readonly>
											</div>
										</div>
										<div class="form-group">
											<label for="nSender" class="col-xs-3 control-label">보내는 사람</label>
											<div class="col-xs-8">
												<input type="text" class="form-control" id="nSender" name="nSender" value="<%=session.getAttribute("id")+"["+session.getAttribute("name")+"]"%>" readonly>												
											</div>
										</div>
										<div class="form-group">
											<label for="nTitle" class="col-xs-3 control-label">제목</label>
											<div class="col-xs-8">
												<input type="text" class="form-control" id="nTitle" name="nTitle">
											</div>
										</div>
										<div class="form-group">
											<label for="nContent" class="col-xs-3 control-label">내용</label>
											<div class="col-xs-8">
												<textarea class="form-control" rows="10" id="nContent" name="nContent"> </textarea>												
											</div>
										</div>
								
										<div class="form-group">
											<div class="col-sm-offset-2 col-sm-9">
												<button type="button" class="btn btn-info" onclick="if(confirm('쪽지를 보내시겠습니까?')){document.noteForm.submit();}">보내기</button>
												<button type="button" class="btn btn-info" data-dismiss="modal"> 취 소 </button>
											</div>
										</div>
									</form>
								</div>

								<div class="modal-footer">
									<div class="col-xs-12 glyphicon glyphicon-remove">스터디에 관해 궁금한 점을 보내주세요.</div><br/>
									<div class="col-xs-12 glyphicon glyphicon-remove">장난으로 보낼 경우 불이익을 받을 수 있습니다!</div>
								</div>
							</div>
						</div>
					</div>
			
			<%if(dto.getStStatus().equals("A")) {%>
			<li role="presentation" class="active"><a href="#" data-toggle="modal"
						data-target="#studyModal" style="margin: 8px"><img
										src="images/update.png">스터디신청</a></li>
				
					<div class="modal fade" id="studyModal" tabindex="-1" role="dialog"
						aria-labelledby="myModalLabel" style="margin:30px;">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
									<h4 class="modal-title" id="myModalLabel"><div class="col-xs-12 glyphicon glyphicon-education logo-small"></div><h4>스터디 신청하기</h4>
								</div>
								
								<div class="modal-body">
									<form class="form-horizontal" id="entryForm" name="entryForm" method="post" action="StudyController?action=addStudyMatch&stNo=<%=dto.getStNo()%>">
										<div class="form-group">
											<label for="stmTitle" class="col-xs-3 control-label">스터디 명</label>
											<div class="col-xs-8">
												<input type="text" class="form-control" id="stmTitle" name="stmTitle" value="<%=dto.getStTitle()%>" readonly>
											</div>
										</div>
										<div class="form-group">
											<label for="stmHost" class="col-xs-3 control-label">스터디 주최자</label>
											<div class="col-xs-8">
												<input type="text" class="form-control" id="stmHost" name="stmHost" value="<%=dto.getStAuthor()%>" readonly>
											</div>
										</div>
										<div class="form-group">
											<label for="stmPeriod" class="col-xs-3 control-label">수행기간</label>
											<div class="col-xs-8">
												<input type="text" class="form-control" id="stmPeriod" name="stmPeriod" value="<%=dto.getStPeriod()%>" readonly>
											</div>
										</div>
										<div class="form-group">
											<label for="stmHost" class="col-xs-3 control-label">참가신청자</label>
											<div class="col-xs-8">
												<input type="text" class="form-control" id="stmEntry" name="stmEntry" value="<%=session.getAttribute("id")+"["+session.getAttribute("name")+"]"%>" readonly>												
											</div>
										</div>
										<div class="form-group">
											<label for="stmEntryComments" class="col-xs-3 control-label">각오</label>
											<div class="col-xs-8">
												<textarea class="form-control" id="stmEntryComment" name="stmEntryComment"> </textarea>												
											</div>
										</div>
								
										<div class="form-group">
											<div class="col-sm-offset-2 col-sm-9">
												<button type="button" class="btn btn-warning" onclick="if(confirm('스터디를 신청하겠습니까?')){document.entryForm.submit();}">신청</button>
												<button type="button" class="btn btn-warning" data-dismiss="modal">닫기</button>
											</div>
										</div>
									</form>
								</div>

								<div class="modal-footer">
									<div class="col-xs-12 glyphicon glyphicon-remove">위 사항을 확실하게 확인하고 신청해주세요.</div><br/>
									<div class="col-xs-12 glyphicon glyphicon-remove">불성실한 태도를 보일경우 불이익을 받을 수 있습니다!</div>
								</div>
							</div>
						</div>
					</div>
			<%} %>
			<li role="presentation" class="active"><a href="StudyController?action=searchStudyList&pageNum=1"><img alt="images/grade.png" src="images/grade.png"> 스터디목록 </a></li>
		<%} %>			
		</ul>
		</div>
	</div>


	<div class="row container-fluid text-center">
		<div class=" col-xs-offset-2 col-xs-8"
			style="border: 6px black solid; padding-top: 60px">
			<div class="col-xs-3">
				<div class="col-xs-12 glyphicon glyphicon-education logo-small"></div>
				<br> <br>
				<h2>스터디 신청내역</h2>
				<div id="deleteStudy"></div>
			</div>
			<div class=" col-xs-9">

				<table class="table col-xs-12" style="margin-top: 20px;">
					<tr>
						<td class="memberList col-xs-2">스터디 신청자</td>
						
						<td class="memberList col-xs-7">참가 한마디</td>
						
						<td class="memberList col-xs-2">스터디 신청일</td>
						<td class="memberList col-xs-1">상태</td>
					
					</tr>
						<% StudyMatch dto1 = null;
						    int flag = 0;
						    for(int i = 1; i < list.size(); i++) {
					   			dto1 = (StudyMatch)list.get(i);
					   		
					   		if(dto1.getStmEntry().equals(session.getAttribute("id"))) {
								flag = 1;
					   		}
							%>					
						<tr>

							<td class="memberList2 col-xs-2"><%=dto1.getStmEntry() %></td>
							
							<td class="memberList2 col-xs-7"><%=dto1.getStmEntryComment() %></td>
							
							<td class="memberList2 col-xs-2"><%=dto1.getStmEntryDate() %></td>
							<%if(dto1.getStmEntryStatus().equals("A")) {  %>
								<td class="memberList2 col-xs-1">수락</td>
							<%} else if(dto1.getStmEntryStatus().equals("D")) { %>
								<td class="memberList2 col-xs-1">거절</td>
							<%} else {%>
								<%if((session.getAttribute("id")+"["+session.getAttribute("name")+"]").equals(dto.getStAuthor())) { %>
									<td class="memberList2 col-xs-1"><a href="#" onclick="if(confirm('스터디 신청을 수락하시겠습니까?')){location.href='StudyController?action=updateStatus&status=A&stNo=<%=dto.getStNo()%>&stmEntry=<%=dto1.getStmEntry()%>&stTitle=<%=dto.getStTitle()%>';}">수락하기</a> | <a href="#" onclick="if(confirm('스터디 신청을 거절하시겠습니까?')){location.href='StudyController?action=updateStatus&status=D&stNo=<%=dto.getStNo()%>&stmEntry=<%=dto1.getStmEntry()%>';}">거절하기</a></td>
								<%} else { %>
									<td class="memberList2 col-xs-1">대기</td>
								<%} %>
							<%} %>
						</tr>
						<%} %>
				</table>
				<%if(flag == 1) { %>
				<script>
				
				document.getElementById("deleteStudy").innerHTML = "<ul class='pager'><li role='presentation' class='active'><a href='StudyController?action=removeStudy&stNo=<%=dto.getStNo()%>'><img src='images/delete.png'>신청취소</a></li></ul>";
				
				</script>
				<%} %>						
				
			</div>
			
		</div>
		
	</div>
	<%@ include file="footer.jsp"%>
</body>
</html>