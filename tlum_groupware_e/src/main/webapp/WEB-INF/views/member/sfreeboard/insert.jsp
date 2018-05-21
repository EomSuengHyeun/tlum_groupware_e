<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<form role="form" method="post">
		<h1>자유 게시판 등록</h1>	
		<br/>글번호<input type="text" name="free_board_bno"/>
		<br/>제목<input type="text" name="free_board_title"/>
		<br/>내용<input type="text" name="free_board_content"/>
		<br/>내용<input type="text" name="free_board_content"/>
		<br/>작성자<input type="text" name="emp_id"/>
		
		
		<div class="box-footer">
			<button type="submit" class="btn btn-primary">Submit</button>
		</div>
	</form>

</body>
</html>