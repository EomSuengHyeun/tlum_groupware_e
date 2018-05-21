<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<body>
	<style>
.mainLabel {
	width: 200px;
	float: left;
}

.mainfullcalendar {
	width: 100%;
	float: left;
}

.icono-reset {
	width: 25px;
	height: 25px;
	margin-bottom: 5px;
	float: right;
	padding: 0;
	cursor: pointer;
}

#mainCalendar {
	width: 100%;
	float: left;
	padding: 2% 5%;
	display: block;
	position: relative;
}

#mainTable {
	position: relative;
	width: 50%;
	float: right;
	padding: 30px 15px 0 30px;
	display: block;
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

.fc-event, .fc-event:hover {
	cursor: pointer;
	color: #fff;
	text-decoration: none;
}
ul#selectRabelUL {
    list-style: none;
    padding: 0;
    margin-left: 15px;
}
li.RabelList {
    border: 1px solid;
    width: 80%;
    margin-bottom: 10px;
    text-align: center;
}
.rabelColor {
    width: 100%;
    height: 10px;
    margin-bottom: 5px;
}
.rabelName {
    width: 100%;
    height: 20px;
    text-align: center;
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
				<div class="box box-solid float-left-in-main">
					<div class="box-header with-border">
						<h3 class="box-title">일정 관리</h3>
					</div>
					<div class="box-body">
						<!-- /btn-group -->
						<div class="input-group">
							<div class="input-group-btn">
								<!-- <button id="add-new-event" type="button" class="btn btn-primary btn-flat">Add</button> -->
								<a class="btn btn-primary btn-xs" id="insertModalOn">일정추가</a> <br />
								<a class="btn btn-primary btn-xs" id="RabelModalOn">라벨추가</a> <br />
								<a class="btn btn-primary btn-xs" id="refreshRabel">라벨새로고침</a>
							</div>
							<!-- /btn-group -->
						</div>
						<!-- /input-group -->
					</div>
				</div>
				<!-- 아이디 가져와서 라벨리스트를 가져온다. 리스트 하나씩 돌리며 컬러값 빼내서 정리. -->
				<div id="selectRabel">
					<ul id="selectRabelUL">
						<c:forEach items="${rabelList}" var="rabelVO">
							<li class="RabelList" id="${rabelVO.rabel_no}">
								<div class="rabelColor" id="${rabelVO.rabel_color}"
									style="background-color:${rabelVO.rabel_color}"></div> 
								<div class="rabelName" id="${rabelVO.rabel_type}">
									<c:choose>
										<c:when test="${rabelVO.rabel_type=='1'}">
											<p>개인일정</p>
										</c:when>
										<c:when test="${rabelVO.rabel_type=='2'}">
											<p>부서일정</p>
										</c:when>
										<c:when test="${rabelVO.rabel_type=='3'}">
											<p>회사일정</p>
										</c:when>
										<c:otherwise>
											<p>타입에러1</p> 
									</c:otherwise>
								</c:choose>
								</div>
							</li>
						</c:forEach>
					</ul>
				</div>
			</div>
			<div id="fastMenu">빠른메뉴 리스트</div>
		</div>
		<div class="aside">

			<!-- cal -->
			<div id="mainCalendar">
				<i class="icono-reset" id="refreshCal"> ::before ::after </i>
				<div class="mainLabel">
					<!-- /. box -->


				</div>
				<!-- /.col -->
				<div class="mainfullCalendar">
					<div class="box box-primary">
						<div class="box-body no-padding">
							<!-- THE CALENDAR -->
							<div id="calendar"></div>
						</div>
						<!-- /.box-body -->
					</div>
					<!-- /. box -->
				</div>

			</div>

			<!-- cal -->
		</div>
		<!-- Modal -->
		<div id="insertModal" class="modal modal-primary fade" role="dialog">
			<div class="modal-dialog">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title"></h4>
					</div>
					<div class="modal-body" data-rno>
						<p>
							cal_title <input type="text" id="cal_title" class="form-control">
						</p>
						<p>
							cal_content <input type="text" id="cal_content"
								class="form-control">
						</p>
						<p>
							cal_start_time <input type="text" id="cal_start_time"
								class="form-control">
						</p>
						<p>
							cal_end_time <input type="text" id="cal_end_time"
								class="form-control">
						</p>
						<!-- 라벨 바꿔야댐 콤보박스로 사용가능한 라벨만 -->
						<p>
							rabel_no <select id="rabel_no_incal">
							<c:forEach items="${rabelList}" var="rabelVO">
									<c:choose>
									<c:when test="${rabelVO.rabel_type=='1'}">
									<option value="${rabelVO.rabel_no}">${rabelVO.rabel_no}</option>
									</c:when>
									<c:when test="${rabelVO.rabel_type=='2'}">
									<c:if test="${loginUser.grade_no>=3}">
									<option value="${rabelVO.rabel_no}">${rabelVO.rabel_no}</option>
									</c:if>
									</c:when>
									<c:when test="${rabelVO.rabel_type=='3'}">
									<c:if test="${loginUser.grade_no>=4}">
									<option value="${rabelVO.rabel_no}">${rabelVO.rabel_no}</option>
									</c:if>
									</c:when>
								</c:choose>
						</c:forEach>
							</select>
						</p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-info" id="AddCalBtn">WRITE</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">CLOSE</button>
					</div>
				</div>
			</div>
		</div>
		<div id="detailModal" class="modal modal-primary fade" role="dialog">
			<div class="modal-dialog">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title"></h4>
					</div>
					<div class="modal-body" data-rno>
						<p>
							cal_title <input type="text" id="cal_title_read"
								class="form-control" readonly="readonly">
						</p>
						<p>
							cal_content <input type="text" id="cal_content_read"
								class="form-control" readonly="readonly">
						</p>
						<p>
							cal_start_time <input type="text" id="cal_start_time_read"
								class="form-control" readonly="readonly">
						</p>
						<p>
							cal_end_time <input type="text" id="cal_end_time_read"
								class="form-control" readonly="readonly">
						</p>
						<p>
							rabel_no <input type="text" id="rabel_no_read"
								class="form-control" readonly="readonly">
						</p>
						<input type="hidden" id="cal_no_read" class="form-control">
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-info" id="MODIFYBtn">MODIFY</button>
						<button type="button" class="btn btn-warning" id="DELETEBtn">DELETE</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">CLOSE</button>
					</div>
				</div>
			</div>
		</div>
		<div id="modifyModal" class="modal modal-primary fade" role="dialog">
			<div class="modal-dialog">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title"></h4>
					</div>
					<div class="modal-body" data-rno>
						<p>
							cal_title <input type="text" id="cal_title_save"
								class="form-control">
						</p>
						<p>
							cal_content <input type="text" id="cal_content_save"
								class="form-control">
						</p>
						<p>
							cal_start_time <input type="text" id="cal_start_time_save"
								class="form-control">
						</p>
						<p>
							cal_end_time <input type="text" id="cal_end_time_save"
								class="form-control">
						</p>
						<p>
							rabel_no <select id="rabel_no_save">
							<c:forEach items="${rabelList}" var="rabelVO">
									<c:choose>
									<c:when test="${rabelVO.rabel_type=='1'}">
									<option value="${rabelVO.rabel_no}">${rabelVO.rabel_no}</option>
									</c:when>
									<c:when test="${rabelVO.rabel_type=='2'}">
									<c:if test="${loginUser.grade_no>=3}">
									<option value="${rabelVO.rabel_no}">${rabelVO.rabel_no}</option>
									</c:if>
									</c:when>
									<c:when test="${rabelVO.rabel_type=='3'}">
									<c:if test="${loginUser.grade_no>=4}">
									<option value="${rabelVO.rabel_no}">${rabelVO.rabel_no}</option>
									</c:if>
									</c:when>
								</c:choose>
						</c:forEach>
							</select>
						</p>
						<input type="hidden" id="cal_no_save" class="form-control">
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-info" id="SAVEBtn">SAVE</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">CLOSE</button>
					</div>
				</div>
			</div>
		</div>
		<!-- Modal -->
		<div id="rabelModal" class="modal modal-primary fade" role="dialog">
			<div class="modal-dialog">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title"></h4>
					</div>
					<div class="modal-body" data-rno>
						<!-- 콤보박스로 -->
						<p>
							rabel_type <select id="rabel_type">
									<option value="1">1(개인일정)</option>
									<c:if test="${loginUser.grade_no>=3}">
									<option value="2">2(부서일정)</option>
									</c:if>
									<c:if test="${loginUser.grade_no>=4}">
									<option value="3">3(회사일정)</option>
									</c:if>
							</select>
						</p>
						<h3>Pick a Color:</h3>
						<div style="margin: auto; width: 236px;">
							<img style='margin-right: 2px;'
								src='<%=request.getContextPath()%>/resources/images/img/img_colormap.gif'
								usemap='#colormap' alt='colormap' />
							<map id='colormap' name='colormap'>
								<area style='cursor: pointer' shape='poly'
									coords='63,0,72,4,72,15,63,19,54,15,54,4'
									onclick='clickColor("#003366")' alt='#003366' />
								<area style='cursor: pointer' shape='poly'
									coords='81,0,90,4,90,15,81,19,72,15,72,4'
									onclick='clickColor("#336699")' alt='#336699' />
								<area style='cursor: pointer' shape='poly'
									coords='99,0,108,4,108,15,99,19,90,15,90,4'
									onclick='clickColor("#3366CC")' alt='#3366CC' />
								<area style='cursor: pointer' shape='poly'
									coords='117,0,126,4,126,15,117,19,108,15,108,4'
									onclick='clickColor("#003399")' alt='#003399' />
								<area style='cursor: pointer' shape='poly'
									coords='135,0,144,4,144,15,135,19,126,15,126,4'
									onclick='clickColor("#000099")' alt='#000099' />
								<area style='cursor: pointer' shape='poly'
									coords='153,0,162,4,162,15,153,19,144,15,144,4'
									onclick='clickColor("#0000CC")' alt='#0000CC' />
								<area style='cursor: pointer' shape='poly'
									coords='171,0,180,4,180,15,171,19,162,15,162,4'
									onclick='clickColor("#000066")' alt='#000066' />
								<area style='cursor: pointer' shape='poly'
									coords='54,15,63,19,63,30,54,34,45,30,45,19'
									onclick='clickColor("#006666")' alt='#006666' />
								<area style='cursor: pointer' shape='poly'
									coords='72,15,81,19,81,30,72,34,63,30,63,19'
									onclick='clickColor("#006699")' alt='#006699' />
								<area style='cursor: pointer' shape='poly'
									coords='90,15,99,19,99,30,90,34,81,30,81,19'
									onclick='clickColor("#0099CC")' alt='#0099CC' />
								<area style='cursor: pointer' shape='poly'
									coords='108,15,117,19,117,30,108,34,99,30,99,19'
									onclick='clickColor("#0066CC")' alt='#0066CC' />
								<area style='cursor: pointer' shape='poly'
									coords='126,15,135,19,135,30,126,34,117,30,117,19'
									onclick='clickColor("#0033CC")' alt='#0033CC' />
								<area style='cursor: pointer' shape='poly'
									coords='144,15,153,19,153,30,144,34,135,30,135,19'
									onclick='clickColor("#0000FF")' alt='#0000FF' />
								<area style='cursor: pointer' shape='poly'
									coords='162,15,171,19,171,30,162,34,153,30,153,19'
									onclick='clickColor("#3333FF")' alt='#3333FF' />
								<area style='cursor: pointer' shape='poly'
									coords='180,15,189,19,189,30,180,34,171,30,171,19'
									onclick='clickColor("#333399")' alt='#333399' />
								<area style='cursor: pointer' shape='poly'
									coords='45,30,54,34,54,45,45,49,36,45,36,34'
									onclick='clickColor("#669999")' alt='#669999' />
								<area style='cursor: pointer' shape='poly'
									coords='63,30,72,34,72,45,63,49,54,45,54,34'
									onclick='clickColor("#009999")' alt='#009999' />
								<area style='cursor: pointer' shape='poly'
									coords='81,30,90,34,90,45,81,49,72,45,72,34'
									onclick='clickColor("#33CCCC")' alt='#33CCCC' />
								<area style='cursor: pointer' shape='poly'
									coords='99,30,108,34,108,45,99,49,90,45,90,34'
									onclick='clickColor("#00CCFF")' alt='#00CCFF' />
								<area style='cursor: pointer' shape='poly'
									coords='117,30,126,34,126,45,117,49,108,45,108,34'
									onclick='clickColor("#0099FF")' alt='#0099FF' />
								<area style='cursor: pointer' shape='poly'
									coords='135,30,144,34,144,45,135,49,126,45,126,34'
									onclick='clickColor("#0066FF")' alt='#0066FF' />
								<area style='cursor: pointer' shape='poly'
									coords='153,30,162,34,162,45,153,49,144,45,144,34'
									onclick='clickColor("#3366FF")' alt='#3366FF' />
								<area style='cursor: pointer' shape='poly'
									coords='171,30,180,34,180,45,171,49,162,45,162,34'
									onclick='clickColor("#3333CC")' alt='#3333CC' />
								<area style='cursor: pointer' shape='poly'
									coords='189,30,198,34,198,45,189,49,180,45,180,34'
									onclick='clickColor("#666699")' alt='#666699' />
								<area style='cursor: pointer' shape='poly'
									coords='36,45,45,49,45,60,36,64,27,60,27,49'
									onclick='clickColor("#339966")' alt='#339966' />
								<area style='cursor: pointer' shape='poly'
									coords='54,45,63,49,63,60,54,64,45,60,45,49'
									onclick='clickColor("#00CC99")' alt='#00CC99' />
								<area style='cursor: pointer' shape='poly'
									coords='72,45,81,49,81,60,72,64,63,60,63,49'
									onclick='clickColor("#00FFCC")' alt='#00FFCC' />
								<area style='cursor: pointer' shape='poly'
									coords='90,45,99,49,99,60,90,64,81,60,81,49'
									onclick='clickColor("#00FFFF")' alt='#00FFFF' />
								<area style='cursor: pointer' shape='poly'
									coords='108,45,117,49,117,60,108,64,99,60,99,49'
									onclick='clickColor("#33CCFF")' alt='#33CCFF' />
								<area style='cursor: pointer' shape='poly'
									coords='126,45,135,49,135,60,126,64,117,60,117,49'
									onclick='clickColor("#3399FF")' alt='#3399FF' />
								<area style='cursor: pointer' shape='poly'
									coords='144,45,153,49,153,60,144,64,135,60,135,49'
									onclick='clickColor("#6699FF")' alt='#6699FF' />
								<area style='cursor: pointer' shape='poly'
									coords='162,45,171,49,171,60,162,64,153,60,153,49'
									onclick='clickColor("#6666FF")' alt='#6666FF' />
								<area style='cursor: pointer' shape='poly'
									coords='180,45,189,49,189,60,180,64,171,60,171,49'
									onclick='clickColor("#6600FF")' alt='#6600FF' />
								<area style='cursor: pointer' shape='poly'
									coords='198,45,207,49,207,60,198,64,189,60,189,49'
									onclick='clickColor("#6600CC")' alt='#6600CC' />
								<area style='cursor: pointer' shape='poly'
									coords='27,60,36,64,36,75,27,79,18,75,18,64'
									onclick='clickColor("#339933")' alt='#339933' />
								<area style='cursor: pointer' shape='poly'
									coords='45,60,54,64,54,75,45,79,36,75,36,64'
									onclick='clickColor("#00CC66")' alt='#00CC66' />
								<area style='cursor: pointer' shape='poly'
									coords='63,60,72,64,72,75,63,79,54,75,54,64'
									onclick='clickColor("#00FF99")' alt='#00FF99' />
								<area style='cursor: pointer' shape='poly'
									coords='81,60,90,64,90,75,81,79,72,75,72,64'
									onclick='clickColor("#66FFCC")' alt='#66FFCC' />
								<area style='cursor: pointer' shape='poly'
									coords='99,60,108,64,108,75,99,79,90,75,90,64'
									onclick='clickColor("#66FFFF")' alt='#66FFFF' />
								<area style='cursor: pointer' shape='poly'
									coords='117,60,126,64,126,75,117,79,108,75,108,64'
									onclick='clickColor("#66CCFF")' alt='#66CCFF' />
								<area style='cursor: pointer' shape='poly'
									coords='135,60,144,64,144,75,135,79,126,75,126,64'
									onclick='clickColor("#99CCFF")' alt='#99CCFF' />
								<area style='cursor: pointer' shape='poly'
									coords='153,60,162,64,162,75,153,79,144,75,144,64'
									onclick='clickColor("#9999FF")' alt='#9999FF' />
								<area style='cursor: pointer' shape='poly'
									coords='171,60,180,64,180,75,171,79,162,75,162,64'
									onclick='clickColor("#9966FF")' alt='#9966FF' />
								<area style='cursor: pointer' shape='poly'
									coords='189,60,198,64,198,75,189,79,180,75,180,64'
									onclick='clickColor("#9933FF")' alt='#9933FF' />
								<area style='cursor: pointer' shape='poly'
									coords='207,60,216,64,216,75,207,79,198,75,198,64'
									onclick='clickColor("#9900FF")' alt='#9900FF' />
								<area style='cursor: pointer' shape='poly'
									coords='18,75,27,79,27,90,18,94,9,90,9,79'
									onclick='clickColor("#006600")' alt='#006600' />
								<area style='cursor: pointer' shape='poly'
									coords='36,75,45,79,45,90,36,94,27,90,27,79'
									onclick='clickColor("#00CC00")' alt='#00CC00' />
								<area style='cursor: pointer' shape='poly'
									coords='54,75,63,79,63,90,54,94,45,90,45,79'
									onclick='clickColor("#00FF00")' alt='#00FF00' />
								<area style='cursor: pointer' shape='poly'
									coords='72,75,81,79,81,90,72,94,63,90,63,79'
									onclick='clickColor("#66FF99")' alt='#66FF99' />
								<area style='cursor: pointer' shape='poly'
									coords='90,75,99,79,99,90,90,94,81,90,81,79'
									onclick='clickColor("#99FFCC")' alt='#99FFCC' />
								<area style='cursor: pointer' shape='poly'
									coords='108,75,117,79,117,90,108,94,99,90,99,79'
									onclick='clickColor("#CCFFFF")' alt='#CCFFFF' />
								<area style='cursor: pointer' shape='poly'
									coords='126,75,135,79,135,90,126,94,117,90,117,79'
									onclick='clickColor("#CCCCFF")' alt='#CCCCFF' />
								<area style='cursor: pointer' shape='poly'
									coords='144,75,153,79,153,90,144,94,135,90,135,79'
									onclick='clickColor("#CC99FF")' alt='#CC99FF' />
								<area style='cursor: pointer' shape='poly'
									coords='162,75,171,79,171,90,162,94,153,90,153,79'
									onclick='clickColor("#CC66FF")' alt='#CC66FF' />
								<area style='cursor: pointer' shape='poly'
									coords='180,75,189,79,189,90,180,94,171,90,171,79'
									onclick='clickColor("#CC33FF")' alt='#CC33FF' />
								<area style='cursor: pointer' shape='poly'
									coords='198,75,207,79,207,90,198,94,189,90,189,79'
									onclick='clickColor("#CC00FF")' alt='#CC00FF' />
								<area style='cursor: pointer' shape='poly'
									coords='216,75,225,79,225,90,216,94,207,90,207,79'
									onclick='clickColor("#9900CC")' alt='#9900CC' />
								<area style='cursor: pointer' shape='poly'
									coords='9,90,18,94,18,105,9,109,0,105,0,94'
									onclick='clickColor("#003300")' alt='#003300' />
								<area style='cursor: pointer' shape='poly'
									coords='27,90,36,94,36,105,27,109,18,105,18,94'
									onclick='clickColor("#009933")' alt='#009933' />
								<area style='cursor: pointer' shape='poly'
									coords='45,90,54,94,54,105,45,109,36,105,36,94'
									onclick='clickColor("#33CC33")' alt='#33CC33' />
								<area style='cursor: pointer' shape='poly'
									coords='63,90,72,94,72,105,63,109,54,105,54,94'
									onclick='clickColor("#66FF66")' alt='#66FF66' />
								<area style='cursor: pointer' shape='poly'
									coords='81,90,90,94,90,105,81,109,72,105,72,94'
									onclick='clickColor("#99FF99")' alt='#99FF99' />
								<area style='cursor: pointer' shape='poly'
									coords='99,90,108,94,108,105,99,109,90,105,90,94'
									onclick='clickColor("#CCFFCC")' alt='#CCFFCC' />
								<area style='cursor: pointer' shape='poly'
									coords='117,90,126,94,126,105,117,109,108,105,108,94'
									onclick='clickColor("#FFFFFF")' alt='#FFFFFF' />
								<area style='cursor: pointer' shape='poly'
									coords='135,90,144,94,144,105,135,109,126,105,126,94'
									onclick='clickColor("#FFCCFF")' alt='#FFCCFF' />
								<area style='cursor: pointer' shape='poly'
									coords='153,90,162,94,162,105,153,109,144,105,144,94'
									onclick='clickColor("#FF99FF")' alt='#FF99FF' />
								<area style='cursor: pointer' shape='poly'
									coords='171,90,180,94,180,105,171,109,162,105,162,94'
									onclick='clickColor("#FF66FF")' alt='#FF66FF' />
								<area style='cursor: pointer' shape='poly'
									coords='189,90,198,94,198,105,189,109,180,105,180,94'
									onclick='clickColor("#FF00FF")' alt='#FF00FF' />
								<area style='cursor: pointer' shape='poly'
									coords='207,90,216,94,216,105,207,109,198,105,198,94'
									onclick='clickColor("#CC00CC")' alt='#CC00CC' />
								<area style='cursor: pointer' shape='poly'
									coords='225,90,234,94,234,105,225,109,216,105,216,94'
									onclick='clickColor("#660066")' alt='#660066' />
								<area style='cursor: pointer' shape='poly'
									coords='18,105,27,109,27,120,18,124,9,120,9,109'
									onclick='clickColor("#336600")' alt='#336600' />
								<area style='cursor: pointer' shape='poly'
									coords='36,105,45,109,45,120,36,124,27,120,27,109'
									onclick='clickColor("#009900")' alt='#009900' />
								<area style='cursor: pointer' shape='poly'
									coords='54,105,63,109,63,120,54,124,45,120,45,109'
									onclick='clickColor("#66FF33")' alt='#66FF33' />
								<area style='cursor: pointer' shape='poly'
									coords='72,105,81,109,81,120,72,124,63,120,63,109'
									onclick='clickColor("#99FF66")' alt='#99FF66' />
								<area style='cursor: pointer' shape='poly'
									coords='90,105,99,109,99,120,90,124,81,120,81,109'
									onclick='clickColor("#CCFF99")' alt='#CCFF99' />
								<area style='cursor: pointer' shape='poly'
									coords='108,105,117,109,117,120,108,124,99,120,99,109'
									onclick='clickColor("#FFFFCC")' alt='#FFFFCC' />
								<area style='cursor: pointer' shape='poly'
									coords='126,105,135,109,135,120,126,124,117,120,117,109'
									onclick='clickColor("#FFCCCC")' alt='#FFCCCC' />
								<area style='cursor: pointer' shape='poly'
									coords='144,105,153,109,153,120,144,124,135,120,135,109'
									onclick='clickColor("#FF99CC")' alt='#FF99CC' />
								<area style='cursor: pointer' shape='poly'
									coords='162,105,171,109,171,120,162,124,153,120,153,109'
									onclick='clickColor("#FF66CC")' alt='#FF66CC' />
								<area style='cursor: pointer' shape='poly'
									coords='180,105,189,109,189,120,180,124,171,120,171,109'
									onclick='clickColor("#FF33CC")' alt='#FF33CC' />
								<area style='cursor: pointer' shape='poly'
									coords='198,105,207,109,207,120,198,124,189,120,189,109'
									onclick='clickColor("#CC0099")' alt='#CC0099' />
								<area style='cursor: pointer' shape='poly'
									coords='216,105,225,109,225,120,216,124,207,120,207,109'
									onclick='clickColor("#993399")' alt='#993399' />
								<area style='cursor: pointer' shape='poly'
									coords='27,120,36,124,36,135,27,139,18,135,18,124'
									onclick='clickColor("#333300")' alt='#333300' />
								<area style='cursor: pointer' shape='poly'
									coords='45,120,54,124,54,135,45,139,36,135,36,124'
									onclick='clickColor("#669900")' alt='#669900' />
								<area style='cursor: pointer' shape='poly'
									coords='63,120,72,124,72,135,63,139,54,135,54,124'
									onclick='clickColor("#99FF33")' alt='#99FF33' />
								<area style='cursor: pointer' shape='poly'
									coords='81,120,90,124,90,135,81,139,72,135,72,124'
									onclick='clickColor("#CCFF66")' alt='#CCFF66' />
								<area style='cursor: pointer' shape='poly'
									coords='99,120,108,124,108,135,99,139,90,135,90,124'
									onclick='clickColor("#FFFF99")' alt='#FFFF99' />
								<area style='cursor: pointer' shape='poly'
									coords='117,120,126,124,126,135,117,139,108,135,108,124'
									onclick='clickColor("#FFCC99")' alt='#FFCC99' />
								<area style='cursor: pointer' shape='poly'
									coords='135,120,144,124,144,135,135,139,126,135,126,124'
									onclick='clickColor("#FF9999")' alt='#FF9999' />
								<area style='cursor: pointer' shape='poly'
									coords='153,120,162,124,162,135,153,139,144,135,144,124'
									onclick='clickColor("#FF6699")' alt='#FF6699' />
								<area style='cursor: pointer' shape='poly'
									coords='171,120,180,124,180,135,171,139,162,135,162,124'
									onclick='clickColor("#FF3399")' alt='#FF3399' />
								<area style='cursor: pointer' shape='poly'
									coords='189,120,198,124,198,135,189,139,180,135,180,124'
									onclick='clickColor("#CC3399")' alt='#CC3399' />
								<area style='cursor: pointer' shape='poly'
									coords='207,120,216,124,216,135,207,139,198,135,198,124'
									onclick='clickColor("#990099")' alt='#990099' />
								<area style='cursor: pointer' shape='poly'
									coords='36,135,45,139,45,150,36,154,27,150,27,139'
									onclick='clickColor("#666633")' alt='#666633' />
								<area style='cursor: pointer' shape='poly'
									coords='54,135,63,139,63,150,54,154,45,150,45,139'
									onclick='clickColor("#99CC00")' alt='#99CC00' />
								<area style='cursor: pointer' shape='poly'
									coords='72,135,81,139,81,150,72,154,63,150,63,139'
									onclick='clickColor("#CCFF33")' alt='#CCFF33' />
								<area style='cursor: pointer' shape='poly'
									coords='90,135,99,139,99,150,90,154,81,150,81,139'
									onclick='clickColor("#FFFF66")' alt='#FFFF66' />
								<area style='cursor: pointer' shape='poly'
									coords='108,135,117,139,117,150,108,154,99,150,99,139'
									onclick='clickColor("#FFCC66")' alt='#FFCC66' />
								<area style='cursor: pointer' shape='poly'
									coords='126,135,135,139,135,150,126,154,117,150,117,139'
									onclick='clickColor("#FF9966")' alt='#FF9966' />
								<area style='cursor: pointer' shape='poly'
									coords='144,135,153,139,153,150,144,154,135,150,135,139'
									onclick='clickColor("#FF6666")' alt='#FF6666' />
								<area style='cursor: pointer' shape='poly'
									coords='162,135,171,139,171,150,162,154,153,150,153,139'
									onclick='clickColor("#FF0066")' alt='#FF0066' />
								<area style='cursor: pointer' shape='poly'
									coords='180,135,189,139,189,150,180,154,171,150,171,139'
									onclick='clickColor("#CC6699")' alt='#CC6699' />
								<area style='cursor: pointer' shape='poly'
									coords='198,135,207,139,207,150,198,154,189,150,189,139'
									onclick='clickColor("#993366")' alt='#993366' />
								<area style='cursor: pointer' shape='poly'
									coords='45,150,54,154,54,165,45,169,36,165,36,154'
									onclick='clickColor("#999966")' alt='#999966' />
								<area style='cursor: pointer' shape='poly'
									coords='63,150,72,154,72,165,63,169,54,165,54,154'
									onclick='clickColor("#CCCC00")' alt='#CCCC00' />
								<area style='cursor: pointer' shape='poly'
									coords='81,150,90,154,90,165,81,169,72,165,72,154'
									onclick='clickColor("#FFFF00")' alt='#FFFF00' />
								<area style='cursor: pointer' shape='poly'
									coords='99,150,108,154,108,165,99,169,90,165,90,154'
									onclick='clickColor("#FFCC00")' alt='#FFCC00' />
								<area style='cursor: pointer' shape='poly'
									coords='117,150,126,154,126,165,117,169,108,165,108,154'
									onclick='clickColor("#FF9933")' alt='#FF9933' />
								<area style='cursor: pointer' shape='poly'
									coords='135,150,144,154,144,165,135,169,126,165,126,154'
									onclick='clickColor("#FF6600")' alt='#FF6600' />
								<area style='cursor: pointer' shape='poly'
									coords='153,150,162,154,162,165,153,169,144,165,144,154'
									onclick='clickColor("#FF5050")' alt='#FF5050' />
								<area style='cursor: pointer' shape='poly'
									coords='171,150,180,154,180,165,171,169,162,165,162,154'
									onclick='clickColor("#CC0066")' alt='#CC0066' />
								<area style='cursor: pointer' shape='poly'
									coords='189,150,198,154,198,165,189,169,180,165,180,154'
									onclick='clickColor("#660033")' alt='#660033' />
								<area style='cursor: pointer' shape='poly'
									coords='54,165,63,169,63,180,54,184,45,180,45,169'
									onclick='clickColor("#996633")' alt='#996633' />
								<area style='cursor: pointer' shape='poly'
									coords='72,165,81,169,81,180,72,184,63,180,63,169'
									onclick='clickColor("#CC9900")' alt='#CC9900' />
								<area style='cursor: pointer' shape='poly'
									coords='90,165,99,169,99,180,90,184,81,180,81,169'
									onclick='clickColor("#FF9900")' alt='#FF9900' />
								<area style='cursor: pointer' shape='poly'
									coords='108,165,117,169,117,180,108,184,99,180,99,169'
									onclick='clickColor("#CC6600")' alt='#CC6600' />
								<area style='cursor: pointer' shape='poly'
									coords='126,165,135,169,135,180,126,184,117,180,117,169'
									onclick='clickColor("#FF3300")' alt='#FF3300' />
								<area style='cursor: pointer' shape='poly'
									coords='144,165,153,169,153,180,144,184,135,180,135,169'
									onclick='clickColor("#FF0000")' alt='#FF0000' />
								<area style='cursor: pointer' shape='poly'
									coords='162,165,171,169,171,180,162,184,153,180,153,169'
									onclick='clickColor("#CC0000")' alt='#CC0000' />
								<area style='cursor: pointer' shape='poly'
									coords='180,165,189,169,189,180,180,184,171,180,171,169'
									onclick='clickColor("#990033")' alt='#990033' />
								<area style='cursor: pointer' shape='poly'
									coords='63,180,72,184,72,195,63,199,54,195,54,184'
									onclick='clickColor("#663300")' alt='#663300' />
								<area style='cursor: pointer' shape='poly'
									coords='81,180,90,184,90,195,81,199,72,195,72,184'
									onclick='clickColor("#996600")' alt='#996600' />
								<area style='cursor: pointer' shape='poly'
									coords='99,180,108,184,108,195,99,199,90,195,90,184'
									onclick='clickColor("#CC3300")' alt='#CC3300' />
								<area style='cursor: pointer' shape='poly'
									coords='117,180,126,184,126,195,117,199,108,195,108,184'
									onclick='clickColor("#993300")' alt='#993300' />
								<area style='cursor: pointer' shape='poly'
									coords='135,180,144,184,144,195,135,199,126,195,126,184'
									onclick='clickColor("#990000")' alt='#990000' />
								<area style='cursor: pointer' shape='poly'
									coords='153,180,162,184,162,195,153,199,144,195,144,184'
									onclick='clickColor("#800000")' alt='#800000' />
								<area style='cursor: pointer' shape='poly'
									coords='171,180,180,184,180,195,171,199,162,195,162,184'
									onclick='clickColor("#993333")' alt='#993333' />
							</map>
							<script>
						var thistop = "-35";
						var thisleft = "135";
						</script>
							<p>
								rabel_color <input type="text" id="rabel_color"
									class="form-control">
							</p>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-info" id="AddRabelBtn">ADD</button>
							<button type="button" class="btn btn-default"
								data-dismiss="modal">CLOSE</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div id="rabelDetailModal" class="modal modal-primary fade" role="dialog">
			<div class="modal-dialog">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title"></h4>
					</div>
					<div class="modal-body" data-rno>
						<!-- 콤보박스로 -->
						<p>
							rabel_type <input type="text" id="rabel_type_rabel_detail"
									class="form-control" readonly="readonly">
						</p>
						<h3>Pick a Color:</h3>
						<div style="margin: auto; width: 236px;">
							<img style='margin-right: 2px;'
								src='<%=request.getContextPath()%>/resources/images/img/img_colormap.gif'
								usemap='#colormap' alt='colormap' />
							<map id='colormap' name='colormap'>
								<area style='cursor: pointer' shape='poly'
									coords='63,0,72,4,72,15,63,19,54,15,54,4'
									onclick='clickColor("#003366")' alt='#003366' />
								<area style='cursor: pointer' shape='poly'
									coords='81,0,90,4,90,15,81,19,72,15,72,4'
									onclick='clickColor("#336699")' alt='#336699' />
								<area style='cursor: pointer' shape='poly'
									coords='99,0,108,4,108,15,99,19,90,15,90,4'
									onclick='clickColor("#3366CC")' alt='#3366CC' />
								<area style='cursor: pointer' shape='poly'
									coords='117,0,126,4,126,15,117,19,108,15,108,4'
									onclick='clickColor("#003399")' alt='#003399' />
								<area style='cursor: pointer' shape='poly'
									coords='135,0,144,4,144,15,135,19,126,15,126,4'
									onclick='clickColor("#000099")' alt='#000099' />
								<area style='cursor: pointer' shape='poly'
									coords='153,0,162,4,162,15,153,19,144,15,144,4'
									onclick='clickColor("#0000CC")' alt='#0000CC' />
								<area style='cursor: pointer' shape='poly'
									coords='171,0,180,4,180,15,171,19,162,15,162,4'
									onclick='clickColor("#000066")' alt='#000066' />
								<area style='cursor: pointer' shape='poly'
									coords='54,15,63,19,63,30,54,34,45,30,45,19'
									onclick='clickColor("#006666")' alt='#006666' />
								<area style='cursor: pointer' shape='poly'
									coords='72,15,81,19,81,30,72,34,63,30,63,19'
									onclick='clickColor("#006699")' alt='#006699' />
								<area style='cursor: pointer' shape='poly'
									coords='90,15,99,19,99,30,90,34,81,30,81,19'
									onclick='clickColor("#0099CC")' alt='#0099CC' />
								<area style='cursor: pointer' shape='poly'
									coords='108,15,117,19,117,30,108,34,99,30,99,19'
									onclick='clickColor("#0066CC")' alt='#0066CC' />
								<area style='cursor: pointer' shape='poly'
									coords='126,15,135,19,135,30,126,34,117,30,117,19'
									onclick='clickColor("#0033CC")' alt='#0033CC' />
								<area style='cursor: pointer' shape='poly'
									coords='144,15,153,19,153,30,144,34,135,30,135,19'
									onclick='clickColor("#0000FF")' alt='#0000FF' />
								<area style='cursor: pointer' shape='poly'
									coords='162,15,171,19,171,30,162,34,153,30,153,19'
									onclick='clickColor("#3333FF")' alt='#3333FF' />
								<area style='cursor: pointer' shape='poly'
									coords='180,15,189,19,189,30,180,34,171,30,171,19'
									onclick='clickColor("#333399")' alt='#333399' />
								<area style='cursor: pointer' shape='poly'
									coords='45,30,54,34,54,45,45,49,36,45,36,34'
									onclick='clickColor("#669999")' alt='#669999' />
								<area style='cursor: pointer' shape='poly'
									coords='63,30,72,34,72,45,63,49,54,45,54,34'
									onclick='clickColor("#009999")' alt='#009999' />
								<area style='cursor: pointer' shape='poly'
									coords='81,30,90,34,90,45,81,49,72,45,72,34'
									onclick='clickColor("#33CCCC")' alt='#33CCCC' />
								<area style='cursor: pointer' shape='poly'
									coords='99,30,108,34,108,45,99,49,90,45,90,34'
									onclick='clickColor("#00CCFF")' alt='#00CCFF' />
								<area style='cursor: pointer' shape='poly'
									coords='117,30,126,34,126,45,117,49,108,45,108,34'
									onclick='clickColor("#0099FF")' alt='#0099FF' />
								<area style='cursor: pointer' shape='poly'
									coords='135,30,144,34,144,45,135,49,126,45,126,34'
									onclick='clickColor("#0066FF")' alt='#0066FF' />
								<area style='cursor: pointer' shape='poly'
									coords='153,30,162,34,162,45,153,49,144,45,144,34'
									onclick='clickColor("#3366FF")' alt='#3366FF' />
								<area style='cursor: pointer' shape='poly'
									coords='171,30,180,34,180,45,171,49,162,45,162,34'
									onclick='clickColor("#3333CC")' alt='#3333CC' />
								<area style='cursor: pointer' shape='poly'
									coords='189,30,198,34,198,45,189,49,180,45,180,34'
									onclick='clickColor("#666699")' alt='#666699' />
								<area style='cursor: pointer' shape='poly'
									coords='36,45,45,49,45,60,36,64,27,60,27,49'
									onclick='clickColor("#339966")' alt='#339966' />
								<area style='cursor: pointer' shape='poly'
									coords='54,45,63,49,63,60,54,64,45,60,45,49'
									onclick='clickColor("#00CC99")' alt='#00CC99' />
								<area style='cursor: pointer' shape='poly'
									coords='72,45,81,49,81,60,72,64,63,60,63,49'
									onclick='clickColor("#00FFCC")' alt='#00FFCC' />
								<area style='cursor: pointer' shape='poly'
									coords='90,45,99,49,99,60,90,64,81,60,81,49'
									onclick='clickColor("#00FFFF")' alt='#00FFFF' />
								<area style='cursor: pointer' shape='poly'
									coords='108,45,117,49,117,60,108,64,99,60,99,49'
									onclick='clickColor("#33CCFF")' alt='#33CCFF' />
								<area style='cursor: pointer' shape='poly'
									coords='126,45,135,49,135,60,126,64,117,60,117,49'
									onclick='clickColor("#3399FF")' alt='#3399FF' />
								<area style='cursor: pointer' shape='poly'
									coords='144,45,153,49,153,60,144,64,135,60,135,49'
									onclick='clickColor("#6699FF")' alt='#6699FF' />
								<area style='cursor: pointer' shape='poly'
									coords='162,45,171,49,171,60,162,64,153,60,153,49'
									onclick='clickColor("#6666FF")' alt='#6666FF' />
								<area style='cursor: pointer' shape='poly'
									coords='180,45,189,49,189,60,180,64,171,60,171,49'
									onclick='clickColor("#6600FF")' alt='#6600FF' />
								<area style='cursor: pointer' shape='poly'
									coords='198,45,207,49,207,60,198,64,189,60,189,49'
									onclick='clickColor("#6600CC")' alt='#6600CC' />
								<area style='cursor: pointer' shape='poly'
									coords='27,60,36,64,36,75,27,79,18,75,18,64'
									onclick='clickColor("#339933")' alt='#339933' />
								<area style='cursor: pointer' shape='poly'
									coords='45,60,54,64,54,75,45,79,36,75,36,64'
									onclick='clickColor("#00CC66")' alt='#00CC66' />
								<area style='cursor: pointer' shape='poly'
									coords='63,60,72,64,72,75,63,79,54,75,54,64'
									onclick='clickColor("#00FF99")' alt='#00FF99' />
								<area style='cursor: pointer' shape='poly'
									coords='81,60,90,64,90,75,81,79,72,75,72,64'
									onclick='clickColor("#66FFCC")' alt='#66FFCC' />
								<area style='cursor: pointer' shape='poly'
									coords='99,60,108,64,108,75,99,79,90,75,90,64'
									onclick='clickColor("#66FFFF")' alt='#66FFFF' />
								<area style='cursor: pointer' shape='poly'
									coords='117,60,126,64,126,75,117,79,108,75,108,64'
									onclick='clickColor("#66CCFF")' alt='#66CCFF' />
								<area style='cursor: pointer' shape='poly'
									coords='135,60,144,64,144,75,135,79,126,75,126,64'
									onclick='clickColor("#99CCFF")' alt='#99CCFF' />
								<area style='cursor: pointer' shape='poly'
									coords='153,60,162,64,162,75,153,79,144,75,144,64'
									onclick='clickColor("#9999FF")' alt='#9999FF' />
								<area style='cursor: pointer' shape='poly'
									coords='171,60,180,64,180,75,171,79,162,75,162,64'
									onclick='clickColor("#9966FF")' alt='#9966FF' />
								<area style='cursor: pointer' shape='poly'
									coords='189,60,198,64,198,75,189,79,180,75,180,64'
									onclick='clickColor("#9933FF")' alt='#9933FF' />
								<area style='cursor: pointer' shape='poly'
									coords='207,60,216,64,216,75,207,79,198,75,198,64'
									onclick='clickColor("#9900FF")' alt='#9900FF' />
								<area style='cursor: pointer' shape='poly'
									coords='18,75,27,79,27,90,18,94,9,90,9,79'
									onclick='clickColor("#006600")' alt='#006600' />
								<area style='cursor: pointer' shape='poly'
									coords='36,75,45,79,45,90,36,94,27,90,27,79'
									onclick='clickColor("#00CC00")' alt='#00CC00' />
								<area style='cursor: pointer' shape='poly'
									coords='54,75,63,79,63,90,54,94,45,90,45,79'
									onclick='clickColor("#00FF00")' alt='#00FF00' />
								<area style='cursor: pointer' shape='poly'
									coords='72,75,81,79,81,90,72,94,63,90,63,79'
									onclick='clickColor("#66FF99")' alt='#66FF99' />
								<area style='cursor: pointer' shape='poly'
									coords='90,75,99,79,99,90,90,94,81,90,81,79'
									onclick='clickColor("#99FFCC")' alt='#99FFCC' />
								<area style='cursor: pointer' shape='poly'
									coords='108,75,117,79,117,90,108,94,99,90,99,79'
									onclick='clickColor("#CCFFFF")' alt='#CCFFFF' />
								<area style='cursor: pointer' shape='poly'
									coords='126,75,135,79,135,90,126,94,117,90,117,79'
									onclick='clickColor("#CCCCFF")' alt='#CCCCFF' />
								<area style='cursor: pointer' shape='poly'
									coords='144,75,153,79,153,90,144,94,135,90,135,79'
									onclick='clickColor("#CC99FF")' alt='#CC99FF' />
								<area style='cursor: pointer' shape='poly'
									coords='162,75,171,79,171,90,162,94,153,90,153,79'
									onclick='clickColor("#CC66FF")' alt='#CC66FF' />
								<area style='cursor: pointer' shape='poly'
									coords='180,75,189,79,189,90,180,94,171,90,171,79'
									onclick='clickColor("#CC33FF")' alt='#CC33FF' />
								<area style='cursor: pointer' shape='poly'
									coords='198,75,207,79,207,90,198,94,189,90,189,79'
									onclick='clickColor("#CC00FF")' alt='#CC00FF' />
								<area style='cursor: pointer' shape='poly'
									coords='216,75,225,79,225,90,216,94,207,90,207,79'
									onclick='clickColor("#9900CC")' alt='#9900CC' />
								<area style='cursor: pointer' shape='poly'
									coords='9,90,18,94,18,105,9,109,0,105,0,94'
									onclick='clickColor("#003300")' alt='#003300' />
								<area style='cursor: pointer' shape='poly'
									coords='27,90,36,94,36,105,27,109,18,105,18,94'
									onclick='clickColor("#009933")' alt='#009933' />
								<area style='cursor: pointer' shape='poly'
									coords='45,90,54,94,54,105,45,109,36,105,36,94'
									onclick='clickColor("#33CC33")' alt='#33CC33' />
								<area style='cursor: pointer' shape='poly'
									coords='63,90,72,94,72,105,63,109,54,105,54,94'
									onclick='clickColor("#66FF66")' alt='#66FF66' />
								<area style='cursor: pointer' shape='poly'
									coords='81,90,90,94,90,105,81,109,72,105,72,94'
									onclick='clickColor("#99FF99")' alt='#99FF99' />
								<area style='cursor: pointer' shape='poly'
									coords='99,90,108,94,108,105,99,109,90,105,90,94'
									onclick='clickColor("#CCFFCC")' alt='#CCFFCC' />
								<area style='cursor: pointer' shape='poly'
									coords='117,90,126,94,126,105,117,109,108,105,108,94'
									onclick='clickColor("#FFFFFF")' alt='#FFFFFF' />
								<area style='cursor: pointer' shape='poly'
									coords='135,90,144,94,144,105,135,109,126,105,126,94'
									onclick='clickColor("#FFCCFF")' alt='#FFCCFF' />
								<area style='cursor: pointer' shape='poly'
									coords='153,90,162,94,162,105,153,109,144,105,144,94'
									onclick='clickColor("#FF99FF")' alt='#FF99FF' />
								<area style='cursor: pointer' shape='poly'
									coords='171,90,180,94,180,105,171,109,162,105,162,94'
									onclick='clickColor("#FF66FF")' alt='#FF66FF' />
								<area style='cursor: pointer' shape='poly'
									coords='189,90,198,94,198,105,189,109,180,105,180,94'
									onclick='clickColor("#FF00FF")' alt='#FF00FF' />
								<area style='cursor: pointer' shape='poly'
									coords='207,90,216,94,216,105,207,109,198,105,198,94'
									onclick='clickColor("#CC00CC")' alt='#CC00CC' />
								<area style='cursor: pointer' shape='poly'
									coords='225,90,234,94,234,105,225,109,216,105,216,94'
									onclick='clickColor("#660066")' alt='#660066' />
								<area style='cursor: pointer' shape='poly'
									coords='18,105,27,109,27,120,18,124,9,120,9,109'
									onclick='clickColor("#336600")' alt='#336600' />
								<area style='cursor: pointer' shape='poly'
									coords='36,105,45,109,45,120,36,124,27,120,27,109'
									onclick='clickColor("#009900")' alt='#009900' />
								<area style='cursor: pointer' shape='poly'
									coords='54,105,63,109,63,120,54,124,45,120,45,109'
									onclick='clickColor("#66FF33")' alt='#66FF33' />
								<area style='cursor: pointer' shape='poly'
									coords='72,105,81,109,81,120,72,124,63,120,63,109'
									onclick='clickColor("#99FF66")' alt='#99FF66' />
								<area style='cursor: pointer' shape='poly'
									coords='90,105,99,109,99,120,90,124,81,120,81,109'
									onclick='clickColor("#CCFF99")' alt='#CCFF99' />
								<area style='cursor: pointer' shape='poly'
									coords='108,105,117,109,117,120,108,124,99,120,99,109'
									onclick='clickColor("#FFFFCC")' alt='#FFFFCC' />
								<area style='cursor: pointer' shape='poly'
									coords='126,105,135,109,135,120,126,124,117,120,117,109'
									onclick='clickColor("#FFCCCC")' alt='#FFCCCC' />
								<area style='cursor: pointer' shape='poly'
									coords='144,105,153,109,153,120,144,124,135,120,135,109'
									onclick='clickColor("#FF99CC")' alt='#FF99CC' />
								<area style='cursor: pointer' shape='poly'
									coords='162,105,171,109,171,120,162,124,153,120,153,109'
									onclick='clickColor("#FF66CC")' alt='#FF66CC' />
								<area style='cursor: pointer' shape='poly'
									coords='180,105,189,109,189,120,180,124,171,120,171,109'
									onclick='clickColor("#FF33CC")' alt='#FF33CC' />
								<area style='cursor: pointer' shape='poly'
									coords='198,105,207,109,207,120,198,124,189,120,189,109'
									onclick='clickColor("#CC0099")' alt='#CC0099' />
								<area style='cursor: pointer' shape='poly'
									coords='216,105,225,109,225,120,216,124,207,120,207,109'
									onclick='clickColor("#993399")' alt='#993399' />
								<area style='cursor: pointer' shape='poly'
									coords='27,120,36,124,36,135,27,139,18,135,18,124'
									onclick='clickColor("#333300")' alt='#333300' />
								<area style='cursor: pointer' shape='poly'
									coords='45,120,54,124,54,135,45,139,36,135,36,124'
									onclick='clickColor("#669900")' alt='#669900' />
								<area style='cursor: pointer' shape='poly'
									coords='63,120,72,124,72,135,63,139,54,135,54,124'
									onclick='clickColor("#99FF33")' alt='#99FF33' />
								<area style='cursor: pointer' shape='poly'
									coords='81,120,90,124,90,135,81,139,72,135,72,124'
									onclick='clickColor("#CCFF66")' alt='#CCFF66' />
								<area style='cursor: pointer' shape='poly'
									coords='99,120,108,124,108,135,99,139,90,135,90,124'
									onclick='clickColor("#FFFF99")' alt='#FFFF99' />
								<area style='cursor: pointer' shape='poly'
									coords='117,120,126,124,126,135,117,139,108,135,108,124'
									onclick='clickColor("#FFCC99")' alt='#FFCC99' />
								<area style='cursor: pointer' shape='poly'
									coords='135,120,144,124,144,135,135,139,126,135,126,124'
									onclick='clickColor("#FF9999")' alt='#FF9999' />
								<area style='cursor: pointer' shape='poly'
									coords='153,120,162,124,162,135,153,139,144,135,144,124'
									onclick='clickColor("#FF6699")' alt='#FF6699' />
								<area style='cursor: pointer' shape='poly'
									coords='171,120,180,124,180,135,171,139,162,135,162,124'
									onclick='clickColor("#FF3399")' alt='#FF3399' />
								<area style='cursor: pointer' shape='poly'
									coords='189,120,198,124,198,135,189,139,180,135,180,124'
									onclick='clickColor("#CC3399")' alt='#CC3399' />
								<area style='cursor: pointer' shape='poly'
									coords='207,120,216,124,216,135,207,139,198,135,198,124'
									onclick='clickColor("#990099")' alt='#990099' />
								<area style='cursor: pointer' shape='poly'
									coords='36,135,45,139,45,150,36,154,27,150,27,139'
									onclick='clickColor("#666633")' alt='#666633' />
								<area style='cursor: pointer' shape='poly'
									coords='54,135,63,139,63,150,54,154,45,150,45,139'
									onclick='clickColor("#99CC00")' alt='#99CC00' />
								<area style='cursor: pointer' shape='poly'
									coords='72,135,81,139,81,150,72,154,63,150,63,139'
									onclick='clickColor("#CCFF33")' alt='#CCFF33' />
								<area style='cursor: pointer' shape='poly'
									coords='90,135,99,139,99,150,90,154,81,150,81,139'
									onclick='clickColor("#FFFF66")' alt='#FFFF66' />
								<area style='cursor: pointer' shape='poly'
									coords='108,135,117,139,117,150,108,154,99,150,99,139'
									onclick='clickColor("#FFCC66")' alt='#FFCC66' />
								<area style='cursor: pointer' shape='poly'
									coords='126,135,135,139,135,150,126,154,117,150,117,139'
									onclick='clickColor("#FF9966")' alt='#FF9966' />
								<area style='cursor: pointer' shape='poly'
									coords='144,135,153,139,153,150,144,154,135,150,135,139'
									onclick='clickColor("#FF6666")' alt='#FF6666' />
								<area style='cursor: pointer' shape='poly'
									coords='162,135,171,139,171,150,162,154,153,150,153,139'
									onclick='clickColor("#FF0066")' alt='#FF0066' />
								<area style='cursor: pointer' shape='poly'
									coords='180,135,189,139,189,150,180,154,171,150,171,139'
									onclick='clickColor("#CC6699")' alt='#CC6699' />
								<area style='cursor: pointer' shape='poly'
									coords='198,135,207,139,207,150,198,154,189,150,189,139'
									onclick='clickColor("#993366")' alt='#993366' />
								<area style='cursor: pointer' shape='poly'
									coords='45,150,54,154,54,165,45,169,36,165,36,154'
									onclick='clickColor("#999966")' alt='#999966' />
								<area style='cursor: pointer' shape='poly'
									coords='63,150,72,154,72,165,63,169,54,165,54,154'
									onclick='clickColor("#CCCC00")' alt='#CCCC00' />
								<area style='cursor: pointer' shape='poly'
									coords='81,150,90,154,90,165,81,169,72,165,72,154'
									onclick='clickColor("#FFFF00")' alt='#FFFF00' />
								<area style='cursor: pointer' shape='poly'
									coords='99,150,108,154,108,165,99,169,90,165,90,154'
									onclick='clickColor("#FFCC00")' alt='#FFCC00' />
								<area style='cursor: pointer' shape='poly'
									coords='117,150,126,154,126,165,117,169,108,165,108,154'
									onclick='clickColor("#FF9933")' alt='#FF9933' />
								<area style='cursor: pointer' shape='poly'
									coords='135,150,144,154,144,165,135,169,126,165,126,154'
									onclick='clickColor("#FF6600")' alt='#FF6600' />
								<area style='cursor: pointer' shape='poly'
									coords='153,150,162,154,162,165,153,169,144,165,144,154'
									onclick='clickColor("#FF5050")' alt='#FF5050' />
								<area style='cursor: pointer' shape='poly'
									coords='171,150,180,154,180,165,171,169,162,165,162,154'
									onclick='clickColor("#CC0066")' alt='#CC0066' />
								<area style='cursor: pointer' shape='poly'
									coords='189,150,198,154,198,165,189,169,180,165,180,154'
									onclick='clickColor("#660033")' alt='#660033' />
								<area style='cursor: pointer' shape='poly'
									coords='54,165,63,169,63,180,54,184,45,180,45,169'
									onclick='clickColor("#996633")' alt='#996633' />
								<area style='cursor: pointer' shape='poly'
									coords='72,165,81,169,81,180,72,184,63,180,63,169'
									onclick='clickColor("#CC9900")' alt='#CC9900' />
								<area style='cursor: pointer' shape='poly'
									coords='90,165,99,169,99,180,90,184,81,180,81,169'
									onclick='clickColor("#FF9900")' alt='#FF9900' />
								<area style='cursor: pointer' shape='poly'
									coords='108,165,117,169,117,180,108,184,99,180,99,169'
									onclick='clickColor("#CC6600")' alt='#CC6600' />
								<area style='cursor: pointer' shape='poly'
									coords='126,165,135,169,135,180,126,184,117,180,117,169'
									onclick='clickColor("#FF3300")' alt='#FF3300' />
								<area style='cursor: pointer' shape='poly'
									coords='144,165,153,169,153,180,144,184,135,180,135,169'
									onclick='clickColor("#FF0000")' alt='#FF0000' />
								<area style='cursor: pointer' shape='poly'
									coords='162,165,171,169,171,180,162,184,153,180,153,169'
									onclick='clickColor("#CC0000")' alt='#CC0000' />
								<area style='cursor: pointer' shape='poly'
									coords='180,165,189,169,189,180,180,184,171,180,171,169'
									onclick='clickColor("#990033")' alt='#990033' />
								<area style='cursor: pointer' shape='poly'
									coords='63,180,72,184,72,195,63,199,54,195,54,184'
									onclick='clickColor("#663300")' alt='#663300' />
								<area style='cursor: pointer' shape='poly'
									coords='81,180,90,184,90,195,81,199,72,195,72,184'
									onclick='clickColor("#996600")' alt='#996600' />
								<area style='cursor: pointer' shape='poly'
									coords='99,180,108,184,108,195,99,199,90,195,90,184'
									onclick='clickColor("#CC3300")' alt='#CC3300' />
								<area style='cursor: pointer' shape='poly'
									coords='117,180,126,184,126,195,117,199,108,195,108,184'
									onclick='clickColor("#993300")' alt='#993300' />
								<area style='cursor: pointer' shape='poly'
									coords='135,180,144,184,144,195,135,199,126,195,126,184'
									onclick='clickColor("#990000")' alt='#990000' />
								<area style='cursor: pointer' shape='poly'
									coords='153,180,162,184,162,195,153,199,144,195,144,184'
									onclick='clickColor("#800000")' alt='#800000' />
								<area style='cursor: pointer' shape='poly'
									coords='171,180,180,184,180,195,171,199,162,195,162,184'
									onclick='clickColor("#993333")' alt='#993333' />
							</map>
							<script>
						var thistop = "-35";
						var thisleft = "135";
						</script>
							<p>
								rabel_color <input type="text" id="rabel_color_rabel_detail"
									class="form-control" readonly="readonly">
							</p>
							<input type="hidden" id="rabel_no_rabel_detail"
									class="form-control">
						</div>
						<div class="modal-footer">
							<!-- 모디파이랑 딜리트버튼 누르면 스크립트로 에이작스넘겨서 권한이있으면 바꿀수있고 없으면 수정 삭제 불가로 하기 -->
							<button type="button" class="btn btn-info" id="modifyRabelBtn">MODIFY</button>
							<button type="button" class="btn btn-info" id="deleteRabelBtn">DELETE</button>
							<button type="button" class="btn btn-default"
								data-dismiss="modal">CLOSE</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div id="rabelModifyModal" class="modal modal-primary fade" role="dialog">
			<div class="modal-dialog">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title"></h4>
					</div>
					<div class="modal-body" data-rno>
						<!-- 콤보박스로 -->
						<p>
							rabel_type <select id="rabel_type_rabel_modify">
									<option value="1">1(개인일정)</option>
									<c:if test="${loginUser.grade_no>=3}">
									<option value="2">2(부서일정)</option>
									</c:if>
									<c:if test="${loginUser.grade_no>=4}">
									<option value="3">3(회사일정)</option>
									</c:if>
							</select>
						</p>
						<h3>Pick a Color:</h3>
						<div style="margin: auto; width: 236px;">
							<img style='margin-right: 2px;'
								src='<%=request.getContextPath()%>/resources/images/img/img_colormap.gif'
								usemap='#colormap' alt='colormap' />
							<map id='colormap' name='colormap'>
								<area style='cursor: pointer' shape='poly'
									coords='63,0,72,4,72,15,63,19,54,15,54,4'
									onclick='clickColor("#003366")' alt='#003366' />
								<area style='cursor: pointer' shape='poly'
									coords='81,0,90,4,90,15,81,19,72,15,72,4'
									onclick='clickColor("#336699")' alt='#336699' />
								<area style='cursor: pointer' shape='poly'
									coords='99,0,108,4,108,15,99,19,90,15,90,4'
									onclick='clickColor("#3366CC")' alt='#3366CC' />
								<area style='cursor: pointer' shape='poly'
									coords='117,0,126,4,126,15,117,19,108,15,108,4'
									onclick='clickColor("#003399")' alt='#003399' />
								<area style='cursor: pointer' shape='poly'
									coords='135,0,144,4,144,15,135,19,126,15,126,4'
									onclick='clickColor("#000099")' alt='#000099' />
								<area style='cursor: pointer' shape='poly'
									coords='153,0,162,4,162,15,153,19,144,15,144,4'
									onclick='clickColor("#0000CC")' alt='#0000CC' />
								<area style='cursor: pointer' shape='poly'
									coords='171,0,180,4,180,15,171,19,162,15,162,4'
									onclick='clickColor("#000066")' alt='#000066' />
								<area style='cursor: pointer' shape='poly'
									coords='54,15,63,19,63,30,54,34,45,30,45,19'
									onclick='clickColor("#006666")' alt='#006666' />
								<area style='cursor: pointer' shape='poly'
									coords='72,15,81,19,81,30,72,34,63,30,63,19'
									onclick='clickColor("#006699")' alt='#006699' />
								<area style='cursor: pointer' shape='poly'
									coords='90,15,99,19,99,30,90,34,81,30,81,19'
									onclick='clickColor("#0099CC")' alt='#0099CC' />
								<area style='cursor: pointer' shape='poly'
									coords='108,15,117,19,117,30,108,34,99,30,99,19'
									onclick='clickColor("#0066CC")' alt='#0066CC' />
								<area style='cursor: pointer' shape='poly'
									coords='126,15,135,19,135,30,126,34,117,30,117,19'
									onclick='clickColor("#0033CC")' alt='#0033CC' />
								<area style='cursor: pointer' shape='poly'
									coords='144,15,153,19,153,30,144,34,135,30,135,19'
									onclick='clickColor("#0000FF")' alt='#0000FF' />
								<area style='cursor: pointer' shape='poly'
									coords='162,15,171,19,171,30,162,34,153,30,153,19'
									onclick='clickColor("#3333FF")' alt='#3333FF' />
								<area style='cursor: pointer' shape='poly'
									coords='180,15,189,19,189,30,180,34,171,30,171,19'
									onclick='clickColor("#333399")' alt='#333399' />
								<area style='cursor: pointer' shape='poly'
									coords='45,30,54,34,54,45,45,49,36,45,36,34'
									onclick='clickColor("#669999")' alt='#669999' />
								<area style='cursor: pointer' shape='poly'
									coords='63,30,72,34,72,45,63,49,54,45,54,34'
									onclick='clickColor("#009999")' alt='#009999' />
								<area style='cursor: pointer' shape='poly'
									coords='81,30,90,34,90,45,81,49,72,45,72,34'
									onclick='clickColor("#33CCCC")' alt='#33CCCC' />
								<area style='cursor: pointer' shape='poly'
									coords='99,30,108,34,108,45,99,49,90,45,90,34'
									onclick='clickColor("#00CCFF")' alt='#00CCFF' />
								<area style='cursor: pointer' shape='poly'
									coords='117,30,126,34,126,45,117,49,108,45,108,34'
									onclick='clickColor("#0099FF")' alt='#0099FF' />
								<area style='cursor: pointer' shape='poly'
									coords='135,30,144,34,144,45,135,49,126,45,126,34'
									onclick='clickColor("#0066FF")' alt='#0066FF' />
								<area style='cursor: pointer' shape='poly'
									coords='153,30,162,34,162,45,153,49,144,45,144,34'
									onclick='clickColor("#3366FF")' alt='#3366FF' />
								<area style='cursor: pointer' shape='poly'
									coords='171,30,180,34,180,45,171,49,162,45,162,34'
									onclick='clickColor("#3333CC")' alt='#3333CC' />
								<area style='cursor: pointer' shape='poly'
									coords='189,30,198,34,198,45,189,49,180,45,180,34'
									onclick='clickColor("#666699")' alt='#666699' />
								<area style='cursor: pointer' shape='poly'
									coords='36,45,45,49,45,60,36,64,27,60,27,49'
									onclick='clickColor("#339966")' alt='#339966' />
								<area style='cursor: pointer' shape='poly'
									coords='54,45,63,49,63,60,54,64,45,60,45,49'
									onclick='clickColor("#00CC99")' alt='#00CC99' />
								<area style='cursor: pointer' shape='poly'
									coords='72,45,81,49,81,60,72,64,63,60,63,49'
									onclick='clickColor("#00FFCC")' alt='#00FFCC' />
								<area style='cursor: pointer' shape='poly'
									coords='90,45,99,49,99,60,90,64,81,60,81,49'
									onclick='clickColor("#00FFFF")' alt='#00FFFF' />
								<area style='cursor: pointer' shape='poly'
									coords='108,45,117,49,117,60,108,64,99,60,99,49'
									onclick='clickColor("#33CCFF")' alt='#33CCFF' />
								<area style='cursor: pointer' shape='poly'
									coords='126,45,135,49,135,60,126,64,117,60,117,49'
									onclick='clickColor("#3399FF")' alt='#3399FF' />
								<area style='cursor: pointer' shape='poly'
									coords='144,45,153,49,153,60,144,64,135,60,135,49'
									onclick='clickColor("#6699FF")' alt='#6699FF' />
								<area style='cursor: pointer' shape='poly'
									coords='162,45,171,49,171,60,162,64,153,60,153,49'
									onclick='clickColor("#6666FF")' alt='#6666FF' />
								<area style='cursor: pointer' shape='poly'
									coords='180,45,189,49,189,60,180,64,171,60,171,49'
									onclick='clickColor("#6600FF")' alt='#6600FF' />
								<area style='cursor: pointer' shape='poly'
									coords='198,45,207,49,207,60,198,64,189,60,189,49'
									onclick='clickColor("#6600CC")' alt='#6600CC' />
								<area style='cursor: pointer' shape='poly'
									coords='27,60,36,64,36,75,27,79,18,75,18,64'
									onclick='clickColor("#339933")' alt='#339933' />
								<area style='cursor: pointer' shape='poly'
									coords='45,60,54,64,54,75,45,79,36,75,36,64'
									onclick='clickColor("#00CC66")' alt='#00CC66' />
								<area style='cursor: pointer' shape='poly'
									coords='63,60,72,64,72,75,63,79,54,75,54,64'
									onclick='clickColor("#00FF99")' alt='#00FF99' />
								<area style='cursor: pointer' shape='poly'
									coords='81,60,90,64,90,75,81,79,72,75,72,64'
									onclick='clickColor("#66FFCC")' alt='#66FFCC' />
								<area style='cursor: pointer' shape='poly'
									coords='99,60,108,64,108,75,99,79,90,75,90,64'
									onclick='clickColor("#66FFFF")' alt='#66FFFF' />
								<area style='cursor: pointer' shape='poly'
									coords='117,60,126,64,126,75,117,79,108,75,108,64'
									onclick='clickColor("#66CCFF")' alt='#66CCFF' />
								<area style='cursor: pointer' shape='poly'
									coords='135,60,144,64,144,75,135,79,126,75,126,64'
									onclick='clickColor("#99CCFF")' alt='#99CCFF' />
								<area style='cursor: pointer' shape='poly'
									coords='153,60,162,64,162,75,153,79,144,75,144,64'
									onclick='clickColor("#9999FF")' alt='#9999FF' />
								<area style='cursor: pointer' shape='poly'
									coords='171,60,180,64,180,75,171,79,162,75,162,64'
									onclick='clickColor("#9966FF")' alt='#9966FF' />
								<area style='cursor: pointer' shape='poly'
									coords='189,60,198,64,198,75,189,79,180,75,180,64'
									onclick='clickColor("#9933FF")' alt='#9933FF' />
								<area style='cursor: pointer' shape='poly'
									coords='207,60,216,64,216,75,207,79,198,75,198,64'
									onclick='clickColor("#9900FF")' alt='#9900FF' />
								<area style='cursor: pointer' shape='poly'
									coords='18,75,27,79,27,90,18,94,9,90,9,79'
									onclick='clickColor("#006600")' alt='#006600' />
								<area style='cursor: pointer' shape='poly'
									coords='36,75,45,79,45,90,36,94,27,90,27,79'
									onclick='clickColor("#00CC00")' alt='#00CC00' />
								<area style='cursor: pointer' shape='poly'
									coords='54,75,63,79,63,90,54,94,45,90,45,79'
									onclick='clickColor("#00FF00")' alt='#00FF00' />
								<area style='cursor: pointer' shape='poly'
									coords='72,75,81,79,81,90,72,94,63,90,63,79'
									onclick='clickColor("#66FF99")' alt='#66FF99' />
								<area style='cursor: pointer' shape='poly'
									coords='90,75,99,79,99,90,90,94,81,90,81,79'
									onclick='clickColor("#99FFCC")' alt='#99FFCC' />
								<area style='cursor: pointer' shape='poly'
									coords='108,75,117,79,117,90,108,94,99,90,99,79'
									onclick='clickColor("#CCFFFF")' alt='#CCFFFF' />
								<area style='cursor: pointer' shape='poly'
									coords='126,75,135,79,135,90,126,94,117,90,117,79'
									onclick='clickColor("#CCCCFF")' alt='#CCCCFF' />
								<area style='cursor: pointer' shape='poly'
									coords='144,75,153,79,153,90,144,94,135,90,135,79'
									onclick='clickColor("#CC99FF")' alt='#CC99FF' />
								<area style='cursor: pointer' shape='poly'
									coords='162,75,171,79,171,90,162,94,153,90,153,79'
									onclick='clickColor("#CC66FF")' alt='#CC66FF' />
								<area style='cursor: pointer' shape='poly'
									coords='180,75,189,79,189,90,180,94,171,90,171,79'
									onclick='clickColor("#CC33FF")' alt='#CC33FF' />
								<area style='cursor: pointer' shape='poly'
									coords='198,75,207,79,207,90,198,94,189,90,189,79'
									onclick='clickColor("#CC00FF")' alt='#CC00FF' />
								<area style='cursor: pointer' shape='poly'
									coords='216,75,225,79,225,90,216,94,207,90,207,79'
									onclick='clickColor("#9900CC")' alt='#9900CC' />
								<area style='cursor: pointer' shape='poly'
									coords='9,90,18,94,18,105,9,109,0,105,0,94'
									onclick='clickColor("#003300")' alt='#003300' />
								<area style='cursor: pointer' shape='poly'
									coords='27,90,36,94,36,105,27,109,18,105,18,94'
									onclick='clickColor("#009933")' alt='#009933' />
								<area style='cursor: pointer' shape='poly'
									coords='45,90,54,94,54,105,45,109,36,105,36,94'
									onclick='clickColor("#33CC33")' alt='#33CC33' />
								<area style='cursor: pointer' shape='poly'
									coords='63,90,72,94,72,105,63,109,54,105,54,94'
									onclick='clickColor("#66FF66")' alt='#66FF66' />
								<area style='cursor: pointer' shape='poly'
									coords='81,90,90,94,90,105,81,109,72,105,72,94'
									onclick='clickColor("#99FF99")' alt='#99FF99' />
								<area style='cursor: pointer' shape='poly'
									coords='99,90,108,94,108,105,99,109,90,105,90,94'
									onclick='clickColor("#CCFFCC")' alt='#CCFFCC' />
								<area style='cursor: pointer' shape='poly'
									coords='117,90,126,94,126,105,117,109,108,105,108,94'
									onclick='clickColor("#FFFFFF")' alt='#FFFFFF' />
								<area style='cursor: pointer' shape='poly'
									coords='135,90,144,94,144,105,135,109,126,105,126,94'
									onclick='clickColor("#FFCCFF")' alt='#FFCCFF' />
								<area style='cursor: pointer' shape='poly'
									coords='153,90,162,94,162,105,153,109,144,105,144,94'
									onclick='clickColor("#FF99FF")' alt='#FF99FF' />
								<area style='cursor: pointer' shape='poly'
									coords='171,90,180,94,180,105,171,109,162,105,162,94'
									onclick='clickColor("#FF66FF")' alt='#FF66FF' />
								<area style='cursor: pointer' shape='poly'
									coords='189,90,198,94,198,105,189,109,180,105,180,94'
									onclick='clickColor("#FF00FF")' alt='#FF00FF' />
								<area style='cursor: pointer' shape='poly'
									coords='207,90,216,94,216,105,207,109,198,105,198,94'
									onclick='clickColor("#CC00CC")' alt='#CC00CC' />
								<area style='cursor: pointer' shape='poly'
									coords='225,90,234,94,234,105,225,109,216,105,216,94'
									onclick='clickColor("#660066")' alt='#660066' />
								<area style='cursor: pointer' shape='poly'
									coords='18,105,27,109,27,120,18,124,9,120,9,109'
									onclick='clickColor("#336600")' alt='#336600' />
								<area style='cursor: pointer' shape='poly'
									coords='36,105,45,109,45,120,36,124,27,120,27,109'
									onclick='clickColor("#009900")' alt='#009900' />
								<area style='cursor: pointer' shape='poly'
									coords='54,105,63,109,63,120,54,124,45,120,45,109'
									onclick='clickColor("#66FF33")' alt='#66FF33' />
								<area style='cursor: pointer' shape='poly'
									coords='72,105,81,109,81,120,72,124,63,120,63,109'
									onclick='clickColor("#99FF66")' alt='#99FF66' />
								<area style='cursor: pointer' shape='poly'
									coords='90,105,99,109,99,120,90,124,81,120,81,109'
									onclick='clickColor("#CCFF99")' alt='#CCFF99' />
								<area style='cursor: pointer' shape='poly'
									coords='108,105,117,109,117,120,108,124,99,120,99,109'
									onclick='clickColor("#FFFFCC")' alt='#FFFFCC' />
								<area style='cursor: pointer' shape='poly'
									coords='126,105,135,109,135,120,126,124,117,120,117,109'
									onclick='clickColor("#FFCCCC")' alt='#FFCCCC' />
								<area style='cursor: pointer' shape='poly'
									coords='144,105,153,109,153,120,144,124,135,120,135,109'
									onclick='clickColor("#FF99CC")' alt='#FF99CC' />
								<area style='cursor: pointer' shape='poly'
									coords='162,105,171,109,171,120,162,124,153,120,153,109'
									onclick='clickColor("#FF66CC")' alt='#FF66CC' />
								<area style='cursor: pointer' shape='poly'
									coords='180,105,189,109,189,120,180,124,171,120,171,109'
									onclick='clickColor("#FF33CC")' alt='#FF33CC' />
								<area style='cursor: pointer' shape='poly'
									coords='198,105,207,109,207,120,198,124,189,120,189,109'
									onclick='clickColor("#CC0099")' alt='#CC0099' />
								<area style='cursor: pointer' shape='poly'
									coords='216,105,225,109,225,120,216,124,207,120,207,109'
									onclick='clickColor("#993399")' alt='#993399' />
								<area style='cursor: pointer' shape='poly'
									coords='27,120,36,124,36,135,27,139,18,135,18,124'
									onclick='clickColor("#333300")' alt='#333300' />
								<area style='cursor: pointer' shape='poly'
									coords='45,120,54,124,54,135,45,139,36,135,36,124'
									onclick='clickColor("#669900")' alt='#669900' />
								<area style='cursor: pointer' shape='poly'
									coords='63,120,72,124,72,135,63,139,54,135,54,124'
									onclick='clickColor("#99FF33")' alt='#99FF33' />
								<area style='cursor: pointer' shape='poly'
									coords='81,120,90,124,90,135,81,139,72,135,72,124'
									onclick='clickColor("#CCFF66")' alt='#CCFF66' />
								<area style='cursor: pointer' shape='poly'
									coords='99,120,108,124,108,135,99,139,90,135,90,124'
									onclick='clickColor("#FFFF99")' alt='#FFFF99' />
								<area style='cursor: pointer' shape='poly'
									coords='117,120,126,124,126,135,117,139,108,135,108,124'
									onclick='clickColor("#FFCC99")' alt='#FFCC99' />
								<area style='cursor: pointer' shape='poly'
									coords='135,120,144,124,144,135,135,139,126,135,126,124'
									onclick='clickColor("#FF9999")' alt='#FF9999' />
								<area style='cursor: pointer' shape='poly'
									coords='153,120,162,124,162,135,153,139,144,135,144,124'
									onclick='clickColor("#FF6699")' alt='#FF6699' />
								<area style='cursor: pointer' shape='poly'
									coords='171,120,180,124,180,135,171,139,162,135,162,124'
									onclick='clickColor("#FF3399")' alt='#FF3399' />
								<area style='cursor: pointer' shape='poly'
									coords='189,120,198,124,198,135,189,139,180,135,180,124'
									onclick='clickColor("#CC3399")' alt='#CC3399' />
								<area style='cursor: pointer' shape='poly'
									coords='207,120,216,124,216,135,207,139,198,135,198,124'
									onclick='clickColor("#990099")' alt='#990099' />
								<area style='cursor: pointer' shape='poly'
									coords='36,135,45,139,45,150,36,154,27,150,27,139'
									onclick='clickColor("#666633")' alt='#666633' />
								<area style='cursor: pointer' shape='poly'
									coords='54,135,63,139,63,150,54,154,45,150,45,139'
									onclick='clickColor("#99CC00")' alt='#99CC00' />
								<area style='cursor: pointer' shape='poly'
									coords='72,135,81,139,81,150,72,154,63,150,63,139'
									onclick='clickColor("#CCFF33")' alt='#CCFF33' />
								<area style='cursor: pointer' shape='poly'
									coords='90,135,99,139,99,150,90,154,81,150,81,139'
									onclick='clickColor("#FFFF66")' alt='#FFFF66' />
								<area style='cursor: pointer' shape='poly'
									coords='108,135,117,139,117,150,108,154,99,150,99,139'
									onclick='clickColor("#FFCC66")' alt='#FFCC66' />
								<area style='cursor: pointer' shape='poly'
									coords='126,135,135,139,135,150,126,154,117,150,117,139'
									onclick='clickColor("#FF9966")' alt='#FF9966' />
								<area style='cursor: pointer' shape='poly'
									coords='144,135,153,139,153,150,144,154,135,150,135,139'
									onclick='clickColor("#FF6666")' alt='#FF6666' />
								<area style='cursor: pointer' shape='poly'
									coords='162,135,171,139,171,150,162,154,153,150,153,139'
									onclick='clickColor("#FF0066")' alt='#FF0066' />
								<area style='cursor: pointer' shape='poly'
									coords='180,135,189,139,189,150,180,154,171,150,171,139'
									onclick='clickColor("#CC6699")' alt='#CC6699' />
								<area style='cursor: pointer' shape='poly'
									coords='198,135,207,139,207,150,198,154,189,150,189,139'
									onclick='clickColor("#993366")' alt='#993366' />
								<area style='cursor: pointer' shape='poly'
									coords='45,150,54,154,54,165,45,169,36,165,36,154'
									onclick='clickColor("#999966")' alt='#999966' />
								<area style='cursor: pointer' shape='poly'
									coords='63,150,72,154,72,165,63,169,54,165,54,154'
									onclick='clickColor("#CCCC00")' alt='#CCCC00' />
								<area style='cursor: pointer' shape='poly'
									coords='81,150,90,154,90,165,81,169,72,165,72,154'
									onclick='clickColor("#FFFF00")' alt='#FFFF00' />
								<area style='cursor: pointer' shape='poly'
									coords='99,150,108,154,108,165,99,169,90,165,90,154'
									onclick='clickColor("#FFCC00")' alt='#FFCC00' />
								<area style='cursor: pointer' shape='poly'
									coords='117,150,126,154,126,165,117,169,108,165,108,154'
									onclick='clickColor("#FF9933")' alt='#FF9933' />
								<area style='cursor: pointer' shape='poly'
									coords='135,150,144,154,144,165,135,169,126,165,126,154'
									onclick='clickColor("#FF6600")' alt='#FF6600' />
								<area style='cursor: pointer' shape='poly'
									coords='153,150,162,154,162,165,153,169,144,165,144,154'
									onclick='clickColor("#FF5050")' alt='#FF5050' />
								<area style='cursor: pointer' shape='poly'
									coords='171,150,180,154,180,165,171,169,162,165,162,154'
									onclick='clickColor("#CC0066")' alt='#CC0066' />
								<area style='cursor: pointer' shape='poly'
									coords='189,150,198,154,198,165,189,169,180,165,180,154'
									onclick='clickColor("#660033")' alt='#660033' />
								<area style='cursor: pointer' shape='poly'
									coords='54,165,63,169,63,180,54,184,45,180,45,169'
									onclick='clickColor("#996633")' alt='#996633' />
								<area style='cursor: pointer' shape='poly'
									coords='72,165,81,169,81,180,72,184,63,180,63,169'
									onclick='clickColor("#CC9900")' alt='#CC9900' />
								<area style='cursor: pointer' shape='poly'
									coords='90,165,99,169,99,180,90,184,81,180,81,169'
									onclick='clickColor("#FF9900")' alt='#FF9900' />
								<area style='cursor: pointer' shape='poly'
									coords='108,165,117,169,117,180,108,184,99,180,99,169'
									onclick='clickColor("#CC6600")' alt='#CC6600' />
								<area style='cursor: pointer' shape='poly'
									coords='126,165,135,169,135,180,126,184,117,180,117,169'
									onclick='clickColor("#FF3300")' alt='#FF3300' />
								<area style='cursor: pointer' shape='poly'
									coords='144,165,153,169,153,180,144,184,135,180,135,169'
									onclick='clickColor("#FF0000")' alt='#FF0000' />
								<area style='cursor: pointer' shape='poly'
									coords='162,165,171,169,171,180,162,184,153,180,153,169'
									onclick='clickColor("#CC0000")' alt='#CC0000' />
								<area style='cursor: pointer' shape='poly'
									coords='180,165,189,169,189,180,180,184,171,180,171,169'
									onclick='clickColor("#990033")' alt='#990033' />
								<area style='cursor: pointer' shape='poly'
									coords='63,180,72,184,72,195,63,199,54,195,54,184'
									onclick='clickColor("#663300")' alt='#663300' />
								<area style='cursor: pointer' shape='poly'
									coords='81,180,90,184,90,195,81,199,72,195,72,184'
									onclick='clickColor("#996600")' alt='#996600' />
								<area style='cursor: pointer' shape='poly'
									coords='99,180,108,184,108,195,99,199,90,195,90,184'
									onclick='clickColor("#CC3300")' alt='#CC3300' />
								<area style='cursor: pointer' shape='poly'
									coords='117,180,126,184,126,195,117,199,108,195,108,184'
									onclick='clickColor("#993300")' alt='#993300' />
								<area style='cursor: pointer' shape='poly'
									coords='135,180,144,184,144,195,135,199,126,195,126,184'
									onclick='clickColor("#990000")' alt='#990000' />
								<area style='cursor: pointer' shape='poly'
									coords='153,180,162,184,162,195,153,199,144,195,144,184'
									onclick='clickColor("#800000")' alt='#800000' />
								<area style='cursor: pointer' shape='poly'
									coords='171,180,180,184,180,195,171,199,162,195,162,184'
									onclick='clickColor("#993333")' alt='#993333' />
							</map>
							<script>
						var thistop = "-35";
						var thisleft = "135";
						</script>
							<p>
								rabel_color <input type="text" id="rabel_color_rabel_modify"
									class="form-control">
							</p>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-info" id="ModifyRabelBtn">SAVE</button>
							<button type="button" class="btn btn-default"
								data-dismiss="modal">CLOSE</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--END content -->
	<!-- jQuery 3 -->
	<script
		src="<%=request.getContextPath()%>/resources/bootstrap/js/jquery.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/bootstrap/js/bootstrap.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/bootstrap/js/jquery-ui.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/bootstrap/js/moment.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/bootstrap/js/fullcalendar.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/bootstrap/js/jQuery-2.1.4.min.js"></script>
	<script type='text/javascript'
		src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
	<script type='text/javascript'>
	
	$('#cal_start_time').flatpickr({
	    enableTime: true,
	    dateFormat: "Y-m-d H:i",
	});
	$('#cal_end_time').flatpickr({
	    enableTime: true,
	    dateFormat: "Y-m-d H:i",
	});
	$('#cal_start_time_save').flatpickr({
	    enableTime: true,
	    dateFormat: "Y-m-d H:i",
	});
	$('#cal_end_time_save').flatpickr({
	    enableTime: true,
	    dateFormat: "Y-m-d H:i",
	});
	</script>
	<script>
	
	$( document ).ready(function() {
		menuAction();
		init_events($('#external-events div.external-event'));
		<%-- $.ajax({
			type:'POST',
			url:"<%=request.getContextPath()%>/member/cal/selcetCal",
				headers : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "post"
				},
				dataType : 'json',
				data : JSON.stringify({
					"cal_no" : cal_no
				}),
				success : function(result) {
					if (result == "SUCCESS") {
						
					}
				}
			}); --%>
		$('#calendar').fullCalendar(
				{
					header : {
						left : 'prev,next today',
						center : 'title',
						right : 'month,list'
					},
					buttonText : {
						today : 'today',
						month : 'month',
					},
					eventClick: function(calEvent, jsEvent, view) {
						$("#detailModal").modal();
						$('#detailModal input').val("");
						$("#cal_title_read").val(calEvent.title);
						$("#cal_content_read").val(calEvent.contents);
						$("#cal_start_time_read").val(calEvent.start.format('YYYY-MM-DD hh:mm'));
						$("#cal_end_time_read").val(calEvent.end.format('YYYY-MM-DD hh:mm'));
						$("#cal_no_read").val(calEvent.calno);
						$("#rabel_no_read").val(calEvent.rabelno);
						
					},
					//Random default events
					eventSources : [{
						events : function(start, end, timezone,callback) {
							$.ajax({
								url : '<%=request.getContextPath()%>/member/cal/main',
								dataType : 'xml',
								method : 'post',
								dataType : "json",
								success : function(result) {
									var scheduleList = [];
									function parse(str) {
									    var y = str.substr(0, 4);
									    var m = str.substr(5, 2);
									    var d = str.substr(8, 2);
									    var h = str.substr(11, 2);
									    var M = str.substr(14, 2);
									    return new Date(y,m-1,d,h,M);
									}
									$.each(result,function(idx,CalLoadDTO) {
										var str = '{"title" : "'+ CalLoadDTO.cal_title+ '"';
										str += ', "calno" : "'+ CalLoadDTO.cal_no+ '"';
										str += ', "contents" : "'+ CalLoadDTO.cal_content+ '"';
										str += ', "start" : "'+ parse(moment(CalLoadDTO.cal_start_time).format('YYYY-MM-DD HH:mm')) + '"';
										str += ', "type" : "'+ CalLoadDTO.rabel_type + '"';
										str += ', "end" : "'+ parse(moment(CalLoadDTO.cal_end_time).format('YYYY-MM-DD HH:mm')) + '"';
										str += ', "backgroundColor" : "'+CalLoadDTO.rabel_color+'"'; // an option!
										str += ', "borderColor" : "'+CalLoadDTO.rabel_color+'"'; // an option!
										str += ', "rabelno" : "'+CalLoadDTO.rabel_no+'"'; // an option!
										str += '}';
										
										scheduleList.push(eval("("+ str+ ")"));
				
									});
									callback(scheduleList);
								},
								error : function(resp) {
									alert("실패!@! : "+resp);
								}
							});
						},
					}]
					})
	});
	function clickColor(hex) {
	   $("#rabel_color").val(hex);
	}
	$('#insertModalOn').on('click',function(event){
		$("#insertModal").modal();
		$('input').val('');
	});
	$('#RabelModalOn').on('click',function(event){
		$("#rabelModal").modal();
		$('input').val('');
	});
	$('#refreshCal').on('click',function(event){
		$('#calendar').fullCalendar('refetchEvents');
	});
	$('#refreshRabel').on('click',function(event){
		location.reload();
	});
	$('li.RabelList').on('click',function(event){
		$('#rabelDetailModal').modal();
		$('input').val('');
		var num = $(this).attr('id');
		var rtype = $(this).children('.rabelName').attr('id');
		var rcolor = $(this).children('.rabelColor').attr('id');
		$("#rabel_no_rabel_detail").val(num);
		$("#rabel_type_rabel_detail").val(rtype);
		$("#rabel_color_rabel_detail").val(rcolor);
		});
			 
	$('#MODIFYBtn').on('click',function(event){
		$("#modifyModal").modal();
		$('#MODIFYBtn input').val("");
		$("#cal_title_save").val($("#cal_title_read").val());
		$("#cal_content_save").val($("#cal_content_read").val());
		$("#cal_start_time_save").val($("#cal_start_time_read").val());
		$("#cal_end_time_save").val($("#cal_end_time_read").val());
		$("#rabel_no_save").val($("#rabel_no_read").val());
		$("#cal_no_save").val($("#cal_no_read").val());
	});
	$('#AddCalBtn').on('click',function(event){
		var cal_title = $("#cal_title").val();
		var cal_content = $("#cal_content").val();
		var cal_start_time = $("#cal_start_time").val();
		var cal_end_time = $("#cal_end_time").val();
		var rabel_no = $("select#rabel_no_incal option:selected").val();	
		function parse(str) {
		    var y = str.substr(0, 4);
		    var m = str.substr(5, 2);
		    var d = str.substr(8, 2);
		    var h = str.substr(11, 2);
		    var M = str.substr(14, 2);
		    return new Date(y,m-1,d,h,M);
		}
		var sDate = parse(cal_start_time);
		var eDate = parse(cal_end_time);
		if(sDate>eDate){
			alert("날짜가 올바르지않습니다.");
			throw 'stop';
		}
		if(cal_title==""||cal_start_time==""||cal_end_time==""||rabel_no==""){
			alert("입력이 올바르지않습니다.");
			throw 'stop';
		}
		$.ajax({
			type:'POST',
			url:"<%=request.getContextPath()%>/member/cal/insertCal",
				headers : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "post"
				},
				dataType : 'json',
				data : JSON.stringify({
					"cal_title" : cal_title,
					"cal_content" : cal_content,
					"cal_start_time" : sDate,
					"cal_end_time" : eDate,
					"rabel_no" : rabel_no
				})
			});
						$('#insertModal').modal('hide');
						$('#calendar').fullCalendar('refetchEvents');
		});
	$('#SAVEBtn').on('click',function(event){
		var cal_no = $("#cal_no_save").val();
		var cal_title = $("#cal_title_save").val();
		var cal_content = $("#cal_content_save").val();
		var cal_start_time = $("#cal_start_time_save").val();
		var cal_end_time = $("#cal_end_time_save").val();
		var rabel_no = $("select#rabel_no_save option:selected").val();	
		function parse(str) {
		    var y = str.substr(0, 4);
		    var m = str.substr(5, 2);
		    var d = str.substr(8, 2);
		    var h = str.substr(11, 2);
		    var M = str.substr(14, 2);
		    return new Date(y,m-1,d,h,M);
		}
		var sDate = parse(cal_start_time);
		var eDate = parse(cal_end_time);
		if(sDate>eDate){
			alert("날짜가 올바르지않습니다.");
			throw 'stop';
		}
		if(cal_no==""||cal_title==""||cal_start_time==""||cal_end_time==""||rabel_no==""){
			alert("입력이 올바르지않습니다.");
			throw 'stop';
		}
		$.ajax({
			type:'POST',
			url:"<%=request.getContextPath()%>/member/cal/modifyCal",
				headers : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "post"
				},
				dataType : 'json',
				data : JSON.stringify({
					"cal_no" : cal_no,
					"cal_title" : cal_title,
					"cal_content" : cal_content,
					"cal_start_time" : sDate,
					"cal_end_time" : eDate,
					"rabel_no" : rabel_no
				})
			});
						$('#detailModal').modal('hide');
						$('#modifyModal').modal('hide');
		$('#calendar').fullCalendar( 'refetchEvents' );
		});
	$('#AddRabelBtn').on('click',function(event){
		var rabel_type = $("select#rabel_type option:selected").val();	
		var rabel_color = $("#rabel_color").val();
		var department_no = '${loginUser.dep_no}';
		var emp_id = '${loginUser.emp_id}';
		$.ajax({
			type:'POST',
			url:"<%=request.getContextPath()%>/member/cal/insertRabel",
				headers : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "post"
				},
				dataType : 'text',
				data : JSON.stringify({
					"rabel_type" : rabel_type,
					"rabel_color" : rabel_color,
					"department_no" : department_no,
					"emp_id" : emp_id
				})
			});
						$('#rabelModal').modal('hide');
		$('#calendar').fullCalendar( 'refetchEvents' );
		});
	$('#DELETEBtn').on('click',function(event){
		var cal_no =$("#cal_no_read").val();
		$.ajax({
			type:'POST',
			url:"<%=request.getContextPath()%>/member/cal/deleteCal",
				headers : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "post"
				},
				dataType : 'text',
				data : cal_no
			});
						$('#detailModal').modal('hide');
		$('#calendar').fullCalendar( 'refetchEvents' );
		});
			/* 서브메뉴, 메인메뉴 보여주기*/
			

			/*  달력 스크립트 시작*/
			/* initialize the external events
			 -----------------------------------------------------------------*/
			function init_events(ele) {
				ele.each(function() {

					// create an Event Object (http://arshaw.com/fullcalendar/docs/event_data/Event_Object/)
					// it doesn't need to have a start or end
					var eventObject = {
						title : $.trim($(this).text())
					// use the element's text as the event title
					}

					// store the Event Object in the DOM element so we can get to it later
					$(this).data('eventObject', eventObject)
					
					// make the event draggable using jQuery UI
					$(this).draggable({
						zIndex : 1070,
						revert : true, // will cause the event to go back to its
						revertDuration : 0
					//  original position after the drag
					})

				})
			}

			

			/* initialize the calendar
			 -----------------------------------------------------------------*/
			//Date for the calendar events (dummy data)
			function parse(str) {
			    var y = str.substr(0, 4);
			    var m = str.substr(5, 2);
			    var d = str.substr(8, 2);
			    var h = str.substr(11, 2);
			    var M = str.substr(14, 2);
			    return new Date(y,m-1,d,h,M);
			}

			/* ADDING EVENTS */
			var currColor = '#3c8dbc' //Red by default
			//Color chooser button
			var colorChooser = $('#color-chooser-btn')
			$('#color-chooser > li > a').click(function(e) {
				e.preventDefault()
				//Save color
				currColor = $(this).css('color')
				//Add color effect to button
				$('#add-new-event').css({
					'background-color' : currColor,
					'border-color' : currColor
				})
			})
			$('#add-new-event').click(function(e) {
				e.preventDefault()
				//Get value and make sure it is not null
				var val = $('#new-event').val()
				if (val.length == 0) {
					return
				}

				//Create events
				var event = $('<div />')
				event.css({
					'background-color' : currColor,
					'border-color' : currColor,
					'color' : '#fff'
				}).addClass('external-event')
				event.html(val)
				$('#external-events').prepend(event)

				//Add draggable funtionality
				init_events(event)

				//Remove event from text input
				$('#new-event').val('')
			})
		/*  달력 스크립트 끝*/

		/* 탭 스크립트  */

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
	</script>