<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<br/><br/>

<h1>상세보기</h1>

<form role="form" action="detail" method="POST">
	<h4>번호<br/><input type="text" name="notice_board_bno" value="${noticeBoard.notice_board_bno}" readonly="readonly"/></h4><br />
	<h4>제목<br/><input type="text" name="notice_board_title" value="${noticeBoard.notice_board_title}" readonly="readonly"/></h4><br />
	<h4>내용<br/>${noticeBoard.notice_board_content}</h4><br />
	<h4>작성일<br/>
		<fmt:formatDate pattern="yyyy-MM-dd HH:mm"
			value="${noticeBoard.notice_board_regdate}" />
	</h4>
	<div class="box-footer">
		<button type="submit" id="modifyBtn">Modify</button>
		<button type="submit" id="removeBtn">REMOVE</button>
		<button type="submit" id="listBtn">LIST</button>
	</div>
</form>
<script type="text/javascript"></script> 
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
	$( function() {
		var formObj = $("form[role='form']");
		console.log(formObj)

      	$("#modifyBtn").on("click", function() {
      		formObj.attr("method", "GET");
      		formObj.attr("action", "modify");    				
	    	formObj.submit();
      	});

      	$("#removeBtn").on("click", function() {
      		formObj.attr("method", "POST");
      		formObj.attr("action", "delete");
         	formObj.submit();
      	});

      	$("#listBtn").on("click", function() {
         	formObj.attr("method", "get");
         	formObj.attr("action", "listNoticeSBoardPage");
	        formObj.submit();
    	});
	} );

</script>
</body>
</html>
