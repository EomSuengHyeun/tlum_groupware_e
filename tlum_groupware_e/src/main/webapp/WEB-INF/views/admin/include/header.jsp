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
		header.main-header > div.admin-header{
			text-align: center;
		}
		
	</style>
	<title><decorator:title default="BOARD"/></title>
	<decorator:head/>
</head>
<body class="hold-transition skin-blue sidebar-mini">
	<!-- header -->
	<header class="main-header"> 
		<div class="admin-header">
			<h4> 관리자 모드 </h4>
		</div>
	</header>
	