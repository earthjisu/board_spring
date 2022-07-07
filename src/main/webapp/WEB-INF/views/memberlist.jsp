<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Member List</title>
</head>
<body>
<style>
	td{border:1px solid black;}
</style>
<table style='border-collapse:collapse'>
<c:forEach var="logininfo" items="${memberlist}">
<tr><td>${logininfo.id}</td><td>${logininfo.pwd}</td><td>${logininfo.name}</td>
<td>${logininfo.mobile}</td><td>${logininfo.joindate}</td></tr>
</c:forEach>
</table>
</body>
</html>