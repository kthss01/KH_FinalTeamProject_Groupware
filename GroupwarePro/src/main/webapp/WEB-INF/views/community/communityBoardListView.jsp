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
                            <button class="btn btn-primary btn-sm" type="button" style="width:220px;" data-toggle="modal" data-target="#multiple-one">카테고리 신청하기</button>

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
                               <h4 class="card-title  font-weight-bold" >${ category.cname }</h4>
                               
                           </div>
                          	<div style="height:70px;">
                           <a  class="btn btn-warning mr-sm-2" href="enrollBoardForm.co?cno=${category.cno}" style="position:absolute; right:55px; width:100px;">글 쓰기</a>
                           </div>
                           <div class=row>
                           <div class="col-1"></div>
                            <table id="boardList" class="table table-sm  table-hover mb-0 col-10" style="text-align:center;" >
                               <thead >
                                   <tr >
                                       <th class="font-weight-bold" >#</th>
                                       <th style="width:60%;" class="font-weight-bold">제목</th>
                                       <th class="font-weight-bold">작성자(익명)</th>
                                       <th class="font-weight-bold">작성날짜</th>
                                       <th class="font-weight-bold">조회수</th>                                       
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
                               </tbody>
                 
                           </table>
                           <div class="col-1"></div>
                           </div> 
	                            <div class=card-footer style="margin-top:50px;">
	                              <nav aria-label="Page navigation example"  >
	                                                  <ul class="pagination" style="justify-content:center;">
						                	<c:choose>
						                		<c:when test="${ pi.currentPage ne 1 }">
						                			<li class="page-item">
						                			<a class="page-link" aria-label="Previous" href="boardList.co?currentPage=${ pi.currentPage-1 }">
						                			    <span aria-hidden="true">&laquo;</span>
						                                <span class="sr-only">Previous</span>                			
						                			</a></li>
						                		</c:when>
						                		<c:otherwise>
													<li class="page-item disabled" >
													<a class="page-link" aria-label="Previous" href="boardList.co?currentPage=${ pi.currentPage+1 }">
						   								<span aria-hidden="true">&laquo;</span>
						                                <span class="sr-only">Previous</span>  
						                			</a></li>                		</c:otherwise>
						                	</c:choose>
								                	
						                    <c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
						                    	<c:choose>
							                		<c:when test="${ pi.currentPage ne p }">
						                    			<li class="page-item"><a class="page-link" href="boardList.co?currentPage=${ p }">${ p }</a></li>
							                		</c:when>
							                		<c:otherwise>
							                			<li class="page-item disabled"><a class="page-link" href="">${ p }</a></li>
							                		</c:otherwise>
							                	</c:choose>
						                    </c:forEach>
								                    
								                    
						                    <c:choose>
						                		<c:when test="${ pi.currentPage ne pi.maxPage }">
						                			<li class="page-item" ><a class="page-link" aria-label="Next" href="boardList.co?currentPage=${ pi.currentPage+1 }">
						                			
						                			
						                			  <span aria-hidden="true">&raquo;</span>
						                              <span class="sr-only">Next</span>
						                			
						                			</a></li>
						                		</c:when>
						                		<c:otherwise>
						                			<li class="page-item disabled" ><a class="page-link" aria-label="Next" href="boardList.co?currentPage=${ pi.currentPage+1 }">
						                				
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
 
 
 
                    
			<!--  카테고리 신청 모달  -->                  
 			<div id="multiple-one" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="multiple-oneModalLabel" aria-hidden="true" style="display: none;">
                   <div class="modal-dialog">
                       <div class="modal-content">
                           <div class="modal-header">
                               <h4 class="modal-title font-weight-bold" id="multiple-oneModalLabel">* 필독  *</h4>
                               <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                           </div>
                           <div class="modal-body">
                               <h5 class="mt-0 font-weight-bold">카테고리 신청 안내사항</h5>
                               <br>
                               <p> 커뮤니티 주제를 신청하면 관리자의 검토 후에 승인이 이뤄집니다. 
                               </p>
                               <p style=font-size:12px;><span class="font-weight-bold" style="color:red">※</span> 단, 정치나 종교 등 사회적으로 예민한 주제는 반려될 수 있으며 승인이 통과되면 해당 주제 게시판이 열리고 신청자에게는 해당 게시판의 관리자 권한이 부여됩니다.
                               	관리에 소홀하거나 게시판 이용이 적을 경우 알림 후에 추후에 삭제 될 가능성이 있음을 알립니다</p>
                           </div>
                           <div class="modal-footer">
                               <button type="button" class="btn btn-primary" data-target="#multiple-two" data-toggle="modal" data-dismiss="modal">신청 양식</button>
                           </div>
                       </div><!-- /.modal-content -->
                   </div><!-- /.modal-dialog -->
               </div>
            </div>
   			<div id="multiple-two" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="multiple-twoModalLabel" aria-hidden="true" style="display: none;">
                   <div class="modal-dialog">
                       <div class="modal-content">
                           <div class="modal-header">
                               <h4 class="modal-title font-weight-bold" id="multiple-twoModalLabel">* 게시판 신청 양식 *</h4>
                               <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                           </div>
      						 <div class="modal-body">
                               <div class="text-center mt-2 mb-4">
                                   <a href="index.html" class="text-success">
                                       <span><img class="mr-2" src="${ pageContext.servletContext.contextPath }/resources/assets/images/logo-icon.png" alt="" height="18">
                                       <img src="${ pageContext.servletContext.contextPath }/resources/assets/images/logo-text.png" alt="" height="18"></span>
                                   </a>
                               </div>

									<form id="applyCategoryForm" action="applyCategory.co" method="post">
                                   <div class="form-group">
                                       <label for="cname"  class="font-weight-bold">카테고리 주제</label>
                                       <input class="form-control" type="text" id="cname" name="cname" placeholder="OOO게시판">
                                   </div>

                                   <div class="form-group">
                                       <label for="discription" class="font-weight-bold">주제 부가설명</label>
                                       <input class="form-control" style="height:120px;" type="text" id="discription" name="discription" placeholder="간단하게  작성해주세요.">
                                   </div>
                                   <input type="hidden" name="manager" value="${ loginUser.empNo }">
                                   <input type="hidden" name="managerName" value="${ loginUser.empName }">
									</form>
                                   <div class="form-group">
                                       <div class="custom-control custom-checkbox">
                                           <input type="checkbox" class="custom-control-input" id="checkCaution" name="checkCaution">
                                           <label class="custom-control-label" for="checkCaution"> 주의사항을 검토하였습니다.</label>
                                       </div>
                                   </div>
                                   <div class="form-group text-center">
                                       <button class="btn btn-primary" type="button" onclick="checkCaution();">신청서 제출하기 </button>
                                   </div>

									
                           </div>

                       </div>
                   </div>
               </div>




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
	<script>
		$(function(){
			$("#categroyMenu").addClass("in");
			
			
			$("#boardList tbody tr").click(function(){
				location.href="detail.co?bno=" + $(this).children().eq(1).text();
			});
			
		});
		

		$("#categoryMenuBtn").addClass("selected");
		$("#categoryMenuBtn").children('a').addClass("active");

	 	
		
		function checkCaution(){
			
			var checkBox = $("input:checkbox[name=checkCaution]").is(":checked");
			console.log(checkBox);
			
			if(checkBox == true){
				
				$("#applyCategoryForm").submit();
				
			}else{
				alert("주의사항을 충분히 검토하신 후 체크해주세요");
			}
			 
		}
		
	</script> 

</html>