<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
      input:checked + label {
          color: red
      }
      #depList>div{
      	 padding: 5px 30px 0 30px;
      }
      button[name="depListBtn"]{
      	width: 120px;
      }
      div#searchEmpList{
		padding: 5px 30px 0 30px;
		padding: 19px;
		margin-bottom: 20px;
		background-color: #f5f5f5;
		border: 1px solid #e3e3e3;
		margin:20px;
      }
      div#searchBar{
      	margin: 0 0 0 20px;
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
            <div>
            
            </div>
            서브메뉴 리스트
         </div>
         <div id="fastMenu">
            빠른메뉴 리스트
         </div>
      </div>   
      <div class="aside">


   <hr/>
      <div id="title">
         <h4>메세지 작성</h4>   
      </div>
   <hr/>
   <form id="inputForm" role="form" method="post">
      <!-- 글번호 시퀀스로 -->
      메시지 번호<input type="text" name="msg_no" placeholder="메시지 번호" />
      수신자<input type="text" id="chk_emp_list" placeholder="사원검색을 선택해주세요." readonly="readonly"/>
      <input type="hidden" name="receive_name"/>
      <input type="hidden" name="receive_id"/>
      <button id="serchEmplyee" type="button" class="btn btn-primary" data-toggle="modal" data-target=".bs-example-modal-sm">사원 검색하기</button><br/>
   
      <!-- 제목부분  -->
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
         제목
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <input type="text" name="msg_title" placeholder="제목" /><br/>
      
      <!-- 작성자=로그인한 사람으로 변경. -->
      <br/><br/>
      
      <!-- 스마트 에디터 본문 -->
      <textarea name="ir1" id="ir1" rows="10" cols="100" style="width:766px; height:412px; display:none;" placeholder="내용입력" ></textarea>
      <!-- 스마트 에디터  끝 -->
      <div class="box-footer">
         <!-- 버튼 -->
         <button type="submit" class="btn btn-primary">보내기</button>
         <button type="button" class="btn btn-danger">취소</button>
      </div>
   </form>
   </div>
   </section>
   <!--END content -->
      
   <!-- modal -->
   <div class="modal fade bs-example-modal-sm" id="modal" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
     <div class="modal-dialog modal-sm">
       <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="false">&times;</span></button>
              <h4 class="modal-title" id="myModalLabel">사원검색</h4>
            </div>
            <div class="modal-body">
               <div id="searchBar">
	               <select name="searchType">
									<option value="" ${cri.searchType==null?'selected':'' }>
									------</option>
									<option value="i" ${cri.searchType eq 'i'?'selected':'' }>
									아이디</option>
									<option value="n" ${cri.searchType eq 'n'?'selected':'' }>
									이름</option>
									<option value="in" ${cri.searchType eq ''?'selected':'' }>
									전체</option>
								</select>
					<input id="keywordInput"  name="keyword" type="text" />
					<button id="empSearchBtn" class="btn btn-primary">검 색</button>
				</div>
               <div id="depList">
                  <c:forEach items="${depList}" var="dep">
                  	<div>
                     <button id="${dep.dep_no}" name="depListBtn" class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapse_${dep.dep_no}" aria-expanded="false" aria-controls="collapse_${dep.dep_no}">
                      ${dep.dep_name}
	                  </button>
	                  <div class="collapse" id="collapse_${dep.dep_no}">
	                     <div class="well">
	                     
<!-- 	                        <input type='checkbox' id='"+empList[i].emp_id+"' name='empChkBox'/> -->
	                     
	                     </div>
	                  </div>
	                  
                  	</div>
                  </c:forEach>
               </div>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-waring" data-dismiss="modal">취소</button>
              <button type="button" class="btn btn-primary" id="goInputEmplist">확인</button>
            </div>
          </div>
        </div>
     </div>
   </div>
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

var sLang = "ko_KR";   // 언어 (ko_KR/ en_US/ ja_JP/ zh_CN/ zh_TW), default = ko_KR

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
$('#inputForm').submit(function(event){
   event.preventDefault();
   var that=$(this);
   var str="";
  		str+="<input type='hidden' name='emp_id' value='${loginUser.emp_id}' />";
		str+="<input type='hidden' name='msg_content' value='"+showHTML()+"' />";
   that.append(str);
   that.get(0).submit();
}); 

//모달창의 확인버튼을 눌럿을때 가져오는 function
$('#goInputEmplist').on('click',function(){
   var empidList=[];
   var empNameList=[];
   var empList=getChkEmpIdList();
   var empIdList = "";
   var empNameList = "";
   var empInfoList = "";
   for(var emp in empList){
		label=$("label[for='"+empList[emp]+"']").text();
		strStart=label.indexOf('이름 : ');
		strEnd=label.indexOf('직급 :');
		name=label.substring(strStart,strEnd ).replace("이름 :","").trim();
		
		if(empInfoList!=""){
			empInfoList = empInfoList+', '+ name +'('+empList[emp]+')';
			empIdList = empIdList+'/'+empList[emp];
			empNameList = empNameList+'/'+ name
		}else{
			empIdList = empList[emp];
			empNameList =  name
			empInfoList =  name +'('+empList[emp]+')';
		}
   }
   $("input[name=receive_id]").val(empIdList);
   $("input[name=receive_name]").val(empNameList);
   $("input#chk_emp_list").val(empInfoList);
   $('#modal').modal('hide');
   
});

//모달창의 사원리스트중 체크된 사원들의 사원아이디을 리스트형태로 return 하는 function
function getChkEmpIdList(){
   var selected = [];
   $chkList=$("input[name='empChkBox']:checked");
   $chkList.each(function (i,ob) { 
// 	   selected.push($(ob).val().split("/"));
		selected.push($(ob).attr('id'));
   });
   return selected;
}
// //모달창 버그때문에 누를떄 show하도록 만든 function
// $('#serchEmplyee').click(function(){
// 	  $('#modal').modal('show');
// });
//부서별 사원리스트 가져오기
$('button[name="depListBtn"]').click(function(){
	var dep_no=	$(this).attr("id");
	var collapse= $("#collapse_"+dep_no+"> div");
	var empList;
	var tag="";
	$.ajax({
	       url:"<%=request.getContextPath()%>/member/emp/depListEmp",
	      type:"post",
	      dataType:"json",
	      data:"dep_no="+dep_no,
	      success:function(data){
	    	 //사원번호, 사원이름, 사원 직책 , 직급
	    	 empList=data;
	    	 for(var i in empList){
	    		 tag+="<input type='checkbox' id='"+empList[i].emp_id+"' name='empChkBox'/>";
	    		 tag+="<label for='"+empList[i].emp_id+"'>";
	    		 tag+="사원번호 : "+empList[i].emp_id;
	    		 tag+="이름 : "+empList[i].emp_name;
	    		 tag+="직급 : "+empList[i].grade_name;
	    		 tag+="직책 : "+empList[i].position_name;
	    		 tag+="</label>"
	    		 tag+="</br>";
	    	 }
	    	 collapse.html(tag);
	      }
	});
});


// 검색
$('#empSearchBtn').on('click',function(){
	
	var searchType=$("select option:selected").val();
	var keyword=$("#keywordInput").val();
	var tag="";
	if(searchType==""||searchType==null){
		alert("검색 타입을 선택하셔야 합니다.");
	}else if(keyword==""||keyword==null){
		alert("검색 내용을 입력하셔야 합니다.");
	}else{
	 	var depList=$('#depList');
		$.ajax({
			url:"<%=request.getContextPath()%>/member/emp/msgEmpSearch",
			type:"post",
			dataType:"json",
			data:"searchType="+searchType+"&keyword="+keyword,
			success:function(data){
				empSearch=data;
				tag+="<div id='searchEmpList'>"
				for(var i in empSearch){
					tag+="<input type='checkbox' id='"+empSearch[i].emp_id+"'name='empChkBox'/>";
					tag+="<label for='"+empSearch[i].emp_id+"'>";
					tag+=" 부서 : "+empSearch[i].dep_name;
					tag+=" 사원번호 :"+empSearch[i].emp_id;
					tag+=" 이름 : "+empSearch[i].emp_name;
		    		 tag+=" 직급 : "+empSearch[i].grade_name;
		    		 tag+=" 직책 : "+empSearch[i].position_name;
		    		 tag+="</label>"
		    		 tag+="</br>";
				}
		    		 tag+="</div>";
				depList.html(tag);
				
			}
			
		});
	}
});



</script>
   
   