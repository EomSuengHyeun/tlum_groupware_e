<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page session="false" %>
<html>
<head>
	<title>LIMIT 게시판</title>
</head>
<body>
<h1> LIMIT 게시판 </h1>

<br/>
<br/>
<button onclick="javascript:location.href='insert';">New Board</button>
<br/>
<br/>
<div>
	
	<c:forEach items="${listAll}" var="LimitBoardVO">
		<tr>	
			<td>${LimitBoardVO.limit_board_bno}</td>
			<td><a href="detail?limit_board_bno=${LimitBoardVO.limit_board_bno}">${LimitBoardVO.limit_board_title}</a></td>
			<td>${LimitBoardVO.limit_board_content}</td>
			<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${LimitBoardVO.limit_board_regdate}" /></td>
			<td>${LimitBoardVO.emp_name}</td>
			<td>${LimitBoardVO.grade_no}</td>
		</tr><br/>
	</c:forEach>
</div>


</body>
</html>
