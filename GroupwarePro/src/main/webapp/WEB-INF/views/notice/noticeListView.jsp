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
                            
                             <div class="input-group-append">
                                            <button class="btn btn-outline-secondary" type="button" onclick="enroll();">글쓰기</button>
                             </div>
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
                
              <!--<div class="card">                        
                            <div class="card-body">
                            
                            <h3></h3>
                            
                           
                            
                            <h3></h3>
                            
                            </div>
                </div> -->
                
                
                <!-- basic table -->
                <div class="row">
                    <div class="col-12">
                        <div class="card">                        
                            <div class="card-body">
                                <div class="row">
                                	
                                    <!-- Signup modal content -->
                                <div id="signup-modal" class="modal fade" tabindex="-1" role="dialog"
                                    aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content">

                                            <div class="modal-body">
                                                <div class="mt-2 mb-4">
                                                    <a href="index.html" class="text-success">
                                                        <span>기간 설정</span>
                                                    </a>
                                                </div>

                                                <form class="pl-3 pr-3" action="#">

                                                    <div class="form-group">
                                                        <div class=""> <!-- custom-control custom-checkbox -->
                                                            <input type="checkbox" class=""
                                                                id="customCheck1"> <!-- custom-control-input -->
                                                            <label class="" for="">1주동안</label>
                                                        </div>
                                                    </div>

                                                    <div class="form-group">
                                                        <div class="">
                                                            <input type="checkbox" class=""
                                                                id="customCheck1">
                                                            <label class="" for="">2주동안</label>
                                                        </div>
                                                    </div>

                                                    <div class="form-group">
                                                        <div class="">
                                                            <input type="checkbox" class=""
                                                                id="customCheck1">
                                                            <label class="" for="">3주동안</label>
                                                        </div>
                                                    </div>

                                                    <div class="form-group">
                                                        <div class="">
                                                            <input type="checkbox" class=""
                                                                id="customCheck1">
                                                            <label class="" for="">4주동안</label>
                                                        </div>
                                                    </div>

                                                    <div class="form-group text-center">
                                                        <button class="btn btn-primary" onclick="call();">공지</button>
                                                    </div>

                                                </form>

                                            </div>
                                        </div><!-- /.modal-content -->
                                    </div><!-- /.modal-dialog -->
                                </div><!-- /.modal -->


                                

                                <i class="icon-bell"></i><a data-toggle="modal"
                                        data-target="#signup-modal">공지로 등록</a>
                                    
                                    <i class="fas fa-trash-alt"></i><a onclick="deleteCall();">삭제</a>
                                    <i class="fas fa-map-pin"></i><a onclick="insertTopBoard();">상단 고정</a>
                                    
                                      <table id="noticeList" class="table table-hover" align="center">
                                      	<thead>
                                      		<tr>
                  							<th></th>
                    						<th>No.</th>
                    						<th>제목</th>
                    						<th>작성자</th>
                    						<th>작성일</th>
                    						<th>조회수</th>
                    						<th></th>
                  						</tr>
                                      	</thead>

                						<tbody>
                   						<c:forEach items="${ list }" var="n">
                       						<tr onclick="location.href='detail.bo?nno='+${ n.NNo }">
                       	   						<td onclick="event.cancelBubble=true">
                       								<input class="form-check-input" type="checkbox" 
                       								id="inlineCheckbox1" name="inlineCheckbox1" value="${n.NNo}">     
                       	   						</td>
                           						<td>${ n.NNo }</td>
                           						<td>${ n.NTitle }</td>
                           						<td>
                           							<c:if test="${n.anonym ne 'Y'}">
                           							${ n.empNo }
                        							</c:if>
                        							<c:if test="${n.anonym ne 'N'}">
                        							익명
                        							</c:if>
                           						</td>
                           						<td>${ n.createDate }</td>
                           						<td>${ n.count }</td>
                           						<td onclick="event.cancelBubble=true">
                           							<c:if test="${n.status ne 'Y'}">
                        							<i class="icon-star btn-outline-secondary"></i>
                        							</c:if>
                        							<c:if test="${n.status ne 'N'}">
                        							<i class="fas fa-star btn-outline-secondary" onclick="deleteNotify();"></i>
                        							</c:if>
                           						</td>
                           						<td style="display:none">${ n.topBoard }</td>
                       						</tr>
                    					</c:forEach>
                						</tbody>
            						</table>
                                </div>
                               
                                
                             
           
                             
                                
                       
                                    
                                     <div id="pagingArea">
                <ul class="pagination" style="justify-content:center;">
                   <c:choose>
                      <c:when test="${ pi.currentPage ne 1 }">
                         <li class="page-item"><a class="page-link" href="list.bo?currentPage=${ pi.currentPage-1 }">Previous</a></li>
                      </c:when>
                      <c:otherwise> <!-- 현재페이지 1 -->
                         <li class="page-item disabled"><a class="page-link" href="">Previous</a></li>
                      </c:otherwise>
                   </c:choose>
                               
                    <c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
                       <c:choose>
                         <c:when test="${ pi.currentPage ne p }">
                             <li class="page-item"><a class="page-link" href="noticeList.bo?currentPage=${ p }">${ p }</a></li>
                         </c:when>
                         <c:otherwise>
                            <li class="page-item disabled"><a class="page-link" href="">${ p }</a></li>
                         </c:otherwise>
                      </c:choose>
                    </c:forEach>
                    
                    
                    <c:choose>
                      <c:when test="${ pi.currentPage ne pi.maxPage }">
                         <li class="page-item"><a class="page-link" href="list.bo?currentPage=${ pi.currentPage+1 }">Next</a></li>
                      </c:when>
                      <c:otherwise>
                         <li class="page-item disabled"><a class="page-link" href="list.bo?currentPage=${ pi.currentPage+1 }">Next</a></li>
                      </c:otherwise>
                   </c:choose>
                </ul>
            </div>
            
            
            <div id="searchArea" align="center">
			<form action="search.bo">
				<select name="">
					
					<option value="">전사게시판</option>
					<option value="">월간식단표</option>
				</select>
				<select name="condition">
					
					<option value="content">제목</option>
				</select>
				<input type="search" name="search" value="${search}">
				<button type="submit">검색하기</button>
			</form>
		</div>
            
            
            
                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
          
         
   
    
      
    
    <script>
       function enroll(){
    	   
    	   location.href="enrollForm.bo"; 
          
       }
    </script>
    
    
    
     <script>
    	function call(){
    		if($('input:checkbox[name=inlineCheckbox1]:checked').length > 1){
     		   alert("전체 항목 중 1가지만 선택해주세요.");
     	   }else if($('input:checkbox[name=inlineCheckbox1]:checked').length < 1){
     		   alert("선택된 게시물이 없습니다.");
     	   }else{
     		   confirm("선택 항목을 공지로 등록하시겠습니까?");
     		   
     		  var nno=Number($('input[name="inlineCheckbox1"]:checked').val());
     		   
     		  $.ajax({
   				url:"insertNotify.bo",
   				data:{nno:nno},
   				type:"post",
   				success:function(result){
   					
   					if(result>0){

   					}else{
   						alert("이미 등록되어 있는 게시글입니다. 다른 게시글을 선택해주세요.");
   					}
   				},error:function(){
   					console.log("ajax 통신 실패");
   				}
   			});
     	   }
    		
    	} 
       </script>
    
    <script>
    	function deleteNotify(){
    		var result=confirm("설정 해제하시겠습니까?");
    		if(result){
    			
    			 var nno=$('input[name="inlineCheckbox1"]:checked').val();
    			 
    			 var res=Number(nno);
    			
    			
        		location.href="deleteNotify.bo?nno=" +res;	
    		}
    		
    	}
    </script>
    
    
    
    <script>
    	function deleteCall(){
    		
    		var result=confirm("해당 게시물을 삭제하시겠습니까?");
    		
    		if(result){
    			var nno=Number($('input[name="inlineCheckbox1"]:checked').val());
        		
        		location.href="deleteCall.bo?nno="+nno;
    		}
    		
    		
    		
    	}
    </script>
    
    <!--  <script>
    	function insertTopBoard(){
  	
    		
    		if($('input:checkbox[name=inlineCheckbox1]:checked').length > 1){
     		   alert("전체 항목 중 1가지만 선택해주세요.");
     	   }else if($('input:checkbox[name=inlineCheckbox1]:checked').length < 1){
     		   alert("선택된 게시물이 없습니다.");
     	   }else{
     		   
     		   confirm("상단 고정하시겠습니까?");
     		  var nno=Number($('input[name="inlineCheckbox1"]:checked').val());
     		   
     		  $.ajax({
   				url:"insertTopBoard.bo",
   				data:{nno:nno},
   				type:"post",
   				success:function(result){
   					
   					if(result>0){
   						
   						//alert("설정 완료되었습니다.");
   						
   					}else{
   						alert("ajax 통신 실패");
   					}
   				},error:function(){
   					console.log("ajax 통신 실패");
   				}
   			});
     		   

     	   }
    		
    	} 
       
    </script>-->
    
    <script>
    	function insertTopBoard(){
    		var nno=Number($('input[name="inlineCheckbox1"]:checked').val());
  	
    		
    		$.ajax({
    			url:"selectTopBoard.bo",
    			data:{nno:nno},
    			type:"get",
    			dataType:"json",
    			success:function(result){
    				console.log("result-->"+result);
    				var res = {
    		    			 topBoard: result.topBoard
    		   
    		    			};
    				if(res.topBoard ==0){
    					confirm("상단 고정하시겠습니까?");
			     		var nno=Number($('input[name="inlineCheckbox1"]:checked').val());
			     		   
			     		location.href="insertTopBoard.bo?nno="+nno;
    					
    					
    				}else{
    					confirm("설정 해제하시겠습니까?");
    					
    					var nno=Number($('input[name="inlineCheckbox1"]:checked').val());
    					
    					location.href="deleteTopBoard.bo?nno="+nno;
    				}
    				
    				
    			},error:function(){
    				console.log("ajax 통신 실패");
    			}
    		});
    		
    	} 
       
    </script>
    
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