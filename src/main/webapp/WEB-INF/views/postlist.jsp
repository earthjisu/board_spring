<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>POST</title>
</head>
<body>
<style>
	td{border:1px solid black;}
</style>
<table style='border-collapse:collapse'>
<c:forEach var="boardDTO" items="${postlist}">
<tr><td>${boardDTO.created}</td><td>${boardDTO.title}</td><td>${boardDTO.writer}</td></tr>
</c:forEach>
</body>
</html>