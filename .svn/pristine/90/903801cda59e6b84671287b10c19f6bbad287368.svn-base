<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" buffer="8kb"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>	
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>	
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<!doctype html>
<html>
	
	<head>
		<meta charset="utf-8">
		<meta content="width=device-width, initial-scale=1.0" name="viewport">
<%-- 		<security:csrfMetaTags/> --%>
		<title>BlueMine</title>
<!-- 		<meta content="" name="description"> -->
<!-- 		<meta content="" name="keywords"> -->
		
		<!-- Favicons -->
<!-- 		<link href="assets/img/favicon.png" rel="icon"> -->
<!-- 		<link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon"> -->
		
		<!-- Google Fonts -->
		<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Jost:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
		
		<!-- Vendor CSS Files -->
		<link href="<%=request.getContextPath()%>/resources/js/bootstrap/css/bootstrap.min.css" rel="stylesheet">
		<link href="<%=request.getContextPath()%>/resources/css/style.css" rel="stylesheet">
<!-- 		<link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet"> -->
		
		<!-- Template Main CSS File -->
		<%-- <link href="<%=request.getContextPath()%>/resources/css/style.css" rel="stylesheet"> --%>
		<tiles:insertAttribute name="preScript" />
		<style>
			a{
			    text-decoration: none;
			}
		</style>
	</head>
	
	<body class="d-flex flex-column vh-100">
		<header id="header" class="fixed-top ">
			<tiles:insertAttribute name="headerMenu" />
		</header>
	

		<div class="row">
			<!-- Main Content Area start -->
			<main id="main">
				<tiles:insertAttribute name="content" />
			</main>		
			<!-- Main Content Area end -->
		</div>

	
		<!-- ======= Footer ======= -->
		<footer id="footer">
			<tiles:insertAttribute name="footer" />
		</footer>

		
		<tiles:insertAttribute name="postScript" />
	</body>
</html>
