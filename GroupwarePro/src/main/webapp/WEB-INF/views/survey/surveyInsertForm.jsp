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
	
	
	.question-wrapper{
		
		box-shadow: 2px 5px 3px 1pxrgba (0,0,0,.67);
	
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
			<h3 class="card-title text-truncate text-dark font-weight-bold mb-1"> 새로운 설문 등록</h3>
		
			<div class="table-responsive">
				<div id="zero_config_wrapper" class="dataTables_wrapper container-fluid dt-bootstrap4">
					<div class="row">
						
					<div class="col-sm-12 col-md-6">
					</div>
					
				</div>
			<div class="row">
			<div class="col-sm-12">
			
			<form class="surveyFrom mt-3" action="insertSurvey.sv" method="GET">
					<div class="card">
						<div class="card-body">
							<h4 class="card-title">제목 </h4>						
							<div class="form-group">
								<input type="text" name="surveyTitle" class="surveyTitle form-control_sm col-md-8" placeholder="설문 제목" aria-controls="zero_config" required maxlength="25">
							</div>
						</div>
					</div>
					
					<div class="card">
						<div class="card-body">
							<h4 class="card-title">내용 </h4>						
							<div class="form-group">
								<input type="text" name="surveyContent" class="surveyContent form-control_sm col-md-8" placeholder="설문 내용" aria-controls="zero_config" required maxlength="250">
							</div>
						</div>
					</div>
					
					<div class="card">
						<div class="card-body">
							<h4 class="card-title">시작일 </h4>						
							<div class="form-group">
								<input type="date" name="startDate" class="startDate form-control_sm col-md-8" placeholder="설문 시작일" aria-controls="zero_config" vale="" required>
							</div>
						</div>
					</div>
					
					<div class="card">
						<div class="card-body">
							<h4 class="card-title">마감일 </h4>						
							<div class="form-group">
								<input type="date" name="finishDate" class="finishDate form-control_sm col-md-8" placeholder="설문 마감일" aria-controls="zero_config" required>
							</div>
						</div>
					</div>
					
					<div class="btn-list">
						<button type="submit" class="btn waves-effect waves-light btn-dark"> 등록 </button>
						<button type="button" class="btn waves-effect waves-light btn-light" onclick="history.back()"> 등록 취소</button>
					</div>
			
			</form>
			
			<!--  시작일에 현재 날짜 자동 입력 -->
			<script>
				document.getElementById('start-date').value = new Date().toISOString().slice(0,10);
			</script>
			
                                    
                                    
           <div class="row">
           	<div class="col-sm-12 col-md-5">
                                    
            	<div class="dataTables_info" id="zero_config_info" role="status" aria-live="polite"> 
            		<span style="font-size:14px;"> ※등록된 설문조사는 설문 시작을 설정한 이후 이용자들에게 노출됩니다.</span>
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
		</footer>
		
	</div>
	</div>
	</div>
	
	</div>
	
	
	
	
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