<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>새글쓰기</title>
</head>
<body>
<form id=frmadd action="addpost" method=GET>
제목: <input type=text id=title name="title"><br>
내용: <textarea id=content name="content" rows=10 cols=70></textarea><br><br>
<input type=submit value='작성완료' id=btnOk>&nbsp;
<input type=button value='목록으로 돌아가기' id=btnList>
</form>
</body>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script>
$(document)
.on('click','#btnList',function(){
	document.location='/member';
})

</script>
</html>