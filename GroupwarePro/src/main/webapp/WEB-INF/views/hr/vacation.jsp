<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.kh.spring.hr.model.vo.Work, com.kh.spring.hr.model.vo.VacationInfo, com.kh.spring.hr.model.vo.VRequest" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%	
	ArrayList<Work> wlist = (ArrayList<Work>)request.getAttribute("wlist"); 
	VacationInfo vi = (VacationInfo)request.getAttribute("vi");
	ArrayList<VRequest> vrList = (ArrayList<VRequest>)request.getAttribute("vrList"); 
	String start = "미등록";
	String end = "미등록";
	
	Work w = null;
	String wNo = null;
	String wDate = null;
	
	Date now = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("yy/MM/dd");
	String nowsf = sf.format(now);
	
	if(wlist.size() > 0) {
		for(int i = 0 ; i <= wlist.size() - 1; i++) {
			
			wDate=sf.format(wlist.get(i).getWDate());
			
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
						<h3>연차 내역</h3>
						<div class="row">
							<div class="m-auto">
								<span>2021.10</span>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12 m-auto">
								<div class="d-flex col-11 m-auto" style="border: 1px solid rgba(0,0,0,.125); background-color: white">
									<div class="col-3 m-auto" style="height:100%; padding:10px 0px">
										<p class="text-center m-auto" style="font-size:12px">관리자 사원</p>
									</div>
									<div class="col-3 m-auto" style="height:100%; padding:10px 0px">
										<p class="text-center m-auto" style="font-size:12px">총 연차</p>
										<p class="text-center m-auto text-primary"><%=vi.getAllDays() %></p>
									</div>
									<div class="col-3 m-auto" style="height:100%; padding:10px 0px">
										<p class="text-center m-auto" style="font-size:12px">사용 연차</p>
										<p class="text-center m-auto text-primary"><%=vi.getUsedDays() %></p>
									</div>
									<div class="col-3 m-auto" style="height:100%; padding:10px 0px">
										<p class="text-center m-auto" style="font-size:12px">잔여 연차</p>
										<p class="text-center m-auto text-primary"><%=vi.getLeftDays() %></p>
									</div>
								</div>
							</div>
						</div>
						<br><br>
						
						<!-- 연차 사용 내역 -->
						<div class="row" style="border-bottom: 2px solid rgba(0,0,0,.125);">
						
							<div class="d-flex col-12" style="padding: 0px 10px; border-bottom: 2px solid rgba(0,0,0,.125);">
								<div class="text-left col-2">
									<h5>사용내역</h5>
								</div>
							</div>
							
							<!-- 헤더 표시 -->
							<div class="d-flex col-12" style="border-bottom: 1px solid rgba(0,0,0,.125);">
								<div class="col-1">
									<span>이름</span>
								</div>
								<div class="col-2">
									<span>부서명</span>
								</div>
								<div class="col-2">
									<span>휴가종류</span>
								</div>
								<div class="col-3">
									<span>연차 사용기간</span>
								</div>
								<div class="col-2">
									<span>사용 연차</span>
								</div>
								<div class="col-2">
									<span>내용</span>
								</div>
							</div>
							
							<!-- 사용내역 리스트 -->
							<%if(vrList.size() > 0) {%>
								<%for(int i = 0; i < vrList.size(); i++) { VRequest vr = vrList.get(i);%>
									<div class="d-flex col-12">
										<div class="col-1">
											<span><%=vr.getEmpName() %></span>
										</div>
										<div class="col-2">
											<span><%=vr.getDeptTitle() %></span>
										</div>
										<div class="col-2">
											<span><%=vr.getVName() %></span>
										</div>
										<div class="col-3">
											<span><%=sf.format(vr.getFirstDate()) %> ~ <%=sf.format(vr.getLastDate()) %></span>
										</div>
										<div class="col-2">
											<span><%=vr.getUsingDay() %></span>
										</div>
										<div class="col-2">
											<span><%=vr.getReason() %></span>
										</div>
									</div>
								<%} %>
							<%}else { %>
								<div class="d-flex col-12">
									<span class="m-auto">연차 사용내역이 없습니다</span>
								</div>
							<%} %>
						</div>
						<br><br><br><br>
						<div class="row" style="border-bottom: 2px solid rgba(0,0,0,.125);">
							<div class="d-flex col-12" style="padding: 0px 10px; border-bottom: 2px solid rgba(0,0,0,.125);">
								<div class="text-left col-2">
									<h5>생성내역</h5>
								</div>
							</div>
							
							<!-- 헤더 표시 -->
							<div class="d-flex col-12" style="border-bottom: 1px solid rgba(0,0,0,.125);">
								<div class="col-3">
									<span>등록일</span>
								</div>
								<div class="col-3">
									<span>사용기간</span>
								</div>
								<div class="col-3">
									<span>발생일수</span>
								</div>
								<div class="col-3">
									<span>내용</span>
								</div>
							</div>
							
							<!-- 사용내역 리스트 -->
							<%if(vrList.size() > 0) {%>
								<%for(int i = 0; i < vrList.size(); i++) { VRequest vr = vrList.get(i);%>
									<div class="d-flex col-12">
										<div class="col-1">
											<span><%=vr.getEmpName() %></span>
										</div>
										<div class="col-2">
											<span><%=vr.getDeptTitle() %></span>
										</div>
										<div class="col-2">
											<span><%=vr.getVName() %></span>
										</div>
										<div class="col-3">
											<span><%=sf.format(vr.getFirstDate()) %> ~ <%=sf.format(vr.getLastDate()) %></span>
										</div>
									</div>
								<%} %>
							<%}else { %>
								<div class="d-flex col-12">
									<span class="m-auto">연차 사용내역이 없습니다</span>
								</div>
							<%} %>
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