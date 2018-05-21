<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> --%>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>

<html>
<head>
	<link href="<%=request.getContextPath() %>/resources/bootstrap/css/bootstrap-theme.min.css" rel="stylesheet" type="text/css" />
	<link href="<%=request.getContextPath() %>/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
	<!-- fullCalendar -->
	<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/css/fullcalendar.min.css">
	<!-- 라벨떼메 써야함. -->
	<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/css/AdminLTE.min.css">
	<!-- 데이트피커 -->
    <link rel='stylesheet' type='text/css'href='<%=request.getContextPath() %>/resources/bootstrap/css/timepicki.css'/>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
	<!-- 아이콘 -->
	<link rel="stylesheet" href="http://icono-49d6.kxcdn.com/icono.min.css">
	
	<style type="text/css">
		{
			padding:0px;
			margin:0px;
		}
		/* 테스트용 border */
		header, footer{
			border: 1px solid #333333; 
		}
		.reftMenu{
			border: 1px solid #333333; 
		}
		.aside{
			border: 1px solid #333333; 
		}
		.content{
			border: 1px solid #333333; 
			height: 715px;
			padding:15px 0 0 0;
		}
		header{
			width: 100%;
			height: 50px;
		}
		footer{
			width: 100%;
			height: 100px;
		}
		#reftMenu, .aside{
			float: left;
			height: 700px;
			overflow: hidden;
		}
		#reftMenu{
			width: 12.5%;
		}	
		.aside{
			width: 87.5%;
		}	
		/*header*/
		header > #headerLogin{
			width: 100%;
			height:20px;
			text-align: right;
			width: 100%;
		}
		#headerMenu{
			width: 100%;
			height:45px;
			overflow: hidden;
		}
		#headerMenu > div{
			float: left;
/* 			height:85px; */
			height:45px;
			width: 12.5%;
			text-align: center;
			margin: auto;
			border: 1px solid #333333; 
		}
		#headerMenu > div > h4{
			font-weight: bold;
		}
		/*Menu*/
		#headerMenu>div{
			background: #74b7ff;
		}
		#headerMenu>div.action{
			background
		}
		
	</style>
	<title><decorator:title default="BOARD"/></title>
	<decorator:head/>
</head>
<body class="hold-transition skin-blue sidebar-mini">
	<!-- header -->
	<header class="main-header"> 
		<div id="headerLogin">
			MIMI님 환영해여
		</div>
		<div id="headerMenu">
			<div id="Menu1">
				<h4>
					TLUM
				</h4>
			</div>
			<div id="Menu2">
				<h4>
					결재
				</h4>
			</div>
			<div id="Menu3">
				<h4>
					자료실
				</h4>
			</div>
			<div id="Menu4">
				<h4>
					일정
				</h4>
			</div>
			<div id="Menu5">
				<h4>
					게시판
				</h4>
			</div>
			<div id="Menu6">
				<h4>
					쪽지
				</h4>
			</div>
			<div id="Menu7">
				<h4>
					증명서/명세서
				</h4>
			</div>
			<div id="Menu8">
				<h4>
					개인정보
				</h4>
			</div>
		</div>
	</header>
	