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
<title>Insert title here</title>

<style>
.filebox .upload-name {
    display: inline-block;
    height: 40px;
    padding: 0 10px;
    vertical-align: middle;
    border: 1px solid #dddddd;
    width: 78%;
    color: #999999;
}
.filebox label {
    display: inline-block;
    padding: 10px 20px;
    color: #fff;
    vertical-align: middle;
    background-color: #999999;
    cursor: pointer;
    height: 40px;
    margin-left: 10px;
}

.filebox input[type="file"] {
    position: absolute;
    width: 0;
    height: 0;
    padding: 0;
    overflow: hidden;
    border: 0;
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
     <!-- Page wrapper  -->
        <!-- ============================================================== -->
        <div class="page-wrapper">
            <!-- ============================================================== -->
            <!-- Bread crumb and right sidebar toggle -->
            <!-- ============================================================== -->
            <div class="page-breadcrumb">
                <div class="row">
                    <div class="col-7 align-self-center">
                        <h4 class="page-title text-truncate text-dark font-weight-bold mb-1">자료실</h4>
                        <div class="d-flex align-items-center">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb m-0 p-0">
                                    <li class="breadcrumb-item"><a href="index.html" class="text-muted">Home</a></li>
                                    <li class="breadcrumb-item text-muted active" aria-current="page">Library</li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                    <div class="col-5 align-self-center">
                        <div class="customize-input float-right">
                            <button class="btn btn-primary btn-sm" type="button" style="width:220px;" 
                            		data-toggle="modal" data-target="#multiple-one">자료 등록하기
                            </button>

                      </div>
                      
                      
                        <!--  자료  등록 모달  -->                  
			   			<div id="multiple-one" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="multiple-oneModalLabel" aria-hidden="true" style="display: none;">
			                   <div class="modal-dialog">
			                       <div class="modal-content">
			                           <div class="modal-header">
			                               <h4 class="modal-title font-weight-bold" id="multiple-oneModalLabel">자료 업로드</h4>
			                               <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			                           </div>
			                        <form class="pl-3 pr-3" action="insertBoard.li" method="post" enctype="multipart/form-data">
			                           <div class="modal-body">
					      
		                                   <div class="form-group">
		                                       <label for="title"  class="font-weight-bold">자료명</label>
		                                       <input class="form-control" type="text" id="title" name="title" placeholder="ex) OOO 양식">
		                                   </div>
		                                   <div class="form-group">
		                                      <label class=" font-weight-bold" for="cno">자료분류</label>
			                                   <select class="custom-select mr-sm-2" id="cno" name="cno">
			                                       <option value="1">경리회계</option>
			                                       <option value="2">경영지원</option>
			                                       <option value="3">영업지원</option>
			                                       <option value="4">인사총무</option>
			                                   </select>
		                                   </div>
		
		                                   <div class="form-group">
		                                       <label for="content" class="font-weight-bold">자료 설명</label>
		                                       <input class="form-control" style="height:120px;" type="text" id="description" name="content" placeholder="간단 설명 기입">
		                                   </div>
				                               <label class="font-weight-bold">자료 첨부</label>
		                                   <div class="form-group filebox">	                                   
											    <input class="upload-name" name="uploadFile" style="width:300px;" value="첨부파일" placeholder="첨부파일">
											    <label for="file" style="margin-top:10px; font-size:15px;">파일선택</label> 
											    <input type="file" id="file" name="uploadFile">
											</div>
			                           </div>
			                           <div class="modal-footer">
			                           	 <button class="btn btn-primary" type="submit">자료 등록하기 </button>
			                           
			                           </div>
			                          </form>
			                           
			                       </div><!-- /.modal-content -->
			                   </div><!-- /.modal-dialog -->
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
                <h4 class="card-title mt-5 font-weight-bold"><i class="fas fa-copy"></i>&nbsp;&nbsp;서류 검색</h4>
                        <div class="card">
                            <div class="card-body" style="padding:15px;">
                               <div class="form-group row">
                               	<div class="col-3" style="display:inline-block">
                               	 <label class=" font-weight-bold" for="">부서 별 분류</label>
                                   <select class="custom-select mr-sm-2" id="cno" name="cno">
                                       <option selected value="0">전체 조회 </option>
                                       <option value="1">경리회계</option>
                                       <option value="2">경영지원</option>
                                       <option value="3">영업지원</option>
                                       <option value="4">인사총무</option>
                                   </select>
                               	
                               	</div>
                               	<div  class=" col-6" style="display:inline-block">
         						<label class="mr-sm-2 font-weight-bold" for="">서류 검색</label>                                  
                                   <input type="search" style="display:inline-block;" class="form-control" placeholder="서류 검색">
                              	</div>
                              	<div class="col-2">	
                              	<button style="width:100px; margin-top:40px;" class="form-control btn btn-outline-secondary"><i class="icon-magnifier">검색</i></button>
                              	</div>
                               </div>
                            </div>
                        </div>
                
                <h4 class="card-title mt-5 font-weight-bold"><i class="fas fa-copy"></i>&nbsp;&nbsp;문서 양식 목록</h4>
	                <div class="row">
	                 <c:forEach items="${ list }" var="l"  varStatus="i">
	                
	                    <div class="col-sm-12 col-md-6 col-lg-3">

	                 		   <div class="card">
	                            <div class="card-body">
	                                <h4 class="card-title" style="font-size:17px;">
	                                <a href="fileDownLoad.do?fileName=${l.changeName }">${l.originName} &nbsp; 
	                                <i class="fas fa-file-alt" onclick="downloadFile(${l.changeName});"></i></a></h4>
	                                
	                                <div class="thumbnail" style="height:100px;">
										<img src="http://placehold.it/170x100" />
	                               </div>
	                               
	                            </div>
	                        </div>
	                 	  </div>                 	                
	                 </c:forEach>            

				<!-- 페이지 -->
	                    
	                     <div class="col-12">
			                <div class="card">
				                <div class="card-footer">
				                 <nav aria-label="Page navigation example" >
                                  <ul class="pagination" style="justify-content:center;">
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
				                			<li class="page-item" ><a class="page-link" aria-label="Next" href="list.bo?currentPage=${ pi.currentPage+1 }">
				                			
				                			
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
            </div>
            <!-- ============================================================== -->
            <!-- End Container fluid  -->
            <!-- ============================================================== -->
            <!-- ============================================================== -->
            <!-- footer -->
            <!-- ============================================================== -->
            <footer class="footer text-center">
                All Rights Reserved by Adminmart. Designed and Developed by <a
                    href="https://wrappixel.com">WrapPixel</a>.
            </footer>
            <!-- ============================================================== -->
            <!-- End footer -->
            <!-- ============================================================== -->
        </div>
        <!-- ============================================================== -->
        <!-- End Page wrapper  -->
        <!-- ============================================================== -->
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
    
    <script>
    $("#file").on('change',function(){
    	  var fileName = $("#file").val();
    	  $(".upload-name").val(fileName);
    	});
    
/*     function downloadFile(filename){
        const encFileName = encodeURI(filename);
        $.ajax({
            method:"GET",
            url : 'fileDownLoad.do',
            success : function(data) {
                window.location ='fileDownLoad.do?FileName=${encFileName}';
            },
            error:function(request,status){
                alert("오류가 발생했습니다.");
            }
        });
    }
 */
    </script>
</body>

</html>