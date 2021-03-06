<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <link rel="icon" type="image/png" sizes="16x16" href="${ pageContext.servletContext.contextPath }/resources/assets/images/favicon.png">
    <!-- Custom CSS -->
    <link href="${ pageContext.servletContext.contextPath }/resources/dist/css/style.min.css" rel="stylesheet">
   
  
  <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/summernote/summernote-lite.css">
   

   

    
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
                        <h4 class="page-title text-truncate text-dark font-weight-bold mb-1">?????????</h4>
                        <div class="d-flex align-items-center">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb m-0 p-0">
                                    <li class="breadcrumb-item"><a href="index.html" class="text-muted">Home</a></li>
                                    <li class="breadcrumb-item text-muted active" aria-current="page">Community</li>
                                </ol>
                            </nav>
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
                
			                    <div class="col-12">
			                        <div  class="card">
			                            <div class="card-body">
			                                <h4 class="card-title font-weight-bold">?????? ??????</h4>
			                            </div>

  			         		<div class="container" style="padding: 50px;">

								<div class="form-group">

	
									 <!--<label class="mr-sm-2  font-weight-bold" for="selectCategory">???????????? ??????</label>
										 <select class="custom-select mr-sm-2"
										id="selectCategory" style="width: 150px;">
										<option selected>???????????????</option>
										<option value="1">???????????????</option>
										<option value="2">???????????????</option>
										<option value="3">???????????????</option>
									</select> <br> -->
									
									<label  style=display:inline
										class="mr-sm-2  font-weight-bold" for="inlineFormCustomSelect">?????????</label> 
									<input
										type="text" class="form-control form-control-sm" value="???????????? ????????? ??????">
									<label style=display:inline class="mr-sm-2  font-weight-bold" for="inlineFormCustomSelect">????????????</label>

									<input type="date" class="form-control" value="2021-05-13"
										readonly>


								</div>
								<label style=display:inline class="mr-sm-2  font-weight-bold" for="inlineFormCustomSelect">????????????</label>

								<textarea id="summernote" name="editordata"> 
								
								???????????? ????????? ???????????????.
								
								</textarea>
  			         				
								<button type=submit class="btn btn-warning">??????</button>

  			         			</div>
			       
			                        </div>
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
            </div>
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
        </div>
        <!-- ============================================================== -->
        <!-- End Page wrapper  -->
        <!-- ============================================================== -->
    </div>
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
    
   <!--  -->   
   <script src="${ pageContext.servletContext.contextPath }/resources/summernote/summernote-lite.js"></script>
   <script src="${ pageContext.servletContext.contextPath }/resources/summernote/lang/summernote-ko-KR.js"></script>


        <script>
			                          $(document).ready(function() {
			                        		//?????? ?????? ??????
			                        		$('#summernote').summernote({
			                        			  height: 500,                 // ????????? ??????
			                        			  minHeight: null,             // ?????? ??????
			                        			  maxHeight: null,             // ?????? ??????
			                        			  focus: true,                  // ????????? ????????? ???????????? ????????? ??????
			                        			  lang: "ko-KR",					// ?????? ??????
			                        			  placeholder: '?????? 2048????????? ??? ??? ????????????'	//placeholder ??????
			                        	          
			                        		});
			                        	});
			                          
			                          
			                          
			                          
			                      /*  // ??????????????? text ??????
			                          $('#summernote').summernote('insertText', ??????????????? ??? ?????????);


			                          // ???????????? ?????? ????????????
			                          $('#summernote').summernote('disable');

			                          // ???????????? ?????? ?????????
			                          $('#summernote').summernote('enable');


			                          // ???????????? ??????
			                          $('#summernote').summernote('reset');


			                          // ??????????????? ??? ?????? ?????? ( ???????????? )
			                          $('#summernote').summernote('undo');
			                          // ???????????????
			                          $('#summernote').summernote('redo');
			                           */
			                          
			                          
			                          </script> 

</body>

</html>