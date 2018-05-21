<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     
	<!-- footer -->
	<footer>
		 푸터
	</footer>
	<!--END footer -->
     
	
	  
	<!-- <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script> -->
	<!-- <script src="http://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> -->
	
	<!-- jQuery 3 -->
	<script src="<%=request.getContextPath() %>/resources/bootstrap/js/jquery.min.js"></script>
	<script src="<%=request.getContextPath() %>/resources/bootstrap/js/bootstrap.js"></script>
	<script src="<%=request.getContextPath() %>/resources/bootstrap/js/jquery-ui.min.js"></script>
	<script src="<%=request.getContextPath() %>/resources/bootstrap/js/moment.js"></script>
	<script src="<%=request.getContextPath() %>/resources/bootstrap/js/fullcalendar.js"></script>
	<script>
	      $(function(){
	         if('${loginUser.emp_id}'==null||'${loginUser.emp_id}'==""){
	            alert("로그인을 하셔야 사용가능한 서비스 입니다.");
	            location.href="<%=request.getContextPath() %>/index";
	         }
	      });
	 </script>

  </body>
</html>









