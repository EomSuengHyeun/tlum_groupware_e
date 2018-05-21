<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<form role="form" action="modify" method="POST">
	
<%-- 		<fmt:formatDate var="fmtDate" value="${form.bean.dateProperty}" pattern="dd/MM/yyyy"/> --%>
<%-- 		<input type="text" name="bean.dateProperty" value="${fmtDate}"/> --%>
		
		
		<fmt:formatDate var="emp_birthday" value="${employee.emp_birthday}"  pattern="yyyy-MM-dd" />
		<fmt:formatDate var="emp_entry_date" value="${employee.emp_entry_date}"  pattern="yyyy-MM-dd" />

		<input type="text" name="emp_birthday" value="${emp_birthday}"/>
		<input type="text" name="emp_entry_date" value="${emp_entry_date}"/>
		
		<input type="hidden" name="emp_id" value="${employee.emp_id }"/><br/>

		${employee.emp_id }<br/>
		
		<input type="password" name ="emp_password" value="${employee.emp_password }"><br/>
		<input type="text" name ="emp_address" value="${employee.emp_address }"><br/>
		<input type="text" name ="emp_email" value="${employee.emp_email }"><br/>
		<input type="text" name ="emp_phone" value="${employee.emp_phone }"><br/>
		
		<h4>관리자용</h4>
		<input type="text" name ="emp_current_status" value="${employee.emp_current_status }"><br/>
		<input type="text" name ="grade_no" value="${employee.grade_no }"><br/>
		<input type="text" name ="position_no" value="${employee.position_no }"><br/>
		<input type="text" name ="dep_no" value="${employee.dep_no }"><br/>
		<input type="submit" value="변경"/>
		
	</form>
	<div class="box-footer">
             <button type="submit" id="modifyBtn" class="btn btn-warning">Modify</button>
             <button type="submit" id="removeBtn" class="btn btn-danger">REMOVE</button>
             <button type="submit" id="listBtn" class="btn btn-primary">GO LIST</button>
    </div>
    
<script type="text/javascript"></script> 
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
	$( function() {
	  $("input[name='emp_birthday']").datepicker();
	  $("input[name='emp_entry_date']").datepicker();

      var formObj = $("form[role='form']");

      console.log(formObj);

      $("#modifyBtn").on("click", function() {
    	 alert("asdasda");
         formObj.attr("action", "modify");
         formObj.attr("method", "POST");
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
         formObj.attr("action", "listEmp");
         formObj.submit();
      });
	} );

</script>

