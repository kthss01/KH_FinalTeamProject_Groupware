<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16"
	href="${ pageContext.servletContext.contextPath }/resources/assets/images/favicon.png">
<title>WeCanvas</title>
<!-- Custom CSS -->
<link
	href="${ pageContext.servletContext.contextPath }/resources/assets/extra-libs/c3/c3.min.css"
	rel="stylesheet">
<link
	href="${ pageContext.servletContext.contextPath }/resources/assets/libs/chartist/dist/chartist.min.css"
	rel="stylesheet">
<link
	href="${ pageContext.servletContext.contextPath }/resources/assets/extra-libs/jvector/jquery-jvectormap-2.0.2.css"
	rel="stylesheet" />
<link
	href="${ pageContext.servletContext.contextPath }/resources/dist/css/style.min.css"
	rel="stylesheet">

<style>
#boardList li:hover {
	cursor: pointer;
	color: #212529;
}
</style>
</head>
<body>


	<div id="main-wrapper" data-layout="vertical" data-navbarbg="skin6"
		data-sidebartype="full" data-sidebar-position="fixed"
		data-header-position="fixed" data-boxed-layout="full">
		<jsp:include
			page="${pageCOntext.servletContext.contextPath}/WEB-INF/views/common/m_header.jsp" />
		<jsp:include
			page="${pageCOntext.servletContext.contextPath}/WEB-INF/views/common/m_sidebar.jsp" />



		<div class="container-fuild" style="padding: 81px 0px 0px 265px;">
			<div class="row">
				<div class="col-12">
					<div class="card">

						<div class="card-body">
							<h3
								class="card-title text-truncate text-dark font-weight-bold mb-1">
								사원 목록
							</h3>

							<div class="row" style="padding:50px;">
								<div class="col-sm-12">
									<div class="col-sm-12 col-md-6 col-lg-4">
						 <!-- 
                        <div class="card">
                            <div class="card-body">
                                <form>
                                    <div class="form-group mb-4">
                                    <ul class="float-left navbar-nav mr-auto"">
                                    	<li>
                                        <select class="custom-select mr-sm-2 sortOption" id="inlineFormCustomSelect" onchange="sortMemberList(this);	">
                                            <option selected>정렬기준</option>
                                            <option value="emp_no"> 사원 번호 </option>
                                            <option value="dept_title">부서별</option>
                                            <option value="job_name">직급별</option>
                                            <option value="emp_name">이름순</option>
                                        </select>
                                        </li>
                                        <li>
                                         <select class="custom-select mr-sm-2 sortOption" id="inlineFormCustomSelect">
                                            <option value="emp_no" selected>내림차순</option>
                                            <option value="dept_title">오름차순</option>
                                        </select>
                                        </li>
                                    </ul>
                                    </div>
                                </form>
                            </div>
                        </div>
                        -->
                    </div>
									<table id="zero_config"
										class="table table-striped table-bordered no-wrap dataTable"
										role="grid" aria-describedby="zero_config_info">
										<thead>
											<tr role="row">
												<th class="sorting_asc font-weight-bold" tabindex="0"
													aria-controls="zero_config" rowspan="1" colspan="1"
													aria-sort="ascending"
													aria-label="Name: activate to sort column descending">사번</th>
												<th class="sorting font-weight-bold" tabindex="0"
													aria-controls="zero_config" rowspan="1" colspan="1"
													aria-label="Position: activate to sort column ascending">이름</th>
												<th class="sorting font-weight-bold" tabindex="0"
													aria-controls="zero_config" rowspan="1" colspan="1"
													aria-label="Build -date activate to sort column ascending"
													style="width: 60%;">연락처</th>
												<th class="sorting font-weight-bold" tabindex="0"
													aria-controls="zero_config" rowspan="1" colspan="1"
													aria-label="Build -date activate to sort column ascending"
													style="width: 60%;">이메일</th>
												<th class="sorting font-weight-bold" tabindex="0"
													aria-controls="zero_config" rowspan="1" colspan="1"
													aria-label="Build -date activate to sort column ascending"
													style="width: 60%;">직급</th>
												<th class="sorting font-weight-bold" tabindex="0"
													aria-controls="zero_config" rowspan="1" colspan="1"
													aria-label="Build -date activate to sort column ascending"
													style="width: 60%;">부서</th>
												
													
											</tr>
										</thead>
										<tbody id="employee-table-body" class="employee-talbe-body">
										<c:forEach items="${ list }" var="e">
											<tr role="row" class="odd">
												<td class="sorting_1">${ e.empNo }</td>
												<td>${ e.empName } </td>
												
												<td> 
													<c:choose>
														<c:when test="${empty e.phone}">  --
														</c:when>
													<c:otherwise>${e.phone}	
													</c:otherwise>
													</c:choose>
												</td>
												<td> 
													<c:choose>
														<c:when test="${empty e.email}">  --
														</c:when>
													<c:otherwise>${e.email}	
													</c:otherwise>
													</c:choose>
												</td>		
													
												<td>${ e.jobName }</td>
												<td>${ e.deptTitle }</td>
												<td class="nav-item dropdown"><a
													class="nav-link dropdown-toggle" href="javascript:void(0)"
													data-toggle="dropdown" aria-haspopup="true"
													aria-expanded="false"> <span
														class="ml-1 d-none d-lg-inline"> <span
															class="text-dark"> menu </span> <svg
																xmlns="http://www.w3.org/2000/svg" width="24"
																height="24" viewBox="0 0 24 24" fill="none"
																stroke="currentColor" stroke-width="2"
																stroke-linecap="round" stroke-linejoin="round"
																class="feather feather-chevron-down svg-icon">
                                								<polyline
																	points="6 9 12 15 18 9">
                                								</polyline>
                                							</svg>
													</span>
												</a>
													<div
														class="dropdown-menu dropdown-menu-right user-dd animated flipInY">
														<a class="dropdown-item" href="#"> 
                                								<svg
																xmlns="http://www.w3.org/2000/svg" width="24"
																height="24" viewBox="0 0 24 24" fill="none"
																stroke="currentColor" stroke-width="2"
																stroke-linecap="round" stroke-linejoin="round"
																class="feather feather-power svg-icon mr-2 ml-1">
	                           								       <circle cx="12" cy="12" r="3"></circle>
	                           								    </svg> 상세
														</a> 
														<a class="dropdown-item" href="#"> 
	                           								    <svg
																xmlns="http://www.w3.org/2000/svg" width="24"
																height="24" viewBox="0 0 24 24" fill="none"
																stroke="currentColor" stroke-width="2"
																stroke-linecap="round" stroke-linejoin="round"
																class="feather feather-power svg-icon mr-2 ml-1">
	                           								       <circle cx="12" cy="12" r="3"></circle>
	                           								    </svg> 삭제
														</a>
													</div></td>
											</tr>
											</c:forEach>
										</tbody>
									</table>

								</div>

							</div>



						</div>
					</div>
				</div>

			</div>
		</div>
	</div>


	<script>
		function sortMemberList(obj){
						
					var value = $(obj).value();
				
        			$.ajax({
                     	url:'sortMemberList.me',
                     	type:'post',
                     	data: {
                     		value : value
                     	},
                     	datatype:'json',
                     	success : function(){
                     			${".employee-table-body"}.html('<c:forEach items="\${ list }" var="e"><tr role="row" class="odd"><td class="sorting_1">\${ e.empNo }</td><td>\${ e.empName }</td><td> <c:choose><c:when test="\${empty e.phone}">  --</c:when><c:otherwise>\${e.phone}</c:otherwise></c:choose></td><td><c:choose><c:when test="\${empty e.email}">  -- </c:when><c:otherwise>\${e.email}</c:otherwise></c:choose></td><td>\${ e.jobName }</td><td>\${ e.deptTitle }</td><td class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="javascript:void(0)" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <span class="ml-1 d-none d-lg-inline"> <span class="text-dark"> menu </span> <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-chevron-down svg-icon"> <polyline points="6 9 12 15 18 9"> </polyline> </svg> </span> </a> <div class="dropdown-menu dropdown-menu-right user-dd animated flipInY"> <a class="dropdown-item" href="#">  <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-power svg-icon mr-2 ml-1">  <circle cx="12" cy="12" r="3"></circle> </svg> 상세 </a> <a class="dropdown-item" href="#"> <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-power svg-icon mr-2 ml-1"> <circle cx="12" cy="12" r="3"></circle> </svg> 삭제 </a> </div></td> </tr> </c:forEach>' )}
                	 })
		};
		
	</script>





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
	<script
		src="${ pageContext.servletContext.contextPath }/resources/assets/extra-libs/c3/d3.min.js"></script>
	<script
		src="${ pageContext.servletContext.contextPath }/resources/assets/extra-libs/c3/c3.min.js"></script>
	<script
		src="${ pageContext.servletContext.contextPath }/resources/assets/libs/chartist/dist/chartist.min.js"></script>
	<script
		src="${ pageContext.servletContext.contextPath }/resources/assets/libs/chartist-plugin-tooltips/dist/chartist-plugin-tooltip.min.js"></script>
	<script
		src="${ pageContext.servletContext.contextPath }/resources/assets/extra-libs/jvector/jquery-jvectormap-2.0.2.min.js"></script>
	<script
		src="${ pageContext.servletContext.contextPath }/resources/assets/extra-libs/jvector/jquery-jvectormap-world-mill-en.js"></script>
	<script
		src="${ pageContext.servletContext.contextPath }/resources/dist/js/pages/dashboards/dashboard1.min.js"></script>

	<script>
	
	function openCategory(cno){
		console.log(cno);
	}
	
	</script>
</body>
</html>