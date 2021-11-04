<!DOCTYPE html>
<html dir="ltr" lang="ko">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="${ pageContext.servletContext.contextPath }/resources/assets/images/favicon.png">
    <title>GroupWare new Account</title>
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


.buttonArea{

}

.buttonArea> button{
	width:95px;
	height:45px;
	text-align:center;
	font-weight:bold;
}


.hidden{
	display:none;
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
        <div class="page-wrapper">
            <div class="page-breadcrumb">
                <div class="row">
                    <div class="col-7 align-self-center">
                       
                        <div class="align-items-center">

                            
                            <br>
                            <div class="info d-block align-items-center">
                            		
                            		<div class="card-body">
                            		<h5 class="card-subtitle"> 계정 타입 선택 </h5>
                            		
                            		<div class="buttonArea btn-list">
                            			<button class="btn waves-effect waves-light btn-danger"> 일반 </button><br>
                            			<button class="btn waves-effect waves-light btn-dark"> 관리자  </button>
                            		</div>
                            		
                            		</div>
                            		
                            
                            </div>
                            
                            
                            
                            <div class="memberForm hidden">
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
                            		</ul>
                            </div>
                            
                            
                            <div class="managerForm hidden">
                            
                            <div class="memberForm hidden">
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
                            		</ul>
                            </div>
                            
                            
                            
                            </div>
                            
                            
                            
                        </div>
                            
                            
                            <script>
                            	
                            	const buttonArea = document.querySelector(".buttonArea");
                            	const member = document.querySelector(".memberForm");
                            	const manager = document.querySelector(".managerForm");
                            	
                            
                            
                            </script>
                            
	
						<!-- 
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
                      -->
                        </div>
                    </div>
                </div>
            </div>
            
            
            
            <div class="container-fluid">
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