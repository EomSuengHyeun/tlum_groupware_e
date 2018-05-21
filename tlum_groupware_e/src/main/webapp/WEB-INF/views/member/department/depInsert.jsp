<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html >
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
				<form role="form" action="depInsert" method="POST">
					<input type="text" name="dep_no" value="${department.dep_no}"/>
					<input type="text" name="dep_name" value="${department.dep_name}"/>
						
					
				
					<div class="box-footer">
						<button type="submit" class="btn btn-primary">Submit</button>
					</div>
				</form>
			   	</div>
			   		   	<div class="row">
      <div class="col-md-12">

         

         <div class='text-center'>
            <ul id="pagination" class="pagination pagination-sm no-margin ">

            </ul>
         </div>

      </div>
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
	      
	    </div>
	  </div>
	</div>