<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	.title:hover{
		cursor: pointer;
	}
	
	.dLists:hover{
		background-color: rgba(0,0,0,.125);
	}
</style>
<link rel="icon" type="image/png" sizes="16x16"
	href="${ pageContext.servletContext.contextPath }/resources/assets/images/favicon.png">
<!-- Custom CSS -->
<link
	href="${ pageContext.servletContext.contextPath }/resources/dist/css/style.min.css"
	rel="stylesheet">
<!-- summernote -->
<link rel="stylesheet"
	href="${ pageContext.servletContext.contextPath }/resources/summernote/summernote-lite.css">

<title>Insert title here</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style>
	th{
		/* background-color: #5f76e8;rgba(0,0,0,.125); */
		background-color: rgba(0,0,0,.125);
		/* color: #ffffff; */
		text-align: center;
	}
	
	#EForm, #approverInfo{
		border: 1px solid rgba(0,0,0,.125);
		width: 203px;
		text-align: left;
	}
	#EForm, #EForms{
		width: 203px;
		text-align: left;
	}
</style>
</head>
<body>
	<button id="newEApproval" type="button" class="btn btn-rounded btn-primary col-12" data-toggle="modal" data-target="#myModal">새 결재 진행</button>
	                	
 	<!-- 결재 진행 전 양식, 결재자 선택하는 모달 -->
 	<div id="myModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" style="display: none;" aria-hidden="true">
         <div class="modal-dialog">
         <form action="enrollForm.ap" method="POST">
             <div class="modal-content">
                 <div class="modal-header">
                     <h4 class="modal-title col-6" id="myModalLabel">결재양식 선택</h4>
                     <h4 class="modal-title col-6" id="myModalLabel">결재선 선택</h4>
                 </div>
                 <div class="modal-body d-flex">
                 	<!-- 결재양식 선택목록 -->
                 	<div class="col-6">
                     	<div class="btn-group">
                                <button id="EForm" type="button" class="btn col-12 dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">--결재양식선택--</button>
                                <input type="hidden" name="fNo" value="" id="fNo">
                                <div id="EForms" class="dropdown-menu" x-placement="bottom-start" style="position: absolute; will-change: transform; top: 0px; left: 0px; transform: translate3d(8px, 38px, 0px);width:100%;height:150px;overflow-y: auto;">
                                	<c:forEach var="form" items="${eFList }">
                                		<a class="dropdown-item" href="#" data-value="${form.FNo }">${form.FName }</a>
                                	</c:forEach>
                                </div>
                            </div>
                        </div>
                        
                        <!-- 결재선 선택 -->
                        <div class="col-6">
	                     	<table class="col-12" style="border: 1px solid rgba(0,0,0,.125);">
									<tbody>
										<!-- 현재 로그인 유저 사번, 이름, 부서 -->
									<tr>
										<th colspan="2">신청</th>
									</tr>
									<tr>
										<td>
											<button type="button" class="btn col-12 text-left">${sessionScope.loginUser.deptTitle} - ${sessionScope.loginUser.empName}</button>
											<input type="hidden" name="drafterId" value="${sessionScope.loginUser.empNo}">
										</td>
									</tr>
									
									<!-- 결재자 선택목록, 사번, 이름, 부서 -->
									<tr>
										<th colspan="2">승인</th>
									</tr>
									<tr>
										<td colspan="2">
											<div class="btn-group" style="width:100%">
			                                    <button id="approverInfo" type="button" class="btn col-12 dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">결재자 선택</button>
			                                    <div id="approver" class="dropdown-menu" x-placement="bottom-start" style="position: absolute; will-change: transform; top: 0px; left: 0px; transform: translate3d(8px, 38px, 0px);width:100%;height:300px;overflow-y: auto;">
				                                    <c:forEach var="emp" items="${mList }">
				                                   		<a class="dropdown-item" href="#" data-value="${emp.empNo }">${emp.deptTitle } - ${emp.empName }</a>
				                                   	</c:forEach>
		                                        </div>
	                                  		</div>
	                                  		<input type="hidden" id="approverId" name="approverId" value="">
                                 		</td>
									</tr>
								</tbody>                          	
                         	</table>
                     	</div>
                     </div>
                     <div class="modal-footer">
                         <button type="button" class="btn btn-rounded btn-light" data-dismiss="modal">취소</button>
                         <button type="submit" class="btn btn-rounded btn-primary" id="submit">확인</button>
                     </div>
                 </div><!-- /.modal-content -->
            </form>
         </div><!-- /.modal-dialog -->
     </div>
     <script>
		$(function(){
			$("#EForms").children().click(function(){
				
				/* 양식 번호 */
				var fNo = $(this).attr('data-value');
				/* 양식 제목 */
				var titleText = $(this).text();
				
				$("#EForm").text(titleText);
				$("#fNo").val(fNo);
				
			})
			
			$("#approver").children().click(function(){
				
				var empInfo = $(this).text();
				var empNo = $(this).attr('data-value');
				
				$("#approverInfo").text(empInfo);
				$("#approverId").val(empNo);
				
			})
		})
	</script>
				
    <br><br>
    <h6 class="card-title">결재하기</h6>
    
    <c:set value="${sessionScope.loginUser.empNo}" var="empNo"/>
   	<div class="list-group"> 
		<a href="waitD.ap?empNo=${empNo }"class="list-group-item">결재 대기 문서</a><!-- 내가 결재, 진행중 -->
	</div>
	<br>
	
	<h6 class="card-title">개인 문서함</h6>
	<div class="list-group"> 
		<a href="draftD.ap?empNo=${empNo }" class="list-group-item">기안 문서함</a><!-- 내가 기안 -->
		<a href="apprD.ap?empNo=${empNo }" class="list-group-item">결재 문서함</a> <!-- 내가 결재 (완료, 반려) -->
	</div>
	<br>
	
	<h6 class="card-title">문서함</h6>
	<div class="list-group"> 
		<a href="eFormList.ap" class="list-group-item">전자결재 양식함</a><!-- 전자결재 양식 -->
	</div>
</body>
</html>