<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>WeCanvas</title>
    <!-- Custom CSS -->
    <link href="${ pageContext.servletContext.contextPath }/resources/assets/extra-libs/c3/c3.min.css" rel="stylesheet">
    <link href="${ pageContext.servletContext.contextPath }/resources/assets/libs/chartist/dist/chartist.min.css" rel="stylesheet">
    <link href="${ pageContext.servletContext.contextPath }/resources/assets/extra-libs/jvector/jquery-jvectormap-2.0.2.css" rel="stylesheet" />
    <link href="${ pageContext.servletContext.contextPath }/resources/dist/css/style.min.css" rel="stylesheet">
    
    <!-- JQuery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<style>
	
	
	
	
	</style>
</head>
<body>


	<div id="main-wrapper" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full" data-sidebar-position="fixed" data-header-position="fixed" data-boxed-layout="full">
	<jsp:include page="${pageCOntext.servletContext.contextPath}/WEB-INF/views/common/m_header.jsp"/>
	<jsp:include page="${pageCOntext.servletContext.contextPath}/WEB-INF/views/common/m_sidebar.jsp"/>
	
	
		
	<div class="container-fuild" style="padding: 81px 0px 0px 265px;">
		<div class="col-12">
		<div class="card" >
			<div class="card-body"> 
				<h3 class="card-title font-weight-bold text-truncate text-dark font-weight-bold mb-1"> 팝업 공지</h3>
			<div class="insert-form-wrapper">
				<form class="form pNotice-Info" action="updatepNotice.no" method="GET">
						 <div class="info d-block align-items-center">
								<ul class="ref navbar-nav">
									<li>
									<div class="card-body" style="display:none;">
											<h3 class="card-title font-weight-bold"> 공지 번호 </h3>
											<input type="text" class="form-control popNo" name="popNo" value="${pNotice.popNo}" required>
										</div>
                            		</li>
									<li>
									<div class="card-body">
											<h3 class="card-title font-weight-bold"> 제목 </h3>
											<input type="text" class="form-control title" name="title" value="${pNotice.title}" required maxlength="20">
										</div>
                            		</li>
                            		<li>
                            			<div class="card-body">
											<h3 class="card-title font-weight-bold"> 내용 </h3>
											<textarea class="form-control content" name="content" required maxlength="300">${pNotice.content}</textarea>
										</div>
                            		</li>
                            		<li>
                            			<div class="card-body">
											<h3 class="card-title font-weight-bold"> 공지 시작 </h3>
											<input type="date" class="form-control startDate" name="startDate" value="${pNotice.startDate}" pattern="\d{4}-\d{2}-\d{2}" required>
										</div>
                            		</li>
                            		<li>
                            			<div class="card-body">
											<h3 class="card-title font-weight-bold"> 공지 종료</h3>
											<input type="date" class="form-control finishDate" name="finishDate" value="${pNotice.finishDate}" required>
										</div>
                            		</li>
                            		<li>
                            			<div class="card-body">
											<h3 class="card-title font-weight-bold"> 공지 상태</h3>
											<select class="form-control finishDate" name="statement" required>
												<option value='Y'>공개</option>
												<option value='N'>비공개</option>
											</select>
										</div>
                            		</li>
                            		<li>
                            			<div class="btn-list">
                            				<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#info-alert-modal" class="preview">미리보기</button>
                            				<!-- Right modal -->
                            				<button type="submit" class="btn btn-secondary">수정완료</button>
                            				<button type="button" class="btn btn-dark" onclick="history.back();">수정취소</button>
                            			</div>
                            		</li>
                            	</ul>
                            </div>	
				</form>
			</div>

		</div>
		</div>
		
		<div class="toast fade" role="alert" data-autohide="false" aria-live="assertive" aria-atomic="true" id="toastBody">
                        <div class="toast-header">
                            <i class="icon-bulb" style="width:100%; left:1; position:absolute;"></i>
                            <strong class="mr-auto pTitle"> \${p.title} </strong>
                            <button type="button" class="ml-2 mb-1 close" data-dismiss="toast" aria-label="Close">
                        	    <span  id="closeToast" aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="toast-body pContent">
                        	\${p.content}
                        	<hr>
                        <a class="block-a-day" style="text-decoration:none; cursor:pointer;">하루동안 보지 않기</a>
                        </div>
       </div>
       
       
	</div>
	</div>
	</div>
	
	<script>
		
	
		$(function(){
			
				
			$(".preview").click(function(){
					
					$(".pTitle").text($(".title").val());
					$(".pContent").text($(".content").val());
					
					$(".toast").addClass("show");
					
					
					
					$("#closeToast").on("click",function(){
						$("#toastBody").removeClass("show");
					})
				})
				
			
			function addZero(data){
				var result='';
				if(data < 10){
					result='0'+data.toString();
					}else{
					result=data;
					}
				return result;
				}
			
			<!-- 기본 날짜 설정 -->
			var sysdate = new Date();
			
			var year = sysdate.getFullYear();
			var month = sysdate.getMonth() + 1;
			var date = sysdate.getDate();
			
			
			<!-- 공지 시작일 최소 날짜 값 -->
			var startDefaultMin = year + '-' + addZero(month)+ '-' + addZero(date);
			<!-- 마감일 최소 날짜 값은 최소 입력 날짜의 1일 이후로 설정-->
			var finishDefaultMin = year + '-' + addZero(month) + '-' + addZero(date+1);
			
	
			if(sysdate.getMonth()+1 >= 7 ) { 
				year = year+1;
				month = 6 - 12 - sysdate.getMonth();
					if(month == 2 && ((year % 4 == 0) && (year % 100 != 0)) || (year % 400 == 0)){
						date = 28;
					}else{
						date = 29;
					}
			}
			
			var startDefaultMax = year + '-' + addZero(month) + '-' + addZero(date);
			
			$(".startDate").attr('min',startDefaultMin);
			$(".startDate").attr('max',startDefaultMax);
			$(".finishDate").attr('min',finishDefaultMin);
					
		})
		
		<!-- 날짜 양식을 0000 -00 - 00 으로 맞추기 위해 10일 또는 10월 보다 아래일 경우 0을 붙이는 함수 -->

		
		
		
 	</script>
	
	
	
	
	
	<script src="${ pageContext.servletContext.contextPath }/resources/assets/libs/jquery/dist/jquery.min.js"></script>
    <script src="${ pageContext.servletContext.contextPath }/resources/assets/libs/popper.js/dist/umd/popper.min.js"></script>
    <script src="${ pageContext.servletContext.contextPath }/resources/assets/libs/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- apps -->
    <!-- apps -->
    <script src="${ pageContext.servletContext.contextPath }/resources/dist/js/app-style-switcher.js"></script>
    <script src="${ pageContext.servletContext.contextPath }/resources/assets/libs/perfect-scrollbar/dist/perfect-scrollbar.jquery.min.js"></script>
    <script src="${ pageContext.servletContext.contextPath }/resources/dist/js/sidebarmenu.js"></script>
    <!--Custom JavaScript -->
    <!--This page JavaScript -->
    <script src="${ pageContext.servletContext.contextPath }/resources/assets/extra-libs/c3/d3.min.js"></script>
    <script src="${ pageContext.servletContext.contextPath }/resources/assets/extra-libs/c3/c3.min.js"></script>
    <script src="${ pageContext.servletContext.contextPath }/resources/assets/libs/chartist/dist/chartist.min.js"></script>
    <script src="${ pageContext.servletContext.contextPath }/resources/assets/extra-libs/jvector/jquery-jvectormap-2.0.2.min.js"></script>
    <script src="${ pageContext.servletContext.contextPath }/resources/assets/extra-libs/jvector/jquery-jvectormap-world-mill-en.js"></script>
	
</body>
</html>