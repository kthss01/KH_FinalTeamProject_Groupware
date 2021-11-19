<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	.title:hover{
		cursor: pointer;
	}
	
	.dLists:hover{
		background-color: rgba(0,0,0,.125);
	}
</style>
<link rel="icon" type="image/png" sizes="16x16"
	href="${ pageContext.servletContext.contextPath }/resources/assets/images/favicon.png">
<!-- Custom CSS -->
<link
	href="${ pageContext.servletContext.contextPath }/resources/dist/css/style.min.css"
	rel="stylesheet">
<!-- summernote -->
<link rel="stylesheet"
	href="${ pageContext.servletContext.contextPath }/resources/summernote/summernote-lite.css">

<title>Insert title here</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style>
	th{
		/* background-color: #5f76e8;rgba(0,0,0,.125); */
		background-color: rgba(0,0,0,.125);
		/* color: #ffffff; */
		text-align: center;
	}
	
	#EForm, #approverInfo{
		border: 1px solid rgba(0,0,0,.125);
		width: 203px;
		text-align: left;
	}
	#EForm, #EForms{
		width: 203px;
		text-align: left;
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

		<!-- ============================================================== -->
		<!-- End Topbar header -->
		<!-- ============================================================== -->
		<!-- ============================================================== -->
		<!-- Left Sidebar - style you can find in sidebar.scss  -->
		<jsp:include page="../common/sidebar.jsp" />

		<!-- ============================================================== -->
		<!-- End Left Sidebar - style you can find in sidebar.scss  -->
		<!-- ============================================================== -->
		<!-- ============================================================== -->
		<!-- Page wrapper  -->
		<!-- ============================================================== -->
		<div class="page-wrapper" style=" background-color: white;">
			<!-- ============================================================== -->
			<!-- Bread crumb and right sidebar toggle -->
			<!-- ============================================================== -->
			<!-- ============================================================== -->
			<!-- End Bread crumb and right sidebar toggle -->
			<!-- ============================================================== -->
			<!-- ============================================================== -->
			<!-- Container fluid  -->
			<!-- ============================================================== -->
			<div class="container-fluid" style="height: 100%">
				<!-- ============================================================== -->
				<!-- Start Page Content -->
				<!-- ============================================================== -->
				
				<div class="row" style="min-height: 500px;">
					<!-- 전자결재 사이드바 -->
					<div class="col-2" style="border-right: 1px solid rgba(0,0,0,.125);">
	                	<button id="newEApproval" type="button" class="btn btn-rounded btn-primary col-12" data-toggle="modal" data-target="#myModal">새 결재 진행</button>
	                	
	                	<!-- 결재 진행 전 양식, 결재자 선택하는 모달 -->
	                	<div id="myModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" style="display: none;" aria-hidden="true">
	                        <div class="modal-dialog">
	                        <form action="enrollForm.ap" method="POST">
	                            <div class="modal-content">
	                                <div class="modal-header">
	                                    <h4 class="modal-title col-6" id="myModalLabel">결재양식 선택</h4>
	                                    <h4 class="modal-title col-6" id="myModalLabel">결재선 선택</h4>
	                                    <!-- <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button> -->
	                                </div>
	                                <div class="modal-body d-flex">
	                                	<!-- 결재양식 목록 -->
	                                	<div class="col-6">
	                                    	<div class="btn-group">
                                                <button id="EForm" type="button" class="btn col-12 dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">--결재양식선택--</button>
                                                <input type="hidden" name="fNo" value="" id="fNo">
                                                <div id="EForms" class="dropdown-menu" x-placement="bottom-start" style="position: absolute; will-change: transform; top: 0px; left: 0px; transform: translate3d(8px, 38px, 0px);width:100%;height:150px;overflow-y: auto;">
                                                	<!-- <a class="dropdown-item" href="#" data-value="">--결재양식선택--</a> -->
                                                	<c:forEach var="form" items="${eFList }">
                                                		<a class="dropdown-item" href="#" data-value="${form.FNo }">${form.FName }</a>
                                                	</c:forEach>
                                                </div>
                                            </div>
                                        </div>
                                        
                                        <!-- 결재선 선택 -->
                                        <div class="col-6">
	                                    	<table class="col-12" style="border: 1px solid rgba(0,0,0,.125);">
												<tbody>
													<!-- 현재 로그인 유저 사번, 이름, 부서 -->
													<tr>
														<th colspan="2">신청</th>
													</tr>
													<tr>
														<td>
															<button type="button" class="btn col-12 text-left">${sessionScope.loginUser.deptTitle} - ${sessionScope.loginUser.empName}</button>
															<input type="hidden" name="drafterId" value="${sessionScope.loginUser.empNo}">
														</td>
													</tr>
													
													<!-- 결재자 선택, 사번, 이름, 부서 -->
													<tr>
														<th colspan="2">승인</th>
													</tr>
													<tr>
														<td colspan="2">
															<div class="btn-group" style="width:100%">
				                                                <button id="approverInfo" type="button" class="btn col-12 dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">결재자 선택</button>
				                                                <div id="approver" class="dropdown-menu" x-placement="bottom-start" style="position: absolute; will-change: transform; top: 0px; left: 0px; transform: translate3d(8px, 38px, 0px);width:100%;height:300px;overflow-y: auto;">
				                                                <c:forEach var="emp" items="${mList }">
			                                                		<a class="dropdown-item" href="#" data-value="${emp.empNo }">${emp.deptTitle } - ${emp.empName }</a>
			                                                	</c:forEach>
				                                                </div>
		                                            		</div>
		                                            		<input type="hidden" id="approverId" name="approverId" value="">
	                                            		</td>
													</tr>
												</tbody>                          	
	                                    	</table>
                                        </div>
	                                </div>
	                                <div class="modal-footer">
	                                    <button type="button" class="btn btn-rounded btn-light" data-dismiss="modal">취소</button>
	                                    <button type="submit" class="btn btn-rounded btn-primary" id="submit">확인</button>
	                                </div>
	                            </div><!-- /.modal-content -->
                            </form>
	                        </div><!-- /.modal-dialog -->
	                    </div>
	                    <script>
							$(function(){
								$("#EForms").children().click(function(){
									
									var titleValue = $(this).attr('data-value');
									var titleText = $(this).text();
									
									$("#EForm").text(titleText);
									$("#fNo").val(titleValue);
									
								})
								
								$("#approver").children().click(function(){
									
									var empInfo = $(this).text();
									var empNo = $(this).attr('data-value');
									
									$("#approverInfo").text(empInfo);
									$("#approverId").val(empNo);
									
								})
							})
						</script>
										
	                	<br><br>
                        <h6 class="card-title">결재하기</h6>
                        <div class="list-group"> 
			           		<a href="waitD.ap" class="list-group-item">결재 대기 문서</a><!-- 내가 결재, 진행중 -->
                       	</div>
                       	<br>
                       	<h6 class="card-title">개인 문서함</h6>
                        <div class="list-group"> 
			           		<a href="draftD.ap" class="list-group-item">기안 문서함</a><!-- 내가 기안 -->
                        	<a href="apprD.ap" class="list-group-item">결재 문서함</a> <!-- 내가 결재 -->
                       	</div>
                       	<br>
                       	<h6 class="card-title">문서함</h6>
                        <div class="list-group"> 
			           		<a href="eFormList.ap" class="list-group-item">전자결재 양식</a><!-- 전자결재 양식 -->
                       	</div>
					</div>
					
					<div class="col-10">
						<h3>결재 대기문서</h3>
						
						<br><br>
						
						<div class="row" style="border-bottom: 1px solid rgba(0,0,0,.125);">
							<div class="d-flex col-12" style="border-bottom: 2px solid rgba(0,0,0,.125); border-top: 2px solid rgba(0,0,0,.125);">
								<div class="col-2">
									<span>기안일</span>
								</div>
								<div class="col-2">
									<span>결재 양식</span>
								</div>
								<div class="col-3">
									<span>제목</span>
								</div>
								<div class="col-1">
									<span>첨부</span>
								</div>
								<div class="col-2">
									<span>문서번호</span>
								</div>
								<div class="col-2">
									<span>결재상태</span>
								</div>
							</div>
							<c:choose>
								<c:when test="${not empty drList}">
									<c:forEach var="dr" items="${drList }">
										<div class="d-flex col-12 dLists">
											<div class="col-2">
												<span><fmt:formatDate value="${dr.draftDate}" type="date" pattern="yyyy-MM-dd"/></span>
											</div>
											<div class="col-2">
												<span>${dr.FName}</span>
											</div>
											<div class="col-3">
												<span class="title">${dr.title}<input type="hidden" value="${dr.ENo }"></span>
											</div>
											<div class="col-1">
												<span></span>
											</div>
											<div class="col-2">
												<span>${dr.ENo }</span>
											</div>
											<div class="col-2">
												<span>${dr.SName }</span>
											</div>
										<!-- --------------------------------------------------------- -->
										</div>
									</c:forEach>
									
								</c:when>
								<c:otherwise>
									<div class="d-flex col-12">
										<span class="m-auto">결재 대기중인 문서가 없습니다.</span>
									</div>
								</c:otherwise>
							</c:choose>
						</div>
						
						<script>
							$(function(){
								$(".title").click(function(){
									
									var eNo = $(this).children().val();
									location.href="eDetail.ap?eNo=" + eNo;
									
								})
							})
						</script>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- ============================================================== -->
	<!-- End PAge Content -->
	<!-- ============================================================== -->
	<!-- ============================================================== -->
	<!-- Right sidebar -->
	<!-- ============================================================== -->
	<!-- .right-sidebar -->
	<!-- ============================================================== -->
	<!-- End Right sidebar -->
	<!-- ============================================================== -->
	<!-- ============================================================== -->
	<!-- End Container fluid  -->
	<!-- ============================================================== -->
	<!-- ============================================================== -->
	<!-- footer -->
	<!-- ============================================================== -->
	<footer class="footer text-center text-muted">
		All Rights Reserved by Adminmart. Designed and Developed by <a
			href="https://wrappixel.com">WrapPixel</a>.
	</footer>
	<!-- ============================================================== -->
	<!-- End footer -->
	<!-- ============================================================== -->

	<!-- ============================================================== -->
	<!-- End Wrapper -->
	<!-- ============================================================== -->
	<!-- End Wrapper -->
	<!-- ============================================================== -->
	<!-- All Jquery -->
	<!-- ============================================================== -->

	
	<script
		src="${ pageContext.servletContext.contextPath }/resources/assets/libs/jquery/dist/jquery.min.js"></script>
	<!-- Bootstrap tether Core JavaScript -->
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
	<!-- slimscrollbar scrollbar JavaScript -->
	<script
		src="${ pageContext.servletContext.contextPath }/resources/assets/libs/perfect-scrollbar/dist/perfect-scrollbar.jquery.min.js"></script>
	<script
		src="${ pageContext.servletContext.contextPath }/resources/assets/extra-libs/sparkline/sparkline.js"></script>
	<!--Wave Effects -->
	<!-- themejs -->
	<!--Menu sidebar -->
	<script
		src="${ pageContext.servletContext.contextPath }/resources/dist/js/sidebarmenu.js"></script>
	<!--Custom JavaScript -->
	<script
		src="${ pageContext.servletContext.contextPath }/resources/dist/js/custom.min.js"></script>
	<!--  -->
	<script
		src="${ pageContext.servletContext.contextPath }/resources/summernote/summernote-lite.js"></script>
	<script
		src="${ pageContext.servletContext.contextPath }/resources/summernote/lang/summernote-ko-KR.js"></script>

</body>
</html>