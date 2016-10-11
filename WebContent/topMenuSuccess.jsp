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
			<a class="navbar-brand" href="index.jsp">MCS</a>
		</div>
		<div class="collapse navbar-collapse" id="myNavbar">

			<ul class="nav navbar-nav navbar-right">
				<li>
					<!-- Button trigger modal -->
					<li>
					<!-- Button trigger modal -->
					<%if(session.getAttribute("id") != null) { %>
					<button type="button" class="btn btn-primary" style="margin: 8px" onclick="location.href='myPage.jsp'">
						<%=session.getAttribute("id")%>님&nbsp;<%=session.getAttribute("part")%>등급</a>
					</button>
					<%} else {%>
						<button type="button" class="btn btn-primary " data-toggle="modal"
						data-target="#myModal" style="margin: 8px">login</button>					
					<%} %>
					<%if(session.getAttribute("id") != null) { %>
					<li><button type="button" class="btn btn-danger "
						style="margin: 8px" onclick="location.href='controller?action=logout'">
						<a href="#">logout</a>
					</button></li>
					<%} %>
				</li>
					 <!-- Modal -->
					<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
						aria-labelledby="myModalLabel">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
									<h4 class="modal-title" id="myModalLabel">Login</h4>
								</div>
								<div class="modal-body">
									<form class="form-horizontal" method="post"
										action="controller?action=login">
										<div class="form-group">
											<label for="inputEmail3" class="col-sm-2 control-label">ID</label>
											<div class="col-sm-10">
												<input type="text" class="form-control" id="id" name="id"
													placeholder="ID">
											</div>
										</div>
										<div class="form-group">
											<label for="inputPassword3" class="col-sm-2 control-label">Password</label>
											<div class="col-sm-10">
												<input type="password" class="form-control" name="pw"
													id="pw" placeholder="Password">
											</div>
										</div>
										<div class="form-group">
											<div class="col-sm-offset-2 col-sm-10">
												<div class="checkbox">
													<label> <input type="checkbox"> Remember me
													</label>
												</div>
											</div>
										</div>
										<div class="form-group">
											<div class="col-sm-offset-2 col-sm-10">
												<button type="submit" class="btn btn-default">Sign
													in</button>
											</div>
										</div>
									</form>

								</div>

								<div class="modal-footer">

									<a class="btn btn-success" role="button" data-toggle="collapse"
										href="#collapseExample" aria-expanded="false"
										aria-controls="collapseExample">join us</a>

									<div class="collapse" id="collapseExample">
										<div class="well">
											<a href="sJoin.jsp"><button type="button"
													class="btn btn-success">재학생 회원가입</button></a> <a
												href="gJoin.jsp"><button type="button"
													class="btn btn-success">졸업생 회원가입</button></a>
										</div>
									</div>


									<button type="button" class="btn btn-danger">Find ID</button>

									<button type="button" class="btn btn-danger">Find PW</button>
								</div>
							</div>
						</div>
					</div>




				</li>
				<li><a href="about.jsp">ABOUT</a></li>
				<li><a href="mentoring.jsp">멘토링</a></li>
				<li><a href="StudyController?action=searchStudyList&pageNum=1">그룹스터디</a></li>
				<li><a href="Kcontroller?action=kinList&pageNum=1">지식IN</a></li>
				<li><a href="notice.jsp">고객센터</a></li>

			</ul>
		</div>
	</div>

	</nav>
	