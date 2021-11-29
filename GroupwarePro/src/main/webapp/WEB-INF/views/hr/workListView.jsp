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
	
	.today{
		background-color: rgba(95,118,232);
		color : white;
		border-radius : 8px;
		padding: 1px;
	}
	
</style>
</head>
<body>
	
	<h3>근태 현황</h3>
	<div class="row">
		<div class="m-auto">
			<span><i data-feather="chevron-left" class="feather-icon" id="before"></i></span>
			<span>${year }.${month }</span>
			<span><i data-feather="chevron-right" class="feather-icon" id="after"></i></span>
		</div>
	</div>
	<div class="row">
		<div class="col-md-12 m-auto">
			<div class="d-flex col-12 m-auto" style="border: 1px solid rgba(0,0,0,.125); background-color: white">
				<div class="col-2 m-auto" style="height:100%; padding:10px 0px">
					<p class="text-center m-auto" style="font-size:12px">이번주 누적</p>
					<p class="text-center m-auto text-primary">3h 27m 32s</p>
				</div>
				<div class="col-2 m-auto" style="height:100%; padding:10px 0px">
				<p class="text-center m-auto" style="font-size:12px">이번주 초과</p>
					<p class="text-center m-auto text-primary">3h 27m 32s</p>
				</div>
				<div class="col-2 m-auto" style="height:100%; padding:10px 0px">
					<p class="text-center m-auto" style="font-size:12px">이번주 잔여</p>
					<p class="text-center m-auto text-primary">3h 27m 32s</p>
				</div>
				<div class="col-2 m-auto" style="height:100%; padding:10px 0px">
					<p class="text-center m-auto" style="font-size:12px">이번달 누적</p>
					<p class="text-center m-auto">3h 27m 32s</p>
				</div>
				<div class="col-2 m-auto" style="height:100%; padding:10px 0px">
					<p class="text-center m-auto" style="font-size:12px">이번달 연장</p>
					<p class="text-center m-auto">3h 27m 32s</p>
				</div>
			</div>
		</div>
	</div>
	<br><br>
	
	<!-- 이번달 wlist 출력  -->
	<c:set var="begin" value="0"/>
	<c:set var="end" value="6"/>
	
	<!-- 이번달이 4주인지 5주인지 구분 -->
	<!-- wlist의 크기를 7로 나눠서 몫이 4이고, 나머지가 0이면 : 4주-->
	<!-- 그 외에는 5주-->
	<c:choose>
		<c:when test="${wlist.size() / 7 == 4 && wlist.size() % 7 == 0}">
			<c:set var="weekNum" value="4"/>
		</c:when>
		<c:otherwise>
			<c:set var="weekNum" value="5"/>
		</c:otherwise>
	</c:choose>
	<c:forEach var="week" begin ="1" end ="${weekNum }">
		<div class="row" style="border-bottom: 2px solid rgba(0,0,0,.125);">
			<!-- 주차 표시 -->
			<div class="d-flex col-12" style="padding: 0px 10px; border-bottom: 2px solid rgba(0,0,0,.125);">
				<div class="text-left col-2">
					<!-- 접었다 펼때 아이콘 바뀜 -->
					<h5 class="chevron cl" id="chevron${week }"><i data-feather="chevron-down" class="feather-icon inner"></i>&nbsp;&nbsp;${week }주차</h5>
				</div>
				<!-- <div class="text-right col-10">
					<span>누적 근무시간 00h 00m 00s (초과 근무시간 00h 00m 00s)</span>
				</div> -->
			</div>
			
			<!-- 헤더 표시, 접었다 펼 수 있음 -->
			<div class="col-12 week" id="week${week }" style="border-bottom: 1px solid rgba(0,0,0,.125);">
				<div class="col-1 text-center">
					<span>일차</span>
				</div>
				<div class="col-2">
					<span>업무시작</span>
				</div>
				<div class="col-2">
					<span>업무종료</span>
				</div>
				<div class="col-2">
					<span>총 근무시간</span>
				</div>
				<div class="col-5">
					<span>근무시간 상세</span>
				</div>
			</div>
			
			<!-- 일자 표시 (7일) -->
			<c:forEach var="date" items="${wlist }" begin ="${begin }" end ="${end }" varStatus ="status">
			<div class="col-12 selects${week }">
				<div class="col-1 text-center">
					<span class="date" id="<fmt:formatDate value="${date.WDate}" type="date" pattern="YYYY/MM/dd"/>"><fmt:formatDate value="${date.WDate}" type="date" pattern="dd"/></span>
					<span class="day"><fmt:formatDate value="${date.WDate}" type="date" pattern="E"/></span>
				</div>
				<div class="col-2">
					<c:set var="st" value="${date.startTime }"/>
					<c:choose>
						<c:when test="${empty st }">
							<span class="startTime"></span>
						</c:when>
						<c:otherwise>
							<span class="startTime">${st }</span>
						</c:otherwise>
					</c:choose>
				</div>
				<div class="col-2">
					<c:set var="et" value="${date.endTime }"/>
					<c:choose>
						<c:when test="${empty et }">
							<span class="endTime"></span>
						</c:when>
						<c:otherwise>
							<span class="endTime">${et }</span>
						</c:otherwise>
					</c:choose>
				</div>
				<div class="col-2">
					<c:choose>
						<c:when test="${empty st or empty et }">
							<span class="totalTime totalTime1">00h 00m 00s</span>
						</c:when>
						<c:otherwise>
							<span class="totalTime totalTime2">${date.totalTime }</span>
						</c:otherwise>
					</c:choose>
				</div>
				
				<div class="col-5">
					<!-- 누적/초과 -->
					<c:choose>
						<span class="workDetail"></span>
					</c:choose>
				</div>
			</div>
			</c:forEach>
			<c:set var="begin" value="${begin+7 }"/>
			<c:set var="end" value="${end+7 }"/>
		</div>
		<br>
	</c:forEach>
	
	<script>
		$(function(){
			
			//총 근무시간 형식 맞추기
			var length = $('.date').length;
			var totalTime = null;
			var totalTimeArr = null;
			
			for(var i = 0; i < length; i++){
				totalTime = $('.totalTime').eq(i).text()
				totalTimeArr = totalTime.split(" ");
				
				var h = Number(totalTimeArr[0].substr(0, totalTimeArr[0].length-1))
				var m = Number(totalTimeArr[1].substr(0, totalTimeArr[1].length-1))
				var s = Number(totalTimeArr[2].substr(0, totalTimeArr[2].length-1))
				
				h = zero(h)
				m = zero(m)
				s = zero(s)
				
				totalTime = h + "h " + m + "m " + s + "s";
				
				$('.totalTime').eq(i).text(totalTime);
			}			
			$(".chevron").click(function(){
				
				var week = $(this).attr('id').substr(7, 1);
				
				if($(this).attr('class').includes('cl') == true) {
					$(this).removeClass('cl');
					$(this).addClass('op');
					
					//헤더 클래스에 d-flex추가
					//내용 클래스에 d-flex추가
					$("#week" + week).addClass('d-flex')
					$(".selects" + week).addClass('d-flex')
					
				}
				
				else if($(this).attr('class').includes('op') == true){
					
					$(this).removeClass('op');
					$(this).addClass('cl');
					
					//헤더 클래스에 d-flex추가
					//내용 클래스에 d-flex추가 
					$("#week" + week).removeClass('d-flex')
					$(".selects" + week).removeClass('d-flex')
					
				}
			})
			
			//오늘 날짜 찾기
			var currentDate = new Date();	// 현재시간
			
			var toDate = currentDate.getFullYear() + "/" + (currentDate.getMonth() + 1) + "/" + currentDate.getDate()
			
			//리스트
			var classDate;
			
			for(var i = 0; i < length; i++){
				classDate = $('.date').eq(i).attr('id');
				
				if(toDate == classDate){
					$('.date').eq(i).addClass('today')
				}
			}
			
			//주별, 일별 누적 근무시간
			var weekNum = "${weekNum}";
			var selectsId = ".selects"
			for(var i = 1; i <= weekNum; i++){
				var time = "00h 00m 00s";
				
				var accumulation = "00h 00m 00s"; //누적시간
				var overtime = "00h 00m 00s"; // 초과시간
				for(var j = 0; j < 7; j++){
					selects = $(selectsId+i).eq(j);
					var total = selects.children().eq(3).children('span');
					var result = selects.children().eq(4).children('span');
					 
					//t1
					var h1 = Number(time.substr(0,2));
					var m1 = Number(time.substr(4,2));
					var s1 = Number(time.substr(8,2));
					
					//t2
					var h2 = Number(total.text().substr(0,2));
					var m2 = Number(total.text().substr(4,2));
					var s2 = Number(total.text().substr(8,2));
					
					var h = h1 + h2
					var m = m1 + m2
					var s = s1 + s2
					
					if(s >= 60) {
						m = m + 1; //분 +1
						s = s - 60;
						
					}
					
					if(m >= 60) {
						h = h + 1; //시 +1
						m = m - 60;
															
					}
					
					h = zero(h)
					m = zero(m)
					s = zero(s)
					
					time = h + "h " + m + "m " + s + "s"
					result.text(time+"/초과 00h 00m 00s");
				}
			}
			
			//자릿수에 "0"추가하기
			function zero(n){
				
				if(n < 10){
					n = "0" + n;
				}
				return n;
			}

		})
		
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