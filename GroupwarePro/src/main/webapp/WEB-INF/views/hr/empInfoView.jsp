<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.kh.spring.hr.model.vo.Work" %>
<%@ page import="java.util.ArrayList, com.kh.spring.hr.model.vo.EmpInfo" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%	
	ArrayList<Work> wlist = (ArrayList<Work>)request.getAttribute("wlist"); 
	String start = "미등록";
	String end = "미등록";
	
	Work w = null;
	String wNo = null;
	String wDate = null;
	
	Date now = new Date();
	SimpleDateFormat sf1 = new SimpleDateFormat("yy/MM/dd");
	SimpleDateFormat sf2 = new SimpleDateFormat("yyyy-MM-dd");
	String nowsf = sf1.format(now);
	
	if(wlist.size() > 0) {
		for(int i = 0 ; i <= wlist.size() - 1; i++) {
			
			wDate=sf1.format(wlist.get(i).getWDate());
			
			if(wDate.equals(nowsf)){
				w = wlist.get(i);
				System.out.println(w);
			}
		}
		
		if(w != null) {
			wNo = w.getWNo();
			
			if(w.getStartTime() != null) {
				start = w.getStartTime().substring(11, w.getStartTime().length());
			}
			
			if(w.getEndTime() != null) {
				end = w.getEndTime().substring(11, w.getEndTime().length());
			}
		}
	}
	
	EmpInfo empInfo = (EmpInfo)request.getAttribute("empInfo");
	System.out.println("==================empInfoView==================");
	System.out.println(empInfo);
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
						<h3>근태관리</h3>
						<div>
							<c:set var="today" value="<%= new java.util.Date() %>"/>
							<p style="font-size:14px"><fmt:formatDate value="${today}" type="date" pattern="yyyy-MM-dd (E)"/></p>
							<p id="clock" style="font-size:40px"></p>
							<div>
								<div class="d-flex" style="font-size: 12px">
									<p class="col-6" style="padding:0px;">출근시간</p><p class="col-6 text-right" style="padding:0px;"><%=start %></p>
								</div>
								<div class="d-flex" style="font-size: 12px">
									<p class="col-6" style="padding:0px;">퇴근시간</p><p class="col-6 text-right" style="padding:0px;"><%=end %></p>
								</div>
								<div class="d-flex" style="font-size: 12px">
									<p class="col-7" style="padding:0px;">주간 누적 근무시간</p><p class="col-5 text-right" style="padding:0px;">00h 00m 00s</p>
								</div>
							</div>
						</div>
						
						<br>
						<form method="get" action="change.hr">
							<div class="d-flex align-items-center">
								<button type="submit" class="btn btn-rounded btn-outline-primary col-6" style="margin:2px" value="1" name="status">출근하기</button>
								<button type="submit" class="btn btn-rounded btn-outline-primary col-6" style="margin:2px" value="2" name="status">퇴근하기</button>
							</div>
							<div class="d-flex align-items-center">
								<button type="button" id="selectStatus" class="btn btn-rounded btn-outline-primary col-12" style="margin:2px 2px 0px 2px;">근무상태변경<i data-feather="chevron-down" class="feather-icon"></i></button>
							</div>
 							<div id="status" class="align-items-center" style="border: 1px solid rgb(95,118,232); border-radius: 10px; background-color:white;">
								<button type="submit" class="d-flex col-12 btn btn-outline-primary" style="border:none; border-top-left-radius: 9px; border-top-right-radius: 9px;" value="3" name="status">업무</button>
								<button type="submit" class="d-flex col-12 btn btn-outline-primary" style="border:none;" value="4" name="status">업무종료</button>
								<button type="submit" class="d-flex col-12 btn btn-outline-primary" style="border:none;" value="5" name="status">외근</button>
								<button type="submit" class="d-flex col-12 btn btn-outline-primary" style="border:none;" value="6" name="status">출장</button>
								<button type="submit" class="d-flex col-12 btn btn-outline-primary" style="border:none; border-bottom-left-radius: 9px; border-bottom-right-radius: 9px;" value="7" name="status">반차</button>
							</div>
							<input type="hidden" name="wNo" value="<%=wNo %>">
						</form>
						<br>
						<!-- 근태관리, 내 근태 현황, 내 연차 내역, 내 인사정보 -->
	                
                        <h6 class="card-title">근태관리</h6>
                        <div class="list-group"> 
			           		<a href="work.hr" class="list-group-item">내 근태 현황</a>
                        	<a href="vacation.hr" class="list-group-item">내 연차 내역</a> 
                        	<a href="empInfo.hr" class="list-group-item">내 인사정보</a> 
                       	</div>
					</div>
					
					<script>
						$(function(){
							$("#status").css("z-index","1")
							$(".list-group").css("z-index","0")
							$(".card-title").css("z-index","0")
							
							$("#selectStatus").click(function(){
								if($("#status").css("display") == "none") {
									$("#status").show();
									
									var width = $("#selectStatus").css("width");
									
									$("#status").css("width", width)
								}
								else {
									$("#status").hide();
								}
							})
						})
						
						function printClock() {
						    
						    var clock = document.getElementById("clock");	// 출력할 장소 선택
						    var currentDate = new Date();	// 현재시간
						    var calendar = currentDate.getFullYear() + "-" + (currentDate.getMonth()+1) + "-" + currentDate.getDate() // 현재 날짜
						    var currentHours = addZeros(currentDate.getHours(),2); 
						    var currentMinute = addZeros(currentDate.getMinutes() ,2);
						    var currentSeconds =  addZeros(currentDate.getSeconds(),2);
						    
						    clock.innerHTML = currentHours+":"+currentMinute+":"+currentSeconds; //날짜를 출력해 줌
						    
						    setTimeout("printClock()",1000);         // 1초마다 printClock() 함수 호출
						    
						    
						    function addZeros(num, digit) { // 자릿수 맞춰주기
							  	var zero = '';
							  	num = num.toString();
							  	if (num.length < digit) {
								  	for (i = 0; i < digit - num.length; i++) {
								  		zero += '0';
								  	}
							  	}
							  	return zero + num;
							}
						}
					</script>
					<!------------------------------------------------------>
					
					<div class="col-10">
						<h3>인사정보</h3>
						<div class="row">
							<table class="table col-11 m-auto">
								<tbody>
									<tr>
										<th rowspan="4">사진</th>
										<th>이름</th>
										<th>소속</th>
										<td colspan="3"><%=empInfo.getDeptTitle() %></td>
									</tr>
									<tr>
										<td rowspan="3"><%=empInfo.getEmpName() %></td>
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
								</tbody>
							</table>
						</div>
						
						<!-- 탭 메뉴 -->
						<div class="row">
                           <ul class="nav nav-tabs mb-3">
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

                           <div class="tab-content" style="padding: 0px 15px;">
                               <div class="tab-pane active" id="basic">
                               		<table class="table">
                               			<tr>
                               				<th>입사일</th>
                               				<td><%=sf2.format(empInfo.getEnrollDate()) %></td>
                               				<th>직무</th>
                               				<td><%=empInfo.getDuty() %></td>
                               				<th>직종</th>
                               				<td><%=empInfo.getOccupation() %></td>
                               				<th>직군</th>
                               				<td><%=empInfo.getJobGroup() %></td>
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