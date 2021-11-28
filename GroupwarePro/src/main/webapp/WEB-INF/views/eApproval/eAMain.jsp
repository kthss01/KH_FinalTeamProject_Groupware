<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	.title, .eNo, .statusHeader{
		overflow : hideen;
		white-space : nowrap; 
		text-overflow : ellipsis;
	}
	
	.title:hover{
		cursor: pointer;
	}
	
	.dLists:hover{
		background-color: rgba(0,0,0,.125);
	}
	
	.status{
		color: white;
		font-weight: bold;
		border : rgba(0,0,0,.125);
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
					
						<h3  class="font-weight-bold">전자결재 홈</h3>
						
						<br><br>
						
						<!-- 결재 대기문서 -->
						<div class="row" style="border-bottom: 1px solid rgba(0,0,0,.125);">
							<div class="d-flex col-12" style="padding: 0px 10px; border-bottom: 1px solid rgba(0,0,0,.125);">
								<div class="text-left col-2">
									<h4 class="font-weight-bold">결재 대기문서</h4>
								</div>
							</div>
							<div class="d-flex col-12" style="border-bottom: 1px solid rgba(0,0,0,.125);">
								<div class="col-2">
									<span class="font-weight-bold">기안일</span>
								</div>
								<div class="col-3">
									<span class="font-weight-bold">결재 양식</span>
								</div>
								<div class="col-5">
									<span class="font-weight-bold">제목</span>
								</div>
								<div class="col-2">
									<span class="font-weight-bold">첨부</span>
								</div>
							</div>
							<c:choose>
								<c:when test="${not empty awList}">
									<c:forEach var="aw" items="${awList }">
										<div class="d-flex col-12 dLists">
											<div class="col-2">
												<span><fmt:formatDate value="${aw.draftDate}" type="date" pattern="yyyy-MM-dd"/></span>
											</div>
											<div class="col-3">
												<span>${aw.FName}</span>
											</div>
											<div class="col-5">
												<span class="title">${aw.title}<input type="hidden" value="${aw.ENo }"></span>
											</div>
											<div class="col-2">
												<span>0</span>
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
						
						<br>
						
						<!-- 기안 진행 문서 -->
						<div class="row" style="border-bottom: 1px solid rgba(0,0,0,.125);">
							<div class="d-flex col-12" style="padding: 0px 10px; border-bottom: 1px solid rgba(0,0,0,.125);">
								<div class="text-left col-2">
									<h4  class="font-weight-bold">기안 진행 문서</h4>
								</div>
							</div>
							<div class="d-flex col-12" style="border-bottom: 1px solid rgba(0,0,0,.125);">
								<div class="col-2">
									<span class="font-weight-bold">기안일</span>
								</div>
								<div class="col-3">
									<span class="font-weight-bold">결재 양식</span>
								</div>
								<div class="col-4">
									<span class="font-weight-bold">제목</span>
								</div>
								<div class="col-2">
									<span class="font-weight-bold">첨부</span>
								</div>
								<div class="col-1">
									<span class="statusHeader font-weight-bold">결재상태</span>
								</div>
							</div>
							<c:choose>
								<c:when test="${not empty dList}">
									<c:forEach var="d" items="${dList }">
										<div class="d-flex col-12 dLists">
											<div class="col-2">
												<span><fmt:formatDate value="${d.draftDate}" type="date" pattern="yyyy-MM-dd"/></span>
											</div>
											<div class="col-3">
												<span>${d.FName}</span>
											</div>
											<div class="col-4">
												<span class="title">${d.title}<input type="hidden" value="${d.ENo }"></span>
											</div>
											<div class="col-2">
												<span><!-- <i data-feather="paperclip" class="feather-icon" style="width:13px; height:13px;"></i>1 --></span>
											</div>
											<div class="col-1 text-center">
												<span class="status" style="background-color: ${d.SColor };">${d.SName }</span>
											</div>
										</div>
									</c:forEach>
									
								</c:when>
								<c:otherwise>
									<div class="d-flex col-12">
										<span class="m-auto">기안 진행중인 문서가 없습니다.</span>
									</div>
								</c:otherwise>
							</c:choose>
						</div>
						
						<br>
						
						<!-- 완료 문서 -->
						<div class="row" style="border-bottom: 1px solid rgba(0,0,0,.125);">
							<div class="d-flex col-12" style="padding: 0px 10px; border-bottom: 1px solid rgba(0,0,0,.125);">
								<div class="text-left col-2">
									<h4  class="font-weight-bold">완료 문서</h4>
								</div>
							</div>
							<div class="d-flex col-12" style="border-bottom: 1px solid rgba(0,0,0,.125);">
								<div class="col-2">
									<span class="font-weight-bold">기안일</span>
								</div>
								<div class="col-3">
									<span class="font-weight-bold">결재 양식</span>
								</div>
								<div class="col-3">
									<span class="font-weight-bold">제목</span>
								</div>
								<div class="col-3">
									<span class="font-weight-bold">문서번호</span>
								</div>
								<div class="col-1">
									<span class="statusHeader font-weight-bold">결재상태</span>
								</div>
							</div>
							<c:choose>
								<c:when test="${not empty fList}">
									<c:forEach var="f" items="${fList }">
										<div class="d-flex col-12 dLists">
											<div class="col-2">
												<span><fmt:formatDate value="${f.draftDate}" type="date" pattern="yyyy-MM-dd"/></span>
											</div>
											<div class="col-3">
												<span>${f.FName }</span>
											</div>
											<div class="col-3">
												<span class="title">${f.title }<input type="hidden" value="${f.ENo }"></span>
											</div>
											<div class="col-3">
												<span class="eNo">${f.ENo }</span>
											</div>
											<div class="col-1 text-center">
												<span class="status" style="background-color: ${f.SColor };">${f.SName }</span>
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