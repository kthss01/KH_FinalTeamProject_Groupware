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
<style>
	th{
		/* background-color: #5f76e8;rgba(0,0,0,.125); */
		background-color: rgba(0,0,0,.125);
		/* color: #ffffff; */
		text-align: center;
	}
	
	#EForm, #approverInfo{
		border: 1px solid rgba(0,0,0,.125);
		width: 203px;
		text-align: left;
	}
	#EForm, #EForms{
		width: 203px;
		text-align: left;
	}
</style>
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
						<jsp:include page="../eApproval/eASidebar.jsp" />
					</div>
					
					<div class="col-10">
						<h3>결재 대기 문서</h3>
						
						<br><br>
						
						<div class="row" style="border-bottom: 1px solid rgba(0,0,0,.125);">
							<div class="d-flex col-12" style="border-bottom: 2px solid rgba(0,0,0,.125); border-top: 2px solid rgba(0,0,0,.125);">
								<div class="col-2">
									<span>기안일</span>
								</div>
								<div class="col-3">
									<span>결재 양식</span>
								</div>
								<div class="col-4">
									<span>제목</span>
								</div>
								<div class="col-1">
									<span>첨부</span>
								</div>
								<div class="col-2">
									<span>기안자</span>
								</div>
							</div>
							<c:choose>
								<c:when test="${not empty wList}">
									<c:forEach var="w" items="${wList }">
										<div class="d-flex col-12 dLists">
											<div class="col-2">
												<span><fmt:formatDate value="${w.draftDate}" type="date" pattern="yyyy-MM-dd"/></span>
											</div>
											<div class="col-3">
												<span>${w.FName}</span>
											</div>
											<div class="col-4">
												<span class="title">${w.title}<input type="hidden" value="${w.ENo }"></span>
											</div>
											<div class="col-1">
												<c:choose>
													<c:when test="${not empty w.originName }">
														<span><a href="${ pageContext.servletContext.contextPath }/resources/upload_files/${w.changeName}" download="${ w.originName }"><i data-feather="paperclip" class="feather-icon" style="width:13px; height:13px;"></i></a></span>
													</c:when>
													<c:otherwise>
														<span></span>
													</c:otherwise>
												</c:choose>
											</div>
											<div class="col-2">
												<span>${w.drafterName }</span>
											</div>
										</div>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<div class="d-flex col-12">
										<span class="m-auto">결재 대기중인 문서가 없습니다.</span>
									</div>
								</c:otherwise>
							</c:choose>
						</div>
						
						<script>
							$(function(){
								$(".title").click(function(){
									
									var eNo = $(this).children().val();
									location.href="eDetail.ap?eNo=" + eNo;
									
								})
							})
						</script>
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