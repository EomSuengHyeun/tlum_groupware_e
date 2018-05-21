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
					<input type="text" name="free_board_bno" value="${freeBoardVO.free_board_bno}"/>
					<input type="text" name="free_board_title" value="${freeBoardVO.free_board_title}"/>
						
					<input type="hidden" name="free_board_content" value="${freeBoardVO.free_board_content }"/><br/>
					<input type="text" name="emp_id" value="${freeBoardVO.emp_id }"/><br/>
					<input type="text" name="emp_name" value="${freeBoardVO.emp_name }"/><br/>
				
				</form>
					<div class="box-footer">
				             <button type="submit" id="modifyBtn" class="btn btn-warning">Modify</button>
				             <button type="submit" id="removeBtn" class="btn btn-danger">REMOVE</button>
				             <button type="submit" id="listBtn" class="btn btn-primary">GO LIST</button>
				   	</div>
			   	</div>
			   		   	<div class="row">
      <div class="col-md-12">

         <div class="box box-success">
            <div class="box-header">
               <h3 class="box-title">ADD NEW REPLY</h3>
            </div>
            <div class="box-body">
               <label for="exampleInputEmail1">Writer</label>
               <input class="form-control" type="text" placeholder="아이디" id="newReplyWriter"> 
               <label for="exampleInputEmail1">Reply Text</label>
               <input class="form-control" type="text"   placeholder="reply_text" id="newReplyText">

            </div>
            <!-- /.box-body -->
            
            
            <div class="box-footer">
               <button type="button" class="btn btn-primary" id="replyAddBtn">ADD
                  REPLY</button>
            </div>
         </div>


         <!-- The time line -->
         <ul class="timeline">
            <!-- timeline time label -->
            <li class="time-label" id="repliesDiv"><span class="bg-green">
                  Replies List </span></li>
         </ul>

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
	      <div class="modal-footer">
	        <button type="button" class="btn btn-info" id="replyModBtn">Modify</button>
	        <button type="button" class="btn btn-danger" id="replyDelBtn">DELETE</button>
	        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	      </div>
	    </div>
	  </div>
	</div>      
   
   	</section>
<script type="text/javascript"></script> 
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="<%=request.getContextPath() %>/resources/bootstrap/js/jquery.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/bootstrap/js/bootstrap.js"></script>
<script src="<%=request.getContextPath() %>/resources/bootstrap/js/jquery-ui.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/bootstrap/js/moment.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.0.11/handlebars.js"></script>
<script id="template" type="text/x-handlebars-template">
{{#each .}}
<li class="replyLi" data-rno={{reply_no}}>
<i class="fa fa-comments bg-blue"></i>
 <div class="timeline-item" >
  <span class="time">
    <i class="fa fa-clock-o"></i>{{prettifyDate reply_regdate}}
  </span>
  <h3 class="timeline-header"><strong>{{reply_no}}</strong> -{{emp_id}}</h3>
  <div class="timeline-body">{{reply_text}} </div>
    <div class="timeline-footer">
     <a class="btn btn-primary btn-xs" 
       data-toggle="modal" data-target="#modifyModal">Modify</a>
    </div>
  </div>         
</li>
{{/each}}
</script>
<script id="templateAttach" type="ttext/x-handlebars-template">
<li style="width:10%;font-size:0.8em;" data-src="{{fullName}}">
   <span class="mailbox-attachment-icon has-img">
      <img src="{{imgsrc}}" alt="Attachment"></span>
    <div class="mailbox-attachment-info">
     <a href="{{getLink}}" class="mailbox-attachment-name">{{fileName}}</a>
     </div>
</li>
</script>
<script>
	$( function() {
// 	  $("input[name='emp_birthday']").datepicker();
// 	  $("input[name='emp_entry_date']").datepicker();

      var formObj = $("form[role='form']");

//       console.log(formObj);

      $("#modifyBtn").on("click", function() {
         formObj.attr("action", "update");
         formObj.attr("method", "GET");
         formObj.submit();
      });

      $("#removeBtn").on("click", function() {
    	  
    	  var arr=[];
    	  $('.uploadedList li').each(function(event){
    		  arr.push($(this).attr("data-src"));
    		  
    	  });
    	  if(arr.length>0){
    		  $.post('<%=request.getContextPath()%>/deleteAllFiles',{files:arr},function(){});
    	  }
         formObj.attr("action", "delete");
         formObj.submit();
      });

      $("#listBtn").on("click", function() {
         formObj.attr("method", "get");
         formObj.attr("action", "freeBoardList");
         formObj.submit();
      });
	} );
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
	/* 댓글*/
	
	   Handlebars.registerHelper("prettifyDate",function(timeValue){
       var dateObj=new Date(timeValue);
       var year=dateObj.getFullYear();
       var month=dateObj.getMonth();
       var date=dateObj.getDate();
       return year+"/"+month+"/"+date;
    })
	
	
	 var printPaging=function(pageMaker,target){
      var str="";
      if(pageMaker.prev){
         str+="<li><a href='"+(pageMaker.startPage-1)+"'> [<<] </a></li>";
      }
      
      for(var i=pageMaker.startPage,len=pageMaker.endPage;i<len;i++){
         var strClass= ((pageMaker.cri.page==i) ? 'calss=active' : '');   
         str+="<li "+strClass+"> <a href='"+i+"'>"+i+"</a></li>";
      }   
      
      if(pageMaker.next){
         str+="<li><a href='"+(pageMaker.endPage+1)+"'> [>>] </a></li>";
      }
      target.html(str);
      
   }
	
	
	var free_board_bno=${freeBoardVO.free_board_bno}
   	var template=Handlebars.compile($('#templateAttach').html());
	var replyPage=1;
	
	getPage("<%=request.getContextPath()%>/freeBoardReplies/"+free_board_bno+"/"+replyPage);
	
	function getPage(pageInfo){
	    $.getJSON(pageInfo,function(data){//Map은 넘겨받을때 JSON으로 넘겨받음
	    	console.log(data.reply_regdate);
	    	console.log(data);
	        printDate(data.list,$('#repliesDiv'),$("#template"));
	          printPaging(data.pageMaker, $('#pagination'));
	    });
	}
	
    var printDate=function(replyArr,target,templateObject){
        var template=Handlebars.compile(templateObject.html());
        var html=template(replyArr);
        $('.replyLi').remove();
        target.after(html);
     }
	

	
	 $('#replyAddBtn').on('click',function(event){
      var emp_id=$('#newReplyWriter').val();
      var reply_text=$('#newReplyText').val();
      
      if(emp_id==""){
         alert('댓글 작성자는 필수입니다.');
         $('#newReplyWriter').focus();
         return;
      }
      if(reply_text==""){
         alert('댓글 내용은 필수입니다.');
         $('#newReplyText').focus();
         return;
      }
      
      $.ajax({
         type:"post",
         url:"<%=request.getContextPath()%>/freeBoardReplies",
         headers:{
            "Content-Type":"application/json",
            "X-HTTP-Method-Override":"post"
         },
         dataType:'text',
         data:JSON.stringify({
            "free_board_bno":free_board_bno,
            "emp_id":emp_id,
            "reply_text":reply_text
         }),
         success:function(data){
            if(data="SUCCESS"){
               alert('등록되었습니다.');
            }
            replyPage=1;
            getPage("<%=request.getContextPath()%>/freeBoardReplies/"+free_board_bno+"/"+replyPage);
            $('#newReplyWriter').val("");
            $('#newReplyText').val("");
         }
      });
   });
   
   $('.pagination').on('click','li a',function(){
      event.preventDefault();
      
      var replyPage=$(this).attr('href');
      
      getPage("<%=request.getContextPath()%>/freeBoardReplies/"+free_board_bno+"/"+replyPage);
      
   });
   
   
   $('.timeline').on('click','.replyLi',function(){
      var reply=$(this);
      $('#replytext').val(reply.find('.timeline-body').text());
//       $('.modal-title').text(reply.attr('data-rno'));
      $('.modal-title').html(reply.attr('data-rno'));
      
   });

   $('#replyDelBtn').on('click',function(event){
      var rno=$('.modal-title').html();
      $.ajax({
         type:'DELETE',
         url:'<%=request.getContextPath()%>/freeBoardReplies/'+reply_no,
         headers:{
            "Content-Type":"application/json",
            "X-HTTP-Method-Override":"DELETE"
         },
         dataType:'text',
         data:"",
         success:function(result){
            if(result=="SUCCESS"){
               alert('삭제가 완료됫습니다.');
               $('#modifyModal').modal('hide');
               getPage("<%=request.getContextPath()%>/freeBoardReplies/"+free_board_bno+"/"+replyPage);
            }
         }
            
            
      });   
   });
   /*댓글 끝*/
</script>
</body>
</html>