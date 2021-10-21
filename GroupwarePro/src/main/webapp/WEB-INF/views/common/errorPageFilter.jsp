<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

		<c:if test="${requestScope['javax.servlet.error.status_code'] == 404}">
			<p>요청하신 페이지를 찾을 수 없습니다.</p>    
		</c:if>

		
		<c:if test="${requestScope['javax.servlet.error.status_code'] == 500}">
			<p>서버에 오류가 발생하여 요청을 수행할 수 없습니다.</p>
		</c:if>
		

		
        <a href="${ pageContext.servletContext.contextPath }">HOME</a>
		
	</div>
	<br>
	
	<jsp:include page="footer.jsp"/>
</body>
</html>