<!DOCTYPE html>
<html dir="ltr" lang="ko">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="${ pageContext.servletContext.contextPath }/resources/assets/images/favicon.png">
    <title>WeCanvas</title>
 
    <!-- fullcalendar-scheduler CDN -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar-scheduler@5.9.0/main.min.css">
 
    <!-- Custom CSS -->
    <link href="${ pageContext.servletContext.contextPath }/resources/assets/extra-libs/c3/c3.min.css" rel="stylesheet">
    <link href="${ pageContext.servletContext.contextPath }/resources/assets/libs/chartist/dist/chartist.min.css" rel="stylesheet">
    <link href="${ pageContext.servletContext.contextPath }/resources/assets/extra-libs/jvector/jquery-jvectormap-2.0.2.css" rel="stylesheet" />
    <!-- Custom CSS -->
    <link href="${ pageContext.servletContext.contextPath }/resources/dist/css/style.min.css" rel="stylesheet">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

	<style>
	
	#boardList li:hover{
	cursor:pointer;
	color:#212529;
	}
	
	</style>

    <script>
    	const empNo = ${ loginUser.empNo };
    </script>

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
    <div id="main-wrapper" data-theme="light" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full"
        data-sidebar-position="fixed" data-header-position="fixed" data-boxed-layout="full">
        <!-- ============================================================== -->
        <!-- Topbar header - style you can find in pages.scss -->
        <!-- ============================================================== -->
       		<jsp:include page="common/header.jsp"/>
        <!-- ============================================================== -->
        <!-- End Topbar header -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- Left Sidebar - style you can find in sidebar.scss  -->
        <!-- ============================================================== -->
			<jsp:include page="common/sidebar.jsp"/>
        <!-- ============================================================== -->
        <!-- End Left Sidebar - style you can find in sidebar.scss  -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- Page wrapper  -->
        <!-- ============================================================== -->
        <div class="page-wrapper">

            <!-- ============================================================== -->
            <!-- Bread crumb and right sidebar toggle -->
            <!-- ============================================================== -->
            <div class="page-breadcrumb">
                <div class="row">
                    <div class="col-7 align-self-center">
                        <h3 class="page-title text-truncate text-dark font-weight-medium mb-1">Good Morning! ${ loginUser.empName }!</h3>

                    </div>

                </div>
            </div>
            <!-- ============================================================== -->
            <!-- End Bread crumb and right sidebar toggle -->
            <!-- ============================================================== -->
            <!-- ============================================================== -->
            <!-- Container fluid  -->
            <!-- ============================================================== -->
            <div class="container-fluid">
                <!-- *************************************************************** -->
                <!-- Start First Cards -->
                <!-- *************************************************************** -->
<!--                 <div class="card-group">
                    <div class="card border-right">
                        <div class="card-body">
                            <div class="d-flex d-lg-flex d-md-block align-items-center">
                                <div>
                                    <div class="d-inline-flex align-items-center">
                                        <h2 class="text-dark mb-1 font-weight-medium">236</h2>
                                        <span
                                            class="badge bg-primary font-12 text-white font-weight-medium badge-pill ml-2 d-lg-block d-md-none">+18.33%</span>
                                    </div>
                                    <h6 class="text-muted font-weight-normal mb-0 w-100 text-truncate">New Clients</h6>
                                </div>
                                <div class="ml-auto mt-md-3 mt-lg-0">
                                    <span class="opacity-7 text-muted"><i data-feather="user-plus"></i></span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card border-right">
                        <div class="card-body">
                            <div class="d-flex d-lg-flex d-md-block align-items-center">
                                <div>
                                    <h2 class="text-dark mb-1 w-100 text-truncate font-weight-medium"><sup
                                            class="set-doller">$</sup>18,306</h2>
                                    <h6 class="text-muted font-weight-normal mb-0 w-100 text-truncate">Earnings of Month
                                    </h6>
                                </div>
                                <div class="ml-auto mt-md-3 mt-lg-0">
                                    <span class="opacity-7 text-muted"><i data-feather="dollar-sign"></i></span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card border-right">
                        <div class="card-body">
                            <div class="d-flex d-lg-flex d-md-block align-items-center">
                                <div>
                                    <div class="d-inline-flex align-items-center">
                                        <h2 class="text-dark mb-1 font-weight-medium">1538</h2>
                                        <span
                                            class="badge bg-danger font-12 text-white font-weight-medium badge-pill ml-2 d-md-none d-lg-block">-18.33%</span>
                                    </div>
                                    <h6 class="text-muted font-weight-normal mb-0 w-100 text-truncate">New Projects</h6>
                                </div>
                                <div class="ml-auto mt-md-3 mt-lg-0">
                                    <span class="opacity-7 text-muted"><i data-feather="file-plus"></i></span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card">
                        <div class="card-body">
                            <div class="d-flex d-lg-flex d-md-block align-items-center">
                                <div>
                                    <h2 class="text-dark mb-1 font-weight-medium">864</h2>
                                    <h6 class="text-muted font-weight-normal mb-0 w-100 text-truncate">Projects</h6>
                                </div>
                                <div class="ml-auto mt-md-3 mt-lg-0">
                                    <span class="opacity-7 text-muted"><i data-feather="globe"></i></span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div> -->
                <!-- *************************************************************** -->
                <!-- End First Cards -->
                <!-- *************************************************************** -->
                <!-- *************************************************************** -->
                <!-- Start Sales Charts Section -->
                <!-- *************************************************************** -->
                <div class="row">
                    <div class="col-lg-7 col-md-12">
                        <div class="card">
							<div class="card-body">
                                <h4 class="card-title mb-3 font-weight-bold">전사 공지사항</h4>
                                <ul class="nav nav-tabs mb-3">
                                    <li class="nav-item">
                                        <a href="#home" data-toggle="tab" aria-expanded="false" class="nav-link">
                                            <i class="mdi mdi-home-variant d-lg-none d-block mr-1"></i>
                                            <span class="d-none d-lg-block  font-weight-bold">공지</span>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="#calendar" data-toggle="tab" aria-expanded="true" class="nav-link active">
                                            <i class="mdi mdi-account-circle d-lg-none d-block mr-1"></i>
                                            <span class="d-none d-lg-block  font-weight-bold">일정</span>
                                        </a>
                                    </li>
             		                <li class="nav-item">
                                        <a href="#reservation" data-toggle="tab" aria-expanded="true" class="nav-link">
                                            <i class="mdi mdi-account-circle d-lg-none d-block mr-1"></i>
                                            <span class="d-none d-lg-block  font-weight-bold">예약</span>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="#settings" data-toggle="tab" aria-expanded="false" class="nav-link">
                                            <i class="mdi mdi-settings-outline d-lg-none d-block mr-1"></i>
                                            <span class="d-none d-lg-block  font-weight-bold">오늘의 식단표</span>
                                        </a>
                                    </li>
                                </ul>

                                <div class="tab-content">
                                    <div class="tab-pane" id="home">
                                        <p>Food truck quinoa dolor sit amet, consectetuer adipiscing elit. Aenean
                                            commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et
                                            magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis,
                                            ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa
                                            quis enim.</p>
                                        <p>Food truck quinoa dolor sit amet, consectetuer adipiscing elit. Aenean
                                            commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et
                                            magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis,
                                            ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa
                                            quis enim.</p>
       
                                    </div>
                                    <div class="tab-pane" id="settings">
                                        <p>Food truck quinoa dolor sit amet, consectetuer adipiscing elit. Aenean
                                            commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et
                                            magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis,
                                            ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa
                                            quis enim.</p>
                                        <p>Food truck quinoa dolor sit amet, consectetuer adipiscing elit. Aenean
                                            commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et
                                            magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis,
                                            ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa
                                            quis enim.</p>

                                    </div>
                                    <div class="tab-pane active" id="calendar">
                                        <!-- calendar app -->
                                        test
                                    </div>
                                    <div class="tab-pane" id="reservation">
                                        <!-- reservation app -->
                                        test2
                                    </div>
                                </div>
                            </div>
         				</div>
                    </div>
                    <div class="col-lg-5 col-md-12">
                        <div class="card"  style="padding:0px 10px 15px 10px;">
                            <div class="card-body">
                            <div id="profileImg" 
                            style="position:absolute; right:0; height:180px; width:180px; 
                            margin-right:50px;
                            background-image:url(${ pageContext.servletContext.contextPath }/resources/assets/images/adminImg.png);
                            background-size:cover;
                            " >
                          
                            
                            </div>
                                  <h4 class="card-title mb-3 font-weight-bold">근태관리</h4>
                            
                                <h4 id="todate" class="card-title mb-3 font-weight-bold"></h4>
                                <p id="clock" style="font-size:40px"></p>
                                <div>
                                <br>
									<div class="d-flex" style="font-size: 16px; ">
										<p class="col-6" style="padding:0px;">출근시간</p>
										<p class="col-6 text-right" style="padding:0px;" id="startTime"></p>
									</div>
									<div class="d-flex" style="font-size: 16px">
										<p class="col-6" style="padding:0px;">퇴근시간</p>
										<p class="col-6 text-right" style="padding:0px;" id="endTime"></p>
									</div>
								</div>
								<form method="get" action="change.hr">
									<!-- 출퇴근 버튼 -->
									<div class="d-flex align-items-center">
										<button type="submit" id="startBtn" class="btn btn-rounded btn-outline-primary col-6" style="margin:2px" value="1" name="status">출근하기</button>
										<button type="submit" id="endBtn" class="btn btn-rounded btn-outline-primary col-6" style="margin:2px" value="2" name="status">퇴근하기</button>
									</div>
									
									<!-- 상태 설정버튼 -->
									<div class="d-flex align-items-center" style="margin-top:15px;">
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
									<input type="hidden" name="main" value="1">
								</form>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- *************************************************************** -->
                <!-- End Sales Charts Section -->
                <!-- *************************************************************** -->
                <!-- *************************************************************** -->
                <!-- Start Location and Earnings Charts Section -->
                <!-- *************************************************************** -->
                <div class="row">
                    <div class="col-md-12 col-lg-7">
                        <div class="card">
                            <div class="card-body">
                                <div class="d-flex align-items-start">
                                    <h4 class="card-title mb-0 font-weight-bold"  >실시간 커뮤니티 인기 글</h4>

                                </div>
									<div class="col-md-12 col-sm-12" style="margin-top:50px;">
                                        <ul class="list-group" id="boardList">

                                        </ul>
                                    </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12 col-lg-5">
                        <div class="card">
                            <div class="card-body">
                                <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                                    <div class="carousel-inner" role="listbox">
                                        <div class="carousel-item"> <img class="img-fluid" src="${ pageContext.servletContext.contextPath }/resources/assets/images/slideImg1.jpg" alt="First slide"> </div>
                                        <div class="carousel-item"> <img class="img-fluid" src="${ pageContext.servletContext.contextPath }/resources/assets/images/slideImg2.jpg" alt="Second slide"> </div>
                                        <div class="carousel-item active"> <img class="img-fluid" src="${ pageContext.servletContext.contextPath }/resources/assets/images/slideImg3.jpg" alt="Third slide"> </div>
                                    </div>
                                    <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev"> <span class="carousel-control-prev-icon" aria-hidden="true"></span> <span class="sr-only">Previous</span> </a>
                                    <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next"> <span class="carousel-control-next-icon" aria-hidden="true"></span> <span class="sr-only">Next</span> </a>
                                </div>

                            </div>

                        </div>
                    </div>
                </div>
                <!-- *************************************************************** -->
                <!-- End Location and Earnings Charts Section -->
                <!-- *************************************************************** -->
			
                            <div class="pNotice-wrapper" style="position:fixed; right:0; bottom: 0; padding: 0px 20px 15px 0px; width:auto; height:auto;">

                          </div>
             </div>
			
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
        </div>
        <!-- ============================================================== -->
        <!-- End Page wrapper  -->
        <!-- ============================================================== -->
    </div>
    <!-- ============================================================== -->
    <!-- End Wrapper -->
    <!-- ============================================================== -->
    </div>
    <!-- End Wrapper -->
    <!-- ============================================================== -->
    <!-- All Jquery -->
    <!-- ============================================================== -->
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
    <!-- <script src="${ pageContext.servletContext.contextPath }/resources/assets/extra-libs/c3/d3.min.js"></script>
    <script src="${ pageContext.servletContext.contextPath }/resources/assets/extra-libs/c3/c3.min.js"></script> -->
    <!-- <script src="${ pageContext.servletContext.contextPath }/resources/assets/libs/chartist/dist/chartist.min.js"></script>
    <script src="${ pageContext.servletContext.contextPath }/resources/assets/libs/chartist-plugin-tooltips/dist/chartist-plugin-tooltip.min.js"></script>
    <script src="${ pageContext.servletContext.contextPath }/resources/assets/extra-libs/jvector/jquery-jvectormap-2.0.2.min.js"></script>
    <script src="${ pageContext.servletContext.contextPath }/resources/assets/extra-libs/jvector/jquery-jvectormap-world-mill-en.js"></script> 
    <!-- <script src="${ pageContext.servletContext.contextPath }/resources/dist/js/pages/dashboards/dashboard1.min.js"></script> -->
	
    <!-- Calendar & Reservation JavaScript -->
    <!-- Axios CDN -->
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
    <!-- Moment CDN -->
    <script src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
    <!-- fullcalendar-scheduler CDN -->
    <script src="https://cdn.jsdelivr.net/npm/fullcalendar-scheduler@5.9.0/main.min.js"></script>
    <!-- fullcalendar-scheduler 언어 CDN -->
    <script src="https://cdn.jsdelivr.net/npm/fullcalendar-scheduler@5.9.0/locales-all.min.js"></script>
	<script src="${ pageContext.servletContext.contextPath }/resources/dist/js/pages/main/main.js" type="module"></script>

	<script>
	$(function(){
		
		//홈버튼 선택 css 자동으로 안되어서 수동으로 추가함
		$('#homeBtn').parent().addClass('selected');
		$('#homeBtn').addClass('active');
		
		
		//인기 게시글 조회
		var boardList = $("#boardList");
		
		$.ajax({
			url:'bestBoardList.co',
			type:'post',
			success : function(list){
				list.forEach((b=>{
					
					boardList.append(`
							<span class="badge badge-info" style="display:inline-block; width:100px;">\${b.cName}</span>

                            <li  class="list-group-item" style="text-align:center; margin-bottom:10px;">
							<input type="hidden" value="\${b.bno}">
							\${b.title}

                            </li>

							`)

				}));
				
				
				$("#boardList li").click(function(){
					location.href="detail.co?bno=" + $(this).children().eq(0).val();
				});
				
				
			}
		})
		
	})
	
	$(function(){
		//출퇴근 버튼 설정
		var start = "${w.startTime}";
		var end = "${w.endTime}";
		console.log(start)
		console.log(end)
	  	//null이면 출근x, 퇴근x
		//null이 아니면 - 출근o, 퇴근x
		//			 - 출근o, 퇴근o
		if(start == ""){
			console.log("없음")
			
			$('#startBtn').attr('disabled', false);
		  	$('#endBtn').attr('disabled', false);
		  	
		  	$('#startTime').text("미등록")
			$('#endTime').text("미등록")
		}
	 	if(start != "" && end == ""){
	 		$('#startBtn').attr('disabled', true)	//출근버튼 비활성화
	 			
	 		$('#startTime').text(start)	//출근시간 표시
	 		$('#endTime').text("미등록")
	 	}
	 	else if(start != "" && end != ""){
	 		$('#startBtn').attr('disabled', true)	//출근버튼 비활성화
	 		$('#endBtn').attr('disabled', true)		//퇴근버튼 비활성화
	 			
	 		$('#startTime').text(start)	//출근시간 표시
	 		$('#endTime').text(end)		//퇴근시간 표시
	 	}
	 		
	 	//근무상태 선택버튼 css설정
	 	$("#status").css("z-index","1")
		$(".list-group").css("z-index","0")
		$(".card-title").css("z-index","0")
		
		$("#status").css("display","none")
		$("#status").css("position","absolute")
		
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
	
    //시간표시 기능
    function printClock() {
    
	    var clock = document.getElementById("clock");	// 출력할 장소 선택
	    var todate = document.getElementById("todate");
	    var currentDate = new Date();	// 현재시간
	    var day = new Array('일', '월', '화', '수', '목', '금', '토')
	    var today = day[currentDate.getDay()];
	    var calendar = currentDate.getFullYear() + "-" + (currentDate.getMonth()+1) + "-" + currentDate.getDate() + " (" + today + ")"// 현재 날짜
	    var currentHours = addZeros(currentDate.getHours(),2); 
	    var currentMinute = addZeros(currentDate.getMinutes() ,2);
	    var currentSeconds =  addZeros(currentDate.getSeconds(),2);
	    
	    clock.innerHTML = currentHours+":"+currentMinute+":"+currentSeconds; //날짜를 출력해 줌
	    todate.innerHTML = calendar; //날짜를 출력해 줌
	    
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
   
    //////////////////////////////////////////////
    
   function setCookie(name,value,expiredDate){
		var today = new Date();
		
		today.setDate(today.getDate() + expiredDate);
		
		document.cookie = name + '=' + escape(value) + '; expires=' + today.toGMTString();
	}
	
	function getCookie(name){
		
		var cookie = document.cookie;
		
		if ( cookie != "") {
			var cookie_arr = cookie.split(";");
			for ( var index in cookie_array) {
				var cookie_name = cookie_arr[index].split("=");
				if (cookie_name[0] == "mycookie") {
					return cookie_name[1];
					}
			
			} 
		
		}
	}
	
	<!-- 팝업 공지 data를 가져오는 ajax 통신-->
	
	$(function(){
		
		var wrapper = document.querySelector(".pNotice-wrapper");
		var index = 0;
		
		$.ajax({
			url:'selectNewPNoticeList.no',
			type:'post',
			success: function(list){
				
			list.forEach(( p=>{
				
				wrapper.innerHTML += ` 
						<div class="toast fade show \${p.popNo}" role="alert" data-autohide="false" aria-live="assertive" aria-atomic="true" id="toastBody">
                        <div class="toast-header">
                            <svg class="bd-placeholder-img rounded mr-2" width="20" height="20" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img">
                            	<i class="icon-bulb" style="width:100%; left:1; position:absolute;"></i>
                            </svg>
                            <strong class="mr-auto"> \${p.title} </strong>
                            <button type="button" class="ml-2 mb-1 close" data-dismiss="toast" aria-label="Close">
                        	    <span  id="closeToast" aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="toast-body">
                        	\${p.content}
                        	<hr>
                        <a class="block-a-day" style="text-decoration:none; cursor:pointer;">하루동안 보지 않기</a>
                        </div>
                    </div> `
			            
            $(this).addClass("t"+index); 
             
             
			}));
             
			
			
			$("#closeToast").on("click",function(){
				$("#toastBody").removeClass("show");
			})
			
			
			
			}
			
		})
		
		
		$(".close>close").click(function(){
			
			$(this).toast('hide');
			
		})
		
		
	})
	
	$(".modal-today-close").click(function() {
		$("#myModal").modal("hide");
		setCookie("mycookie", 'popupEnd', 1);
	})

    
	</script>

</body>

</html>