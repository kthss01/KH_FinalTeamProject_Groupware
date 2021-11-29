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
        <jsp:include page="../common/sidebar.jsp"/>
      
        <div class="page-wrapper">
        
            <div class="page-breadcrumb">
                <div class="row">
                    <div class="col-7 align-self-center">
                        <h4 class="page-title text-truncate text-dark font-weight-medium mb-1 font-weight-bold">설문</h4>
                        <div class="d-flex align-items-center">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb m-0 p-0">
                                    <li class="breadcrumb-item"><a href="index.html" class="text-muted">메뉴</a></li>
                                    <li class="breadcrumb-item text-muted active" aria-current="page">설문</li>
                                </ol>
                            </nav>
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
                                <h4 class="card-title font-weight-bold"> 설문 </h4>
                                      <table id="noticeList" class="table table-hover" align="center">
                <thead>
                  <tr>
                  	<th></th>
                    <th>제목</th>
                    <th>내용</th>
                    <th>마감일</th>
                    <th>질문 수</th>
                    <th></th>
                  </tr>
                </thead>
                <tbody>
                
                <c:choose>
                	<c:when test="${empty list}">
                	
                		<td colspan="6" style="text-align:center"> 현재 진행중인 설문이 없습니다.</td>
                	
                	</c:when>
                	<c:otherwise>
                   <c:forEach items="${ list }" var="sv">
                  	<tr class="tuple" style="cursor:pointer;" onclick="location.href='surveyQuestionForm.sv?surveyNo='+${sv.surveyNo}">
                   		<td style="display:none;">${sv.surveyNo}</td>
                   		<td></td>
                   		<td>${sv.surveyTitle}</td>
                   		<td>${sv.surveyContent}</td>
                   		<td>${sv.finishDate}</td>
                   		<td>${sv.questionCount}</td>
                   		<td></td>
                   	</tr>
                    </c:forEach>
                    </c:otherwise>
                </c:choose>
                </tbody>
            </table>
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