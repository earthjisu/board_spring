<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
<form id=frmSignin method=POST action="user_signin">
<table align=center>
<tr><td align=center colspan='2'><h1>Signin</h1></td></tr>
<tr><td>아이디: </td><td><input type=text name=id value='${uid}'></td></tr>
<tr><td>비밀번호: </td><td><input type=password name=pwd id=pwd></td></tr>
<tr><td>비밀번호 확인: </td><td><input type=password name=pwd1 id=pwd1></td></tr>
<tr><td>이름: </td><td><input type=text name=user_name id=user_name></td></tr>
<tr><td>모바일: </td><td><input type=text name=mobile id=mobile></td></tr>
<tr><td colspan="2" align=center><input type=submit value='회원가입'></td></tr>
</table>

</form>
</body>
<script src='https://code.jquery.com/jquery-3.4.1.js'></script>
<script>
$(document)
.on('submit','#frmSignin',function(){
	if($('#pwd').val()!=$('#pwd1').val()){
		alert('비밀번호를 다시 확인하세요');
		return false;
	}
	return true;
})
</script>
</html>