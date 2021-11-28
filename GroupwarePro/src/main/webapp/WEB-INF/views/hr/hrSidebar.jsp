<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

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
		cursor: pointer;
	}
	
	#status{
		display:none;
		position:absolute;
	}
	
	.selects1:hover, .selects2:hover, .selects3:hover, .selects4:hover, .selects5:hover{
		background-color: rgba(95,118,232, 0.1);
	}
	
	.week, .selects1, .selects2, .selects3, .selects4, .selects5{
		display:none;
	}
	
</style>
</head>
<body onload="printClock()">
	
	<h3>근태관리</h3>
	<div>
		<c:set var="today" value="<%= new java.util.Date() %>"/>
		<p style="font-size:14px"><fmt:formatDate value="${today}" type="date" pattern="yyyy-MM-dd (E)"/></p>
		<p id="clock" style="font-size:40px"></p>
		<div>
			<div class="d-flex" style="font-size: 12px">
				<p class="col-6" style="padding:0px;">출근시간</p>
				<c:choose>
					<c:when test="${empty w.startTime }">
						<p class="col-6 text-right" style="padding:0px;">미등록</p>
					</c:when>
					<c:otherwise>
						<p class="col-6 text-right" style="padding:0px;">${w.startTime}</p>
					</c:otherwise>
				</c:choose>
			</div>
			<div class="d-flex" style="font-size: 12px">
				<p class="col-6" style="padding:0px;">퇴근시간</p>
				<c:choose>
					<c:when test="${empty w.endTime }">
						<p class="col-6 text-right" style="padding:0px;">미등록</p>
					</c:when>
					<c:otherwise>
						<p class="col-6 text-right" style="padding:0px;">${w.endTime}</p>
					</c:otherwise>
				</c:choose>
			</div>
			<div class="d-flex" style="font-size: 12px">
				<p class="col-7" style="padding:0px;">주간 누적 근무시간</p><p class="col-5 text-right" style="padding:0px;">00h 00m 00s</p>
			</div>
		</div>
	</div>
	
	<br>
	<form method="get" action="change.hr">
		<div class="d-flex align-items-center">
		<!-- 출근시간 없으면 출근가능, 퇴근 불가능 -->
		<!-- 출근 시간이 있으면, 출근 불가능, 퇴근 가능 -->
		<!-- 출근시간, 퇴근시간이 있으면, 출근 불가능, 퇴근 불가능 -->
		<!-- 버튼 속성 disable 주기 -->
		<c:choose>
			<c:when test="${empty w.startTime }">
				<button type="submit" class="btn btn-rounded btn-outline-primary col-6" style="margin:2px" value="1" name="status">출근하기</button>
				<button type="submit" class="btn btn-rounded btn-outline-primary col-6" style="margin:2px" value="2" name="status" disabled>퇴근하기</button>
			</c:when>
			<c:when test="${not empty w.startTime && empty w.endTime}">
				<button type="submit" class="btn btn-rounded btn-outline-primary col-6" style="margin:2px" value="1" name="status" disabled>출근하기</button>
				<button type="submit" class="btn btn-rounded btn-outline-primary col-6" style="margin:2px" value="2" name="status">퇴근하기</button>
			</c:when>
			<c:otherwise>
				<button type="submit" class="btn btn-rounded btn-outline-primary col-6" style="margin:2px" value="1" name="status" disabled>출근하기</button>
				<button type="submit" class="btn btn-rounded btn-outline-primary col-6" style="margin:2px" value="2" name="status" disabled>퇴근하기</button>
			</c:otherwise>
		</c:choose>
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
		<input type="hidden" name="wNo" value="${w.WNo }">
	</form>
	<br>
	<!-- 근태관리, 내 근태 현황, 내 연차 내역, 내 인사정보 -->
            
    <h6 class="card-title">근태관리</h6>
    <div class="list-group"> 
		<a href="work.hr" class="list-group-item">내 근태 현황</a>
	    <a href="vacation.hr" class="list-group-item">내 연차 내역</a> 
	    <a href="empInfo.hr" class="list-group-item">내 인사정보</a> 
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