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
			<a class="navbar-brand" href="admSuccess.jsp">MCS</a>
		</div>
		<div class="collapse navbar-collapse" id="myNavbar">

			<ul class="nav navbar-nav navbar-right">
				<li>
					<!-- Button trigger modal -->
					<button type="button" class="btn btn-primary " data-toggle="modal"
						data-target="#myModal" style="margin: 8px">
						<a href="admSuccess.jsp"><%=session.getAttribute("id")%>´Ô&nbsp;<%=session.getAttribute("part")%>µî±Þ</a>
					</button>
				</li>
				<li><button type="button" class="btn btn-danger "
						style="margin: 8px" onclick="location.href='controller?action=logout'">
						<a href="#">logout</a>
					</button></li>
			</ul>
		</div>
	</div>

	</nav>