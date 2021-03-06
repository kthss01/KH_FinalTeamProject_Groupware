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
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="${ pageContext.servletContext.contextPath }/resources/assets/images/favicon.png">

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
						 <div class="info d-block align-items-center">
								<ul class="ref navbar-nav">
									<li>
									<div class="card-body">
											<h3 class="card-title font-weight-bold"> 제목 </h3>
											<input type="text" class="form-control title" name="title" value="${pNotice.title}" readonly>
										</div>
                            		</li>
                            		<li>
                            			<div class="card-body">
											<h3 class="card-title font-weight-bold"> 내용 </h3>
											<textarea class="form-control content" rows="3" name="content" readonly>${pNotice.content}</textarea>
										</div>
                            		</li>
                            		<li>
                            			<div class="card-body">
											<h3 class="card-title font-weight-bold"> 공지 시작 </h3>
											<input type="date" class="form-control startDate" name="startDate" value="${pNotice.startDate}" pattern="\d{4}-\d{2}-\d{2}" readonly>
										</div>
                            		</li>
                            		<li>
                            			<div class="card-body">
											<h3 class="card-title font-weight-bold"> 공지 종료</h3>
											<input type="date" class="form-control finishDate" name="finishDate" value="${pNotice.finishDate}" readonly>
										</div>
                            		</li>
                            		<li>
                            			<div class="card-body">
											<h3 class="card-title font-weight-bold  "> 공지 상태</h3>
											<input type="text" class="form-control finishDate" name="statement" value="${pNotice.statement}" readonly>
										</div>
                            		</li>
                            		<li>
                            			<div class="btn-list">
                            				<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#info-alert-modal" class="preview">미리보기</button>
                            				<!-- Right modal -->
                            				<button type="button" class="btn btn-secondary" onclick="location.href='pNoticeUpdateForm.no?popNo='+${pNotice.popNo}">수정하기</button>
                            				<button type="button" class="btn btn-dark" onclick="history.back();">공지목록</button>
                            			</div>
                            		</li>
                            	</ul>
                            </div>	
			</div>

		</div>
		</div>
		<footer>
		
		
		</footer>
		
		<div id="info-alert-modal" class="modal fade" tabindex="-1" role="dialog"
                                    aria-hidden="true">
                                    <div class="modal-dialog modal-sm" style="float:left; margin:5%;">
                                        <div class="modal-content">
                                            <div class="modal-body p-4">
                                                <div class="text-center">
                                                    <i class="dripicons-information h1 text-info"></i>
                                                    <h4 class="mt-2" style="overflow:auto; word-break:break-all;">${pNotice.title}</h4>
                                                    <hr>
                                                    <div style="overflow:auto; word-break:break-all;">
														${pNotice.content}                                         
                                                    </div>
                                                    <hr>
                                                    <br>
                                                    <span class="font-10 font-weight-bold">미리보기 화면 입니다</span>
                                                    <br>
                                                    <div class="modal-footer float-left">
                                                    <button type="button" class="btn btn-info my-2 font-10" data-dismiss="modal">닫기</button>
													<button type="button" class="btn btn-primary font-10" data-dismiss="modal"> 하루 동안 보이지 않기</button>
	                                                </div>                                                    
                                                </div>
                                            </div>
                                        </div><!-- /.modal-content -->
                                    </div><!-- /.modal-dialog -->
                                </div><!-- /.modal -->
	</div>
	</div>
	</div>
	
	<script>
		
	
		$(function(){
			<!-- 기본 날짜 설정 -->
			var sysdate = new Date();
			
			var year = sysdate.getFullYear();
			var month = sysdate.getMonth() + 1;
			var date = sysdate.getDate();
			
			
			<!-- 공지 시작일 최소 날짜 값 -->
			var startDefaultMin = year + '-' + addZero(month)+ '-' + addZero(date);
			<!-- 마감일 최소 날짜 값은 최소 입력 날짜의 1일 이후로 설정-->
			var finishDefaultMin = year + '-' + addZero(month) + '-' + addZero(date+1);
			
			<!-- 공지 시작일 지정은 최소 날짜로부터 6개월 이후까지
				 만약 6개월 뒤가 2월일 경우 2월의 마지막 날짜 까지로 지정-->
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
		function addZero(data){
			var result='';
			if(data < 10){
				result='0'+data.toString();
			}else{
				result=data;
			}
			return result;
		}

		
		
		
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