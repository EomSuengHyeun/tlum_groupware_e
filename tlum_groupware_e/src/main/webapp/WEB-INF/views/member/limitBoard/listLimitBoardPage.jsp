<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page session="false"%>
<html>
<head>
<title>Home</title>
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
</head>
<body>
	<h1>Limit Board</h1>
	<section class="content">
		<div>
			<table class="table table-striped table-hover">
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>내용</th>
					<th>작성일</th>
				</tr>
				<c:forEach items="${limitBoardList}" var="LimitBoardVO">
					<tr>
						<td><a
							href="detail?limit_board_bno=${LimitBoardVO.limit_board_bno}">${LimitBoardVO.limit_board_bno }</a>
						</td>
						<td><a
							href="detail?limit_board_bno=${LimitBoardVO.limit_board_bno}">${LimitBoardVO.limit_board_title }</a>
						</td>
						<td><a
							href="detail?limit_board_bno=${LimitBoardVO.limit_board_bno}">${LimitBoardVO.limit_board_content }</a>
						</td>
						<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
								value="${LimitBoardVO.limit_board_regdate}" /></td>
						<td><a
							href="detail?limit_board_bno=${LimitBoardVO.limit_board_bno}">${LimitBoardVO.emp_name }</a>
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>

		<div class="text-center">
			<ul class="pagination link">

				<c:if test="${pageMaker.prev}">
					<li><a href="${pageMaker.startPage - 1}">&laquo;</a></li>
				</c:if>

				<c:forEach begin="${pageMaker.startPage }"
					end="${pageMaker.endPage }" var="idx">
					<li
						<c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
						<a href="${idx}">${idx}</a>
					</li>
				</c:forEach>

				<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
					<li><a href="${pageMaker.endPage +1}">&raquo;</a></li>
				</c:if>

			</ul>
		</div>



	</section>
	<form id="jobForm">
		<input type='hidden' name="page" value=${pageMaker.cri.page}>
		<input type='hidden' name="perPageNum"
			value=${pageMaker.cri.perPageNum}>
	</form>

	<script
		src="<%=request.getContextPath()%>/resources/bootstrap/js/jquery.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/bootstrap/js/bootstrap.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/bootstrap/js/jquery-ui.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/bootstrap/js/moment.js"></script>
	<script>
		$(".link li a").on(
				"click",
				function(event) {
					event.preventDefault();

					var targetPage = $(this).attr("href");

					var jobForm = $("#jobForm");
					jobForm.find("[name='page']").val(targetPage);
					jobForm.attr("action", "listLimitBoardPage").attr(
							"method", "get");
					jobForm.submit();
				});
		$(function() {
			menuAction();
		});
		$("#reftMenu > ul > li").click(function() {
			$("#reftMenu > ul > li").removeClass("active");
			$(this).addClass("active");
			menuAction();
		});

		function menuAction() {
			if ($("#contentNav").attr("class") == "active") {
				$("#contentMenu").addClass("action");
				$("#fastMenu").removeClass("action");
			} else if ($("#fastNav").attr("class") == "active") {
				$("#contentMenu").removeClass("action");
				$("#fastMenu").addClass("action");
			}
		};
		
		/*검색*/
		$('#searchBtn').on('click',function(){
			self.location="listNoticeSBoardPage"
						   +"${pageMaker.makeQuery(1)}"
						   +"&searchType="
						   +$("select option:selected").val()
						   +"&keyword="
						   +$('#keywordInput').val();
		});
		
	</script>
</body>
</html>

