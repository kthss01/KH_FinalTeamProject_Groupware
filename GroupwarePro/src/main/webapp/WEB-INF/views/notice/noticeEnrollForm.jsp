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
        <!-- ============================================================== -->
        



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
                        <h4 class="page-title text-truncate text-dark font-weight-medium mb-1">전사공지사항</h4>
                        <div class="d-flex align-items-center">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb m-0 p-0">
                                    <li class="breadcrumb-item"><a href="index.html" class="text-muted">Apps</a></li>
                                    <li class="breadcrumb-item text-muted active" aria-current="page">Ticket List</li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                    <div class="col-5 align-self-center">
                        <div class="customize-input float-right">
                            <!--<select class="custom-select custom-select-set form-control bg-white border-0 custom-shadow custom-radius">
                                <option selected>Aug 19</option>
                                <option value="1">July 19</option>
                                <option value="2">Jun 19</option>
                            </select> -->
                            
                             <!-- <div class="input-group-append">
                                            <button class="btn btn-outline-secondary" type="button" href="">글쓰기</button>
                             </div> -->
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
                <!-- basic table -->
                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-body">
                                <div class="row">
                                    <!-- Column -->
                                    <div class="col-md-6 col-lg-3 col-xlg-3">
                                        <div class="card card-hover">
                                            <div class="p-2 bg-primary text-center">
                                                <h1 class="font-light text-white">2,064</h1>
                                                <h6 class="text-white">Total Tickets</h6>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- Column -->
                                    <div class="col-md-6 col-lg-3 col-xlg-3">
                                        <div class="card card-hover">
                                            <div class="p-2 bg-cyan text-center">
                                                <h1 class="font-light text-white">1,738</h1>
                                                <h6 class="text-white">Responded</h6>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- Column -->
                                    <div class="col-md-6 col-lg-3 col-xlg-3">
                                        <div class="card card-hover">
                                            <div class="p-2 bg-success text-center">
                                                <h1 class="font-light text-white">1100</h1>
                                                <h6 class="text-white">Resolve</h6>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- Column -->
                                    <div class="col-md-6 col-lg-3 col-xlg-3">
                                        <div class="card card-hover">
                                            <div class="p-2 bg-danger text-center">
                                                <h1 class="font-light text-white">964</h1>
                                                <h6 class="text-white">Pending</h6>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- Column -->
                                </div>
                                
                                <!-- enctype="multipart/form-data" -->
                                <form id="enrollForm" method="post" action="enroll.bo" enctype="multipart/form-data">
                                
                                
                                <h4 class="card-title">작성자</h4>
                                <input type="text" class="" id="inputSuccess1" name="empNo" value="${loginUser.getEmpNo()}" style="width:200px;">
                                <!--form-control is-valid  -->
                                <br><br>
                                     
                                <!-- <div class="card-body">
                                <h4 class="card-title">작성자</h4>
                                <h6 class="card-subtitle">To use add <code>is-valid</code> class to the input</h6>
                                <form class="mt-3">
                                    <label class="form-control-label" for="inputSuccess1">Input with success</label>
                                    <input type="text" class="form-control is-valid" id="inputSuccess1" name="empNo" value="${loginUser.getEmpNo() }">
                                    <div class="valid-feedback">
                                        Success! You've done it.
                                    </div>
                                </form>
                            </div> -->
                            
                            <h4 class="card-title">제목</h4>
                            <input type="text" class="" id="inputSuccess2" name="nTitle" style="width:300px;">
                            <br>
                            <br>
                            
                            
                            <!--<h4 class="card-title">파일첨부</h4>
                            <input type="file" class="" id="inputSuccess4" name="upfiles">-->
                            
                            <h4 class="card-title">파일첨부</h4>
                            <input type="file" class="form-control-file" id="inputSuccess4" name="upfiles">
                            <br>
                            
                            
                            
                            <!--<div class="card-body">
                                <h4 class="card-title"></h4>
                                <form class="mt-3">
                                    <div class="form-group">
                                        <textarea class="form-control" rows="3"></textarea>
                                    </div>
                                </form>
                            </div> -->
                                
                                <!-- <label style=display:inline class="mr-sm-2  font-weight-bold" for="inlineFormCustomSelect">내용</label>  --> 
                                <h4 class="card-title">내용</h4>
                                <!-- <textarea class="form-control" rows="3" name="nContent" id="inputSuccess3"></textarea> -->
                                
                                
                                
                                <div class="form-group">
		<textarea class="form-control" rows="10" name="nContent" style="width:550px;" required>${notice.NContent}</textarea>
	</div>
                                
                                
                                

								<!-- <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">Textarea</h4>
                                <form class="mt-3">
                                    <div class="form-group">
                                        <textarea class="form-control" rows="3" name="nContent" id="inputSuccess3"></textarea>
                                    </div>
                                </form>
                            </div>
                        </div>-->
								
								<br>
								
								<h4 class="card-title">익명설정</h4>
                                <fieldset class="radio">
                                    <label>
                                        <input type="radio" name="anonym" value="Y">예
                                    </label>
                                </fieldset>
                                <fieldset class="radio">
                                    <label>
                                        <input type="radio" name="anonym" value="N">아니오
                                    </label>
                                </fieldset> 
                                
                                <br>
                                
                           <!-- <h4 class="card-title">공지로 등록</h4>
                                <fieldset class="radio">
                                    <label>
                                        <input type="radio" id="" name="" value="">예
                                    </label>
                                </fieldset>
                                <fieldset class="radio">
                                    <label>
                                        <input type="radio" name="" value="">아니오
                                    </label>
                                </fieldset> -->   
                                
                               
                                
                                <!-- <h4 class="card-title">알림</h4>
                                <fieldset class="checkbox">
                                    <label>
                                        <input type="checkbox" value="">메일알림
                                    </label>
                                </fieldset>-->
                               
                               
                                
                                <div class="input-group-append">
                                            <button class="btn btn-outline-secondary btn-lg" type="submit">등록하기</button>
                             	</div>
                                
                                
                                
                                </form>
                                
                                <div class="table-responsive">
                                    
                                    <!--<ul class="pagination float-right">
                                        <li class="page-item disabled">
                                            <a class="page-link" href="#" tabindex="-1">Previous</a>
                                        </li>
                                        <li class="page-item active"><a class="page-link" href="#">1</a></li>
                                        <li class="page-item">
                                            <a class="page-link" href="#">2 <span class="sr-only">(current)</span></a>
                                        </li>
                                        <li class="page-item"><a class="page-link" href="#">3</a></li>
                                        <li class="page-item">
                                            <a class="page-link" href="#">Next</a>
                                        </li>
                                    </ul>  -->
                                    
                                    
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
            <!-- <script>
            	function insert(){
            		
            		var empNo=$('inputSuccess1').val();
            		var nTitle=$('inputSuccess2').val();
            		var nContent=$('#inputSuccess3').val();
            		
            		$.ajax({
        				url: 'enroll.bo',
        				data : {
        					empNo : empNo,
        					nTitle : nTitle,
        					nContent :  nContent
      	        	  	},
      	        	  success: function(data){
      	        		  alert("INSERT SUCCESS");
      	        	  },
      	        	error: function (xhr, status, error) {
		    	    	alert("INSERT FAILED");

		    	      }
        				
        			});
            	}
            </script> -->
            
            
            
            
            <!-- <script>
       $(function(){
          $("#boardList tbody tr").click(function(){
             location.href="detail.bo?bno=" + $(this).children().eq(0).text();
          });
       });
    </script> -->
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