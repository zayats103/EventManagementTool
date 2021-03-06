<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>404 - Page not found</title>
</head>
<style>
body {
	background: #f0ffff;
	margin: 0;
	padding: 20px;
	text-align: center;
	font-family: Arial, Helvetica, sans-serif;
	font-size: 14px;
	color: #666666;
}

.error_page {
	width: 600px;
	padding: 50px;
	margin: auto;
}

.error_page h1 {
	margin: 20px 0 0;
}

.error_page p {
	margin: 10px 0;
	padding: 0;
}

a {
	color: #006dcc;
	text-decoration: none;
}

a:hover {
	color: #006dcc;
	text-decoration: underline;
}
</style>

</head>

<body class="login">
	<div class="error_page">
		<h1>404</h1>
		<img alt="Sad face"
			src="<spring:url value="/web/img/404.gif" />" />
		<h1>We're sorry...</h1>
		<p>The page you are looking for cannot be found.</p>
		<p>
			<a href="<spring:url value="/home.html"/>">Return
				to the homepage</a>
		</p>
	</div>
</body>
</html>