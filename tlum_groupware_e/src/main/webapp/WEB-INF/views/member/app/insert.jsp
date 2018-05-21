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
		input[name='free_board_title']{
			width: 80%;
		}
		textarea[name='ir1']{
			width: 90%;
		}
		#title{
			
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
			<h4>자유 게시판 등록</h4>	
		</div>
	<hr/>
	<form id="inputForm" role="form" method="post">
		<!-- 글번호 시퀀스로 -->
		글번호<input type="text" name="free_board_bno" placeholder="글번호" />
		작성자<input type="text" name="emp_id" placeholder="작성자" /><br/>
		
		<!-- 제목부분  -->
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			제목
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		
		<input type="text" name="free_board_title" placeholder="제목" /><br/>
		
		<!-- 작성자=로그인한 사람으로 변경. -->
		<br/><br/>
		
		<!-- 스마트 에디터 본문 -->
		<textarea name="ir1" id="ir1" rows="10" cols="100" style="width:766px; height:412px; display:none;" placeholder="내용입력" ></textarea>
		<!-- 스마트 에디터  끝 -->
		<div class="box-footer">
			<!-- 버튼 -->
			<button type="submit" class="btn btn-primary">등록</button>
			<button type="button" class="btn btn-danger">취소</button>
		</div>
	</form>
	</div>
	</section>
	<!--END content -->
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/smartedit/js/service/HuskyEZCreator.js" charset="utf-8"></script>
<script src="<%=request.getContextPath() %>/resources/bootstrap/js/jquery.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/bootstrap/js/bootstrap.js"></script>
<script src="<%=request.getContextPath() %>/resources/bootstrap/js/jquery-ui.min.js"></script>
	
<script type="text/javascript">
$(function () {
	/* 서브메뉴, 메인메뉴 보여주기*/
	menuAction();
});

/* 탭 스크립트  */

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


/* 스마트 에디터 2 시작*/
var oEditors = [];

var sLang = "ko_KR";	// 언어 (ko_KR/ en_US/ ja_JP/ zh_CN/ zh_TW), default = ko_KR

// 추가 글꼴 목록
//var aAdditionalFontSet = [["MS UI Gothic", "MS UI Gothic"], ["Comic Sans MS", "Comic Sans MS"],["TEST","TEST"]];


nhn.husky.EZCreator.createInIFrame({
	oAppRef: oEditors,
	elPlaceHolder: "ir1",
	sSkinURI: "<%=request.getContextPath() %>/resources/smartedit/SmartEditor2Skin.html",	
	htParams : {
		bUseToolbar : true,				// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
		bUseVerticalResizer : true,		// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
		bUseModeChanger : true,			// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
		//bSkipXssFilter : true,		// client-side xss filter 무시 여부 (true:사용하지 않음 / 그외:사용)
		//aAdditionalFontList : aAdditionalFontSet,		// 추가 글꼴 목록
		fOnBeforeUnload : function(){
			//alert("완료!");
		},
		I18N_LOCALE : sLang
	}, //boolean
	fOnAppLoad : function(){
		//예제 코드
		//oEditors.getById["ir1"].exec("PASTE_HTML", ["로딩이 완료된 후에 본문에 삽입되는 text입니다."]);
	},
	fCreator: "createSEditor2"
	
});
function pasteHTML() {
	var sHTML = "<span style='color:#FF0000;'>이미지도 같은 방식으로 삽입합니다.<\/span>";
	oEditors.getById["ir1"].exec("PASTE_HTML", [sHTML]);
}

//스마트 에디터 본문내용 가져오기

function showHTML() {
	var sHTML = oEditors.getById["ir1"].getIR();
	return sHTML;
}
	
function submitContents(elClickedObj) {
	oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);	// 에디터의 내용이 textarea에 적용됩니다.
	
	// 에디터의 내용에 대한 값 검증은 이곳에서 document.getElementById("ir1").value를 이용해서 처리하면 됩니다.
	
	try {
		elClickedObj.form.submit();
	} catch(e) {}
}

function setDefaultFont() {
	var sDefaultFont = '궁서';
	var nFontSize = 24;
	oEditors.getById["ir1"].setDefaultFont(sDefaultFont, nFontSize);
}


/* 스마트 에디터 2 끝*/
/* INSERT */
 
$('#inputForm').submit(function(event){
	event.preventDefault();
	console.log(showHTML());
	var that=$(this);
	var str="<input type='hidden' name='free_board_content' value='"+showHTML()+"' />";
	that.append(str);
	that.get(0).submit();
}); 

</script>
	
	
