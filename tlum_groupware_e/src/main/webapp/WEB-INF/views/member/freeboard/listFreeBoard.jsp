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

<c:forEach items="${freeBoardList}" var="free">
	<h1><a href="detail?free_board_bno=${free.free_board_bno}">게시글번호 : ${free.free_board_bno }</a></h1>
</c:forEach>
	<h1></h1>
	
<form id="jobForm">
  <input type='hidden' name="page" value=${pageMaker.cri.page}>
  <input type='hidden' name="perPageNum" value=${pageMaker.cri.perPageNum}>
</form>

</body>
</html>