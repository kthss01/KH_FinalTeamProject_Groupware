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
	
		<img src="${ pageContext.servletContext.contextPath }/resources/images/error.png" width="300">
		<br><br>
		<h1 style="font-weight:bold">${ msg }</h1>
		<h1 style="font-weight:bold">${ ref_form }</h1>
		<h5 style="color: red;"> ${ requestScope['javax.servlet.error.message'] }</h5>
	
		<!-- 
		  - javax.servlet.error.status_code (오류 상태 코드)
		  - javax.servlet.error.message (오류 메시지)
		  - javax.servlet.error.request_uri (오류가 발생한 요청 URI)
		  - javax.servlet.error.exception (발생한 예외처리 내용)
		  - javax.servlet.error.servelt_name (오류가 발생한 Servlet)
		
		
		 -->
	</div>
	<br>
	
	<jsp:include page="footer.jsp"/>
</body>
</html>