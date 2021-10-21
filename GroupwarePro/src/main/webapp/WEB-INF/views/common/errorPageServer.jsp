<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="menubar.jsp"/>
	
	<br>
	<div align="center">	
		<br><br>
		<h1 style="font-weight:bold">${ msg }</h1>
		<h5 style="color: red;">${ requestScope['javax.servlet.error.message'] }</h2>
		
	</div>
	<br>
	
	<jsp:include page="footer.jsp"/>
</body>
</html>