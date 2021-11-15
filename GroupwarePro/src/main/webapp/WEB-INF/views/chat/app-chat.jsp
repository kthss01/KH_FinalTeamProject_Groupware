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

<style>
.ps-scrollbar-x-rail {
	bottom: 0px;
}

.ps-scrollbar-y-rail {
	top: 0px;
}

.nameList:hover{

	font-weight:bold;
	
}

</style>

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
		<!-- 팝업 공지  -->


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
			<div class="container-fluid"
				style="padding-left: 70px; padding-right: 70px;">
				<div class="row">
					<div class="col-md-12">
						<div class="card">
							<div class="row no-gutters">

								<!-- 주소록 -->
								<div class="col-lg-5 col-xl-3 border-right">
									<div class="card-body">
										<h3
											style="color: #1C2D41; font-weight: bold; display: inline;">주소록</h3>
										<select
											style="height: 35px; width: 100px; font-size: 13px; position: absolute; right: 10px; color: #5F76E8;"
											class="mr-sm-2 custom-select form-control bg-white custom-radius custom-shadow border-1"
											name="status" id="status">
											<option value="1" selected>온라인</option>
											<option value="2">부재중</option>
											<option value="3">회의중</option>
											<option value="4">식사중</option>
										</select>

										<div style="margin-top: 30px;">

											<form>
												<input id="searchContect" class="form-control" type="text"
													placeholder="이름  입력"
													style="font-size: 15px; display: inline-block; width: 85%;">
												<i class="icon-magnifier"></i>
											</form>
										</div>

									</div>
									<div class="scrollable position-relative"
										style="height: calc(100vh - 400px);">


										<ul class="mailbox list-style-none" id="contectListArea">
											<!-- 연락처 추가 영역 -->

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
													<span id="job" style="font-size: 16px;">${ receiver.jobName}</span>
													<br>
													<span id="dept" style="font-size: 12px;"> ${ receiver.deptTitle}<span>
															| </span>
													</span>
													<span id="email" style='font-size: 12px;'>${ receiver.email}<span>
															| </span></span>
													<span id="phone" style='font-size: 12px;'>${ receiver.phone}</span>
													<input id="receiver" type="hidden" name="receiver"
														value="${receiver.ENo }" />
													<input id="receiverId" type="hidden" name="receiverId"
														value="${receiver.loginId }" />
													<button type="button" class="btn btn-outline-warning" id="favoritesBtn" 
													style="font-size:15px; position:absolute; right:10px; top:10px;" onclick="favorites();">
														 <i class="fa fa-star" ></i>즐겨찾기
													 </button>
												</c:when>
												<c:otherwise>

													<span style="font-size: 14px;"><i class="icon-clock"></i>
														weCanvas 메신저의 대화기록은 48시간 보존됩니다.</span>
													<br>
													<span style="font-size: 14px;"> 이전 기록이 필요하시면
														weCanvas 고객지원팀으로 문의주시기 바랍니다.</span>
												</c:otherwise>


											</c:choose>
										</div>
									</div>
										<div id="newAlert" style="display:none;" class="alert alert-dark alert-dismissible fade show mb-0" role="alert">
		                                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
		                                        <span aria-hidden="true">×</span>
		                                    </button>
		                                    <strong>새로운 메세지 도착 </strong>
		                                </div>
									<div class="chat-box scrollable position-relative"
										style="height: calc(100vh - 400px); ">

										<!--chat Row -->
										<ul class="chat-list list-style-none px-3 pt-3">


											<!-- 이전 기록 조회 -->
											<c:forEach items="${ chatList }" var="c">
												<c:if test="${ c.receiver eq loginUser.empNo }">
													<li class="chat-item odd list-style-none mt-3">
														<div class="chat-content text-right d-inline-block pl-3">
															<div class="box msg p-2 d-inline-block mb-1">${c.msg}
															</div>
															<br>
														</div>
													</li>
												</c:if>
												<c:if test="${ c.receiver ne loginUser.empNo }">
													<li class="chat-item list-style-none mt-3">
														<div class="chat-img d-inline-block">
															<img
																src="${ pageContext.servletContext.contextPath }/resources/assets/images/users/3.jpg"
																alt="user" class="rounded-circle" width="45">
														</div>
														<div class="chat-content d-inline-block pl-3">
															<div class="msg p-2 d-inline-block mb-1">${c.msg}</div>
														</div>

													</li>
												</c:if>


											</c:forEach>

											<!-- 메시지 올라오는 화면 -->
										</ul>
									</div>
									<c:if test="${not empty receiver }">

										<div class="card-body border-top">
											<div class="row">
												<div class="col-9">
													<div class="input-field mt-0 mb-0">
														<c:if test="${receiver.EStatus ne '오프라인' }">
															<input placeholder="메세지를 입력하세요."
																class="form-control border-0" id="message" type="text">
														</c:if>
														<c:if test="${receiver.EStatus eq '오프라인' }">
															<input placeholder="오프라인인 상대와는 대화가 불가합니다."
																class="form-control border-0" id="message" type="text"
																readonly>
														</c:if>
													</div>
												</div>
												<div class="col-3">
													<a
														class="btn-circle btn-lg btn-cyan float-right text-white"
														id="sendBtn"><i class="fas fa-paper-plane"></i></a>
												</div>
											</div>
										</div>
									</c:if>
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


	<script>

	
	
	
        $(function () {
        	
        	selectDeptList();
        	
  
        	if($("#receiver").val() != null){
            	checkFavorites();

        	}
        	
        	

        	//일정시간 마다 주소록 조회 (상태변경을 위한 반복 조회)
        	
       	    var timer = setInterval(function(){
            	selectDeptList();
		    }, 60000)
        	
    	    //스크롤바 제일 아래로 초기화
  	      $('.chat-list').parent().animate({
  	          scrollTop: $('.chat-list').height()
  	        }, 100);
  	    
        	
        	
        	let target = document.querySelector('.chat-list');

        	// 감시자 인스턴스 만들기
        	let observer = new MutationObserver((mutations) => {
        	    // 노드가 변경 됐을 때의 작업
        	    
        	    //새로운 메세지 오면 스크롤바 제일 아래로
        	      $('.chat-list').parent().animate({
        	          scrollTop: $('.chat-list').height()
        	        }, 300);
        	    
        	})

        	// 감시자의 설정
        	let option = {
        	    attributes: true,
        	    childList: true,
        	    characterData: true
        	};

        	// 대상 노드에 감시자 전달
        	observer.observe(target, option);
        	
        	
        	$('.chat-box').on('resize',function(){
        		
        		console.log($(this).height);
        	})

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
        		var val = $(this).val();
        		if (val == "") { 
        			$('.mailbox li').show(); 
        		} else {
        				$('.mailbox li').hide(); 
        				$(".mailbox li:contains('"+val+"')").show(); 
        			} 
        		});
        


        	
        });
      
        
        var selectDeptList = function(){
        	
        	var contectList = $("#contectListArea");
        	contectList.empty();
        	
        	contectList.append(`
        			
					<li>
                    <a href="#"
                        class="message-item d-flex align-items-center border-bottom px-3 py-2">
                         <i class="fas fa-star" style="font-size:18px; color:orange;"></i> &nbsp;&nbsp;&nbsp;
                            <span class="message-title mb-0 mt-1 font-weight-bold" style="font-size:19px; color:#5F76E8;">즐겨찾기</span>
             
                    </a>
	                    <ul id="favorites">
	                    </ul>
                  </li>
        			
        			
        			`)
        			
        	var eno = '${ loginUser.empNo }';

        	$.ajax({
        		url:'favorites.ch',
        		type:'post',
        		data : { eno : eno },
        		dataType:'json',
        		success: function(list){
        			list.forEach((f => {
        				$("#favorites").append(`
        						
							    <div style="margin-left:20px;">
								<a class="fas fa-minus deleteFavorites" href="delteFavorites.ch?fno=\${f.fno}&eno=\${eno}" style="font-size:14px; position:absolute; right:30px; margin-top:10px;"></a>

	    							<a href="chatPage.ch?eno=\${f.fno}">

	        								<li class="nameList">

	    											<span style="font-size:16px; color:#1C2D41;">\${f.fName}</span>
	    											<span style="font-size:10px; color:#005600; display:inline-block; margin-left:10px;">( \${f.status})</span>
	    									</li>
									</a>

								</div>

        						`)

        			}));
        			
        		}
        		
        	}) 
        	
        	
        	
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
    	                                 <i class="icon-menu" style="font-size:11px;"></i> &nbsp;&nbsp;&nbsp;
    	                                    <span class="message-title mb-0 mt-1" style="font-size:19px;">\${d.title}</span>
    	                     
    	                            </a>
    	                            <ul id="\${d.title}">
    	                            </ul>
                                </li>
            					`)
       			
            			selectContectList(d.title);
             		}));  

            	}
            })
        	
        	
        }
        
        
        
        
        
        
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
              			if(c.eNo != ${ loginUser.empNo }){
              				
    						titleArea.append(`
    								<div style="margin-left:20px;">
            							<a href="chatPage.ch?eno=\${c.eNo}">
    	        								<li class="nameList">
    	    											<span style="font-size:16px; color:#1C2D41;">\${c.eName}</span>
    	    											<span style="font-size:10px; color:#005600; display:inline-block; margin-left:10px;">( \${c.eStatus})</span>
    	    									</li>
    									</a>
    								</div>
    								`)
              			}
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
            			if(result == 1){
    						//db에 먼저 올리고 성공하면  webSocket에 메세지 보냄 (프로토콜 : 기능, 발신자, 수신자, 발신자번호, 메세지)
            				socket.send("chat," + senderId +"," + receiverId+","+sender +"," + msg);
            			}else{
            				alert("현재 서버오류로 채팅이 불가합니다.");
            			}
            		}
            	}) 
        
        $("#status").on('change',function(){
        	var eStatus = $(this).val();
         	var eNo = '${ loginUser.empNo }';

        	$.ajax({
        		url:'updateStatus.ch',
        		data: {
        			eStatus : eStatus,
        			eNo : eNo
        			
        		},
        		type:'post',
        		success:function(){
        		},error:function(){
        			alert("서버오류 : 고객지원팀으로 문의 바랍니다.");
        		}
        	
        	})
        });

 }

        
        var favorites = function(){
        	

        	var fno = $("#receiver").val();
        	var eno = ${loginUser.empNo};
        	
         	$.ajax({
         		url:"insertFavorites.ch",
         		type:'post',
         		data : {
         			fno : fno,
         			eno : eno
         		},
         		success : function (result){
         			
         		console.log("result : " + result);
          			if(result != null  ){
         				location.reload();

         			}else{
         				alert("서버오류 : 고객지원팀으로 문의 바랍니다.")

         			} 
         			

         		}
        		
        	});
        	
        	
        	
        }    	
    	
    	
    	var checkFavorites = function(){
    		
    		var eno = '${ loginUser.empNo }';
        	var fno = $("#receiver").val();
        	
        	
        	$.ajax({
        		url:'checkFavorites.ch',
        		type:'post',
        		data:{eno : eno, fno : fno},
        		success : function(result){
        			if(result == 1){
        				
        				$("#favoritesBtn").css("display","none");
        				
        			}else{
        				$("#favoritesBtn").css("display","block");

        			}
        		}
        	});


    	}
        
        </script>
</body>

</html>