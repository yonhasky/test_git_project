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
<title>MCS - ���� ���丵 ����</title>
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

.btn-major {
	background-color: #f4511e;
	color: white;
	font-weight: bold;
}

.table>tbody>tr {
	border: 20px;
}	
img {
width:15px;}	
}
</style>
</head>
<body>
	<%@ include file="topMenuSuccess.jsp"%>

	
	

	<div class="row container-fluid text-center">
		<div class=" col-xs-offset-2 col-xs-8"
			style="border: 6px black solid; padding-top: 60px">
			<div class="col-xs-3">
				<div class="col-xs-12 glyphicon glyphicon-education logo-small"></div>
				<br> <br>
				<h3>���丵 ��û����</h3>
			</div>
			<div class=" col-xs-9">

				<table class="table" style="margin-top: 20px;">
					<tr>
						<td class="memberList">�̸�</td>
						<td class="memberList">����</td>
						<td class="memberList">�а�</td>
						<td class="memberList">�й�</td>
						<td class="memberList">��û��</td>
						<td class="memberList">����</td>
						<td class="memberList"></td>
					</tr>
					<c:forEach var="list" items="${requestScope.list}">
						<tr>
							<td class="memberList2">${list.mName}</td>
							<td class="memberList2">${list.mComment}</td>
							<td class="memberList2">${list.mMajor}�а�</td>
							<td class="memberList2">${list.mGrade}�й�</td>
							<td class="memberList2">${list.mDate}</td>
							<td class="memberList2">${list.mStatus}����</td>
							<c:if test="${list.mEntry eq sessionScope.id}">
								<td class="memberList2"><a href="MentoringController?action=mentoringDetail&mNo=${list.mNo}"><img
										src="images/update.png"></a> |<a href="MentoringController?action=mentoringDelete&mEntry=${list.mEntry}&mNo=${list.mNo}&mHost=${list.mHost}"><img
										src="images/delete.png"></a></td>
							</c:if>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>

	<%@ include file="footer.jsp"%>
</body>
</html>