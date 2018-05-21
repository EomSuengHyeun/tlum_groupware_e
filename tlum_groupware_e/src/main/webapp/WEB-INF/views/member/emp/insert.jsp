<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
</head>
<body>
<form role="form" method="post">
		<h1>임직원 등록 샘플</h1>				
			<br/>아이디<input type="text" name="emp_id"/>
			<br/>비밀번호<input type="text" name="emp_password"/>
			<br/>입사일<input id="emp_entry_date" type="text" name="emp_entry_date" />
			<br/>이름<input type="text" name="emp_name"/>
			<br/>주소<input type="text" name="emp_address"  />
			<br/>생일<input id="emp_birthday" type="text" name="emp_birthday"/>
			<br/>이메일<input type="text" name="emp_email"/>
			<br/>폰번호<input type="text" name="emp_phone"/>
			<br/>상태<input type="text" name="emp_current_status" value="1"/>
			<br/>직급<input type="text" name="grade_no" value="1"/>
			<br/>직책<input type="text" name="position_no" value="1"/>
			<br/>부서<input type="text" name="dep_no" value="1"/>
	
		
		<div class="box-footer">
			<button type="submit" class="btn btn-primary">Submit</button>
		</div>
		<!-- //board_view -->

	<!-- //content -->
</form>



<script type="text/javascript"></script> 
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>

$( function() {
  $( "#emp_entry_date" ).datepicker();
  $( "#emp_birthday" ).datepicker();
} );
// 	$('#insertEmployee').submit(function(event){
// 		alert("aasdsa");
// 		event.preventDefault();
// 		var that=$(this);
		
// 		that.get(0).submit();
// 	});

</script>

</body>
</html>