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
    <title>We-Canvas survey question script</title>
    <!-- Custom CSS -->
    
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
 
    
    <link href="${ pageContext.servletContext.contextPath }/resources/assets/extra-libs/c3/c3.min.css" rel="stylesheet">
    <link href="${ pageContext.servletContext.contextPath }/resources/assets/libs/chartist/dist/chartist.min.css" rel="stylesheet">
    <link href="${ pageContext.servletContext.contextPath }/resources/assets/extra-libs/jvector/jquery-jvectormap-2.0.2.css" rel="stylesheet" />
    <!-- Custom CSS -->
    <link href="${ pageContext.servletContext.contextPath }/resources/dist/css/style.min.css" rel="stylesheet">


<style>
	
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
			<h3 class="card-title text-truncate text-dark font-weight-bold mb-1"> 설문  </h3>
			
			<div class="card">
				<div class="card-body">
						<h4 class="font-weight-bold card-title"> 질문 등록</h4>
					
							<span class="card-subtitle font-weight-bold" style="color:black;"> 설문 제목 : <b>${survey.surveyTitle}</b> </span>
							<hr>
							<span class="card-subtitle font-weight-bold" style="color:black;"> 설문 내용 : <b>${survey.surveyContent}</b></span>
							<br>
							<span class="card-subtitle font-weight-bold font-11 question-count"> 총 질문 수 :  ${survey.questionCount}</span>
				</div>
			</div>
			<div class="table-responsive">
				<div id="zero_config_wrapper" class="dataTables_wrapper container-fluid dt-bootstrap4">
					<div class="row">
						
					<div class="col-sm-12 col-md-6">
					</div>
					
				</div>
			<div class="row">
			<div class="col-sm-12">
			
					<ul class="list-unstyled qList" id="qList">
						<li class="list-item">
							<div class="card">
								<h4 class="card-title"> - ${survey.questionCount} 번 질문</h4>
									<input type="text" class="questionNo" id ="questionNo" name="questionNo" value="${survey.questionCount}" readonly style="display:none">
									<div class="card-body input-field">
										<input type="text" class="essayText" name="essayText" placeholder="질문의 내용을 적어주십시오.">
									</div>
							</div>
						</li>
						
						
					
					</ul>
						<div class="card">
							<div class="card-body">
								<select class="bg-white border-0 type"  name="type" class="type" style="width=150px;">
									<option value="essay" selected> 서술형 </option>
									<option value="optional"> 선택형 </option>
								</select>
								<button type="button" class="btn waves-effect btn-dark font-weight-bold addNewQuestion">  질문추가  + </button>			
								<button type="button" class="btn btn-secondary testBtn">테스트 버튼</button>			
								<div class="form-group">
								</div>
							</div>
						</div>	
						
						
					<ul class="testUL">
					
					</ul>
			</div>
			</div>
                                    
                                    
           <div class="row">
           		<div class="col-sm-12 col-md-5">
                                    
            	<div class="guid_text" id="zero_config_info" role="status" aria-live="polite"> 
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
	</div>
	</div>
	<script>
	
		var list = document.getElementById("#qList");
		var index = document.getElementById("#questionNo").value;
	
		const tag = '<li class="list-item"> <div class="card"> <h4 class="card-subtitle"> -' +  + 번 질문</h4>
							<input type="text" class="questionNo" name="questionNo" value="${survey.questionCount}" readonly style="display:none">
							<div class="card-body input-field">
								<input type="text" class="essayText" name="essayText" placeholder="질문의 내용을 적어주십시오.">
							</div>
					</div>
				</li>';
		
		const addNewQuestion =()=> {
			list.append(tag);
		}
		
		
		document.querySelector(".testBtn").addEventListener('click',addNewQuestion);
	
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