<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<nav class="navbar navbar-default navbar-fixed-top">
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#myNavbar">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="success.jsp">MCS</a>
		</div>
		<div class="collapse navbar-collapse" id="myNavbar">

			<ul class="nav navbar-nav navbar-right">
				<li>
					<!-- Button trigger modal -->
					<button type="button" class="btn btn-primary " data-toggle="modal"
						data-target="#myModal" style="margin: 8px">
						<a href="myPage.jsp"><%=session.getAttribute("id")%>님&nbsp;<%=session.getAttribute("part")%>등급</a>
					</button>
				</li>
				<li><button type="button" class="btn btn-danger "
						style="margin: 8px">
						<a href="controller?action=logout">logout</a>
					</button></li>
				<li><a href="about.jsp">ABOUT</a></li>
				<li><a href="mentoring.jsp">멘토링</a></li>
				<li><a href="study.jsp">그룹스터디</a></li>
				<li><a href="kin.jsp">지식IN</a></li>
				<li><a href="notice.jsp">고객센터</a></li>

			</ul>
		</div>
	</div>

	</nav>