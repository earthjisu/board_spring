<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정</title>
</head>
<body>
<form id=frmupdate action="update" method=GET>
<input type=hidden name=seqbb value="${boardDTO.seqbb}">
제목: <input type=text id=title name="title" value="${boardDTO.title}"><br><br>
내용: <textarea id=content name="content" rows=10 cols=70>${boardDTO.content}</textarea><br><br>
<input type=submit value='수정완료' id=btnOk>&nbsp;
<input type=button value='취소' id=btnCancel>&nbsp;
<input type=button value='삭제' id=btnDelete onclick="location.href='/member/delete/${boardDTO.seqbb}'";>
</form>
</body>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script>
$(document)
.on('click','#btnCancel',function(){
	document.location='/member';
})
.on('click','#btnOk',function(){
	document.location='/member';
})

</script>
</html>