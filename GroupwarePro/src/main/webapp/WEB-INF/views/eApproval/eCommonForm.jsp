<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style>
	th {
		width: 100px;
		text-align: center;
		background-color: rgba(0,0,0,.125);
	}
	
	table, td, th {
		border-collapse : collapse;
	}
</style>
</head>
<body>
	<div class="row col-12">
		<h1 class="m-auto">${ea.FName }</h1>
	</div>
	<br><br><br>
	<div class="row col-12 m-auto">
		<div class="col-md-6">
			<table border='1' style="height: 104px;">
				<tr>
					<th>기안자</th>
					<td style="width: 150px">${ea.drafterName }</td>
				</tr>
				<tr>
					<th>기안부서</th>
					<td>${ea.drafterDept }</td>
				</tr>
				<tr>
					<th>기안일</th>
					<c:choose>
						<c:when test="${empty ea.draftDate }">
							<c:set var="today" value="<%= new java.util.Date() %>"/>
							<td><fmt:formatDate value="${today}" type="date" pattern="yyyy-MM-dd(E)"/></td>
						</c:when>
						<c:otherwise>
							<td><fmt:formatDate value="${ea.draftDate}" type="date" pattern="yyyy-MM-dd(E)"/></td>
						</c:otherwise>
					</c:choose>
				</tr>
				<tr>
					<th>문서번호</th>
					<c:choose>
						<c:when test="${ea.SCode eq 2}">
							<td>${ea.ENo}</td>
						</c:when>
						<c:when test="${empty ea.SCode }">
							<td></td>
						</c:when>
						<c:otherwise>
							<td></td>
						</c:otherwise>
					</c:choose>
				</tr>
			</table>
		</div>
		<div class="col-md-6">
			<table class="text-center" border='1' style="height: 104px; float: right;">
				<tr>
					<th rowspan="3" style="width: 26px;">결재선</th>
					<td style="min-width: 70px; height: 27px;">${ea.approverJob }</td>
				</tr>
				<tr>
					<td>
						<c:if test="${ea.SCode eq 2 }">
							<h4 style="color: red">승인</h4>
						</c:if>
						${ea.approverName }
					</td>
				</tr>
				<tr>
					<td style="max-height: 27px; height: 27px; font-size: 10px;">
						<c:choose>
							<c:when test="${ea.SCode eq 2 }">
								<fmt:formatDate value="${ea.approveDate}" type="date" pattern="yyyy/MM/dd"/>
							</c:when>
							<c:when test="${ea.SCode eq 3 }">
								<fmt:formatDate value="${ea.approveDate}" type="date" pattern="yyyy/MM/dd"/>(반려)
							</c:when>
						</c:choose>
					</td>
				</tr>
			</table>
		</div>
	</div>
	<br><br>
	<div class="row col-12 m-auto">
		<div class="col-12">
			<table border='1' class="col-12">
				<tr>
					<th>제목</th>
					<td>
					<c:choose>
						<c:when test="${ea.drafterId != loginUser.empNo}">
							<input class="col-12" type="text" value="${ea.title }" name="title" readonly>
						</c:when>
						<c:otherwise>
							<input class="col-12" type="text" value="${ea.title }" name="title" required>
						</c:otherwise>
					</c:choose>
					</td>
				</tr>
			</table>
		</div>
	</div>
	<br><br>
	<div class="row col-12 m-auto">
		<div class="col-12">
			<table border='1' class="col-12">
				<tr>
					<th>내용</th>
					<td>
						<c:choose>
							<c:when test="${ea.drafterId != loginUser.empNo}">
								<textarea class="col-12" name="content" rows="3" readonly>${ea.content }</textarea>
							</c:when>
							<c:otherwise>
								<textarea class="col-12" name="content" rows="3" required>${ea.content }</textarea>
						</c:otherwise>
						</c:choose>
					</td>
				</tr>
				<tr>
					<th>첨부파일</th>
					<td>
						<c:choose>
							<c:when test="${empty ea.originName && ea.SCode eq 0}">
								<input type="file" id="upfile" name="uploadFile">
							</c:when>
							<c:when test="${!empty ea.originName && ea.SCode eq 1 && ea.drafterId eq loginUser.empNo}">
								<input type="file" id="upfile" name="uploadFile">현재 업로드된 파일 : ${ ea.originName }
							</c:when>
							<c:when test="${ea.drafterId eq loginUser.empNo && ea.SCode eq 3 && !empty ea.originName }">
								<input type="file" id="upfile" name="uploadFile">현재 업로드된 파일 : ${ ea.originName }
							</c:when>
							<c:when test="${ea.drafterId eq loginUser.empNo && ea.SCode eq 3 && empty ea.originName }">
								<input type="file" id="upfile" name="uploadFile">현재 업로드된 파일 : ${ ea.originName }
							</c:when>
							<c:otherwise>
								<a href="${ pageContext.servletContext.contextPath }/resources/upload_files/${ea.changeName}" download="${ ea.originName }">${ ea.originName }</a>
							</c:otherwise>
						</c:choose>
					</td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>