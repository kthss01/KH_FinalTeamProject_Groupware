<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	.title:hover{
		cursor: pointer;
	}
	
	.dLists:hover{
		background-color: rgba(0,0,0,.125);
	}
</style>
<link rel="icon" type="image/png" sizes="16x16"
	href="${ pageContext.servletContext.contextPath }/resources/assets/images/favicon.png">
<!-- Custom CSS -->
<link
	href="${ pageContext.servletContext.contextPath }/resources/dist/css/style.min.css"
	rel="stylesheet">
<!-- summernote -->
<link rel="stylesheet"
	href="${ pageContext.servletContext.contextPath }/resources/summernote/summernote-lite.css">

<title>Insert title here</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

</head>
<body>
	<!-- ============================================================== -->
	<!-- Preloader - style you can find in spinners.css -->
	<!-- ============================================================== -->
	<div class="preloader">
		<div class="lds-ripple">
			<div class="lds-pos"></div>
			<div class="lds-pos"></div>
		</div>
	</div>
	<!-- ============================================================== -->
	<!-- Main wrapper - style you can find in pages.scss -->
	<!-- ============================================================== -->
	<div id="main-wrapper" data-theme="light" data-layout="vertical"
		data-navbarbg="skin6" data-sidebartype="full"
		data-sidebar-position="fixed" data-header-position="fixed"
		data-boxed-layout="full">
		<!-- ============================================================== -->
		<!-- Topbar header - style you can find in pages.scss -->
		<jsp:include page="../common/header.jsp" />

		<!-- ============================================================== -->
		<!-- End Topbar header -->
		<!-- ============================================================== -->
		<!-- ============================================================== -->
		<!-- Left Sidebar - style you can find in sidebar.scss  -->
		<jsp:include page="../common/sidebar.jsp" />

		<!-- ============================================================== -->
		<!-- End Left Sidebar - style you can find in sidebar.scss  -->
		<!-- ============================================================== -->
		<!-- ============================================================== -->
		<!-- Page wrapper  -->
		<!-- ============================================================== -->
		<div class="page-wrapper" style=" background-color: white;">
			<!-- ============================================================== -->
			<!-- Bread crumb and right sidebar toggle -->
			<!-- ============================================================== -->
			<!-- ============================================================== -->
			<!-- End Bread crumb and right sidebar toggle -->
			<!-- ============================================================== -->
			<!-- ============================================================== -->
			<!-- Container fluid  -->
			<!-- ============================================================== -->
			<div class="container-fluid" style="height: 100%">
				<!-- ============================================================== -->
				<!-- Start Page Content -->
				<!-- ============================================================== -->
				
				<div class="row" style="min-height: 500px;">
					<!-- 전자결재 사이드바 -->
					<div class="col-2" style="border-right: 1px solid rgba(0,0,0,.125);">
	                	
	                	<button type="button" class="btn waves-effect waves-light btn-rounded btn-outline-primary col-12">새 결재 진행</button>
	                	<br><br>
                        <h6 class="card-title">결재하기</h6>
                        <div class="list-group"> 
			           		<a href="wait.ap" class="list-group-item">결재 대기 문서</a><!-- wait -->
                       	</div>
                       	<br>
                       	<h6 class="card-title">개인 문서함</h6>
                        <div class="list-group"> 
			           		<a href="draftD.ap" class="list-group-item">기안 문서함</a>
                        	<a href="apprD.ap" class="list-group-item">결재 문서함</a> 
                       	</div>
                       	<br>
                       	<h6 class="card-title">문서함</h6>
                        <div class="list-group"> 
			           		<a href="eFormList.ap" class="list-group-item">전자결재 양식</a>
                       	</div>
					</div>
					
					<div class="col-10">
						<h3>결재하기</h3>
						<br>
						
						<!-- 1. 내가 기안자 : 수정하기, 기안취소하기-->
						<!-- 2. 내가 결재자 : 결재하기, 반려하기-->
						<!-- 3. 결재완료 문서(완료, 반려) -->
						<c:set value="${sessionScope.loginUser.empNo}" var="loginUser"/>
						<c:set value="${ea.approverId}" var="approverId"/>
						<c:set value="${ea.drafterId}" var="drafterId"/>
						<c:set value="${ea.SCode}" var="sCode"/>
						
						<form method="POST">
							<div class="row" style="margin:10px;">
							<c:choose>
								<c:when test="${approverId == loginUser && sCode == 1}">
									<button type="submit" formaction="approve.ap" name="sCode" value="2" class="btn waves-effect waves-light btn-outline-secondary" style="margin-right: 10px;">결재</button>
									<button type="submit" formaction="approve.ap" name="sCode" value="3" class="btn waves-effect waves-light btn-outline-secondary">반려</button>
								</c:when>
								<c:when test="${drafterId == loginUser && sCode == 1}">
									<button type="submit" formaction="update.ap" class="btn waves-effect waves-light btn-outline-secondary" style="margin-right: 10px;">수정</button>
									<button type="submit" formaction="delete.ap" class="btn waves-effect waves-light btn-outline-secondary">취소</button>
								</c:when>
							</c:choose>
							</div>
							
							<div class="row" style="margin:10px; padding-bottom: 20px; border: 1px solid rgba(0,0,0,.125);">
								<!-- 공통 문서 양식 -->
								<jsp:include page="eCommonForm.jsp" flush="true">
									<jsp:param name="ea" value="${ea }" />
								</jsp:include>
								<input type="hidden" name="eNo" value="${ea.ENo }">
								<input type="hidden" name="fNo" value="${ea.FNo }">
								<input type="hidden" name="drafterId" value="${ea.drafterId }">
								<input type="hidden" name="approverId" value="${ea.approverId }">
								
								<!-- 추가 문서 양식 -->
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- ============================================================== -->
	<!-- End PAge Content -->
	<!-- ============================================================== -->
	<!-- ============================================================== -->
	<!-- Right sidebar -->
	<!-- ============================================================== -->
	<!-- .right-sidebar -->
	<!-- ============================================================== -->
	<!-- End Right sidebar -->
	<!-- ============================================================== -->
	<!-- ============================================================== -->
	<!-- End Container fluid  -->
	<!-- ============================================================== -->
	<!-- ============================================================== -->
	<!-- footer -->
	<!-- ============================================================== -->
	<footer class="footer text-center text-muted">
		All Rights Reserved by Adminmart. Designed and Developed by <a
			href="https://wrappixel.com">WrapPixel</a>.
	</footer>
	<!-- ============================================================== -->
	<!-- End footer -->
	<!-- ============================================================== -->

	<!-- ============================================================== -->
	<!-- End Wrapper -->
	<!-- ============================================================== -->
	<!-- End Wrapper -->
	<!-- ============================================================== -->
	<!-- All Jquery -->
	<!-- ============================================================== -->

	
	<script
		src="${ pageContext.servletContext.contextPath }/resources/assets/libs/jquery/dist/jquery.min.js"></script>
	<!-- Bootstrap tether Core JavaScript -->
	<script
		src="${ pageContext.servletContext.contextPath }/resources/assets/libs/popper.js/dist/umd/popper.min.js"></script>
	<script
		src="${ pageContext.servletContext.contextPath }/resources/assets/libs/bootstrap/dist/js/bootstrap.min.js"></script>
	<!-- apps -->
	<!-- apps -->
	<script
		src="${ pageContext.servletContext.contextPath }/resources/dist/js/app-style-switcher.js"></script>
	<script
		src="${ pageContext.servletContext.contextPath }/resources/dist/js/feather.min.js"></script>
	<!-- slimscrollbar scrollbar JavaScript -->
	<script
		src="${ pageContext.servletContext.contextPath }/resources/assets/libs/perfect-scrollbar/dist/perfect-scrollbar.jquery.min.js"></script>
	<script
		src="${ pageContext.servletContext.contextPath }/resources/assets/extra-libs/sparkline/sparkline.js"></script>
	<!--Wave Effects -->
	<!-- themejs -->
	<!--Menu sidebar -->
	<script
		src="${ pageContext.servletContext.contextPath }/resources/dist/js/sidebarmenu.js"></script>
	<!--Custom JavaScript -->
	<script
		src="${ pageContext.servletContext.contextPath }/resources/dist/js/custom.min.js"></script>
	<!--  -->
	<script
		src="${ pageContext.servletContext.contextPath }/resources/summernote/summernote-lite.js"></script>
	<script
		src="${ pageContext.servletContext.contextPath }/resources/summernote/lang/summernote-ko-KR.js"></script>

</body>
</html>