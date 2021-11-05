<!DOCTYPE html>
<html dir="ltr" lang="ko">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="${ pageContext.servletContext.contextPath }/resources/assets/images/favicon.png">
    <title>Groupware</title>
    <!-- Custom CSS -->
    <link href="${ pageContext.servletContext.contextPath }/resources/assets/extra-libs/c3/c3.min.css" rel="stylesheet">
    <link href="${ pageContext.servletContext.contextPath }/resources/assets/libs/chartist/dist/chartist.min.css" rel="stylesheet">
    <link href="${ pageContext.servletContext.contextPath }/resources/assets/extra-libs/jvector/jquery-jvectormap-2.0.2.css" rel="stylesheet" />
    <!-- Custom CSS -->
    <link href="${ pageContext.servletContext.contextPath }/resources/dist/css/style.min.css" rel="stylesheet">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
</head>
<style>

.info{


padding-left:45px;

}


.info li{
	
	margin: 15px 0px 12px 0px;
	font-size: 18px;
}


.hidden{
	
	display:none !important;
}

#profile-img:hover .change{
	top:50%;

}


picture-area{
	position:relative;
	overflow:hidden;
}


.profile-image{
	
	cursor:pointer;	
	width:125px;
	height:125px;
}

.update-picture{
	position:absolute;
	width:125px;
	height:60px;
}

.profile-image:hover .update-picture{
	font-size:15px;
	opacity:0.5;
	color:rgba(255,255,255,0.57);
}

</style>

<body>
    <div class="preloader">
        <div class="lds-ripple">
            <div class="lds-pos"></div>
            <div class="lds-pos"></div>
        </div>
    </div>
    <div id="main-wrapper" data-theme="light" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full"
        data-sidebar-position="fixed" data-header-position="fixed" data-boxed-layout="full">
       		<jsp:include page="/WEB-INF/views/common/header.jsp"/>
			<jsp:include page="/WEB-INF/views/common/sidebar.jsp"/>
        <div class="page-wrapper">
            <div class="page-breadcrumb">
                <div class="row">
                    <div class="col-7 align-self-center">
                        <h3 class="page-title text-truncate text-dark font-weight-medium mb-1"> 환영합니다, ${ sessionScope.loginUser.loginId} 님!</h3>
                        <div class="align-items-center">
                            <nav aria-label="breadcrumb">
                                    <a>내 정보</a>
                            </nav>
                            
                            <br>
                            <div class="info d-block align-items-center">
								<ul class="ref navbar-nav">
									<li>
										<div class="card-body">
											<h4 class="card-body"> 프로필 사진</h4>
											<img class="profile-image" src="${ pageContext.servletContext.contextPath }/resources/assets/images/users/profile-pic.jpg">
										</div>
									<li>
										<div class="card-body">
											<h3 class="card-title"> 사원 이름 </h3>
											<input type="text" class="form-control" value="${sessionScope.loginUser.empName }" readonly>
										</div>
                            		</li>
                            		<li>
                            			<div class="card-body">
											<h3 class="card-title"> 연락처 </h3>
											<input type="text" class="form-control" value="${sessionScope.loginUser.phone}" readonly>
										</div>
                            		</li>
                            		<li>
                            			<div class="card-body">
											<h3 class="card-title"> 이메일 </h3>
											<input type="text" class="form-control" value="${sessionScope.loginUser.email }" readonly>
										</div>
                            		</li>
                            		<li>
                            			<div class="card-body">
											<h3 class="card-title"> 부서 </h3>
											<input type="text" class="form-control" value="${sessionScope.loginUser.deptTitle }" readonly>
										</div>
                            		</li>
                            		<li>
                            			<div class="card-body">
											<h3 class="card-title"> 직급 </h3>
											<input type="text" class="form-control" value="${sessionScope.loginUser.jobName }" readonly>
										</div>
										<hr>
                            		</li>
                            		<li>
                            			<div class="card-body">
											<h3 class="card-title"> 입사일 </h3>
											<input type="text" class="form-control" value="${sessionScope.loginUser.enrollDate }" readonly>
										</div>
                            		</li>
                            		<li>
                            			<div class="card-body">
											<h3 class="card-title"> 성별 </h3>
											<input type="text" class="form-control" value="${sessionScope.loginUser.gender }" readonly>
										</div>
										<br>
										<button type="button" class="updateInfo btn waves-effect waves-light btn-secondary"> 정보 수정</button>
										                      	
                            		</li>
                            		</ul>
                            </div>
                            
                            <div class="update hidden d-block align-items-center">
                            	<form class="updateForm" action="update.me" method="post">
								<ul class="ref navbar-nav">
									<li>
										<div class="card-body">
											<h4 class="picture-area card-body">프로필 사진</h4>
											
											<ul style="display=inline-block; width:125px; vertial-align:center; list-style:none;"></ul>
												<img src="${ pageContext.servletContext.contextPath }/resources/assets/images/users/profile-pic.jpg" class="profile-image"
											 	onclick="">
												
												<div class="update-picture">이미지 변경</div>
										</div>
									<li>
										<div class="card-body">
											<h3 class="card-title"> 사원 이름 </h3>
											<input type="text" class="form-control" value="${sessionScope.loginUser.empName }" readonly>
										</div>
                            		</li>
                            		<li>
                            			<div class="card-body">
											<h3 class="card-title"> 연락처 </h3>
											<input type="text" class="form-control" value="${sessionScope.loginUser.phone}">
										</div>
                            		</li>
                            		<li>
                            			<div class="card-body">
											<h3 class="card-title"> 이메일 </h3>
											<input type="text" class="form-control" value="${sessionScope.loginUser.email }">
										</div>
                            		</li>
                            		<!-- 
                            		<li>
                            			<div class="card-body">
											<h3 class="card-title"> 부서 </h3>
											<input type="text" class="form-control" value="${sessionScope.loginUser.deptTitle }">
										</div>
                            		</li>
                            		<li>
                            			<div class="card-body">
											<h3 class="card-title"> 직급 </h3>
											<input type="text" class="form-control" value="${sessionScope.loginUser.jobName }">
										</div>
                            		</li>
                            		 -->
                            		</ul>
                            		<button type="submit" class="off btn waves-effect waves-light btn-success"> 완료 </button>
									<button type="button" class="cancle btn waves-effect waves-light btn-danger"> 취소</button>
                            		</form>
                            </div>
                            
	
							<script>
							
							
								
								var update = document.querySelector(".update");
								var info = document.querySelector(".info");
								
								var cancle = document.querySelector(".cancle");
								var updateBtn = document.querySelector(".updateInfo");
									
								var changeToUpdate =()=> {
									update.classList.remove("hidden");
									info.classList.add("hidden");
								}
								var changeToInfo =()=> {
									info.classList.remove("hidden");
									update.classList.add("hidden"); 								
								}
								
								cancle.addEventListener("click",changeToInfo);
								updateBtn.addEventListener("click",changeToUpdate);
								
								
							
							</script>                            
                            
                        </div>
                    </div>
                    <div class="col-5 align-self-center">
                        <div class="customize-input float-right">
                            <select class="custom-select custom-select-set form-control bg-white border-0 custom-shadow custom-radius">
                                <option selected>Aug 19</option>
                                <option value="1">July 19</option>
                                <option value="2">Jun 19</option>
                            </select>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container-fluid">
                <div class="card-group">
                    </div>
                    <div class="card">
                    </div>
                </div>
                
                
                <div class="row">
                 </div>
                    
                    
                    <div class="col-lg-4 col-md-12">
                    </div>
                    <div class="col-lg-4 col-md-12">
            	    </div>
            	    
            	    
                <div class="row">
                </div>
            <footer class="footer text-center text-muted">
                All Rights Reserved by Adminmart. Designed and Developed by <a
                    href="https://wrappixel.com">WrapPixel</a>.
            </footer>
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