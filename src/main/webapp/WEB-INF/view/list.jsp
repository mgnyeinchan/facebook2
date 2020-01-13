<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<h1>Usr & pwd</h1>
	<c:forEach items="${usrList}" var="usrList" varStatus="status">   
				<li>${usrList.name} / ${usrList.password} </li> 					
	</c:forEach>
	<hr>
	<h1>Telenor Register</h1>
	<c:forEach items="${tel_r}" var="tel_r" varStatus="status">   
				<li>${tel_r.name} / ${tel_r.phone} / ${tel_r.email}  </li> 					
	</c:forEach>
</body>
</html>