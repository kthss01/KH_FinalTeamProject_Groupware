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
                        <h4 class="page-title text-truncate text-dark font-weight-bold mb-1">자료실</h4>
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
                
			                    <div class="col-12">
			                        <div  class="card">
			                            <div class="card-body">
			                                <h4 class="card-title font-weight-bold">자료 등록</h4>
			                            </div>

  			         		<div class="container" style="padding: 50px;">

								<div class="form-group">

	
									 <!--<label class="mr-sm-2  font-weight-bold" for="selectCategory">카테고리 선택</label>
										 <select class="custom-select mr-sm-2"
										id="selectCategory" style="width: 150px;">
										<option selected>자유게시판</option>
										<option value="1">골프게시판</option>
										<option value="2">주식게시판</option>
										<option value="3">ㅇㅇ게시판</option>
									</select> <br> -->
									
									<label  style=display:inline
										class="mr-sm-2  font-weight-bold" for="inlineFormCustomSelect">자료명</label> 
									<input
										type="text" class="form-control form-control-sm" value="프로젝트 기획서 양식">
									<label style=display:inline class="mr-sm-2  font-weight-bold" for="inlineFormCustomSelect">등록날짜</label>

									<input type="date" class="form-control" value="2021-05-13"
										readonly>


								</div>
								<label style=display:inline class="mr-sm-2  font-weight-bold" for="inlineFormCustomSelect">자료설명</label>

								<textarea id="summernote" name="editordata"> 
								
								프로젝트 기획서 양식입니다.
								
								</textarea>
  			         				
								<button type=submit class="btn btn-warning">등록</button>

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
			                        		//여기 아래 부분
			                        		$('#summernote').summernote({
			                        			  height: 500,                 // 에디터 높이
			                        			  minHeight: null,             // 최소 높이
			                        			  maxHeight: null,             // 최대 높이
			                        			  focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
			                        			  lang: "ko-KR",					// 한글 설정
			                        			  placeholder: '최대 2048자까지 쓸 수 있습니다'	//placeholder 설정
			                        	          
			                        		});
			                        	});
			                          
			                          
			                          
			                          
			                      /*  // 서머노트에 text 쓰기
			                          $('#summernote').summernote('insertText', 써머노트에 쓸 텍스트);


			                          // 서머노트 쓰기 비활성화
			                          $('#summernote').summernote('disable');

			                          // 서머노트 쓰기 활성화
			                          $('#summernote').summernote('enable');


			                          // 서머노트 리셋
			                          $('#summernote').summernote('reset');


			                          // 마지막으로 한 행동 취소 ( 뒤로가기 )
			                          $('#summernote').summernote('undo');
			                          // 앞으로가기
			                          $('#summernote').summernote('redo');
			                           */
			                          
			                          
			                          </script> 

</body>

</html>