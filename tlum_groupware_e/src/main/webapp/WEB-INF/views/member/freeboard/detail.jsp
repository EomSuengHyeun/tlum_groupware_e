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
	<form role="form" action="update" method="POST">
		<input type="text" name="free_board_bno" value="${freeBoard.free_board_bno}"/>
		<input type="text" name="free_board_title" value="${freeBoard.free_board_title}"/>
			
		<input type="hidden" name="free_board_content" value="${freeBoard.free_board_content }"/><br/>
		<input type="text" name="emp_id" value="${freeBoard.emp_id }"/><br/>
		<input type="text" name="emp_name" value="${freeBoard.emp_name }"/><br/>
	
	</form>
	<div class="box-footer">
             <button type="submit" id="modifyBtn" class="btn btn-warning">Modify</button>
             <button type="submit" id="removeBtn" class="btn btn-danger">REMOVE</button>
             <button type="submit" id="listBtn" class="btn btn-primary">GO LIST</button>
   	</div>
   	
<script type="text/javascript"></script> 
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
	$( function() {
// 	  $("input[name='emp_birthday']").datepicker();
// 	  $("input[name='emp_entry_date']").datepicker();

      var formObj = $("form[role='form']");

      console.log(formObj);

      $("#modifyBtn").on("click", function() {
    	 alert("asdasda");
         formObj.attr("action", "modify");
         formObj.attr("method", "POST");
         formObj.submit();
      });

      $("#removeBtn").on("click", function() {
    	  
    	  var arr=[];
    	  $('.uploadedList li').each(function(event){
    		  arr.push($(this).attr("data-src"));
    		  
    	  });
    	  if(arr.length>0){
    		  $.post('<%=request.getContextPath()%>/deleteAllFiles',{files:arr},function(){});
    	  }
         formObj.attr("action", "delete");
         formObj.submit();
      });

      $("#listBtn").on("click", function() {
         formObj.attr("method", "get");
         formObj.attr("action", "listFreeBoard");
         formObj.submit();
      });
	} );

</script>
</body>
</html>