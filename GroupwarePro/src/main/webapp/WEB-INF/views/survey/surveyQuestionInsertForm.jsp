<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
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
							<label for="surveyTitle"> 설문 제목 :</label>
							<span class="card-subtitle font-weight-bold surveyTitle" style="color:black;">${survey.surveyTitle}</span>
							<hr>
							<label for="surveyContent"> 설문 내용 :</label>
							<span class="card-subtitle font-weight-bold surveyContent" style="color:black;">${survey.surveyContent}</span>
							<br>
							<span class="card-subtitle font-weight-bold font-11 question-count"> 총 질문 수 :  ${survey.questionCount}</span>
							<br>
							<button type="button" class="btn waves-effect waves-light btn-primary" onclick="history.back()">작성 취소</button>
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
			
					<input type="text" class="question-no" value="${survey.questionCount}" readonly style="display:none">
					<ul class="list-unstyled question-list">
					
					<% int i = 0; %>
					<c:forEach items="${list}" var="q">
						<c:if test="${not empty list}">
							
					<li class="list-item">
						<div class="card">
							<h4 class="card-subtitle"> <%=i++%>번 질문</h4>
						<input type="text" class="sequence" name="sequence" value="">
						<div class="card-body input-field">
							<label for="essayText">질문 : ${q.esText} </label>
							<input type="text" class="essayText" name="essayText" placeholder="질문의 내용을 적어주십시오." required>
							</div>
						</div>
					</li>
						
						
						</c:if>
					</c:forEach>
						
					
					</ul>
						<div class="card">
							<div class="card-body">
								<button type="button" class="btn waves-effect btn-dark font-weight-bold addNewQuestion">  질문추가  + </button>			
								<div class="form-group">
								</div>
							</div>
						</div>	
						
			
			</div>
			</div>
                                    
                                    
           <div class="row">
           		<div class="col-sm-12 col-md-5">
                                    
            	<div class="list_info" id="zero_config_info" role="status" aria-live="polite"> 
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
	<script>
	
			var list = document.querySelector(".qList");
			var value = document.querySelector(".question-no").value;
			var list = document.querySelector(".question-list");
			
			
			$(function(){
				
				
				if(value==0){
					value = 1;
				}
				
				$(".addNewQuestion").click(function(){
					
					console.log("value : " + value);
					list.innerHTML += `<li class="list-item">
						<div class="card">
					<h4 class="card-subtitle"> - `+ value +` 번 질문</h4>
						<input type="text" class="sequence" name="sequence" value="`+value+`" readonly style="display:none;">
						<div class="card-body input-field">
							<label for="essayText">질문 : </label>
							<input type="text" class="essayText" name="essayText" placeholder="질문의 내용을 적어주십시오." required>
							<br>
							<button type="button" class="btn waves-effect waves-light btn-secondary saveQuestion"> O </button>
							<button type="button" class="btn waves-effect waves-light btn-secondary canceQuestion"> X </button>
							</div>
						</div>
					</li>`;
					value++;
				})
								
			})
			
					
				
				
			
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