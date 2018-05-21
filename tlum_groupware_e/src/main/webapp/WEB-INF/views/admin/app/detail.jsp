<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html >

<style>
		#contentMenu{
			display: none;
		}
		#fastMenu{
			display: none;
		}
		div#reftMenu> div.action > div{
			background: #336600;
			display: block;
		}
		div>ul.nav>li{
			white-space: nowrap;
		}
		div>ul.nav>li>a{
    		font-size: 10px;
		}
		div#boardContent, div#title{
			margin:0 auto;
			width: 90%;
		}
		input[name='free_board_title']{
			margin:0 auto;
			width: 90%;
		}
		div.box-footer{
		text-align: right;
		}
		
	</style>
	<!-- content -->
	<section class="content">
		<div id="reftMenu">
		<ul class="nav nav-tabs nav-justified">
		  <li id="contentNav" role="presentation"><a href="#">메뉴</a></li>
		  <li id="fastNav" role="presentation" class="active"><a href="#">빠른메뉴</a></li>
		</ul>
			<div id="contentMenu">
				서브메뉴 리스트
			</div>
			<div id="fastMenu">
				빠른메뉴 리스트
			</div>
		</div>	
		<div class="aside">


		<hr/>
			<div id="title">
				<input type="hidden" name="emp_id" value="${freeBoard.emp_id }"/>
				<input type="hidden" name="emp_name" value="${freeBoard.emp_name }"/>
				제목&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="free_board_title" value="${freeBoard.free_board_title}"readonly="readonly"/><br/><br/>
				글번호&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="free_board_bno" value="${freeBoard.free_board_bno}" readonly="readonly"/>
				작성자&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="${freeBoard.emp_name }(${freeBoard.emp_id })" readonly="readonly"/>
		
			</div>
		<hr/>
		<div id="boardContent">
			${freeBoard.free_board_content }		
		</div>
		<div class="box-footer">
	             <button type="submit" id="modifyBtn" class="btn btn-warning">수정</button>
	             <button type="submit" id="removeBtn" class="btn btn-danger">삭제</button>
	             <button type="submit" id="listBtn" class="btn btn-primary">리스트로 가기</button>
	   	</div>
   </div>
	</section>
	<!--END content -->
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/smartedit/js/service/HuskyEZCreator.js" charset="utf-8"></script>
<script src="<%=request.getContextPath() %>/resources/bootstrap/js/jquery.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/bootstrap/js/bootstrap.js"></script>
<script src="<%=request.getContextPath() %>/resources/bootstrap/js/jquery-ui.min.js"></script>
	
<script type="text/javascript">

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
	
	
