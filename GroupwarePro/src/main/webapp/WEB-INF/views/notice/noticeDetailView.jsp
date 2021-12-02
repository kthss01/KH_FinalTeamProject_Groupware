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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
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
                        <h4 class="page-title text-truncate text-dark font-weight-medium mb-1">전사 게시판</h4>
                        <div class="d-flex align-items-center">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb m-0 p-0">
                                    <li class="breadcrumb-item"><a href="index.html" class="text-muted">Apps</a></li>
                                    <li class="breadcrumb-item text-muted active" aria-current="page">Notice List</li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                    <div class="col-5 align-self-center">
                        <div class="customize-input float-right">
                            
                        </div>
                    </div>
                </div>
                
                
                
                
                
                
            </div>
            
            
            

            <div class="container-fluid">
              
                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-body">
                                
                                
                                    <div class="page-wrapper"> 
                                    	<div class="row"> 
      										<div class="col-md-12 text-center font-weight-bold"><h1>${ notice.NTitle }</h1>
      											<button type="button" class="btn btn-danger btn-circle-lg btn float-right" onclick="faHeart();">             
      											<i class="fa fa-heart"></i>
                                				</button>
                                				
                                				<form id="postForm" action="increaseSupport.bo" method="post">
													<input type="hidden" name="nno" value="${ notice.NNo }">
												</form>
                                				<!-- <i class="icon-options-vertical btn float-right btn btn-primary btn-lg"></i> -->
                                				
                                				
                                				<button type="button" class="btn btn-secondary dropdown-toggle btn float-right"
                                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                
                                                	<i class="icon-options-vertical btn btn-primary btn-lg"></i>
                                            </button>
                                            <div class="dropdown-menu">
                                                <!-- Dropdown menu links -->
                                                <a class="dropdown-item" onclick="callFunction();">수정하기</a>
                                                <a class="dropdown-item" href="#">Another action</a>
                                                <a class="dropdown-item" href="#">Something else here</a>
                                                <div class="dropdown-divider"></div>
                                                <a class="dropdown-item" href="#">Separated link</a>
                                            </div>
                                            
                                            
      										</div>
    									</div>
    <hr>
    
    
    
    <div class="row">
      <div class="col-md-12 justify-content-end text-center">${ notice.NContent }</div>
    </div>

    
    <div class="row">
      <div class="col-md-12">
      	<c:if test="${ !empty notice.originName }">
                        	<a href="${ pageContext.servletContext.contextPath }/resources/upload_files/${notice.changeName}" download="${ notice.originName }"><i class="fas fa-download"></i>첨부파일 다운</a>       
                        </c:if>
                        <c:if test="${ empty notice.originName }">
                        	
                        </c:if>
      </div>
    </div>
    
    
    <hr>
    
    <div class="card">
    	<div class="row">
      		<div class="col-md-12">
      		<h2>댓글</h2>
      		
                                
                                
                                <form class="mt-4">
                                    <div class="">
                                    <table class=''> <!-- table table-bordered -->
                                    			<!-- <thead>
                                    				<tr>
                                    					<td class="col-md-3">작성자번호</td>
                                    					<td class="col-md-9">내용</td>
                                    				</tr>
                                    			</thead>-->
                                    			<tbody id="test">
                                    				
                                    			</tbody>
                                    		</table>
                                    	<div id="replyArea">
                                    		
                                    	</div>
                                    	
                                        
                                        <div class="input-group">
                                        	<input type="text" class="form-control" id="placeholder" placeholder="Placeholder Text">
                                        	
                                        	<!--  <i class="fas fa-upload" type="button"></i> -->
                                            <button class="btn btn-outline-secondary" type="button" id="enrollR">댓글 작성</button>
                                        </div>
                                        
                                        
                                    </div>
                                </form>
                                
                            
      		                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
      		
      		</div>
    	</div>
    </div><!--  -->
                                    </div><!-- page-wrapper -->
                                    
                                    
                             
                                    
                                    
                                
                            </div>
                        </div>
                    </div>
                </div>
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
    
    <script>
    $(function(){
		
		
		
		selectReplyList();
		
		$("#enrollR").click(function(){
			var nno = ${notice.NNo};
	   		
	   		
	    	   if($("#placeholder").val().trim().length != 0){
	    	   				
	    	   	$.ajax({
	    	   		url:"rinsert.bo",
	    	   		type:"post",
	    	   		data:{replyContent:$("#placeholder").val(),
	    	   			  refNo:nno,
	    	   			  replyWriter:"${loginUser.getEmpNo()}"},
	    	   		success:function(result){
	    	   			if(result > 0){//
	    	   				$("#placeholder").val("");
	    	   				selectReplyList();
	    	   				alert("댓글이 등록되었습니다.");
	    	   				
	    	   			}else{
	    	   				alert("로그인하러가기-댓글을 등록하려면 로그인을 해주세요.");
	    	   			}
	    	   		},error:function(){
	    	   			console.log("댓글 작성 ajax 통신 실패");
	    	   		}
	    	   	});
	    	   				
	    	   			}else{
	    	   				alert("작성된 댓글이 없습니다. 댓글을 입력해주세요.");
	    	   			}
		});
		
		
		selectReplyList();
		
	});
    
    
    
    function selectReplyList(){
 		var nno=${notice.NNo};
 		
 		$.ajax({
			url:"rlist.bo",
			data:{nno:nno},
			type:"get",
			success:function(list){
				
				//alert("댓글 리스트 조회 성공");
				
				
				
				
				
				
				var value=""; 
				$.each(list, function(i, obj){

					value +="<tr>" 
						+"<td>"+obj.replyWriter+"님" +"</td>"
						+"<td>"+ obj.replyContent+"</td>"
						+"</tr>";
					
					
					
				});
				
				
				$("#test").html(value);
				
				
			},error:function(){
				console.log("댓글 리스트조회용 ajax 통신 실패");
			}
		});
 		
 		
 		
 	}
 	</script>
    
    
    
    
    
    
    <!--  <script>
       function enrollR(){
    	   var nno = ${notice.NNo};
   		
   		
    	   if($("#placeholder").val().trim().length != 0){
    	   				
    	   	$.ajax({
    	   		url:"rinsert.bo",
    	   		type:"post",
    	   		data:{replyContent:$("#placeholder").val(),
    	   			  refNo:nno,
    	   			  replyWriter:"${loginUser.getEmpNo()}"},
    	   		success:function(result){
    	   			if(result > 0){//
    	   				$("#placeholder").val("");
    	   				//selectReplyList();
    	   				alert("댓글등록성공");
    	   				
    	   			}else{
    	   				alert("로그인하러가기-댓글을 등록하려면 로그인을 해주세요.");
    	   			}
    	   		},error:function(){
    	   			console.log("댓글 작성 ajax 통신 실패");
    	   		}
    	   	});
    	   				
    	   			}else{
    	   				alert("작성된 댓글이 없습니다. 댓글을 입력해주세요.");
    	   			}
       }
    </script>  -->
    
    
    <script>
    	function callFunction(){
    		var nno=${notice.NNo};
    		location.href="updateForm.bo?nno="+nno;
    		
    	}
    </script>
    
    <script>
    	function faHeart(){
    		var postForm = $("#postForm");
    		
    		
    		postForm.submit();
    		
    		
    		
    		
    		
    		
    	}
    </script>

    
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