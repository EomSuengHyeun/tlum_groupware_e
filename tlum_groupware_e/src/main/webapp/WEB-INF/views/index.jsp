<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
   <style type="text/css">
         /*body*/
      body{
         background-image: url('<%=request.getContextPath() %>/resources/images/login/background.jpg');
      
      }
      
      #login-tab{
         width: 400px;
         height: 200px;
         border: 1px solid #333;
         background: #fff;
         
         /*위치 지정*/
         margin: 0px auto;
          margin-top: 200px;
      }
      div.tab-content>div>form{
         padding:30px;
      }
      div.tab-content>div>form>table {
         margin:0 10px 0 0;
         float:left;
      }
      div.tab-content>div>form>button {
         float:left;
         height:60px;
         
      }
      /*login table*/
      div.tab-content>div>form>table tr td {
         padding-bottom: 10px;
      }
      /*logo Img*/
      #loginLogo{
          width: 700px;
/*           left: 100px; */
      }
      #loginglogodiv{
          text-align: center;
          margin: 0px auto;
          margin-top: 100px;
      }
      
      
   </style>
   <link href="<%=request.getContextPath() %>/resources/bootstrap/css/bootstrap-theme.min.css" rel="stylesheet" type="text/css" />
   <link href="<%=request.getContextPath() %>/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
   <!-- fullCalendar -->
   <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/css/fullcalendar.min.css">
   <!-- 라벨떼메 써야함. -->
   <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/css/AdminLTE.min.css">
   
</head>
<body>
   <div id="loginglogodiv">
      <img id="loginLogo" src="<%=request.getContextPath() %>/resources/images/login/Logo.png"/>
   </div>
   <div id="login-tab">
      <div role="tabpanel">
         <!-- Nav tabs -->
         <ul class="nav nav-tabs" role="tablist">
            <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab"><h4>임직원</h4></a></li>
            <li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab"><h4>관리자</h4></a></li>
         </ul>
         
         <!-- Tab panes -->
         <div class="tab-content">
               <div role="tabpanel" class="tab-pane active" id="home">
            <!-- 임직원 로그인 페이지 -->
                  <form action="empLoginPost" id="empLoginForm" role="form" method="post">
                     <table>
                        <tr>
                           <td>사원번호</td>
                           <td><input type="text" placeholder="사원번호를 입력하세요" name="emp_id"/></td>
                        </tr>
                        <tr>
                           <td>비밀번호</td>
                           <td><input type="password" placeholder="비밀번호를 입력하세요." name="emp_password"/></td>
                        </tr>
                     </table>
                     <button type="submit" class="btn btn-primary"> 로그인 </button>
                  </form>
               </div>
               <!-- 임직원 로그인 페이지 끝-->
               
               <div role="tabpanel" class="tab-pane" id="profile">
               <!-- 관리자 로그인 페이지 -->
               
                  <form action="adminLoginPost" id="adminLoginForm" role="form" method="post">
                     <table>
                        <tr>
                           <td> 관리자ID </td>
                           <td> <input type="text" placeholder="관리자ID를 입력하세요"/> </td>
                        </tr>
                        <tr>
                           <td>비밀번호</td>
                           <td> <input type="password" placeholder="비밀번호를 입력하세요."/> </td>
                        </tr>
                     </table>
<!--                      <button type="submit" class="btn btn-primary"> 로그인 </button> -->
                     <button type="submit"  class="btn btn-primary"> 로그인 </button>
                  </form>
               </div>   
               <!-- 관리자 로그인 페이지 끝 -->
               
         </div>
      </div>
   </div>

   <script src="<%=request.getContextPath() %>/resources/bootstrap/js/jquery.min.js"></script>
   <script src="<%=request.getContextPath() %>/resources/bootstrap/js/bootstrap.js"></script>
   <script src="<%=request.getContextPath() %>/resources/bootstrap/js/jquery-ui.min.js"></script>
   <script src="<%=request.getContextPath() %>/resources/bootstrap/js/moment.js"></script>
   <script src="<%=request.getContextPath() %>/resources/bootstrap/js/fullcalendar.js"></script>
   <script type="text/javascript">
        $(function(){
           if("${msg}"=="False"){
              alert("로그인실패");
           }
        });
//       $("#empLoginForm").submit(function(event){
//          event.preventDefault();
         
//          $(this).get(0).submit();
//       })
//       /member/emp/loginPost

   /* function emp_login_go(){
      console.log($('#empLoginForm').serialize());
         $.ajax({
            url:"/emp/loginPost",
            data:$('#empLoginForm').serialize(),
            type:"post",
            dataType:'json',            
            beforeSend:function(xhr){
               xhr.setRequestHeader("Accept","application/json");         
            }
         }).done(function(body){
            var message=body.message;
            var retUrl=body.retUrl;
            var error=body.error;
            
            alert(message);
            
            if(error){
               $('input[name="emp_password"]').val("");   
            }else{
               location.href=retUrl;
               
            }
            alert(retUrl);
//             location.href=retUrl; 
         });
      };
    */
   </script>
</body>
</html>