<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html dir="ltr" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="${ pageContext.servletContext.contextPath }/resources/assets/images/favicon.png">
    <title>Adminmart Template - The Ultimate Multipurpose admin template</title>
    <!-- This page css -->
    <!-- Custom CSS -->
    <link href="${ pageContext.servletContext.contextPath }/resources/dist/css/style.min.css" rel="stylesheet">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
</head>

<body>
    <div class="preloader">
        <div class="lds-ripple">
            <div class="lds-pos"></div>
            <div class="lds-pos"></div>
        </div>
    </div>
    <div id="main-wrapper" data-theme="light" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full" data-sidebar-position="fixed" data-header-position="fixed" data-boxed-layout="full">
        
        <jsp:include page="../common/header.jsp"/>
      
        <div class="page-wrapper">
        
            <div class="page-breadcrumb">
                <div class="row">
                    <div class="col-7 align-self-center">
                        <div class="d-flex align-items-center">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb m-0 p-0">
                                    <li class="breadcrumb-item"><a href="index.html" class="text-muted">메뉴</a></li>
                                    <li class="breadcrumb-item text-muted active" aria-current="page">설문</li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                    <div class="col-5 align-self-center">
                        <div class="customize-input float-right">
                            
                             <div class="input-group-append">
                             </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container-fluid">
                
                
                
                <div class="row">
                    <div class="col-12">
                        <div class="card">                        
                            <div class="card-body">
                                <div class="row">
                                	<!-- 공지로 등록 -->
                                <h4 class="card-title font-weight-bold"> ${survey.surveyTitle} </h4>
        						 </div>
        						 <span class="card-subtitle font-9"> ${survey.surveyContent}</span>
        						 
        						 <div class="row">
        						 	
        						 	<form class="input-form" action="insertAnswer.sv" method="POST">
        						 		<ul class="list-style-none question-list">
        						 		
        						 		<c:if test="${not empty list}">
        						 			<c:forEach items="${list}" var="q">
        						 			<li class="list-item">
        						 				<div class="card">
        						 					<div class="card-body">
        						 						<h4 class="card-title">${q.sequence}</h4>
        						 							<span>${q.essayText}</span>
        						 						<input type="text" class="essayNo" value="${q.essayNo}" readonly style="display:none;">
        						 						<br>
        						 						<input type="text" class="answer" name="answer">
        						 					</div>
        						 				</div>
        						 			</li>
        						 			</c:forEach>
        						 		</c:if>
        						 		
        						 		
        						 		</ul>
        						 		<hr>
        						 		<div class="btn-list">
        						 			<button type="submit" class="btn waves-effect waves-light btn-primary">작성 완료 </button>
        						 			<button type="button" class="btn waves-effect waves-light btn-secondary">작성 취소</button>
        						 		</div>
        						 	</form>
        						 </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
          
    
      
    
    <script>
    	
	
    
    </script>
    
    
    
     <script>
       
    </script>
    
    
    
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
</body>

</html>