<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="${ pageContext.servletContext.contextPath }/resources/assets/images/favicon.png">

    <title>WeCanvas</title>
    <!-- Custom CSS -->
    <link href="${ pageContext.servletContext.contextPath }/resources/assets/extra-libs/c3/c3.min.css" rel="stylesheet">
    <link href="${ pageContext.servletContext.contextPath }/resources/assets/libs/chartist/dist/chartist.min.css" rel="stylesheet">
    <link href="${ pageContext.servletContext.contextPath }/resources/assets/extra-libs/jvector/jquery-jvectormap-2.0.2.css" rel="stylesheet" />
    <link href="${ pageContext.servletContext.contextPath }/resources/dist/css/style.min.css" rel="stylesheet">
    
    <!-- JQuery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<style>
	
	
	.hidden{
	
	display:none important!;	
	
	}
	
	</style>
</head>
<body>


	<div id="main-wrapper" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full" data-sidebar-position="fixed" data-header-position="fixed" data-boxed-layout="full">
	<jsp:include page="${pageCOntext.servletContext.contextPath}/WEB-INF/views/common/m_header.jsp"/>
	<jsp:include page="${pageCOntext.servletContext.contextPath}/WEB-INF/views/common/m_sidebar.jsp"/>
	
	
		
	<div class="container-fuild" style="padding: 81px 0px 0px 265px;">
		<div class="col-12">
		<div class="card" >
			<div class="card-body"> 
				<h3 class="card-title font-weight-bold text-truncate text-dark font-weight-bold mb-1"> 설문 내용 </h3>
			<div class="insert-form-wrapper">
								<ul class="ref navbar-nav">
									<li>
										<div class="card-body">
											<h3 class="card-title font-weight-bold"> 제목 </h3>
											<input type="text" class="form-control title" name="title" value="${survey.surveyTitle}" readonly>
										</div>
                            		</li>
                            		<li>
                            			<div class="card-body">
											<h3 class="card-title font-weight-bold"> 내용 </h3>
											<textarea class="form-control content" rows="3" name="content" readonly>${survey.surveyContent}</textarea>
										</div>
                            		</li>
                            		<li>
                            			<div class="card-body">
											<h3 class="card-title font-weight-bold"> 작성일 </h3>
											<input type="date" class="form-control startDate" name="startDate" value="${survey.writeDate}" pattern="\d{4}-\d{2}-\d{2}" readonly>
										</div>
                            		</li>
                            		<li>
                            			<div class="card-body">
											<h3 class="card-title font-weight-bold"> 시작일</h3>
											<input type="date" class="form-control finishDate" name="finishDate" value="${survey.startDate}" readonly>
										</div>
                            		</li>
                            		
                            		<li>
                            			<div class="card-body">
											<h3 class="card-title font-weight-bold"> 마감일</h3>
											<input type="text" class="form-control finishDate" name="statement" value="${survey.finishDate}" readonly>
										</div>
                            		</li>
                            		
                            		<li>
                            			<div class="card-body">
											<h3 class="card-title font-weight-bold"> 게시 상태</h3>
											<input type="text" class="form-control finishDate" name="statement" value="${survey.statement}" readonly>
										</div>
                            		</li>
                            		<li>
                            			<div class="btn-list">
                            				<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#info-alert-modal" class="preview">미리보기</button>
                            				<!-- Right modal -->
                            				<button type="button" class="btn btn-secondary" onclick="location.href='pNoticeUpdateForm.no?popNo='+${pNotice.popNo}">수정하기</button>
                            				<button type="button" class="btn btn-dark" onclick="history.back();">공지목록</button>
                            			</div>
                            		</li>
                            	</ul>
                            
			</div>

		</div>
		</div>
		
	</div>
	</div>
	</div>
	
	<script>
	
	
		
 	</script>
	
	
	<script src="${ pageContext.servletContext.contextPath }/resources/assets/libs/jquery/dist/jquery.min.js"></script>
    <script src="${ pageContext.servletContext.contextPath }/resources/assets/libs/popper.js/dist/umd/popper.min.js"></script>
    <script src="${ pageContext.servletContext.contextPath }/resources/assets/libs/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- apps -->
    <!-- apps -->
    <script src="${ pageContext.servletContext.contextPath }/resources/dist/js/app-style-switcher.js"></script>
    <script src="${ pageContext.servletContext.contextPath }/resources/dist/js/feather.min.js"></script>
    <script src="${ pageContext.servletContext.contextPath }/resources/assets/libs/perfect-scrollbar/dist/perfect-scrollbar.jquery.min.js"></script>
    <script src="${ pageContext.servletContext.contextPath }/resources/dist/js/sidebarmenu.js"></script>
    <!--Custom JavaScript -->
    <script src="${ pageContext.servletContext.contextPath }/resources/dist/js/custom.min.js"></script>
    <!--This page JavaScript -->
    <script src="${ pageContext.servletContext.contextPath }/resources/assets/extra-libs/c3/d3.min.js"></script>
    <script src="${ pageContext.servletContext.contextPath }/resources/assets/extra-libs/c3/c3.min.js"></script>
    <script src="${ pageContext.servletContext.contextPath }/resources/assets/libs/chartist/dist/chartist.min.js"></script>
    <script src="${ pageContext.servletContext.contextPath }/resources/assets/libs/chartist-plugin-tooltips/dist/chartist-plugin-tooltip.min.js"></script>
    <script src="${ pageContext.servletContext.contextPath }/resources/assets/extra-libs/jvector/jquery-jvectormap-2.0.2.min.js"></script>
    <script src="${ pageContext.servletContext.contextPath }/resources/assets/extra-libs/jvector/jquery-jvectormap-world-mill-en.js"></script>
    <script src="${ pageContext.servletContext.contextPath }/resources/dist/js/pages/dashboards/dashboard1.min.js"></script>
	
</body>
</html>