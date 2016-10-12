<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="work.model.dto.Student"%>
<%@ page import="work.util.Utility"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
</script>
<style>
.btn-warning {
	background-color: #F7BE81;
}
.btn-major{
background-color:#f4511e;
color:white;
font-weight:bold;
}

.col-xs-5{
padding:0px
}
</style>
</head>
<body>
	<%@ include file="topMenuSuccess.jsp"%>

	<div class="jumbotron text-center">

		<h1>Mentoring</h1>
		<p>Mentoring Campus in Sahmyook University</p>
		<form name="form" class="form-inline">
			<span class="form-group"> <span class="col-xs-12"> <select
					class="form-control" name="first" onchange="firstChange();" size=1>
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
				</SELECT>
			</span>
			</span> <input type="text" class="form-control" size="50" placeholder="�˻�"
				required>
			<button type="button" class="btn btn-danger">�˻�</button>
		</form>
	</div>

	<!-- Container (Portfolio Section) -->
	<div id="portfolio" class="container-fluid text-center bg-grey">
		<div class="row">


			<h2>Mentoring</h2>
			<h4>������ ����Ե���� ���丵</h4>

			<div class="row">

				<c:forEach var="dto" items="${requestScope.list}">

					<div class="col-xs-5" style="background-color: white; margin: 30px">
						<div class="col-xs-3">
							<div class="col-xs-12 glyphicon glyphicon-education logo-small" ></div>
							
								<img alt="img/default.jpg" src="${dto.img}" alt="images/ceci1.jpg" class="img-circle"
									style="width: 120px; height: 120px;">
							


						</div>
						<div class="col-xs-7 caption">

							<div class="btn-group btn-group-justified" role="group"
								aria-label="...">
								<div class="btn-group" role="group">
									<button type="button" class="btn btn-major">${dto.major}</button>
								</div>

								<div class="btn-group" role="group">
									<button type="button" class="btn btn-default">${dto.gDate} ����
										</button>
								</div>
							</div>
							<div class="col-xs-12">
								<h3>${dto.name}</h3>
								<p>${dto.grade}�й�</p>

								<p>���� : ${dto.job} ȸ�� : ${dto.company}</p>
							</div>
						</div>
						<button class="col-xs-2 btn" style="height:190px;background-color:#f4511e">
							<a href="controller?action=graduationDetail&id=${dto.id}"
								class="glyphicon glyphicon-chevron-right logo-small"
								style="color: white" role="button"></a>
						</button>
					</div>
				</c:forEach>

			</div>

		</div>
	</div>


	<%@ include file="footer.jsp"%>
</body>
</html>