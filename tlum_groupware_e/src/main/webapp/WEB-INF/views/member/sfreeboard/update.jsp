<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<body>
	<style>
.mainLabel {
	width: 200px;
	float: left;
}

.mainfullcalendar {
	width: 500px;
	float: left;
}

#mainCalendar {
	width: 40%;
	float: left;
	padding: 30px 0 15px 30px;
}

#mainTable {
	width: 60%;
	float: left;
	padding: 30px 15px 0 30px;
}

#contentMenu {
	display: none;
}

#fastMenu {
	display: none;
}

div#reftMenu div.action {
	display: block;
}
</style>
	<!-- content -->
	<section class="content">
		<div id="reftMenu">
			<ul class="nav nav-tabs nav-justified">
				<li id="contentNav" role="presentation"><a href="#">메뉴</a></li>
				<li id="fastNav" role="presentation" class="active"><a href="#">빠른메뉴</a></li>
			</ul>
			<div id="contentMenu">서브메뉴 리스트</div>
			<div id="fastMenu">빠른메뉴 리스트</div>
		</div>
		
	
		<div class="aside">
			<div>
				<form role="form" action="update" method="POST">
					<input type="text" name="free_board_bno" value="${freeBoardVO.free_board_bno}"/>
					<input type="text" name="free_board_title" value="${freeBoardVO.free_board_title}"/>
						
					<input type="hidden" name="free_board_content" value="${freeBoardVO.free_board_content }"/><br/>
					<input type="text" name="emp_id" value="${freeBoardVO.emp_id }"/><br/>
					<input type="text" name="emp_name" value="${freeBoardVO.emp_name }"/><br/>
				
				</form>
					<div class="box-footer">
				             <button type="submit" id="modifyBtn" class="btn btn-warning">SAVE</button>
<!-- 				             <button type="submit" id="removeBtn" class="btn btn-danger">REMOVE</button> -->
				             <button type="submit" id="listBtn" class="btn btn-primary">CANCEL</button>
				   	</div>
			   	</div>
		</div>

          
	
   
   	</section>
<script type="text/javascript"></script> 
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="<%=request.getContextPath() %>/resources/bootstrap/js/jquery.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/bootstrap/js/bootstrap.js"></script>
<script src="<%=request.getContextPath() %>/resources/bootstrap/js/jquery-ui.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/bootstrap/js/moment.js"></script>

<script>
	$( function() {
// 	  $("input[name='emp_birthday']").datepicker();
// 	  $("input[name='emp_entry_date']").datepicker();

      var formObj = $("form[role='form']");

//       console.log(formObj);

      $("#modifyBtn").on("click", function() {
         formObj.attr("action", "update");
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
	$("#reftMenu > ul > li").click(function(){
		$("#reftMenu > ul > li").removeClass("active");
		$(this).addClass("active");
		menuAction();
	});
	
	function menuAction(){
		if($("#contentNav").attr("class")=="active"){
			$("#contentMenu").addClass("action");
			$("#fastMenu").removeClass("action");
		}else if($("#fastNav").attr("class")=="active"){
			$("#contentMenu").removeClass("action");
			$("#fastMenu").addClass("action");
		}
	};
	
</script>
</body>
</html>