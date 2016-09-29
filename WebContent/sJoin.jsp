<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<!-- Theme Made By www.w3schools.com - No Copyright -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<link href="css/common.css" rel="stylesheet" type="text/css">

<script type="text/javascript">
	function firstChange() {
		var x = document.form.first.options.selectedIndex;
		var groups = document.form.first.options.length;
		var group = new Array(groups);
		for (i = 0; i < groups; i++)
			group[i] = new Array();

		group[0][0] = new Option("대학분류", "");

		group[1][0] = new Option("학과선택", "");
		group[1][1] = new Option("영어영문학부", "영어영문학부");
		group[1][2] = new Option("중국어학과", "중국어학과");
		group[1][3] = new Option("일본어학과", "일본어학과");
		group[1][4] = new Option("유아교육과", "유아교육과");
		group[1][5] = new Option("경영정보학과", "경영정보학과");
		group[1][6] = new Option("경영학과", "경영학과");

		group[2][0] = new Option("학과선택", "");
		group[2][1] = new Option("물리치료학과", "물리치료학과");
		group[2][2] = new Option("식품영양학과", "식품영양학과");
		group[2][3] = new Option("사회복지학과", "사회복지학과");
		group[2][4] = new Option("상담심리학과", "상담심리학과");
		group[2][5] = new Option("보건관리학과", "보건관리학과");
		group[2][6] = new Option("생활체육학과", "생활체육학과");
		group[2][7] = new Option("간호학과", "간호학과");

		group[3][0] = new Option("학과선택", "");
		group[3][1] = new Option("생명과학과", "생명과학과");
		group[3][2] = new Option("동물생명자원학과", "동물생명자원학과");
		group[3][3] = new Option("환경디자인원예학과", "환경디자인원예학과");
		group[3][4] = new Option("컴퓨터학부", "컴퓨터학부");
		group[3][5] = new Option("컴퓨터-메카트로닉스공학부", "컴퓨터-메카트로닉스공학부");
		group[3][6] = new Option("화학생명과학과", "화학생명과학과");
		group[3][7] = new Option("화학과", "화학과");

		group[4][0] = new Option("학과선택", "");
		group[4][1] = new Option("기초의약과학과", "기초의약과학과");
		group[4][2] = new Option("약학과", "약학과");

		group[5][0] = new Option("학과선택", "");
		group[5][1] = new Option("미술컨텐츠학과", "미술컨텐츠학과");
		group[5][2] = new Option("커뮤니케이션디자인학과", "커뮤니케이션디자인학과");
		group[5][3] = new Option("건축학과", "건축학과");
		group[5][4] = new Option("아트앤디자인학과", "아트앤디자인학과");
		group[5][5] = new Option("음악학과", "음악학과");

		group[6][0] = new Option("학과선택", "");
		group[6][1] = new Option("신학과", "신학과");

		temp = document.form.second;
		for (m = temp.options.length - 1; m > 0; m--)
			temp.options[m] = null
		for (i = 0; i < group[x].length; i++) {
			temp.options[i] = new Option(group[x][i].text, group[x][i].value)
		}
		temp.options[0].selected = true
	}
	function secondChange() {
		var first = document.form.first.options.selectedIndex;
		var x = document.form.second.options.selectedIndex;
		var groups = document.form.second.options.length;
		var group = new Array(groups);
		for (i = 0; i < groups; i++)
			group[i] = new Array();
		if (first == 1) {
			group[0][0] = new Option("", "");
			group[1][0] = new Option("영어영문학전공", "");
			group[1][1] = new Option("영어통번역전공", "ss3");
			group[2][0] = new Option("", "");
			group[3][0] = new Option("", "");
			group[4][0] = new Option("", "");
			group[5][0] = new Option("", "");

		} else if (first == 2) {
			group[0][0] = new Option("", "");
			group[1][0] = new Option("", "");
			group[2][0] = new Option("", "");
			group[3][0] = new Option("", "");
			group[4][0] = new Option("", "");
			group[5][0] = new Option("", "");
			group[6][0] = new Option("", "");

		} else if (first == 3) {
			group[0][0] = new Option("", "");
			group[1][0] = new Option("", "");
			group[2][0] = new Option("", "");
			group[3][0] = new Option("", "");
			group[4][0] = new Option("컴퓨터시스템 전공", "hp_laser");
			group[4][1] = new Option("소프트웨어 전공", "hp_laser");
			group[4][2] = new Option("응용컴퓨팅 전공", "hp_laser");
			group[5][0] = new Option("", "");
			group[6][0] = new Option("", "");

		} else if (first == 4) {
			group[0][0] = new Option("", "");
			group[1][0] = new Option("", "");

		} else if (first == 5) {
			group[0][0] = new Option("", "");
			group[1][0] = new Option("", "");
			group[2][0] = new Option("", "");
			group[3][0] = new Option("", "");
			group[4][0] = new Option("", "");

		} else if (first == 6) {
			group[0][0] = new Option("", "");

		}

		temp = document.form.third;
		for (m = temp.options.length - 1; m > 0; m--)
			temp.options[m] = null
		for (i = 0; i < group[x].length; i++) {
			temp.options[i] = new Option(group[x][i].text, group[x][i].value)
		}
		temp.options[0].selected = true
	}
	
	//비밀번호 확인 일치/불일치
	function confirmPw() {

		var pw = document.getElementById("pw").value;
		var pwc = document.getElementById("pwConfirm").value;

		if (pw == pwc) {
			var ok = "<span class='glyphicon glyphicon-ok' aria-hidden='true'></span><span class='sr-only'>Error:</span>password match ";
			document.getElementById("messagePwConfirm").innerHTML = ok;
			messagePwConfirm.style.color = "blue";
			messagePwConfirm.style.fontWeight = "bold";

		} else {
			var not = "<span class='glyphicon glyphicon-remove' aria-hidden='true'></span><span class='sr-only'>Error:</span>password do not match ";
			document.getElementById("messagePwConfirm").innerHTML = not;
			messagePwConfirm.style.color = "red";
		}
	}
</script>

<style type="text/css">
.form-control {
	width: 300px
}
</style>

</head>
<body id="myPage" data-spy="scroll" data-target=".navbar"
	data-offset="60">

	<%@ include file="topMenu.jsp"%>

	<!-- Container (About Section) -->
	<div id="about" class="container-fluid">
		<div class="row">
			<div class="col-sm-4">
				<span class="glyphicon glyphicon-signal logo"></span>
			</div>
			<div class="col-sm-8">
				<form name="form" class="form-horizontal" method="post"
					action="Controller?action=join" enctype="multipart/form-data">
					<div class="form-group">
						<label for="inputEmail3" class="col-xs-2 control-label">ID</label>
						<div class="col-xs-5">
							<input type="text" class="form-control" id="id" name="id"
								placeholder="id" maxlength="12" data-toggle="tooltip"
								title="아이디는 4-12자 이내로 작성해주세요.">
						</div>
					</div>

					<div class="form-group">
						<label for="inputPassword3" class="col-xs-2 control-label">Password</label>
						<div class="col-xs-5">
							<input type="password" class="form-control" id="pw" name="pw"
								placeholder="Password" maxlength="12" data-toggle="tooltip"
								title="비밀번호는 4-12자 이내로 작성해주세요.">
						</div>
					</div>

					<div class="form-group">
						<label for="inputPassword3" class="col-xs-2 control-label">PW
							confirm</label> <span class="col-xs-4" style="width: 300px"> <input
							type="password" class=" form-control col-xs-12" id="pwConfirm"
							name="pwConfirm" placeholder="Password" maxlength="12"
							onkeyup="confirmPw()" data-toggle="tooltip"
							title="비밀번호는 4-12자 이내로 작성해주세요.">
						</span> <span class="col-xs-4 " id="messagePwConfirm" style="margin-left:10px"></span>
					</div>

					<div class="form-group">
						<label for="inputPassword3" class="col-xs-2 control-label">이름</label>
						<div class="col-xs-5">
							<input type="text" class="form-control" id="name" name="name"
								placeholder="name">
						</div>
					</div>
					<div class="form-group">
						<label for="inputPassword3" class="col-xs-2 control-label">연락처</label>

						<span class="col-xs-2" style="width: 110px;"> <select
							class="form-control" name="mobile1" style="width: 80px;">
								<option>010</option>
								<option>011</option>
								<option>016</option>
								<option>018</option>
								<option>019</option>
						</select>
						</span> <span class="col-xs-2" style="width: 110px;"> <input
							type="text" class="form-control" id="mobile2" name="mobile2"
							style="width: 80px;"
							onkeyUp="moveItem(this.value, 4, document.insertForm.mobile3)">
						</span> <span class="col-xs-2" style="width: 110px;"> <input
							type="text" class="form-control" id="mobile3" name="mobile3"
							style="width: 80px;"
							onkeyUp="moveItem(this.value, 4, document.insertForm.email1)">
						</span>
					</div>

					<div class="form-group">
						<label for="inputPassword3" class="col-xs-2 control-label">e-mail</label>
						<div class="col-xs-10">
							<input type="text" class="form-control" id="email1" name="email1"
								placeholder="e-mail">
						</div>
						<label for="inputPassword3" class="col-xs-2 control-label"></label>

						<div class="col-xs-8">
							<select class="form-control" name="email2">
								<option value="@naver.com">@naver.com</option>
								<option value="@daum.net">@daum.net</option>
								<option value="@syu.ac.kr">@syu.ac.kr</option>
								<option value="@google.com">@google.com</option>
								<option value="@hotmail.com">@hotmail.com</option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label for="inputPassword3" class="col-xs-2 control-label">성별</label>
						<div class="col-xs-8">
							<label class="radio-inline"> <input type="radio"
								name="gender" id="inlineRadio1" value="M"> Male
							</label> <label class="radio-inline"> <input type="radio"
								name="gender" id="inlineRadio2" value="F"> Female
							</label>
						</div>
					</div>


					<div class="form-group">
						<label for="inputPassword3" class="col-xs-2 control-label">생년
						</label>
						<div class="col-xs-2" style="width: 80px;">

							<select class="form-control" name="birth" style="width: 80px;">
								<option>1990</option>
								<option>1991</option>
								<option>1992</option>
								<option>1993</option>
								<option>1994</option>
							</select>
						</div>
					</div>

					<div class="form-group">
						<label for="inputPassword3" class="col-xs-2 control-label">전공
						</label>
						<div class="col-xs-3">

							<select class="form-control" name="first"
								onchange="firstChange();" size=1>
								<OPTION value=''>대학분류</OPTION>

								<OPTION value=''>인문사회대학</OPTION>
								<OPTION value=''>보건복지대학</OPTION>
								<OPTION value=''>과학기술대학</OPTION>
								<OPTION value=''>약학대학</OPTION>
								<OPTION value=''>문화예술대학</OPTION>
								<OPTION value=''>신학대학</OPTION>

							</SELECT> <SELECT class="form-control" name="second"
								onchange="secondChange();" size=1>
								<OPTION value=''>학과분류</OPTION>
							</SELECT> <SELECT class="form-control" name="third" size=1>
								<OPTION value=''>세부전공</OPTION>
							</SELECT>
						</div>
					</div>

					<div class="form-group">
						<label for="inputPassword3" class="col-xs-2 control-label">학번
						</label>
						<div class="col-sm-2" style="width: 80px;">

							<select class="form-control" name="grade" style="width: 80px;">
								<option value='2001'>2001</option>
								<option value='2002'>2002</option>
								<option value='2003'>2003</option>
								<option value='2004'>2004</option>
								<option value='2005'>2005</option>
								<option value='2006'>2006</option>
								<option value='2007'>2007</option>
								<option value='2008'>2008</option>
								<option value='2009'>2009</option>
								<option value='2010'>2010</option>
								<option value='2011'>2011</option>
								<option value='2012'>2012</option>
								<option value='2013'>2013</option>
								<option value='2014'>2014</option>
								<option value='2015'>2015</option>
							</select>
						</div>
					</div>

					<div class="form-group">

						<label for="inputPassword3" class="col-xs-2 control-label">사진
						</label>
						<div class="col-sm-3">
							<input class="btn btn-default " type="file" name="img" size="50"
								maxlength="100">
						</div>
					</div>




					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-4">
							<button type="submit" class="btn btn-default btn-lg"
								onclick="return validCheck()" name="submit">Sign in</button>
							<button type="submit" class="btn btn-danger btn-lg"
								onclick="return validCheck()" name="submit">back</button>
						</div>
					</div>

				</form>


			</div>

		</div>
	</div>

	<%@ include file="footer.jsp"%>

</body>
</html>