<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<c:forEach items="${employeeList}" var="emp">
	<h1><a href="detail?emp_id=${emp.emp_id}">아이디 : ${emp.emp_id }</a></h1>
	<h1><a href="detail?emp_id=${emp.emp_name}">이름 : ${emp.emp_name }</a></h1>
</c:forEach>
</body>
</html>
