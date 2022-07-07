<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 보기</title>
</head>
<body>
<form id=frmview action="view" method='get'>
제목: <input type=text readonly id=title name="title" value="${boardDTO.title}"><br>
내용: <textarea id=content name="content" rows=10 cols=70 readonly>${boardDTO.content}</textarea><br><br>
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