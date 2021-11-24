<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="${ pageContext.servletContext.contextPath }/resources/assets/images/favicon.png">
    <title>WeCanvas</title>
    <!-- Custom CSS -->
    <link href="${ pageContext.servletContext.contextPath }/resources/assets/extra-libs/c3/c3.min.css" rel="stylesheet">
    <link href="${ pageContext.servletContext.contextPath }/resources/assets/libs/chartist/dist/chartist.min.css" rel="stylesheet">
    <link href="${ pageContext.servletContext.contextPath }/resources/assets/extra-libs/jvector/jquery-jvectormap-2.0.2.css" rel="stylesheet" />
    <link href="${ pageContext.servletContext.contextPath }/resources/dist/css/style.min.css" rel="stylesheet">

	<style>
	
	#boardList li:hover{
	cursor:pointer;
	color:#212529;
	}
	
	

	
	.hidden{
	
	display:none important!;
	
	}
	
	
	</style>
</head>
<body>


	 <div id="main-wrapper" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full" data-sidebar-position="fixed" data-header-position="fixed" data-boxed-layout="full">
	<jsp:include page="${pageCOntext.servletContext.contextPath}/WEB-INF/views/common/m_header.jsp"/>
	<jsp:include page="${pageCOntext.servletContext.contextPath}/WEB-INF/views/common/m_sidebar.jsp"/>
	
	
		
	<div class="container-fuild" style="padding: 81px 0px 0px 265px;">
	<div class="row">
		<div class="col-12">
		<div class="card">
		
			<div class="card-body">
			<h3 class="card-title text-truncate text-dark font-weight-bold mb-1"> 커뮤니티 목록</h3>
		
			<div class="innerWrapper">
				<div id="zero_config_wrapper" class="dataTables_wrapper container-fluid dt-bootstrap4">
					<div class="row">
						<div class="col-sm-12 col-md-6">
						
                                    <div class="row"><div class="col-sm-12 col-md-5">
                                    <div class="col-sm-12 col-md-7">
                                    
                                    <div class="card survey-info" id="zero_config_paginate">
                                    
                                    	<ul class="list-style-none info-list">
                                    		<li>info-update-form
											<div class="card-body">
												<h3 class="card-title"> 설문 번호 </h3>
												<input type="text" class="form-control empName" name="empName" value="${survey.surveyNo}" readonly>
											</div>
                            				</li>
                            				
                            				<li>
											<div class="card-body">
												<h3 class="card-title"> 설문 내용 </h3>
												<input type="text" class="form-control empName" name="empName" value="${survey.surveyContent}" readonly>
											</div>
                            				</li>
                            				
                            				<li>
											<div class="card-body">
												<h3 class="card-title"> 작성일 </h3>
												<input type="text" class="form-control empName" name="empName" value="${survey.writeDate}" readonly>
											</div>
                            				</li>
                            				
                            				<li>
											<div class="card-body">
												<h3 class="card-title"> 시작일 </h3>
												<input type="text" class="form-control empName" name="empName" value="${survey.startDate}" readonly>
											</div>
                            				</li>
                            				
                            				<li>
											<div class="card-body">
												<h3 class="card-title"> 종료일 </h3>
												<input type="text" class="form-control empName" name="empName" value="${survey.finishDate}" readonly>
											</div>
                            				</li>
                                    		
                                    		<li>
											<div class="card-body">
												<h3 class="card-title"> 게시상태 </h3>
												<input type="text" class="form-control empName" name="empName" value="${survey.statement}" readonly>
											</div>
                            				</li>
                            				
                            				<li>
											<div class="card-body">
												<h3 class="card-title"> 총 질문 수 </h3>
												<input type="text" class="form-control empName" name="empName" value="${survey.questionCount}" readonly>
											</div>
                            				</li>
                            				
                            				<li>
	                            				<div class="card-body btn-list">
                            						<button type="button" class="btn waves-effect waves-light btn-primary updateSurveyForm">수정</button>
                            						<button type="button" class="btn waves-effect waves-light btn-primary" onclick="history.back()">뒤로</button>
    	                        				</div>
                            				</li>
                                    	</ul>
                                    	
                                    	<form class="info-update-form hidden">
                                    	
                                    	<ul class="list-style-none">
                                    		<li>
											<div class="card-body">
												<h3 class="card-title"> 설문 번호 </h3>
												<input type="text" class="form-control empName" name="empName" >
											</div>
                            				</li>
                            				
                            				<li>
											<div class="card-body">
												<h3 class="card-title"> 설문 내용 </h3>
												<input type="text" class="form-control empName" name="empName" >
											</div>
                            				</li>
                            				
                            				<li>
											<div class="card-body">
												<h3 class="card-title"> 작성일 </h3>
												<input type="text" class="form-control empName" name="empName" >
											</div>
                            				</li>
                            				
                            				<li>
											<div class="card-body">
												<h3 class="card-title"> 시작일 </h3>
												<input type="text" class="form-control empName" name="empName">
											</div>
                            				</li>
                            				
                            				<li>
											<div class="card-body">
												<h3 class="card-title"> 종료일 </h3>
												<input type="text" class="form-control empName" name="empName" >
											</div>
                            				</li>
                                    		
                                    		<li>
											<div class="card-body">
												<h3 class="card-title"> 게시상태 </h3>
												<input type="text" class="form-control empName" name="empName" >
											</div>
                            				</li>
                            				
                            				<li>
											<div class="card-body">
												<h3 class="card-title"> 총 질문 수 </h3>
												<input type="text" class="form-control empName" name="empName" >
											</div>
                            				</li>
                            				
                            				<li>
	                            				<div class="card-body btn-list">
                            						<button type="button" class="btn waves-effect waves-light btn-primary updateSurveyForm">수정</button>
                            						<button type="button" class="btn waves-effect waves-light btn-primary" onclick="history.back()">뒤로</button>
    	                        				</div>
                            				</li>
                                    	</ul>
                                    	
                                    	
                                    	</form>
                                    	
                                    </div>
                           </div>
                      </div>
                 </div>
			
			</div>
		
		</div>
		</div>
		</div>
		</div>
		
		<footer>
			copyright
		</footer>
		
	</div>
	</div>
	</div>
	
	</div>
	
	
	
	<script>
	
	
	
	$(function(){
		$(".updateSurveyForm").click(function(){
			
			document.querySelector(".survey-info").classList.add("hidden");
			document.querySelector(".info-update-form").classList.remove("hidden");
			
			
		})
	})
	
	
	
	</script>
	
	
	
	
	
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
    <script src="${ pageContext.servletContext.contextPath }/resources/assets/extra-libs/c3/d3.min.js"></script>
    <script src="${ pageContext.servletContext.contextPath }/resources/assets/extra-libs/c3/c3.min.js"></script>
    <script src="${ pageContext.servletContext.contextPath }/resources/assets/libs/chartist/dist/chartist.min.js"></script>
    <script src="${ pageContext.servletContext.contextPath }/resources/assets/libs/chartist-plugin-tooltips/dist/chartist-plugin-tooltip.min.js"></script>
    <script src="${ pageContext.servletContext.contextPath }/resources/assets/extra-libs/jvector/jquery-jvectormap-2.0.2.min.js"></script>
    <script src="${ pageContext.servletContext.contextPath }/resources/assets/extra-libs/jvector/jquery-jvectormap-world-mill-en.js"></script>
    <script src="${ pageContext.servletContext.contextPath }/resources/dist/js/pages/dashboards/dashboard1.min.js"></script>
	
</body>
</html>