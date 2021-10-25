<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <link rel="icon" type="image/png" sizes="16x16" href="${ pageContext.servletContext.contextPath }/resources/assets/images/favicon.png">
    <!-- Custom CSS -->
    <link href="${ pageContext.servletContext.contextPath }/resources/dist/css/style.min.css" rel="stylesheet">
    <!-- JQuery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    
<title>Insert title here</title>
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
    <div id="main-wrapper" data-theme="light" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full" data-sidebar-position="fixed" data-header-position="fixed" data-boxed-layout="full">
        <!-- ============================================================== -->
        <!-- Topbar header - style you can find in pages.scss -->
         	<jsp:include page="../common/header.jsp"/>
   
        <!-- ============================================================== -->
        <!-- End Topbar header -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- Left Sidebar - style you can find in sidebar.scss  -->
              <jsp:include page="../common/sidebar.jsp"/>
      
        <!-- ============================================================== -->
        <!-- End Left Sidebar - style you can find in sidebar.scss  -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- Page wrapper  -->
        <!-- ============================================================== -->
        <div class="page-wrapper">
            <!-- ============================================================== -->
            <!-- Bread crumb and right sidebar toggle -->
            <!-- ============================================================== -->
            <div class="page-breadcrumb">
                <div class="row">
                	               
                    <div class="col-7 align-self-center">
                        <h4 class="page-title text-truncate text-dark font-weight-bold mb-1">커뮤니티</h4>
                        <div class="d-flex align-items-center">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb m-0 p-0">
                                    <li class="breadcrumb-item"><a href="index.html" class="text-muted">Home</a></li>
                                    <li class="breadcrumb-item text-muted active" aria-current="page">Community</li>
                                </ol>
                            </nav>
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
            <!-- ============================================================== -->
            <!-- End Bread crumb and right sidebar toggle -->
            <!-- ============================================================== -->
            <!-- ============================================================== -->
            <!-- Container fluid  -->
            <!-- ============================================================== -->
            <div class="container-fluid">
                <!-- ============================================================== -->
                <!-- Start Page Content -->
                <!-- ============================================================== -->
                <div class="row">
                 <button class="btn btn-primary" onclick="">카테고리 신청하기</button>
                
			                    <div class="col-12">
			                        <div  class="card">
			                            <div class="card-body">
			                                <h4 class="card-title  font-weight-bold" >자유게시판</h4>
			                            </div>
			                           <div>
			                            <a  class="btn btn-warning" href="enrollBoardForm.co">글 쓰기</a>
			                           
			                           </div>
			                            
			                            
			                            <table id="boardList" class="table table-sm  table-hover mb-0" style="text-align:center;" >
			                                <thead>
			                                    <tr>
			                                        <th  >#</th>
			                                        <th style="width:60%;" >제목</th>
			                                        <th >작성자(익명)</th>
			                                        <th >작성날짜</th>
			                                        <th >조회수</th>
			                                        
			                                    </tr>
			                                </thead>
			                                <tbody>
			                                	<c:forEach items="${ list }" var="b"  varStatus="i">
			                                    <tr>
 			                                        <th scope="row">${ fn:length(list)-i.index }</th>
 			                                        <td style="display:none">${b.bno}</td> 			                                        
			                                        <td> ${ b.title }</td>
			                                        <td> ${ b.nickname }</td>
			                                        <td> ${ b.CDate }</td>
			                                        <td> ${ b.hit }</td>
			                                    </tr>
			                                    </c:forEach>
			                                    <!-- <tr>
			                                        <th scope="row">2</th>
			                                        <td>이곳은</td>
			                                        <td>관리자</td>
			                                        <td>21-10-22</td>
			                                        <td>10</td>
			                                    </tr>
			                                    <tr>
			                                        <th scope="row">3</th>
			                                        <td>자유게시판입니다.</td>
			                                        <td>관리자</td>
			                                        <td>21-10-22</td>
			                                        <td>20</td>
			                                    </tr> -->
			                                </tbody>
			                  
			                            </table>
			                            
			                            
			                            
			                            <div class=card-footer >
			                              <nav aria-label="Page navigation example" >
                                            <ul class="pagination">
                                                     <ul class="pagination">
                	<c:choose>
                		<c:when test="${ pi.currentPage ne 1 }">
                			<li class="page-item">
                			<a class="page-link" aria-label="Previous" href="list.bo?currentPage=${ pi.currentPage-1 }">
                			    <span aria-hidden="true">&laquo;</span>
                                <span class="sr-only">Previous</span>                			
                			</a></li>
                		</c:when>
                		<c:otherwise>
							<li class="page-item disabled" >
							<a class="page-link" aria-label="Previous" href="list.bo?currentPage=${ pi.currentPage+1 }">
   								<span aria-hidden="true">&laquo;</span>
                                <span class="sr-only">Previous</span>  
                			</a></li>                		</c:otherwise>
                	</c:choose>
                	
                    <c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
                    	<c:choose>
	                		<c:when test="${ pi.currentPage ne p }">
                    			<li class="page-item"><a class="page-link" href="list.bo?currentPage=${ p }">${ p }</a></li>
	                		</c:when>
	                		<c:otherwise>
	                			<li class="page-item disabled"><a class="page-link" href="">${ p }</a></li>
	                		</c:otherwise>
	                	</c:choose>
                    </c:forEach>
                    
                    
                    <c:choose>
                		<c:when test="${ pi.currentPage ne pi.maxPage }">
                			<li class="page-item" x><a class="page-link" aria-label="Next" href="list.bo?currentPage=${ pi.currentPage+1 }">
                			
                			
                			  <span aria-hidden="true">&raquo;</span>
                              <span class="sr-only">Next</span>
                			
                			</a></li>
                		</c:when>
                		<c:otherwise>
                			<li class="page-item disabled" ><a class="page-link" aria-label="Next" href="list.bo?currentPage=${ pi.currentPage+1 }">
                				
                			  <span aria-hidden="true">&raquo;</span>
                              <span class="sr-only">Next</span>
                			</a></li>
                		</c:otherwise>
                	</c:choose>
                                            </ul>
                                        </nav>
			                            
			                            </div>
			                        </div>
			                    </div>
                            </div>
                        </div>
                    </div>
                </div>
 
 	<script>
	$(function(){
		$("#boardList tbody tr").click(function(){
			location.href="detail.co?bno=" + $(this).children().eq(1).text();
		});
	});
 	
 	</script>
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
    <script src="${ pageContext.servletContext.contextPath }/resources/assets/libs/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap tether Core JavaScript -->
    <script src="${ pageContext.servletContext.contextPath }/resources/assets/libs/popper.js/dist/umd/popper.min.js"></script>
    <script src="${ pageContext.servletContext.contextPath }/resources/assets/libs/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- apps -->
    <!-- apps -->
    <script src="${ pageContext.servletContext.contextPath }/resources/dist/js/app-style-switcher.js"></script>
    <script src="${ pageContext.servletContext.contextPath }/resources/dist/js/feather.min.js"></script>
    <!-- slimscrollbar scrollbar JavaScript -->
    <script src="${ pageContext.servletContext.contextPath }/resources/assets/libs/perfect-scrollbar/dist/perfect-scrollbar.jquery.min.js"></script>
    <script src="${ pageContext.servletContext.contextPath }/resources/assets/extra-libs/sparkline/sparkline.js"></script>
    <!--Wave Effects -->
    <!-- themejs -->
    <!--Menu sidebar -->
    <script src="${ pageContext.servletContext.contextPath }/resources/dist/js/sidebarmenu.js"></script>
    <!--Custom JavaScript -->
    <script src="${ pageContext.servletContext.contextPath }/resources/dist/js/custom.min.js"></script>
</body>

</html>