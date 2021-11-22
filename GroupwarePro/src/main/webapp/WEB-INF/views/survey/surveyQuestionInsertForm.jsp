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
	
	.info-wrapper{
		border-radius: 3px;
		border: 2px solid rgba(0,0,0,.32);
		padding: 5px 10px 5px 10px;
		width: 150px;
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
			<h3 class="card-title text-truncate text-dark font-weight-bold mb-1"> 설문 - 질문 등록 </h3>
			
			<fieldset class="info-wrapper">
			<legend class="font-weight-bold"> 질문 등록</legend>
			
			
			<span class="card-subtitle font-weight-bold" style="color:black;"> 설문 제목 : <b>${survey.surveyTitle}</b> </span>
			<br>
			<span class="card-subtitle font-weight-bold" style="color:black;"> 설문 내용 : <b>${survey.surveyContent}</b></span>
			<br>
			</fieldset>
			<div class="table-responsive">
				<div id="zero_config_wrapper" class="dataTables_wrapper container-fluid dt-bootstrap4">
					<div class="row">
						
					<div class="col-sm-12 col-md-6">
					</div>
					
				</div>
			<div class="row">
			<div class="col-sm-12">
			
			<form class="surveyFrom mt-3" action="survey">
					
					<ul class="list-unstyled question-list">
					
					<li>
						
					</li>	
					
					</ul>
						<div class="card">
							<div class="card-body">
								<select class="bg-white border-0 type"  name="type" id="type" style="width=150px;" onchange="eventHandler(this);">
									<option value="essay" selected> 서술형 </option>
									<option value="optional"> 선택형 </option>
								</select>
								<button type="button" class="btn font-weight-bold" onclick="addNewQuestion();">  질문추가  + </button>						
								<div class="form-group">
								</div>
							</div>
						</div>	
			</form>
			
			</div>
			</div>
					
			
			<script>
			var order = 0;
			var list = document.querySelector(".question-list");
			var type = document.querySelector(".type")
			

			function eventHandler(event){
				var value = event.options[event.selectedIndex].text;
				console.log(event.options);
				console.log(value);
				
					order = order + 1;
				if ( value == "essay" ) {
					list.innerHTML += '<li> <div class="card"> <h5 class="card-title font-weight-bold">' + order + ' </h5> <input type="text" value="' + order + '" readonly style="display:none;"><br><input type="text" class="question_content" placeholder="질문을 작성하세요."> <br> <input type="text" class="question_answer"> <br> </div> </li>';
					
					appendNewEssay();
					
				} else {
					
					appendNewOptional()]
				}
 				
				
			}
			
			
			
			function eventHandler(event){
				
				var value = event.options[event.selectedIndex].text;
				console.log(event.options);
				console.log(value);
			}
			
			
			
			
			$(function(){
				
				<%--
				var obj = new Object();
				obj.name = $(".surveyTitle").value;
				obj.questions = $()
				--%>
				
				<!--   
					
				1.  Name 속성으로 배열방식으로 질문 요소를 불러 일금
				
				2.  향상된 for문으로 차례로 지문을 읽어가며 해당 영역의 첫번째 자식 요소 값을 가져옴
				
				3. 해당 자식 요소 값이 "essay"  또는 "optional" 일 경우 그에 따른 객체 정보를 담음
				
				4. 저장될때 각각 순차적인 시퀀스 값을 가 짐 ( 질문 순서 )
				
				5. 최종 적으로 이 정보를 객체 배열에 담고 gson 으로 변환
				
				6. gson을 Controller 로 보냄 ( 또는 객체 리스트 그대로를 보냄 )
				
				7. --...								
				
				-->
						
				var q-list = document.getElementsByClassName("questions");
				
				
				for ( var i in q-list ) {
					
					var type = i.child().eq().value;
					
					if ( type == "essay"){
						
						
					}
					
				}
				
				
				
			})
			
			
			
			
			
			
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