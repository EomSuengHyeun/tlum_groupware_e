<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
		#newBtn
		.mainLabel{
		    width: 200px;
		    float: left;
		}
		.mainfullcalendar{
			width: 500px;	
		    float: left;
		}
		#mainCalendar{
			width: 40%;
			float:left;
			padding:30px 0 15px 30px;
		}
		#mainTable{
			width: 60%;
			float: left;
			padding:30px 15px 0 30px;
		}
		#contentMenu{
			display: none;
		}
		#fastMenu{
			display: none;
		}
		div#reftMenu div.action{
			display: block;
		}
	</style>


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
		
			<div>
			<!-- 검색 -->
			<div class='box-body'>
					
						
							
						
						
							<select name="searchType">
								<option value="" ${cri.searchType==null?'selected':'' }>
								------</option>
								<option value="t" ${cri.searchType eq 't'?'selected':'' }>
								제목</option>
								<option value="c" ${cri.searchType eq 'c'?'selected':'' }>
								내용</option>
								<option value="e" ${cri.searchType eq 'e'?'selected':'' }>
								작성자</option>
								<option value="tce" ${cri.searchType eq 'tce'?'selected':'' }>
								제목 + 내용 + 작성자</option>
							</select>
							<input id="keywordInput"
								   name="keyword"
								   type="text" />
							<button id="searchBtn" class="btn btn-primary">검 색</button>
						
					
				</div>
				<table class="table table-striped table-hover">
					<tr>
						<th>테이블 번호</th>
						<th>게시글제목</th>
						<th>작성자</th>
					</tr>
					<c:forEach items="${list}" var="free">
						<tr>
							<td>
								<a href="detail?free_board_bno=${free.free_board_bno}">${free.free_board_bno }</a>
							</td>
							<td>
								<a href="detail?free_board_bno=${free.free_board_bno}">${free.free_board_title }</a>
							</td>
							<td>
								<a href="detail?free_board_bno=${free.free_board_bno}">${free.emp_name}</a>
							</td>
						</tr>
					</c:forEach>
				</table>
				<button id='newBtn' class="btn btn-primary" onclick="javascript:location.href='insert';">New Board</button>
			</div>
		</div>
					<div class="text-center">
						<ul class="pagination link">
 
							<c:if test="${pageMaker.prev}">
								<li><a href="${pageMaker.startPage - 1}">&laquo;</a></li>
							</c:if>

							<c:forEach begin="${pageMaker.startPage }"
								end="${pageMaker.endPage }" var="idx">
								<li <c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
									<a href="${idx}">${idx}</a>
<!-- 									<a href="dsads">2131312</a> -->
								</li>
							</c:forEach>

							<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
								<li><a
									href="${pageMaker.endPage +1}">&raquo;</a></li>
							</c:if>

						</ul>
					</div>


				
			</section>
<form id="jobForm">
  <input type='hidden' name="page" value=${pageMaker.cri.page}>
  <input type='hidden' name="perPageNum" value=${pageMaker.cri.perPageNum}>
</form>

<script src="<%=request.getContextPath() %>/resources/bootstrap/js/jquery.min.js"></script>
	<script src="<%=request.getContextPath() %>/resources/bootstrap/js/bootstrap.js"></script>
	<script src="<%=request.getContextPath() %>/resources/bootstrap/js/jquery-ui.min.js"></script>
	<script src="<%=request.getContextPath() %>/resources/bootstrap/js/moment.js"></script>
<script>
	
	
	$(".link li a").on("click", function(event){
		event.preventDefault(); 
		
		var targetPage = $(this).attr("href");
		
		var jobForm = $("#jobForm");
		jobForm.find("[name='page']").val(targetPage);
		jobForm.attr("action","freeBoardList").attr("method", "get");
		jobForm.submit();
	});
	$(function(){
		menuAction();
	});
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
	/*검색*/
	$('#searchBtn').on('click',function(){
		self.location="freeBoardList"
					   +"${pageMaker.makeQuery(1)}"
					   +"&searchType="
					   +$("select option:selected").val()
					   +"&keyword="
					   +$('#keywordInput').val();
	});
	
</script>

