<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<style>
	table{border-collapse:collapse;}
	th,td{border:1px solid darkgreen;}
</style>
<body align=center>
<%-- <p align=right>${statusLine}</p>
<p>${newbutton}</p> --%>
<h1>
	Hello World :-)
</h1>
	<c:if test="${userinfo==''}">
		<p align=right><a href='login'>Login</a>&nbsp;<a href='signin'>Join</a></p>
		<table align=center>
			<tr><th>작성시각</th><th>제목</th><th>작성자</th></tr>
		<c:forEach var="join" items="${listPost}">
			<tr><td hidden>${join.seqbb}</td><td>${join.created}</td><td><a href='view?seqbb=${join.seqbb}'>${join.title}</td><td>${join.writer}</td></tr>
		</c:forEach>
		</table>
	</c:if>
	<c:if test="${userinfo!=''}">
		<p align=right>${userinfo}&nbsp;<a href='logout'>Logout</a></p>
		<table align=center>
		<tr><th>작성시각</th><th>제목</th><th>작성자</th><th colspan='2'>관리</th></tr>
		<c:forEach var="join" items="${listPost}">
			<tr><td hidden>${join.seqbb}</td><td>${join.created}</td><td><a href='view?seqbb=${join.seqbb}'>${join.title}</td><td>${join.writer}</td>
			<c:if test="${userid==join.writer}">
				<td><input type=button id='btnUpdate' value='수정' onclick="location.href='/member/modify?seqbb=${join.seqbb}'";></td>
				<td><input type=button id='btnDel' value='삭제' onclick="location.href='/member/delete/${join.seqbb}'";></td></tr>
			</c:if>
			<c:if test="${userid!=join.writer}">
				<td></td>
				<td></td>
			</c:if>
		</c:forEach>
		</table>
	</c:if>


	<c:if test="${userinfo!=''}">
		<a href='newpost'>새글쓰기</a>
	</c:if>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script>
</script>
</body>
</html>
