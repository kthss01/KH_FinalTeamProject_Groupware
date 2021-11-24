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
		
			<div class="table-responsive">
				<div id="zero_config_wrapper" class="dataTables_wrapper container-fluid dt-bootstrap4"><div class="row"><div class="col-sm-12 col-md-6"><div class="dataTables_length" id="zero_config_length"><label>Show <select name="zero_config_length" aria-controls="zero_config" class="form-control form-control-sm"><option value="10">10</option><option value="25">25</option><option value="50">50</option><option value="100">100</option></select> entries</label></div></div><div class="col-sm-12 col-md-6"><div id="zero_config_filter" class="dataTables_filter"><label>Search:<input type="search" class="form-control form-control-sm" placeholder="" aria-controls="zero_config"></label></div></div></div><div class="row"><div class="col-sm-12"><table id="zero_config" class="table table-striped table-bordered no-wrap dataTable" role="grid" aria-describedby="zero_config_info">
                                        <thead>
                                            <tr role="row">
                                            	<th class="sorting_asc" tabindex="0" aria-controls="zero_config" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Name: activate to sort column descending" style="width: 0px;">개설명</th>
                                           		<th class="sorting" tabindex="0" aria-controls="zero_config" rowspan="1" colspan="1" aria-label="Position: activate to sort column ascending" style="width: 0px;">신청인</th>
                                           		<th class="sorting" tabindex="0" aria-controls="zero_config" rowspan="1" colspan="1" aria-label="Board: activate to sort column ascending" style="width: 0px;">신청일</th>
                                           	 	<th class="sorting" tabindex="0" aria-controls="zero_config" rowspan="1" colspan="1" aria-label="Build -date activate to sort column ascending" style="width: 0px;">신청사유</th>
                                          	</tr>
                                        </thead>
                                        <tbody id="pros-table-body" class="pros-talbe-body">
                                        		<tr role="row" class="odd">
                                        			<td class="sorting_1">길동네</td>
                                        			<td>홍길동</td>
                                        			<td>2021/11/10</td>
                                        			<td>그냥</td>
                                        			<td class="nav-item dropdown">
                           								<a class="nav-link dropdown-toggle" href="javascript:void(0)" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                						<span class="ml-1 d-none d-lg-inline">
                                						
                                							<span class="text-dark"> menu </span> 
                                						
                                							<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-chevron-down svg-icon">
                                								<polyline points="6 9 12 15 18 9">
                                								</polyline>
                                							</svg>
                                						</span>
                           								</a>
                           								<div class="dropdown-menu dropdown-menu-right user-dd animated flipInY">
                                							<a class="dropdown-item" href="javascript:void(0)">
                                								<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-settings svg-icon mr-2 ml-1">
                                								<circle cx="12" cy="12" r="3"></circle>
                                								</svg>
                                  							  수락
                                  							</a>
                           								    <a class="dropdown-item" href="javascript:void(0)">
                           								    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-power svg-icon mr-2 ml-1">
                           								    </svg>
									                                          거절
															</a>
                                <div class="dropdown-divider"></div>
                            </div>
                        </td>
                                        		</tr>
                                        		
                                        </tbody>
                                        <tr role="row" class="odd">
                                    </table>
                                    
                                    
                                    <div class="row"><div class="col-sm-12 col-md-5">
                                    
                                    <div class="dataTables_info" id="zero_config_info" role="status" aria-live="polite"> Board entry 표시 구역 </div>
                                    
                                    
                                    </div>
                                    
                                    <div class="col-sm-12 col-md-7">
                                    
                                    <div class="dataTables_paginate paging_simple_numbers" id="zero_config_paginate">
                                    
                                    	<ul class="pagination">
                                    		<li class="paginate_button page-item previous disabled" id="zero_config_previous">
                                    			<a href="#" aria-controls="zero_config" data-dt-idx="0" tabindex="0" class="page-link">Previous</a>
                                    		</li>
                                    		<li class="paginate_button page-item active">
                                    			<a href="#" aria-controls="zero_config" data-dt-idx="1" tabindex="0" class="page-link">1</a>
                                    		</li>
                                    		<li class="paginate_button page-item ">
                                    			<a href="#" aria-controls="zero_config" data-dt-idx="2" tabindex="0" class="page-link">2</a>
                                    		</li>
                                    		<li class="paginate_button page-item ">
                                    			<a href="#" aria-controls="zero_config" data-dt-idx="3" tabindex="0" class="page-link">3</a>
                                    		</li>
                                    		<li class="paginate_button page-item ">
                                    			<a href="#" aria-controls="zero_config" data-dt-idx="4" tabindex="0" class="page-link">4</a>
                                    		</li>
                                    		<li class="paginate_button page-item ">
                                    			<a href="#" aria-controls="zero_config" data-dt-idx="5" tabindex="0" class="page-link">5</a>
                                    		</li>
                                    		<li class="paginate_button page-item ">
                                    			<a href="#" aria-controls="zero_config" data-dt-idx="6" tabindex="0" class="page-link">6</a>
                                    		</li>
                                    		<li class="paginate_button page-item next" id="zero_config_next">
                                    			<a href="#" aria-controls="zero_config" data-dt-idx="7" tabindex="0" class="page-link">Next</a>
                                    		</li>
                                    	</ul>
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
			사라져버린 푸터
		</footer>
		
	</div>
	</div>
	</div>
	
	</div>
	
	
	
	<script>
	
	
	
	function commCategoryList(){
		
		
		
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