<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page session="false" %>
<html>
<head>
	<title>공지사항</title>
</head>
<body>
<h1> 공지사항 </h1>

<br/>
<br/>
<button onclick="javascript:location.href='insert';">New Board</button>
<br/>
<br/>
<div>
	
	<c:forEach items="${listAll}" var="NoticeBoardVO">
		<tr>	
			<td>${NoticeBoardVO.notice_board_bno}</td>
			<td><a href="detail?notice_board_bno=${NoticeBoardVO.notice_board_bno}">${NoticeBoardVO.notice_board_title}</a></td>
			<td>${NoticeBoardVO.notice_board_content}</td>
			<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${NoticeBoardVO.notice_board_regdate}" /></td>
		</tr><br/>
	</c:forEach>
</div>


</body>
</html>
