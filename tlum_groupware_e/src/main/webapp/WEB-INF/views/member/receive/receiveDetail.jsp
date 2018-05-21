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
					<input type="text" name="msg_title" value="${msgReceive.msg_title}"/>
					<input type="text" name="msg_content" value="${msgReceive.msg_content}"/>
						
					보낸사람 :<input type="hidden" name="send_id" value="${msgReceive.send_name }"/>
					<input type="text" name="send_name" value="${msgReceive.send_id }"/><br/>
					<input type="text" name="emp_name" value="${msgReceive.emp_id }"/><br/>
				
				</form>
					<div class="box-footer">
				             
				             <button type="submit" id="removeBtn" class="btn btn-danger">REMOVE</button>
				             <button type="submit" id="listBtn" class="btn btn-primary">GO LIST</button>
				   	</div>
			   	</div>
			   		   	<div class="row">
      
      <!-- /.col -->
   </div>
   <!-- /.row -->
			   	
			   	
	   	</div>



          
	<!-- Modal -->
	<div id="modifyModal" class="modal modal-primary fade" role="dialog">
	  <div class="modal-dialog">
	    <!-- Modal content-->
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	        <h4 class="modal-title"></h4>
	      </div>
	      <div class="modal-body" data-rno>
	        <p><input type="text" id="replytext" class="form-control"></p>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-info" id="replyModBtn">Modify</button>
	        <button type="button" class="btn btn-danger" id="replyDelBtn">DELETE</button>
	        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	      </div>
	    </div>
	  </div>
	</div>  
	</section>