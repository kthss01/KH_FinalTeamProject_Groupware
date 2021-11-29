<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.kh.spring.hr.model.vo.Work" %>
<%@ page import="java.util.ArrayList, com.kh.spring.hr.model.vo.EmpInfo" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%	
	SimpleDateFormat sf1 = new SimpleDateFormat("yy/MM/dd");
	SimpleDateFormat sf2 = new SimpleDateFormat("yyyy-MM-dd");
	
	EmpInfo empInfo = (EmpInfo)request.getAttribute("empInfo");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
	.inner:hover{
		color: rgb(95,118,232);
	}
	
	#status{
		display:none;
		position:absolute;
	}
	
	th, td{
		border: 0.1px solid rgb(222, 226, 230);
	}
	tr{
		height: 40px;
	}
	
	table{
		 width: 100%;
		 border-collapse: collapse;
	}
</style>
</head>
<body onload="printClock()">
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
				
				<div class="row" style="height: 100%;">
						<!-- 근태관리 사이드바 -->
						<div class="col-2" style="border-right: 1px solid rgba(0,0,0,.125);">
							<jsp:include page="../hr/hrSidebar.jsp" >
								<jsp:param value="${w}" name="w"/>
							</jsp:include>
						</div>
					<!------------------------------------------------------>
					
					<div class="col-10">
						<h3>인사정보</h3>
						<br>
						<div class="row">
							<table class="m-auto">
								<tr>
									<th style="text-align: center">사진</th>
									<th style="text-align: center">이름</th>
									<th>소속</th>
									<td colspan="3"><%=empInfo.getDeptTitle() %></td>
								</tr>
								<tr>
									<td rowspan="3" style="text-align: center"><img class="rounded-circle" src="${ pageContext.servletContext.contextPath }/resources/assets/images/users/profile-pic.jpg"></img></td>
									<td rowspan="3" style="text-align: center"><%=empInfo.getEmpName() %></td>
									<th>사번</th>
									<td><%=empInfo.getEmpNo() %></td>
									<th>내선번호</th>
									<td><%=empInfo.getExNumber() %></td>
								</tr>
								<tr>
									<th>이메일</th>
									<td><%=empInfo.getEmail() %></td>
									<th>휴대번호</th>
									<td><%=empInfo.getPhone() %></td>
								</tr>
								<tr>
									<th>직위/직책</th>
									<td><%=empInfo.getJobName() %>/<%=empInfo.getPosition() %></td>
									<th>대표전화</th>
									<td><%=empInfo.getMainNumber() %></td>
								</tr>
							</table>
						</div>
						
						<!-- 탭 메뉴 -->
						<div class="row">
                           <ul class="nav nav-tabs col-12">
                               <li class="nav-item">
                                   <a href="#basic" data-toggle="tab" aria-expanded="false" class="nav-link active">
                                       <i class="mdi mdi-home-variant d-lg-none d-block mr-1"></i>
                                       <span class="d-none d-lg-block">기본</span>
                                   </a>
                               </li>
                               <li class="nav-item">
                                   <a href="#detail" data-toggle="tab" aria-expanded="true" class="nav-link">
                                       <i class="mdi mdi-account-circle d-lg-none d-block mr-1"></i>
                                       <span class="d-none d-lg-block">신상</span>
                                   </a>
                               </li>
                               <li class="nav-item">
                                   <a href="#duty" data-toggle="tab" aria-expanded="false" class="nav-link">
                                       <i class="mdi mdi-settings-outline d-lg-none d-block mr-1"></i>
                                       <span class="d-none d-lg-block">직무/담당</span>
                                   </a>
                               </li>
                               <li class="nav-item">
                                   <a href="#appoint" data-toggle="tab" aria-expanded="false" class="nav-link">
                                       <i class="mdi mdi-settings-outline d-lg-none d-block mr-1"></i>
                                       <span class="d-none d-lg-block">발령</span>
                                   </a>
                               </li>
                               <li class="nav-item">
                                   <a href="#carrer" data-toggle="tab" aria-expanded="false" class="nav-link">
                                       <i class="mdi mdi-settings-outline d-lg-none d-block mr-1"></i>
                                       <span class="d-none d-lg-block">경력</span>
                                   </a>
                               </li>
                               <li class="nav-item">
                                   <a href="#reward" data-toggle="tab" aria-expanded="false" class="nav-link">
                                       <i class="mdi mdi-settings-outline d-lg-none d-block mr-1"></i>
                                       <span class="d-none d-lg-block">포상/징계</span>
                                   </a>
                               </li>
                               <li class="nav-item">
                                   <a href="#evaluation" data-toggle="tab" aria-expanded="false" class="nav-link">
                                       <i class="mdi mdi-settings-outline d-lg-none d-block mr-1"></i>
                                       <span class="d-none d-lg-block">인사평가</span>
                                   </a>
                               </li>
                               <li class="nav-item">
                                   <a href="#edu" data-toggle="tab" aria-expanded="false" class="nav-link">
                                       <i class="mdi mdi-settings-outline d-lg-none d-block mr-1"></i>
                                       <span class="d-none d-lg-block">교육</span>
                                   </a>
                               </li>
                               <li class="nav-item">
                                   <a href="#license" data-toggle="tab" aria-expanded="false" class="nav-link">
                                       <i class="mdi mdi-settings-outline d-lg-none d-block mr-1"></i>
                                       <span class="d-none d-lg-block">자격</span>
                                   </a>
                               </li>
                               <li class="nav-item">
                                   <a href="#language" data-toggle="tab" aria-expanded="false" class="nav-link">
                                       <i class="mdi mdi-settings-outline d-lg-none d-block mr-1"></i>
                                       <span class="d-none d-lg-block">어학</span>
                                   </a>
                               </li>
                               <li class="nav-item">
                                   <a href="#military" data-toggle="tab" aria-expanded="false" class="nav-link">
                                       <i class="mdi mdi-settings-outline d-lg-none d-block mr-1"></i>
                                       <span class="d-none d-lg-block">병역</span>
                                   </a>
                               </li>
                               <li class="nav-item">
                                   <a href="#abroad" data-toggle="tab" aria-expanded="false" class="nav-link">
                                       <i class="mdi mdi-settings-outline d-lg-none d-block mr-1"></i>
                                       <span class="d-none d-lg-block">해외출장</span>
                                   </a>
                               </li>
                               <li class="nav-item">
                                   <a href="#academic" data-toggle="tab" aria-expanded="false" class="nav-link">
                                       <i class="mdi mdi-settings-outline d-lg-none d-block mr-1"></i>
                                       <span class="d-none d-lg-block">학력</span>
                                   </a>
                               </li>
                               <li class="nav-item">
                                   <a href="#family" data-toggle="tab" aria-expanded="false" class="nav-link">
                                       <i class="mdi mdi-settings-outline d-lg-none d-block mr-1"></i>
                                       <span class="d-none d-lg-block">가족</span>
                                   </a>
                               </li>
                           </ul>

                           <div class="tab-content col-12" style="padding: 0px">
                               <div class="tab-pane active" id="basic">
                               		<table class="m-auto" style="margin:0px;">
                               			<tr>
                               				<th>입사일</th>
                               				<td style="width: 150px;"><%=sf2.format(empInfo.getEnrollDate()) %></td>
                               				<th>직무</th>
                               				<td style="width: 150px;"><%=empInfo.getDuty() %></td>
                               				<th>직종</th>
                               				<td style="width: 150px;"><%=empInfo.getOccupation() %></td>
                               				<th>직군</th>
                               				<td style="width: 150px;"><%=empInfo.getJobGroup() %></td>
                               			</tr>
                               			<tr>
                               				<th>채용구분</th>
                               				<td><%=empInfo.getRecruitName() %></td>
                               				<th>직원구분</th>
                               				<td><%=empInfo.getEmpDiv() %></td>
                               				<th>급여구분</th>
                               				<td><%=empInfo.getSalCode() %></td>
                               				<th>추천자</th>
                               				<td><%=empInfo.getRecommender() %></td>
                               			</tr>
                               			<tr>
                               				<th>상태</th>
                               				<td><%=empInfo.getStatement() %></td>
                               				<th>생년월일</th>
                               				<td>생년월일내용</td>
                               				<th>성별</th>
                               				<td><%=empInfo.getGender() %></td>
                               				<th>결혼여부</th>
                               				<td><%=empInfo.getMarriageYn() %></td>
                               			</tr>
                               			<tr>
                               				<th>장애여부</th>
                               				<td><%=empInfo.getDisabilityYn() %></td>
                               				<th>보훈여부</th>
                               				<td><%=empInfo.getVeteranYn() %></td>
                               				<th>퇴사일</th>
                               				<%if(empInfo.getRetireDate() == null) {%>
                               				<td>null</td>
                               				<%} else{ %>
                               				<td><%=sf2.format(empInfo.getRetireDate()) %></td>
                               				<%} %>
                               				
                               				<th>퇴직사유</th>
                               				<td><%=empInfo.getRetireReason() %></td>
                               			</tr>
                               		</table>
                               </div>
                               <div class="tab-pane" id="detail">
                                   <p>Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim
                                       justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis
                                       eu pede mollis pretium. Integer tincidunt.Cras dapibus. Vivamus elementum
                                       semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor
                                       eu, consequat vitae, eleifend ac, enim.</p>
                                   <p class="mb-0">Food truck quinoa dolor sit amet, consectetuer adipiscing elit.
                                       Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus
                                       et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis,
                                       ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa
                                       quis enim.</p>
                               </div>
                               <div class="tab-pane" id="duty">
                                   <p>Food truck quinoa dolor sit amet, consectetuer adipiscing elit. Aenean
                                       commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et
                                       magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis,
                                       ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa
                                       quis enim.</p>
                                   <p class="mb-0">Donec pede justo, fringilla vel, aliquet nec, vulputate eget,
                                       arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam
                                       dictum felis eu pede mollis pretium. Integer tincidunt.Cras dapibus. Vivamus
                                       elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula,
                                       porttitor eu, consequat vitae, eleifend ac, enim.</p>
                               </div>
                           </div>
						</div>
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