<!DOCTYPE html>
<html dir="ltr" lang="ko">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- Tell the browser to be responsive to screen width -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16"
	href="${ pageContext.servletContext.contextPath }/resources/assets/images/favicon.png">
<title>채팅</title>
<!-- This page css -->

<!--     부트스트랩5
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" 
	rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" 
	crossorigin="anonymous"> -->

<!-- Custom CSS -->
<link
	href="${ pageContext.servletContext.contextPath }/resources/dist/css/style.min.css"
	rel="stylesheet">


<style>
.contectDeptList button:hover {
	font-weight: bold;
}

.accordion {
	height: 80px;
}

.accordion-button {
	height: 60px;
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
		<!-- End Topbar header -->
		<!-- ============================================================== -->


		<!-- Left Sidebar - style you can find in sidebar.scss  -->
		<!-- ============================================================== -->
		<jsp:include page="../common/sidebar.jsp" />
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
						<h4
							class="page-title text-truncate text-dark font-weight-bold mb-1">메신저</h4>
						<div class="d-flex align-items-center">
							<nav aria-label="breadcrumb">
								<ol class="breadcrumb m-0 p-0">
									<li class="breadcrumb-item text-muted active"
										aria-current="page">Home</li>
									<li class="breadcrumb-item text-muted" aria-current="page">Messenger</li>
								</ol>
							</nav>
						</div>
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
				<div class="row">
					<div class="col-md-12">
						<div class="card">
							<div class="row no-gutters">



								<!-- 주소록 -->
								<div class="col-lg-5 col-xl-3 border-right">
									<div class="card-body">
										<h3 style="color: #1C2D41; font-weight: bold;">주소록</h3>
										<br>
										<form>
											<input id="searchContect" class="form-control" type="text"
												placeholder="이름 또는 부서 입력"
												style="font-size: 15px; display: inline-block; width: 85%;">
											<i class="icon-magnifier"></i>
										</form>
									</div>
									<div class="scrollable position-relative"
										style="height: calc(100vh - 250px);">


										<ul class="mailbox list-style-none" id="contectListArea">



											<!-- Message -->
											<%--                                                      <a href="javascript:void(0)"
                                                        class="message-item d-flex align-items-center border-bottom px-3 py-2">
                                                        <div class="user-img"> <img src="${ pageContext.servletContext.contextPath }/resources/assets/images/users/3.jpg"
                                                                alt="user" class="img-fluid rounded-circle"
                                                                width="40px"> <span
                                                                class="profile-status away float-right"></span>
                                                        </div>
                                                        <div class="w-75 d-inline-block v-middle pl-2">
                                                            <h6 class="message-title mb-0 mt-1">Arijit Sinh</h6>
                                             
                                                        </div>
                                                    </a> --%>

										</ul>
									</div>
								</div>
								<!--  채팅화면 -->
								<div class="col-lg-7  col-xl-9">

									<div class="border-bottom" style="padding: 15px; height: 90px;">
										<div style="float: left;">
											<img
												src="${ pageContext.servletContext.contextPath }/resources/assets/images/users/1.jpg"
												alt="user" class="rounded-circle" width="65">
										</div>

										<div style="float: left; margin-left: 10px;">
										<c:choose>
											<c:when test="${not empty receiver }">
											<span id='receiverName'
												style="font-size: 22px; color: #1c2d41; font-weight: bold;">${ receiver.EName}</span>
											<span id="job" style="font-size: 16px;">${ receiver.jobName}</span> <br> 
											<span id="dept" style="font-size: 16px;"> ${ receiver.deptTitle}<span> | </span> </span>
											<span id="email" style='font-size: 16px;'>${ receiver.email}<span> | </span></span>
											<span id="phone" style='font-size: 16px;'>${ receiver.phone}</span>
										    <input id="receiver" type="hidden"  name="receiver" value="${receiver.ENo }" />
										    <input id="receiverId" type="hidden"  name="receiverId" value="${receiver.loginId }" />
											</c:when>
										</c:choose>
											
										</div>
									</div>

									<div class="chat-box scrollable position-relative"
										style="height: calc(100vh - 250px);">

										<!--chat Row -->
										<ul class="chat-list list-style-none px-3 pt-3">

											<!--chat Row -->
											<li class="chat-item list-style-none mt-3">
												<div class="chat-img d-inline-block">
													<img
														src="${ pageContext.servletContext.contextPath }/resources/assets/images/users/3.jpg"
														alt="user" class="rounded-circle" width="45">
												</div>
												<div class="chat-content d-inline-block pl-3">
													<h6 class="font-weight-medium">Angelina Rhodes</h6>
													<div class="msg p-2 d-inline-block mb-1">Well we have
														good budget for the project</div>
												</div>
												<div class="chat-time d-block font-10 mt-1 mr-0 mb-3">11:00
													am</div>
											</li>
											<!--chat Row -->


										</ul>
									</div>
									<div class="card-body border-top">
										<div class="row">
											<div class="col-9">
												<div class="input-field mt-0 mb-0">
													<input placeholder="메세지를 입력하세요."
														class="form-control border-0" id="message" type="text">
												</div>
											</div>
											<div class="col-3">
												<a class="btn-circle btn-lg btn-cyan float-right text-white"
													id="sendBtn"><i class="fas fa-paper-plane"></i></a>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- ============================================================== -->
			<!-- End Container fluid  -->
			<!-- ============================================================== -->
			<!-- ============================================================== -->
			<!-- footer -->
			<!-- ============================================================== -->
			<footer class="footer text-center">
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
	<!-- End Wrapper -->
	<!-- ============================================================== -->
	<!-- All Jquery -->
	<!-- ============================================================== -->
	<script
		src="${ pageContext.servletContext.contextPath }/resources/assets/libs/jquery/dist/jquery.min.js"></script>
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
	<script
		src="${ pageContext.servletContext.contextPath }/resources/assets/libs/perfect-scrollbar/dist/perfect-scrollbar.jquery.min.js"></script>
	<script
		src="${ pageContext.servletContext.contextPath }/resources/dist/js/sidebarmenu.js"></script>
	<!--Custom JavaScript -->
	<script
		src="${ pageContext.servletContext.contextPath }/resources/dist/js/custom.min.js"></script>
	<!--This page JavaScript -->

	<!-- 부트스트랩5 -->
	<!--     <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>
 -->
	<!-- SockJs 라이브러리 추가  -->
	<!--     <script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>
     -->

	<script>
    var socket = null;
    $(document).ready( function() {
        connectWS();	
    });
    function connectWS() {
        var ws = new WebSocket("ws://localhost:8090/wecanvas/echo");
        socket = ws;
        ws.onopen = function () {
            console.log('Info: connection opened.');
        };
        ws.onmessage = function (event) {
            console.log(event.data+'\n');
            
             $('.chat-list').append(`
            		
					<!--chat Row -->
					<li class="chat-item list-style-none mt-3">
						<div class="chat-img d-inline-block">
							<img
								src="${ pageContext.servletContext.contextPath }/resources/assets/images/users/3.jpg"
								alt="user" class="rounded-circle" width="45">
						</div>
						<div class="chat-content d-inline-block pl-3">
							<h6 class="font-weight-medium">Angelina Rhodes</h6>
							<div class="msg p-2 d-inline-block mb-1">							
									\${event.data}
							</div>
						</div>

					</li>

            		`); 


        };
        
        ws.onclose = function (event) { 
            console.log('Info: connection closed.');
        };
        ws.onerror = function (err) { console.log('Error:', err); };
        

    }

	//자신의 url과 핸들러 맵핑할 주소로 WebSocket객체 생성, 객체가 메시지를 받고 연결이 끊길 때 호출할 함수 셋팅  

    	
        $(function () {
 
        	$('#message').on('keypress',function(e){
                if (e.keyCode == 13) {
                    var msg = $(this).val();
                    var recevier = $("#receiver").val();
                    
                       sendAjax(msg);
                      
 
  
				 		$(".chat-list").append(`
		                        <li class="chat-item odd list-style-none mt-3">
		                        <div class="chat-content text-right d-inline-block pl-3">
		                            <div class="box msg p-2 d-inline-block mb-1">\${msg} </div>
		                            <br>
		                        </div>
		                    </li>	
		        				`);
                   $(this).val("");
                   $(this).focus(); 
               }
	
        	});
        	
        	
        	$('#searchContect').keyup(function(event) {
        		var val = $(this).val(); if (val == "") { 
        			$('.mailbox li').show(); 
        		} else {
        				$('.mailbox li').hide(); $(".mailbox li:contains('"+val+"')").show(); 
        			} 
        		});

        var contectList = $("#contectListArea");
        
         $.ajax({
        	url:'deptList.ch',
        	type:'post',
        	dataType:'json',
        	success : function(list){
        		
         		list.forEach((d => {
        			contectList.append(`
                            <li>
	                            <a href="#"
	                                class="message-item d-flex align-items-center border-bottom px-3 py-2">
	                                 <i class="icon-menu" style="font-size:14px;"></i> &nbsp;&nbsp;&nbsp;
	                                    <span class="message-title mb-0 mt-1" style="font-size:21px;">\${d.title}</span>
	                     
	                            </a>
	                            <ul id="\${d.title}">
	                            </ul>
                            </li>
        					`)
   			
        			selectContectList(d.title);
         		}));  

        	}
        })
	
                	
        });
        
        function selectContectList(title){
        	
        	var titleArea = $("#"+title);
        	var title = title;
        	$.ajax({
        		url:'contectList.ch',
        		type:'post',
        		dataType:'json',
        		data:{
        			title : title
        		},
        		success : function(list){
              		list.forEach((c => {
						titleArea.append(`
								<div style="margin-left:20px;">
        							<a href="chatPage.ch?eno=\${c.eNo}">
	        								<li>
	    											<span style="font-size:14px;">\${c.eName}</span>
	    									</li>
									</a>
								</div>

								`)
            		}));

        		}
        	})
  
        }
        
    
     	
        var sendAjax = function(msg){
        	
        	var msg = msg;
        	var receiver = $("#receiver").val();
         	var receiverId = $("#receiverId").val();
         	var sender = '${ loginUser.empNo }';
        	var senderId = '${ loginUser.loginId }';

        	
        	$.ajax({
        		url:'sendMsg.ch',
        		type:'post',
        		data:{
        			msg : msg,
        			receiver : receiver,
        			sender : sender
        		},
        		success:function(result){
        			console.log(result);
        			if(result == 0){
						//db에 먼저 올리고 성공하면  webSocket에 메세지 보냄 (프로토콜 : 기능, 메세지, 발신자, 수신자)
        				socket.send("chat," + senderId +"," + receiverId+"," + msg);
        			}else{
        				alert("현재 서버오류로 채팅이 불가합니다.");
        			}
        		}
        	}) 
        	
        }  
 
    </script>
</body>

</html>