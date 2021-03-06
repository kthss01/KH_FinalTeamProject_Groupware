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
	
	
	.table-item:hover{
	cursor:pointer;
	color:#212529;
	}
	
	
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
				<h3 class="card-title font-weight-bold text-truncate text-dark font-weight-bold mb-1"> ?????? ?????? ??????</h3>
			<div class="insert-form-wrapper">
				<form class="form pNotice-Info" action="insertPNotice.no" method="POST">
						 <div class="info d-block align-items-center">
								<ul class="ref navbar-nav">
									<li>
									<div class="card-body">
											<h3 class="card-title"> ?????? </h3>
											<input type="text" class="form-control title" name="title" required maxlength="20">
										</div>
                            		</li>
                            		<li>
                            			<div class="card-body">
											<h3 class="card-title"> ?????? </h3>
											<textarea class="form-control content" rows="3" name="content" required maxlength="300"></textarea>
										</div>
                            		</li>
                            		<li>
                            			<div class="card-body">
											<h3 class="card-title"> ?????? ?????? </h3>
											<input type="date" class="form-control startDate" name="startDate" pattern="\d{4}-\d{2}-\d{2}" required>
										</div>
                            		</li>
                            		<li>
                            			<div class="card-body">
											<h3 class="card-title"> ?????? ??????</h3>
											<input type="date" class="form-control finishDate" name="finishDate"  required>
										</div>
                            		</li>
                            		<li>
                            			<div class="card-body">
											<h3 class="card-title"> ?????? ??????</h3>
											<select class="form-control finishDate" name="statement" required>
												<option value='Y'>??????</option>
												<option value='N'>?????????</option>
											</select>
										</div>
                            		</li>
                            		<li>
                            			<div class="btn-list">
                            				<!-- Right modal -->
                            				<button type="submit" class="btn btn-primary" class="update-form-Btn">??????</button>
                            				<button type="button" class="btn btn-secondary" onclick="history.back();">?????? ??????</button>
                            			</div>
                            		</li>
                            	</ul>
                            </div>	
				</form>
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
                                                    <span class="font-10 font-weight-bold">???????????? ?????? ?????????</span>
                                                    <br>
                                                    <div class="modal-footer float-left">
                                                    <button type="button" class="btn btn-info my-2 font-10" data-dismiss="modal">??????</button>
													<button type="button" class="btn btn-primary font-10" data-dismiss="modal"> ?????? ?????? ????????? ??????</button>
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
			function addZero(data){
				var result='';
				if(data < 10){
					result='0'+data.toString();
					}else{
					result=data;
					}
				return result;
				}
			
			<!-- ?????? ?????? ?????? -->
			var sysdate = new Date();
			
			var year = sysdate.getFullYear();
			var month = sysdate.getMonth() + 1;
			var date = sysdate.getDate();
			
			
			<!-- ?????? ????????? ?????? ?????? ??? -->
			var startDefaultMin = year + '-' + addZero(month)+ '-' + addZero(date);
			<!-- ????????? ?????? ?????? ?????? ?????? ?????? ????????? 1??? ????????? ??????-->
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
		
		<!-- ?????? ????????? 0000 -00 - 00 ?????? ????????? ?????? 10??? ?????? 10??? ?????? ????????? ?????? 0??? ????????? ?????? -->

		
		
		
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