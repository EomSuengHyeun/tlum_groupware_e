<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
      div#title{
         text-align: center;
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
         <hr/>
            <div id="title">
               <h4>자유게시판</h4>
            </div>
         <hr/>
         <button class="btn btn-danger" id="chkALLDeleteBtn">선택 삭제</button>
         <div>
            <table class="table table-striped table-hover">
                  <tr>
                     <th><input type="checkbox" name="sendListChkALL"/></th>
                     <th>받은사람</th>
                     <th>쪽지 제목</th>
                     <th>보낸날짜</th>
                     <th>읽음 유무</th>
                     <th>삭제 하기</th>
                  </tr>
                  <c:forEach items="${sendList}" var="msg">
                     <tr>
                    	<td>
                        	<input type="checkbox" name="sendListChk" value="${msg.msg_no}"/>
                        </td>
                        <td>
                           <a href="senddetail?msg_no=${msg.msg_no}">${msg.receive_name }</a>
                        </td>
                        <td>
                           <a href="senddetaill?msg_no=${msg.msg_no}">${msg.msg_title }</a>
                        </td>
                        <td>
                           <a href="senddetail?msg_no=${msg.msg_no}">
                          	 	<fmt:formatDate value="${msg.msg_regdate}" pattern="yyyy-MM-dd"/>
                           </a>
                        </td>
                        <td>
                           <a href="senddetail?msg_no=${msg.msg_no}">${msg.msg_view}</a>
                        </td>
                        <td>
                           <a class="btn btn-danger" href="senddelete?msg_no=${msg.msg_no}">삭제하기</a>
                        </td>
                     </tr>
                  </c:forEach>
            </table>
         </div>
         <div class="box-footer">
            <div class="text-center">
                  <ul class="pagination link">
 
                     <c:if test="${pageMaker.prev}">
                        <li><a href="${pageMaker.startPage - 1}">&laquo;</a></li>
                     </c:if>

                     <c:forEach begin="${pageMaker.startPage }"
                        end="${pageMaker.endPage }" var="idx">
                        <li <c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
                           <a href="${idx}">${idx}</a>
<!--                            <a href="dsads">2131312</a> -->
                        </li>
                     </c:forEach>

                     <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
                        <li><a
                           href="${pageMaker.endPage +1}">&raquo;</a></li>
                     </c:if>

                  </ul>
               </div> 
           </div>
      </div>
      <form id="jobForm">
         <input type='hidden' name="page" value="${pageMaker.cri.page}"/>
         <input type='hidden' name="perPageNum" value="${pageMaker.cri.perPageNum}"/>
      </form>
   </section>
      


<script src="<%=request.getContextPath() %>/resources/bootstrap/js/jquery.min.js"></script>
   <script src="<%=request.getContextPath() %>/resources/bootstrap/js/bootstrap.js"></script>
   <script src="<%=request.getContextPath() %>/resources/bootstrap/js/jquery-ui.min.js"></script>
   <script src="<%=request.getContextPath() %>/resources/bootstrap/js/moment.js"></script>
<script>
   $("input[name='sendListChkALL']").on('click',function(){
	   if($("input[name='sendListChkALL']").is(":checked")){
		   $('input:checkbox[name="sendListChk"]').each(function() {
 	            $(this).prop("checked", true); //리스트의 모든 체크박스 체크 
 		   });
	   }else{
		   $('input:checkbox[name="sendListChk"]').each(function() {
	            $(this).prop("checked", false);//리스트의 모든 체크박스 체크 해제
           });
	   }
   });
   $("input[name='sendListChk']").on('click',function(){
	   if(($("input[name='sendListChkALL']").is(":checked"))){
		   $("input:checkbox[name='sendListChkALL']").prop("checked", false);
	   }
   });
   $("#chkALLDeleteBtn").on('click',function(){
	   var msg_noList="";
	   $chkList=$("input[name='sendListChk']:checked");
	   
	   $chkList.each(function (i,ob) { 
// 		   	console.log($(ob).val());
// 			selected.push($(ob).val());
			if(i!=0){
			   	msg_noList += "/"+$(ob).val();
			}else{
			   	msg_noList = $(ob).val();
			}
	   });
	   location.href="<%=request.getContextPath() %>/member/send/sendListdelete?msg_noList="+msg_noList;
	   
	   
   });
   $(".link li a").on("click", function(event){
      event.preventDefault(); 
      
      var targetPage = $(this).attr("href");
      
      var jobForm = $("#jobForm");
      jobForm.find("[name='page']").val(targetPage);
      jobForm.attr("action","listFreeBoardPage").attr("method", "get");
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
   
</script>
