<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>

<form method=POST action="user_check">
<table align=center>
<input type=text id=hid value="${login}" hidden>
<tr><td colspan="2" align=center><h1>Login</h1></td></tr>
<tr><td>ID: </td><td><input type=text name=userid></td></tr>
<tr><td>PASSWORD: </td><td><input type=password name=pwd></td></tr>
<tr><td align=center colspan="2"><input type=submit value='로그인'>
	<input type=button id=btnJoin value='회원가입' onclick="location.href='/member/signin'";></td></tr>
</table>
</form>
<script src='https://code.jquery.com/jquery-3.4.1.js'></script>
<script>
$(document)
.ready(function(){
	if($('#hid').val()=="fail"){
		alert("아이디와 비밀번호를 다시 확인하세요.")
	}
})
</script>
</body>
</html>