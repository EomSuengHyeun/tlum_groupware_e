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

	<div class="box-header">
		<h3 class="box-title">NOTICE BOARD MODIFY</h3>
	</div>
	
	<form role="form" action="modify" method="post">
		<div>
			<div>
				<label for="exampleInput1">번호</label> <input type="text"
					name='notice_board_bno' class="form-control" value="${noticeBoard.notice_board_bno}"
					readonly="readonly">
			</div>
			<div>
				<label for="exampleInput2">제목</label> <input type="text"
					name='notice_board_title' class="form-control" value="${noticeBoard.notice_board_title}">
			</div>
			<%-- <div>
				<label for="exampleInput3">내용</label>
				<textarea class="form-control" name="notice_board_content" rows="3">${noticeBoard.notice_board_content}</textarea>
			</div> --%>
			<!-- 스마트 에디터 본문 -->
      		<textarea name="ir1" id="ir1" rows="10" cols="100" style="width:766px; height:412px; display:none;" placeholder="내용입력" ></textarea>
      		<!-- 스마트 에디터  끝 -->
			
		</div>
	
	<div class="box-footer">
		<button type="submit" id="saveBtn">SAVE</button>
		<button id="listBtn">CANCEL</button>
	</div>
	</form>
<script src="<%=request.getContextPath() %>/resources/bootstrap/js/jquery.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/bootstrap/js/bootstrap.js"></script>
<script src="<%=request.getContextPath() %>/resources/bootstrap/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/smartedit/js/service/HuskyEZCreator.js" charset="utf-8"></script>
<script>
	$( function() {
		var formObj = $("form[role='form']");
		console.log(formObj);

		$("#listBtn").on("click", function() {
			alert("취소되었습니다.");
			formObj.attr("method", "get");
         	formObj.attr("action", "detail");
	        formObj.submit();
    	});

		$("#saveBtn").on("click", function() {
			alert("저장되었습니다.")
			formObj.submit();
		});

	});
	
	
	/* 스마트 에디터 2 시작*/
	var oEditors = [];

	var sLang = "ko_KR";   // 언어 (ko_KR/ en_US/ ja_JP/ zh_CN/ zh_TW), defa`ult = ko_KR

	// 추가 글꼴 목록
	//var aAdditionalFontSet = [["MS UI Gothic", "MS UI Gothic"], ["Comic Sans MS", "Comic Sans MS"],["TEST","TEST"]];


	nhn.husky.EZCreator.createInIFrame({
	   oAppRef: oEditors,
	   elPlaceHolder: "ir1",
	   sSkinURI: "<%=request.getContextPath() %>/resources/smartedit/SmartEditor2Skin.html",   
	   htParams : {
	      bUseToolbar : true,            // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
	      bUseVerticalResizer : true,      // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
	      bUseModeChanger : true,         // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
	      //bSkipXssFilter : true,      // client-side xss filter 무시 여부 (true:사용하지 않음 / 그외:사용)
	      //aAdditionalFontList : aAdditionalFontSet,      // 추가 글꼴 목록
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
	   oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);   // 에디터의 내용이 textarea에 적용됩니다.
	   
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
 $("form[role='form']").submit(function(event){
   event.preventDefault();
   var that=$(this);
   var str="<input type='hidden' name='notice_board_content' value='"+showHTML()+"' />";
   that.append(str);
   that.get(0).submit();
});
	
</script>
	
</body>
</html>