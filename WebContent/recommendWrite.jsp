<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>���ǻ���</title>

<link rel="stylesheet" href="css/bootstrap.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<link href="css/common.css" rel="stylesheet" type="text/css">
<script>
function moveEntryPage() {
	if(confirm('�Խñ��� ����Ͻðڽ��ϱ�?')) {
		document.entryForm.action = "RecommendController?action=recommendEntry";
		document.entryForm.submit();
	}
}

function moveListPage() {
	if(confirm('�� �ۼ��� ��ҽðڽ��ϱ�?')) {
		document.entryForm.action = "RecommendController?action=recommendList&pageNum=1";
		document.entryForm.submit();
	}
}
</script>
</head>
<body>
	<%@ include file="topMenu.jsp"%>

<div id="portfolio" class="container-fluid text-center bg-grey">
		<div class="row">
<h1 class="text-center"><span class="glyphicon glyphicon-list-alt"></span> ���ǻ��� �ۼ�</h1><br/><br/>
<h5 class="text-center">������ ������� �����Ӱ� ��ȭ���ּ���</h5><br/>
<form class="form-horizontal" name="entryForm" method="post" enctype="multipart/form-data">
  <div class="form-group">
    <label for="bTitle" class="col-sm-2 control-label">����</label>
    <div class="col-sm-8">
      <input type="text" class="form-control" name="bTitle" id="bTitle" placeholder="Input Title">
    </div>
  </div>
  <div class="form-group">
    <label for="bPw" class="col-sm-2 control-label">��ȣ</label>
    <div class="col-sm-8">
      <input type="password" class="form-control" name="bPw" id="bPw" placeholder="Input Password">
    </div>
  </div>
  <div class="form-group">
    <label for="bContent" class="col-sm-2 control-label">����</label>
    <div class="col-sm-8">
   		<textarea class="form-control" name="bContent" rows="7"></textarea>   
    </div>
  </div>
  
  <div class="form-group">
    <label for="bFile1" class="col-sm-2 control-label">���� ���ε�</label>
    <div class="col-sm-3">
    	<input type="file" class="form-control" name="bFile1" id="bFile1">
    </div>
    <div class="col-sm-3">
    	<input type="file" class="form-control" name="bFile2" id="bFile2">
    </div>
    <div class="col-sm-offset-2 col-sm-3">
    	<input type="file" class="form-control" name="bFile3" id="bFile3">
    </div>
  </div>

  <div class="form-group">
    <div class="col-sm-offset-6">
      <button type="button" onclick="moveEntryPage()" class="col-sm-2 btn btn-info">�۾���</button>
      <button type="button" onclick="moveListPage()" class="col-sm-2 btn btn-info">���</button>
    </div>
  </div>
</form>
<jsp:include page="footer.jsp"/>
</div>
	</div>
</body>
</html>