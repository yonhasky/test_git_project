<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>MCS-������ ȸ������</title>
<!-- Theme Made By www.w3schools.com - No Copyright -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/ajax.js"></script>

<link href="css/common.css" rel="stylesheet" type="text/css">

<script type="text/javascript">
	/*	1. ������ �ε� : 
	 --ȸ������ ��ư ��Ȱ��ȭ
	 --���̵� focus */
	window.onload = init;

	/**
	 * 2. ���̵� focus �Ҿ��� ��  
	 -- ���̵� �ߺ���ȸ(�񵿱� ���)
	 -- ���̵� �ߺ�����, ���̵� ��밡��, ���̵� �ʼ��Է�
	 -- ���̵� ��밡�� -> ȸ�����Թ�ư Ȱ��ȭ
	 */
	function isUserId() {
		//web.xml
		var url = "controller";

		var params = "";
		params += "action=idCheck";

		var id = document.getElementById("id").value;
		params += "&id=" + id;

		// ���䵥���� : Json
		params += "&responseDataType=json";

		//�������� �ݹ� �Լ� ���ε�
		var callback = responseJson;
		var method = "GET";
		// js/ajax.js ��ũ��Ʈ �̿���� ajax ���� ��û
		new ajax.xhr.Request(url, params, callback, method)
	}

	/** Json ���䵥���� ó�� callback �Լ�
	{"valid","true"}
	
	eval("1+2") =>���ڿ����� ��ȯ�Լ�
	json ������ ���ڿ��� json��ü ��ȯ
	eval("("+json������ ���乮�ڿ�+")")
	 */
	function responseJson(xhr) {
		if (xhr.readyState == 4 && xhr.status == 200) {
			var resultJson = eval("(" + xhr.responseText + ")");
			var result = resultJson.valid;
			if (result == 'true') {
				// messageUserId ����޼��� ���
				document.getElementById("messageUserId").innerHTML = "<span class='glyphicon glyphicon-remove' aria-hidden='true'></span><span class='sr-only'>Error:</span>���̵� �ߺ� ";
				document.getElementById("btnJoin").disabled = true;

			} else if (result == 'false') {
				document.getElementById("messageUserId").innerHTML = "<span class='glyphicon glyphicon-ok' aria-hidden='true'></span><span class='sr-only'>Error:</span>��밡�� ";

			} else if (result == 'required') {
				document.getElementById("messageUserId").innerHTML = "���Է�";
				document.getElementById("btnJoin").disabled = true;
			}
		}

	}

	//��й�ȣ ���̱�
	function isShowUserPw() {
		if (document.getElementById("isShow").checked) {
			document.getElementById("pw").type = "text";
		} else {
			document.getElementById("pw").type = "password";
		}
	}

	function firstChange() {
		var x = document.form.first.options.selectedIndex;
		var groups = document.form.first.options.length;
		var group = new Array(groups);
		for (i = 0; i < groups; i++)
			group[i] = new Array();

		group[0][0] = new Option("���кз�", "");

		group[1][0] = new Option("�а�����", "");
		group[1][1] = new Option("������к�", "������к�");
		group[1][2] = new Option("�߱����а�", "�߱����а�");
		group[1][3] = new Option("�Ϻ����а�", "�Ϻ����а�");
		group[1][4] = new Option("���Ʊ�����", "���Ʊ�����");
		group[1][5] = new Option("�濵�����а�", "�濵�����а�");
		group[1][6] = new Option("�濵�а�", "�濵�а�");

		group[2][0] = new Option("�а�����", "");
		group[2][1] = new Option("����ġ���а�", "����ġ���а�");
		group[2][2] = new Option("��ǰ�����а�", "��ǰ�����а�");
		group[2][3] = new Option("��ȸ�����а�", "��ȸ�����а�");
		group[2][4] = new Option("���ɸ��а�", "���ɸ��а�");
		group[2][5] = new Option("���ǰ����а�", "���ǰ����а�");
		group[2][6] = new Option("��Ȱü���а�", "��Ȱü���а�");
		group[2][7] = new Option("��ȣ�а�", "��ȣ�а�");

		group[3][0] = new Option("�а�����", "");
		group[3][1] = new Option("������а�", "������а�");
		group[3][2] = new Option("���������ڿ��а�", "���������ڿ��а�");
		group[3][3] = new Option("ȯ������ο����а�", "ȯ������ο����а�");
		group[3][4] = new Option("��ǻ���к�", "��ǻ���к�");
		group[3][5] = new Option("��ǻ��-��īƮ�δн����к�", "��ǻ��-��īƮ�δн����к�");
		group[3][6] = new Option("ȭ�л�����а�", "ȭ�л�����а�");
		group[3][7] = new Option("ȭ�а�", "ȭ�а�");

		group[4][0] = new Option("�а�����", "");
		group[4][1] = new Option("�����Ǿ���а�", "�����Ǿ���а�");
		group[4][2] = new Option("���а�", "���а�");

		group[5][0] = new Option("�а�����", "");
		group[5][1] = new Option("�̼��������а�", "�̼��������а�");
		group[5][2] = new Option("Ŀ�´����̼ǵ������а�", "Ŀ�´����̼ǵ������а�");
		group[5][3] = new Option("�����а�", "�����а�");
		group[5][4] = new Option("��Ʈ�ص������а�", "��Ʈ�ص������а�");
		group[5][5] = new Option("�����а�", "�����а�");

		group[6][0] = new Option("�а�����", "");
		group[6][1] = new Option("���а�", "���а�");

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
			group[1][0] = new Option("�����������", "�����������");
			group[1][1] = new Option("�������������", "�������������");
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
			group[4][0] = new Option("��ǻ�ͽý��� ����", "��ǻ�ͽý��� ����");
			group[4][1] = new Option("����Ʈ���� ����", "����Ʈ���� ����");
			group[4][2] = new Option("������ǻ�� ����", "������ǻ�� ����");
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

	function Verification() {

		var id = document.getElementById("id").value;
		var pwc = document.getElementById("pwConfirm").value;
		var name = document.getElementById("name").value;
		var mobile2 = document.getElementById("mobile2").value;
		var mobile3 = document.getElementById("mobile3").value;
		var email1 = document.getElementById("email1").value;
		var gender1 = document.getElementById("gender1").checked;
		var gender2 = document.getElementById("gender2").checked;

		if (id == "") {
			var ok = "���̵� �Էµ��� �ʾҽ��ϴ�.";
			document.getElementById("messageBirth").innerHTML = ok;
			document.getElementById("id").focus();
		} else if (pwc == "") {
			var ok1 = "��й�ȣ�� �Էµ��� �ʾҽ��ϴ�.";
			document.getElementById("messageBirth").innerHTML = ok1;
			document.getElementById("pwConfirm").focus();
		} else if (name == "") {
			var ok2 = "�̸��� �Էµ��� �ʾҽ��ϴ�.";
			document.getElementById("messageBirth").innerHTML = ok2;
			document.getElementById("name").focus();
		} else if (mobile2 == "") {
			var ok3 = "�ڵ����� �Էµ��� �ʾҽ��ϴ�.";
			document.getElementById("messageBirth").innerHTML = ok3;
			document.getElementById("mobile2").focus();
		} else if (mobile3 == "") {
			var ok4 = "�ڵ����� �Էµ��� �ʾҽ��ϴ�.";
			document.getElementById("messageBirth").innerHTML = ok4;
			document.getElementById("mobile3").focus();
		} else if (email1 == "") {
			document.getElementById("messageBirth").innerHTML = "�̸����� �Էµ��� �ʾҽ��ϴ�.";
			document.getElementById("email1").focus();
		} else if (gender1 == false && gender2 == false) {
			document.getElementById("messageBirth").innerHTML = "������ �Էµ��� �ʾҽ��ϴ�.";
			document.getElementById("gender1").focus();
		} else {
			document.getElementById("messageBirth").innerHTML = "";
			document.getElementById("btnJoin").disabled = false;
		}
	}
	//��й�ȣ Ȯ�� ��ġ/����ġ
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

	/* ������ �ʱ�ȭ �Լ�*/
	function init() {
		document.getElementById("id").focus();
		document.getElementById("btnJoin").disabled = true; //true �Ǵ� "disabled"
		//document.getElementById("btnJoin").setAttribute("disabled", true);
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
				<span class="glyphicon glyphicon-user logo"></span>
			</div>
			<div class="col-sm-8">
				<form name="form" class="form-horizontal" method="post"
					action="controller?action=gJoin" enctype="multipart/form-data">
					<div class="form-group">
						<label for="inputEmail3" class="col-xs-2 control-label">ID</label>
						<span class="col-xs-4" style="width: 300px"> <input
							type="text" class="form-control" id="id" name="id"
							placeholder="id" maxlength="12" data-toggle="tooltip"
							data-placement="top" onblur="isUserId()"
							title="���̵�� 4-12�� �̳��� �ۼ����ּ���.">
						</span><span id="messageUserId" class="col-xs-4 "
							style="margin-left: 10px"></span>
					</div>

					<div class="form-group">
						<label for="inputPassword3" class="col-xs-2 control-label">Password</label>
						<div class="col-xs-5">
							<input type="password" class="form-control" id="pw" name="pw"
								placeholder="Password" maxlength="12" data-toggle="tooltip"
								title="��й�ȣ�� 4-12�� �̳��� �ۼ����ּ���.">
						</div>
					</div>

					<div class="form-group">
						<label for="inputPassword3" class="col-xs-2 control-label">PW
							confirm</label> <span class="col-xs-4" style="width: 300px"> <input
							type="password" class=" form-control col-xs-12" id="pwConfirm"
							name="pwConfirm" placeholder="Password" maxlength="12"
							onkeyup="confirmPw()" data-toggle="tooltip"
							title="��й�ȣ�� 4-12�� �̳��� �ۼ����ּ���.">
						</span> <span class="col-xs-4 " id="messagePwConfirm"
							style="margin-left: 10px"></span>
					</div>

					<div class="form-group">
						<label for="inputPassword3" class="col-xs-2 control-label">�̸�</label>
						<div class="col-xs-5">
							<input type="text" class="form-control" id="name" name="name"
								placeholder="name">
						</div>
					</div>
					<div class="form-group">
						<label for="inputPassword3" class="col-xs-2 control-label">����ó</label>

						<span class="col-xs-2" style="width: 110px;"> <select
							class="form-control" name="mobile1" style="width: 80px;">
								<option value="010">010</option>
								<option value="011">011</option>
								<option value="016">016</option>
								<option value="018">018</option>
								<option value="019">019</option>
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
						<label for="inputPassword3" class="col-xs-2 control-label">����</label>
						<div class="col-xs-8">
							<label class="radio-inline"> <input type="radio"
								name="gender" id="gender1" value="M"> Male
							</label> <label class="radio-inline"> <input type="radio"
								name="gender" id="gender2" value="F"> Female
							</label>
						</div>
					</div>


					<div class="form-group">
						<label for="inputPassword3" class="col-xs-2 control-label">����
						</label> <span class="col-xs-2" style="width: 100px;"> <select
							class="form-control" name="birth" onfocus="Verification()"
							style="width: 100px;">
								<option value="1980">1980</option>
								<option value="1981">1981</option>
								<option value="1982">1982</option>
								<option value="1983">1983</option>
								<option value="1984">1984</option>
								<option value="1985">1985</option>
								<option value="1986">1986</option>
								<option value="1987">1987</option>
								<option value="1988">1988</option>
								<option value="1989">1989</option>
								<option value="1990">1990</option>
								<option value="1991">1991</option>
								<option value="1992">1992</option>
								<option value="1993">1993</option>
								<option value="1994">1994</option>
								<option value="1994">1995</option>
								<option value="1994">1996</option>
								<option value="1994">1997</option>
								<option value="1994">1998</option>

						</select>
						</span><span id="messageBirth" class="col-xs-4 "
							style="margin-left: 10px"></span>
					</div>

					<div class="form-group">
						<label for="inputPassword3" class="col-xs-2 control-label">����
						</label>
						<div class="col-xs-3">

							<select class="form-control" name="first"
								onchange="firstChange();" size=1>
								<OPTION value=''>���кз�</OPTION>

								<OPTION value=''>�ι���ȸ����</OPTION>
								<OPTION value=''>���Ǻ�������</OPTION>
								<OPTION value=''>���б������</OPTION>
								<OPTION value=''>���д���</OPTION>
								<OPTION value=''>��ȭ��������</OPTION>
								<OPTION value=''>���д���</OPTION>

							</SELECT> <SELECT class="form-control" name="second"
								onchange="secondChange();" size=1>
								<OPTION value=''>�а��з�</OPTION>
							</SELECT> <SELECT class="form-control" name="third" size=1>
								<OPTION value=''>��������</OPTION>
							</SELECT>
						</div>
					</div>

					<div class="form-group">
						<label for="inputPassword3" class="col-xs-2 control-label">�й�
						</label>
						<div class="col-sm-2" style="width: 100px;">

							<select class="form-control" name="grade" style="width: 100px;">
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

						<label for="inputPassword3" class="col-xs-2 control-label">����
						</label>
						<div class="col-sm-3">
							<input class="btn btn-default " type="file" name="img" size="50"
								maxlength="100">
						</div>
					</div>

					<div class="form-group">
						<label for="inputPassword3" class="col-xs-2 control-label">������
						</label>
						<div class="col-sm-2" style="width: 100px;">

							<select class="form-control" name="gDate1" style="width: 100px;">

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
						<div class="col-sm-1" style="width: 20px">��</div>
						<div class="col-sm-2" style="width: 90px;">

							<select class="form-control" name="gDate2" style="width: 80px;">
								<option>02</option>
								<option>08</option>
							</select>
						</div>
						<div class="col-sm-1" style="width: 20px">��</div>
					</div>

					<div class="form-group">
						<label for="inputPassword3" class="col-xs-2 control-label">����
						</label>
						<div class="col-sm-2" style="width: 80px;">

							<select class="form-control" name="job">
								<option value="�濵���繫">�濵���繫</option>
								<option value="�����������">�����������</option>
								<option value="���ꡤ����">���ꡤ����</option>
								<option value="IT�����ͳ�">IT�����ͳ�</option>
								<option value="������">������</option>
								<option value="����">����</option>
								<option value="�̵��">�̵��</option>
								<option value="Ư������������">Ư������������</option>
								<option value="�Ǽ�">�Ǽ�</option>
								<option value="���롤����">���롤����</option>
								<option value="����">����</option>
								<option value="������">������</option>
								<option value="�Ƿ�">�Ƿ�</option>

							</select>
						</div>
					</div>


					<div class="form-group">
						<label for="inputPassword3" class="col-xs-2 control-label">ȸ��</label>
						<div class="col-xs-5">
							<input type="text" class="form-control" id="inputPassword3"
								name="company">
						</div>
					</div>

					<div class="form-group">
						<label for="inputPassword3" class="col-xs-2 control-label">���
						</label>
						<div class="col-xs-2" style="width: 90px;">
							<select class="form-control" name="career1" style="width: 80px;">
								<option value="0">0</option>
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
								<option value="5">5</option>
								<option value="6">6</option>
								<option value="7">7</option>
								<option value="8">8</option>
								<option value="9">9</option>
								<option value="10">10</option>
								<option value="11">11</option>
								<option value="12">12</option>
								<option value="13">13</option>
								<option value="14">14</option>
							</select>
						</div>
						<div class="col-xs-1" style="width: 20px">��</div>
						<div class="col-xs-2" style="width: 90px;">

							<select class="form-control" name="career2" style="width: 80px;">
								<option value="01">01</option>
								<option value="02">02</option>
								<option value="03">03</option>
								<option value="04">04</option>
								<option value="05">05</option>
								<option value="06">06</option>
								<option value="07">07</option>
								<option value="08">08</option>
								<option value="09">09</option>
								<option value="10">10</option>
								<option value="11">11</option>
								<option value="12">12</option>

							</select>
						</div>
						<div class="col-sm-1" style="width: 20px">��</div>
					</div>

					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-4">
							<button id="btnJoin" type="submit" class="btn btn-default btn-lg"
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