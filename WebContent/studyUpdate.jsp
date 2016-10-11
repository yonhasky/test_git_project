<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>스터디 내용 수정</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<link href="css/common.css" rel="stylesheet" type="text/css">
<script>
function moveEntryPage() {
	if(confirm('해당 내용으로 수정하시겠습니까?')) {
		document.entryForm.method = "POST";
		document.entryForm.action = "StudyController?action=modifyStudy";
		document.entryForm.submit();
	}
}

function moveListPage() {
	if(confirm('스터디 수정을 취소시겠습니까?')) {
		document.entryForm.action = "StudyController?action=searchStudyList&pageNum=1";
		document.entryForm.submit();
	}
}

function init() {
	var stYear1 = document.getElementById("stYear1");
	var stMonth1 = document.getElementById("stMonth1");
	var stYear2 = document.getElementById("stYear2");
	var stMonth2 = document.getElementById("stMonth2");
	
	for(var i = 16; i >= 0; i--) {
		var newOpt = new Option((i+2000)+'년',(i+2000));
		stYear1.options[16-i] = newOpt;
	}
	
	for(var i = 1; i <= 12; i++) {
		var newOpt = new Option(i+'월','0'+i);
		stMonth1.options[i-1] = newOpt;
		
	}
	
	for(var i = 16; i >= 0; i--) {
		var newOpt = new Option((i+2000)+'년',(i+2000));
		stYear2.options[16-i] = newOpt;
	}
	
	for(var i = 1; i <= 12; i++) {
		var newOpt = new Option(i+'월','0'+i);
		stMonth2.options[i-1] = newOpt;
	}
	
	initDay();
	initDay2();
}

function initDay() {
	var stMonth = document.getElementById("stMonth1");
	var stDay = document.getElementById("stDay1");
	
	
	for(var i = 1; i <= stMonth.options.length; i++) {
		stDay.options[i-1] = null;
	}
	
	if(stMonth.value == 1 || stMonth.value == 3 || stMonth.value == 5 || stMonth.value == 7 || stMonth.value == 8 || stMonth.value == 10 || stMonth.value == 12) {
		
		for(var i = 1; i <= 31; i++) {
			var newOpt = new Option(i+'일', '0'+i);
			stDay.options[i-1] = newOpt;
		}
		
	} else if(stMonth.value == 2) {
		for(var i = 1; i <= 28; i++) {
			var newOpt = new Option(i+'일', '0'+i);
			stDay.options[i-1] = newOpt;
		}
		
	} else {
		for(var i = 1; i <= 30; i++) {
			var newOpt = new Option(i+'일', '0'+i);
			stDay.options[i-1] = newOpt;
		}
	
	}
}
function initDay2() {
	var stMonth = document.getElementById("stMonth2");
	var stDay = document.getElementById("stDay2");
	
	
	for(var i = 1; i <= stMonth.options.length; i++) {
		stDay.options[i-1] = null;
	}
	
	if(stMonth.value == 1 || stMonth.value == 3 || stMonth.value == 5 || stMonth.value == 7 || stMonth.value == 8 || stMonth.value == 10 || stMonth.value == 12) {
		
		for(var i = 1; i <= 31; i++) {
			var newOpt = new Option(i+'일', '0'+i);
			stDay.options[i-1] = newOpt;
		}
		
	} else if(stMonth.value == 2) {
		for(var i = 1; i <= 28; i++) {
			var newOpt = new Option(i+'일', '0'+i);
			stDay.options[i-1] = newOpt;
		}
		
	} else {
		for(var i = 1; i <= 30; i++) {
			var newOpt = new Option(i+'일', '0'+i);
			stDay.options[i-1] = newOpt;
		}
	
	}
}

window.onload=init;

</script>
</head>
<body>
<%@ include file="topMenuSuccess.jsp"%>
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
</div>
<form class="form-horizontal" method="POST" name="entryForm" enctype="multipart/form-data">
  <div class="form-group">
    <label for="stYear1" class="col-xs-2 control-label">수행기간</label>
    <div class="col-xs-1">
      <select name="stYear1" id="stYear1" class="form-control">
      </select>
    </div>
    <div class="col-xs-1">
      <select name="stMonth1" id="stMonth1" onchange="initDay()" class="form-control">
      </select>
    </div>
    <div class="col-xs-1">
      <select name="stDay1" id="stDay1" class="form-control">
      </select>
    </div>
    <div class="col-xs-1">
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;~
    </div>
    <div class="col-xs-1">
      <select name="stYear2" id="stYear2" class="form-control">
      </select>
    </div>
    <div class="col-xs-1">
      <select name="stMonth2" id="stMonth2" onchange="initDay2()" class="form-control">
      </select>
    </div>
    <div class="col-xs-1">
      <select name="stDay2" id="stDay2" class="form-control">
      </select>
    </div>
  </div><br/>
  
  <div class="form-group">
    <label for="stTitle" class="col-sm-2 control-label">제목</label>
    <div class="col-sm-8">
      <input type="text" class="form-control" name="stTitle" id="stTitle" placeholder="Input Title">
    </div>
  </div>
  <div class="form-group">
    <label for="stOverview" class="col-sm-2 control-label">개요</label>
    <div class="col-sm-8">
      <input type="text" class="form-control" name="stOverview" id="stOverview" placeholder="Input Overview">
    </div>
  </div>
  <div class="form-group">
    <label for="stContent" class="col-sm-2 control-label">내용</label>
    <div class="col-sm-8">
   		<textarea class="form-control" name="stContent" rows="9"></textarea>   
    </div>
  </div>
  
  <div class="form-group">
    <label for="stFile1" class="col-sm-2 control-label">사진 업로드</label>
    <div class="col-sm-4">
    	<input type="file" class="form-control" name="stFile1" id="stFile1">
    </div>
    <div class="col-sm-4">
    	<input type="file" class="form-control" name="stFile2" id="stFile2">
    </div>
  </div>


  <div class="form-group">
    <div class="col-sm-offset-8">
      <button type="button" onclick="moveEntryPage()" class="col-sm-2 btn btn-info" style="margin:1px">스터디 등록</button>
      <button type="button" onclick="moveListPage()" class="col-sm-2 btn btn-info" style="margin:1px">취소</button>
    </div>
  </div>
  
  
</form>
</div>
<%@ include file="footer.jsp"%>
</body>
</html>