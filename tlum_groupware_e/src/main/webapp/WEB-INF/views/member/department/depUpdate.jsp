<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
				<form role="form" action="depUpdate" method="POST">
					<input type="text" name="dep_no" value="${department.dep_no}"/>
					<input type="text" name="dep_name" value="${department.dep_name}"/>
						
					
				
				</form>
					<div class="box-footer">
				             <button type="submit" id="modifyBtn" class="btn btn-warning">Modify</button>
				             <button type="submit" id="removeBtn" class="btn btn-danger">REMOVE</button>
				             <button type="submit" id="listBtn" class="btn btn-primary">GO LIST</button>
				   	</div>
			   	</div>
			   		   	<div class="row">
      <div class="col-md-12">

         <!-- <div class="box box-success">
            <div class="box-header">
               <h3 class="box-title">ADD NEW REPLY</h3>
            </div>
            <div class="box-body">
               <label for="exampleInputEmail1">Writer</label>
               <input class="form-control" type="text" placeholder="아이디" id="newReplyWriter"> 
               <label for="exampleInputEmail1">Reply Text</label>
               <input class="form-control" type="text"   placeholder="reply_text" id="newReplyText">

            </div>
            /.box-body
            
            
            <div class="box-footer">
               <button type="button" class="btn btn-primary" id="replyAddBtn">ADD
                  REPLY</button>
            </div>
         </div> -->


         <!-- The time line -->
         <!-- <ul class="timeline">
            timeline time label
            <li class="time-label" id="repliesDiv"><span class="bg-green">
                  Replies List </span></li>
         </ul> -->

         <div class='text-center'>
            <ul id="pagination" class="pagination pagination-sm no-margin ">

            </ul>
         </div>

      </div>
      <!-- /.col -->
   </div>
   <!-- /.row -->
			   	
			   	
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


      $("#modifyBtn").on("click", function() {

  		 formObj.attr("action", "depUpdate");
         formObj.attr("method", "POST");
         formObj.submit();
      });

      $("#removeBtn").on("click", function() {
    	 
         formObj.attr("action", "depDelete");
         formObj.submit();
      });

      $("#listBtn").on("click", function() {
         formObj.attr("method", "get");
         formObj.attr("action", "depList");
         formObj.submit();
      });
	} );

</script>