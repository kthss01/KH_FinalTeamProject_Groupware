<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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

<style>

#commentBox{
	margin-bottom:50px;
}

.replyBtn1{
	position:absolute;
	right:60px;
}
.replyBtn2{
	position:absolute;
	right:0;
}

.icon-close:hover{
	cursor:pointer;
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
	<div id="main-wrapper" data-theme="light" data-layout="vertical"
		data-navbarbg="skin6" data-sidebartype="full"
		data-sidebar-position="fixed" data-header-position="fixed"
		data-boxed-layout="full">
		<!-- ============================================================== -->
		<!-- Topbar header - style you can find in pages.scss -->
		<jsp:include page="../common/header.jsp" />

		<!-- ============================================================== -->
		<!-- End Topbar header -->
		<!-- ============================================================== -->
		<!-- ============================================================== -->
		<!-- Left Sidebar - style you can find in sidebar.scss  -->
		<jsp:include page="../common/sidebar.jsp" />

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
						<h4
							class="page-title text-truncate text-dark font-weight-bold mb-1">커뮤니티</h4>
						<div class="d-flex align-items-center">
							<nav aria-label="breadcrumb">
								<ol class="breadcrumb m-0 p-0">
									<li class="breadcrumb-item"><a href="index.html"
										class="text-muted">Home</a></li>
									<li class="breadcrumb-item text-muted active"
										aria-current="page">Community</li>
								</ol>
							</nav>
						</div>
					</div>
					  <div class="col-5 align-self-center">
                        <div class="customize-input float-right">
                            <button class="btn btn-primary btn-sm" type="button" style="width:220px;" 
                            		data-toggle="modal" data-target="#multiple-one">카테고리 신청하기
                            </button>

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
						<div class="card">
							<div class="container" style="padding: 50px;">


								<div class="form-group">

									<label style="display: inline-block; width:130px;" class="mr-sm-2 font-weight-bold">
												<i class="fas fa-user"></i>  &nbsp&nbsp작성자</label>
									<span id="nickname" style="font-size:18px;">${ b.nickname }</span>
									<input id="writer" name="writer" type="hidden" value='${ b.writer }'>
									<br> 
									<label style="display: inline-block; width:130px;" 
										class="mr-sm-2  font-weight-bold" for="inlineFormCustomSelect">
										<i class="far fa-caret-square-right"></i>  &nbsp&nbsp글 제목</label> 
									<span id="title" style="font-size:18px;">${ b.title }</span> 
									<input id="updateTitle" style="display: inline-block; width: 600px;" type="text" class="form-control form-control-sm"
													value="${ b.title }"> 
									<br> 
									<label id="dateLabel" style="display: inline-block; width:130px;" class="mr-sm-2  font-weight-bold">
											<i class="far fa-calendar-alt"></i>  &nbsp&nbsp작성날짜</label> 
									<span style="font-size:18px;" id="enrollDate"> ${ b.CDate } </span>
								    <span id="updateDate">
										<c:set var="today" value="<%=new java.util.Date()%>" /> <!-- 현재날짜 -->
										<c:set var="date">
											<fmt:formatDate value="${today}" pattern="yyyy-MM-dd" />
										</c:set> <c:out value="${date}" />
									</span>

								<br>
								<label style="display: inline-block; width:130px;"  class="mr-sm-2  font-weight-bold"
									for="inlineFormCustomSelect"><i class="fas fa-align-left"></i> &nbsp&nbsp내용</label>
								<hr>

								<div id="summernote" style="min-height: 200px; padding-left:40px;">
									${b.content }</div>
									<div id="imgBox" style="margin-bottom: 50px;">
										<c:forEach items="${ at }" var="at">
											<img class="col-5" style="margin: auto;"
												src="${ pageContext.servletContext.contextPath }/resources/upload_files/${at.changeName}">

										</c:forEach>
									</div>

								
									<div id="imgUpdate" style="margin-top: 50px; ">
										<h4>첨부파일 수정</h4>

			<%-- 							<c:forEach items="${ at }" var="at" varStatus="status">

											<div style="font-size: 12px;">
												<span class="current_file">기존 파일 ${status.count} <i
													class="icon-close"></i></span> <br />
												<p>${at.originName}</p>
											</div>
										</c:forEach> --%>

										<button id="btn-upload" type="button" class="btn btn-sm"
											style="border: 1px solid #ddd; outline: none;"><i class="fas fa-link"></i> 파일 추가</button>
										<input id="input_file" multiple="multiple" type="file"
											style="display: none;"> <span
											style="font-size: 10px; color: gray;">※첨부파일은 게시물 당 최대
											4개까지 등록이 가능합니다. 초과하실 경우 기존에 등록되어 있는 파일이 교체됩니다.</span>
										<div class="data_file_txt" id="data_file_txt"
											style="margin: 40px;">


											<span>파일 목록</span> <br />
											<div id="articlefileChange"></div>
										</div>
									</div>
								
								<c:if test="${ loginUser.empNo eq b.writer or loginUser.empNo eq 200}">
								<div id="btnArea" style="height:80px;"class="col-12">
									<button id="updateFormBtn" class="btn btn-primary" onclick="edit()" type="button" style="margin-top: 50px; position:absolute; right:80px;"><i class="fas fa-edit"></i> 수정</button>
									<button id="deleteBtn" class="btn btn-danger" onclick="deleteBoard()" style="margin-top: 50px; position:absolute; right:0" >삭제</button>
									<button id="updateBtn" class="btn btn-secondary" onclick="updateBoard()" style="margin-top: 50px; position:absolute; right:80px;"><i class="fas fa-edit"></i> 수정완료</button>
									<button id="updateCancelBtn" class="btn btn-secondary" onclick="updateCancel()" style="margin-top: 50px; position:absolute; right:0">취소</button>
								</div>
								</c:if>

								<div class="card-footer"
									style="margin-top: 50px; min-height: 500px; padding: 50px;">
									<h4 class='font-weight-bold'>댓글 목록</h4>
									총 <span id="rcount"></span>개
									<div id="commentBox" style="position:relative"></div>



									<hr>
									<h4 style="margin-bottom: 25px;" class='font-weight-bold'>댓글 쓰기</h4>

									<form id="replyForm" method="post">
										<input type="hidden" name="bno" value="${b.bno }"> <label
											style="display: inline" class="mr-sm-2  font-weight-bold">닉네임</label>
										<input id="replyNickname" name="name" type="text"
											class="form-control form-control-sm"
											style="display: inline-block; width: 200px;" name="nickname">

										<label style="display: inline"
											class="mr-sm-2  font-weight-bold">비밀번호</label> <input
											id="replyPwd" name="pwd" type="password"
											class="form-control form-control-sm"
											style="display: inline-block; width: 200px;" name="cPwd"
											maxLength="6">

										<textarea id="comment" name="comment"
											class="comment form-control form-control-sm" maxlength="1000"
											style="resize: none; height: 100px; margin-top: 10px;"> </textarea>

										<input class="btn btn-orange" type="button" id="commentBtn"
											style="margin-top: 30px;" onclick="insertComment();"
											value="등록">
									</form>


								</div>
							</div>
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

                               <form class="pl-3 pr-3" action="#">

                                   <div class="form-group">
                                       <label for="cname"  class="font-weight-bold">카테고리 주제</label>
                                       <input class="form-control" type="text" id="cname" name="cname" placeholder="OOO게시판">
                                   </div>

                                   <div class="form-group">
                                       <label for="description" class="font-weight-bold">주제 부가설명</label>
                                       <input class="form-control" style="height:120px;" type="text" id="description" name="description" placeholder="간단하게  작성해주세요.">
                                   </div>

                                   <div class="form-group">
                                       <div class="custom-control custom-checkbox">
                                           <input type="checkbox" class="custom-control-input" id="customCheck1">
                                           <label class="custom-control-label" for="customCheck1"> 주의사항을 검토하였습니다.</label>
                                       </div>
                                   </div>
                                   <div class="form-group text-center">
                                       <button class="btn btn-primary" type="submit">신청서 제출하기 </button>
                                   </div>

                               </form>

                           </div>

                       </div>
                   </div>
               </div>
	<!-- All Jquery -->
	<!-- ============================================================== -->

	<script
		src="${ pageContext.servletContext.contextPath }/resources/assets/libs/jquery/dist/jquery.min.js"></script>
	<!-- Bootstrap tether Core JavaScript -->
	<script
		src="${ pageContext.servletContext.contextPath }/resources/assets/libs/popper.js/dist/umd/popper.min.js"></script>
	<script
		src="${ pageContext.servletContext.contextPath }/resources/assets/libs/bootstrap/dist/js/bootstrap.min.js"></script>
	<!-- apps -->
	<!-- apps -->
	<script
		src="${ pageContext.servletContext.contextPath }/resources/dist/js/app-style-switcher.js"></script>
	<script
		src="${ pageContext.servletContext.contextPath }/resources/dist/js/feather.min.js"></script>
	<!-- slimscrollbar scrollbar JavaScript -->
	<script
		src="${ pageContext.servletContext.contextPath }/resources/assets/libs/perfect-scrollbar/dist/perfect-scrollbar.jquery.min.js"></script>
	<script
		src="${ pageContext.servletContext.contextPath }/resources/assets/extra-libs/sparkline/sparkline.js"></script>
	<!--Wave Effects -->
	<!-- themejs -->
	<!--Menu sidebar -->
	<script
		src="${ pageContext.servletContext.contextPath }/resources/dist/js/sidebarmenu.js"></script>
	<!--Custom JavaScript -->
	<script
		src="${ pageContext.servletContext.contextPath }/resources/dist/js/custom.min.js"></script>
	<!--  -->
	<script
		src="${ pageContext.servletContext.contextPath }/resources/summernote/summernote-lite.js"></script>
	<script
		src="${ pageContext.servletContext.contextPath }/resources/summernote/lang/summernote-ko-KR.js"></script>

	<script>
    
    
	$(function(){
		

		selectReplyList(${b.bno});
		
		$('#updateBtn').hide();
		$('#updateCancelBtn').hide();
		$('#updateDate').hide();
		$('#updateTitle').hide();
		$('#imgUpdate').hide();

		// input file 파일 첨부시 fileCheck 함수 실행
	
	$("#input_file").on("change", fileCheck);

	});

	
	$("#file").on('change', function() {
		var fileName = $("#file").val();
		$(".upload-name").val(fileName);
	});

    
    var updateCancel = function(){
    	
    	$('#summernote').summernote('destroy');
 		$('.card-footer').show();
		$('#updateCancelBtn').hide();
		$('#updateBtn').hide();
		$('#deleteBtn').show();
		$('#updateFormBtn').show();
		$('#imgUpdate').hide();
		$('#dateLabel').text('작성날짜');
		$('#updateTitle').hide();
		$('#title').show();

    }

	
	var edit = function() {
		$('#updateFormBtn').hide();
		$('#deleteBtn').hide();
		$('#updateBtn').show();
		$('#updateCancelBtn').show();
		$('#enrollDate').hide();
		$('#updateDate').show();
		$('#title').hide();
		$('#updateTitle').show();
		$('#imgBox').hide();
		$('#imgUpdate').show();
		$('#dateLabel').text('수정날짜');
		$('.card-footer').hide();
		
		  $('#summernote').summernote({
			  height : 500,		  
			  focus: true,
			  toolbar: [
				    // [groupName, [list of button]]
				    ['style', ['bold', 'italic', 'underline', 'clear']],
				    ['font', ['strikethrough', 'superscript', 'subscript']],
				    ['fontsize', ['fontsize']],
				    ['color', ['color']],
				    ['para', ['ul', 'ol', 'paragraph']],
				    ['height', ['height']]
			  ]
				
			  });
		};
		
	var deleteBoard = function(){
		 var bno = ${b.bno};

		$.ajax({
			
			url:'delete.co',
			type:'post',
			data: {bno : bno},
			success:function(result){
				if(result > 0){
					alert("글이 삭제되었습니다.");
					location.href="boardList.co?cno=" + ${b.cno};
				}
			}
			
			
		})
		
	}
	
	 /* 첨부파일 로직 */

	 $(function () {
		 
		 var bno = ${b.bno};
		 
		 //현재 게시글의 파일정보 가져오기
		 
		 $.ajax({
			
			 url:'selectAttachmentList.co',
			 dataType:'json',
			 type:'post',
			 data:{bno :  bno},
			 success:function(list){
				 
				 list.forEach((f=>{
			         $('#imgBox').append(`
			        		 <img class="col-5" style="margin: auto;"
									src="${ pageContext.servletContext.contextPath }/resources/upload_files/\${f.changeName}">

				 		`);

			         origin_files.push(f.originName);
			         $('#articlefileChange').append(
			         		'<div id="file' + fileNum + '">'
			        		+ '<span style="font-size:12px">' + f.originName + '</span>'  
			        		+ '<i style="font-size:10px;" class="icon-close"onclick="originfileDelete(\'file' + fileNum + '\')"'+'></i>' 
			        		+ '<div/>'
			 		);
			         
			         fileNum ++;
			         
			         
				 }));
				 
			 }
		 }) 
		 

	     $('#btn-upload').click(function (e) {
	         e.preventDefault();
	         $('#input_file').click();
	     });
	 });

	 // 파일 현재 필드 숫자 totalCount랑 비교값
	 var fileCount = 0;
	 // 해당 숫자를 수정하여 전체 업로드 갯수를 정한다.
	 var totalCount = 4;
	 // 파일 고유넘버
	 var fileNum = 0;
	 // 첨부파일 배열
	 var content_files = new Array();
	 var origin_files = new Array();


	 function fileCheck(e) {
	     var files = e.target.files;
	     
	     // 파일 배열 담기
	     var filesArr = Array.prototype.slice.call(files);
	     
	     // 파일 개수 확인 및 제한
	     if (fileCount + filesArr.length > totalCount) {
	       $.alert('파일은 최대 '+totalCount+'개까지 업로드 할 수 있습니다.');
	       return;
	     } else {
	     	 fileCount = fileCount + filesArr.length;
	     }
	     
	     // 각각의 파일 배열담기 및 기타
	     filesArr.forEach(function (f) {
	    	 console.log(f);
	       var reader = new FileReader();
	       reader.onload = function (e) {
	         content_files.push(f);
	         $('#articlefileChange').append(
		         		'<div id="file' + fileNum + '">'
		        		+ '<span style="font-size:12px">' + f.name + '</span>'  
		        		+ '<i style="font-size:10px;" class="icon-close"onclick="fileDelete(\'file' + fileNum + '\')"'+'></i>' 
		        		+ '<div/>'
		 		);
	         fileNum ++;
	       };
	       reader.readAsDataURL(f);
	     });
	     console.log(content_files);
	     //초기화 한다.
	     $("#input_file").val("");
	   }

	 // 파일 부분 삭제 함수
	 function fileDelete(fileNum){
		 console.log(fileNum);
	     var no = fileNum.replace(/[^0-9]/g, "");
	     content_files[no].is_delete = true;
	     origin_files[no].is_delete = true;
	 	$('#' + fileNum).remove();
	 	fileCount --;
	     console.log(content_files);
	     
	 }
	 //기존 파일 부분 삭제 함수
	 function originfileDelete(fileNum){
	     console.log(origin_files);
		 console.log(fileNum);
	     var no = fileNum.replace(/[^0-9]/g, "");
 		origin_files.splice(origin_files.indexOf(origin_files[fileNum]),1);
 	 	$('#' + fileNum).remove();
	 	fileCount --;
	     console.log(origin_files);
	     
	 }			 

	 
		 function updateBoard(){
			
			  	var formData = new FormData();
			  	var bno = ${b.bno};
		 		for (var x = 0; x < content_files.length; x++) {
		 			// 삭제 안한것만 담아 준다. 
		 			if(!content_files[x].is_delete){
		 				 formData.append("article_file", content_files[x]);
		 			}
		 		}

	 			console.log(origin_files);

		 		formData.append("bno", bno);
		 		formData.append("content", $('#summernote').summernote('code'));
		 		formData.append("title", $('#updateTitle').val());

  				 $.ajax({		
  					 
						type: "POST",
			  	     	url: 'originFileCheck.co',
			  	     	async:false,
			      	  	data : {origin_files : origin_files, 
			      	  			bno : bno},
			  	      	success: function (data) {
			  	      		

			   				 $.ajax({		
									type: "POST",
						  	     	url: 'updateBoard.co',
					    	   	  	enctype: "multipart/form-data",
						      	  	data : formData,
						  	     	async:false,
					        	  	processData: false,
					    	      	contentType: false,
						  	      	success: function (data) {
										location.href="detail.co?bno=" + bno;
						  	      },
						  	      error: function (xhr, status, error) {
						  	    	alert("서버오류로 지연되고있습니다. 잠시 후 다시 시도해주시기 바랍니다.");
					
						  	      }
									 
								 });  

			  	      		
			  	      },
			  	      error: function (xhr, status, error) {
			  	    	alert("서버오류로 지연되고있습니다. 잠시 후 다시 시도해주시기 바랍니다.");
		
			  	      }
						 
					 }); 

			   	
  
  				 
		 } 
		 
		 
		    var bTitle= '${b.title}';
		    var bno = ${b.bno};
			var wirter= '${b.writer}';
		 
		 
  	 		function insertComment(){
	
  	 			var formData = $("#replyForm").serialize();  	 			
  	 			
  	 			$.ajax({
  	 				type:'post',
  	 				url : 'insertReply.co',
  	 				data : formData,
  	 				ansyc :false,
  	 				dataType : 'json',
  	 				success : function (result){
						if(result > 0){
						$("#replyNickname  ").val("");
						$("#replyPwd").val("");
						$("#comment").val("");
        				selectReplyList(${b.bno});

        				if(${loginUser.loginId} != writer){
             				socket.send("reply," + bTitle +"," + bno + "," + wirter);
        				}
        				
 
						}else{
							alert("댓글등록실패");
						}
  	 					
  	 				},
  	 				error:function(request, status, error){
  	 					console.log("request"+request);
  	 					console.log("status"+status);
  	 					console.log("error"+error);
  	 				}
  	 			})
  	 			

  	 		}
  	 		
  	 		function insertReComment(){
  	 			
  	 			var formData = $("#reCommentForm").serialize();
  	 			console.log("==" + formData);
  	 			$.ajax({
  	 				type:'post',
  	 				url : 'insertReply.co',
  	 				data : formData,
  	 				success : function (result){
						if(result > 0){
							alert("답글이 성공적으로 등록되었습니다.");
							$("#reCommentBox").hide();							
							
							selectReplyList(${b.bno});
							
						}else{
							alert("댓글등록실패");
						}
  	 					
  	 				},
  	 				error:function(request, status, error){
  	 					console.log("request"+request);
  	 					console.log("status"+status);
  	 					console.log("error"+error);
  	 				}
  	 			})	
  	 		}
  	 		
  	 		
  	 		const commentBox = $('#commentBox');
  	 		
   	 		function selectReplyList(bno){
  	 			$.ajax({
  	 				url:"selectReplyList.co",
  	 				data:{bno : bno},
  	 				type:"post",
  	 				dataType : 'json',
  	 				success:function(list){		 	 					
  	 					$("#rcount").text(list.length);
	 						commentBox.empty();

  	 					list.forEach((r => {
  	 						
  	 						commentBox.append(`
  	 								<br>
  	 								<b class='font-weight-bold'>\${r.name}</b>님의 한마디 
  	 								<br>
  	 								
  	 								<textarea name="comment" class="comment form-control form-control-sm" style="resize:none;"  maxlength="1000" disabled> \${r.comment}</textarea>
  	 								<input type="button" class ="btn reComment replyBtn1" style="font-size:15px;" value="답글">
  	 								
  	 										<input type="button" class="btn replyBtn2 " onclick="deleteReply('\${r.cno}' , '\${r.pwd}');" style="font-size:15px;" value="삭제" >
  	 										<input type="hidden" name="cno" value=\${r.cno}>
  	 										<input type="hidden" name="pwd" value=\${r.pwd}>
  	 		
  	 								`)	
  	 								
  	 							
  	 							 selectReComentList(r.cno, bno); 

  	 					}));

  	 			   	 	$(".reComment").on("click",function(){
  	 			   	 				$(".replyBtn1").hide();
  	 			   	 				$(".replyBtn2").hide();
  	 			   	 				var pno = $(this).next().next().val();
   	  			   	 	 				$(this).next().after(`
  	 			   	 							<div id="reCommentBox" style="margin-left:50px;">
  	 			   	 						<br>
  	 			   	 						<form method="post" id="reCommentForm"> 
  	 			   	 						<input type="hidden" id='pno' name="pno" value=\${pno}>
  	 												ㄴ<input type="hidden" name="bno" value="${b.bno }"> <label
  	 												style="display: inline" class="mr-sm-2  font-weight-bold">닉네임</label>
  	 											<input id="replyNickname" name="name" type="text"
  	 												class="form-control form-control-sm"
  	 												style="display: inline-block; width: 200px;" name="nickname">

  	 											<label style="display: inline"
  	 												class="mr-sm-2  font-weight-bold">비밀번호</label> <input
  	 												id="replyPwd" name="pwd" type="password"
  	 												class="form-control form-control-sm"
  	 												style="display: inline-block; width: 200px;" name="pwd"
  	 												maxLength="6">

  	 											<textarea id="comment" name="comment"
  	 												class="comment form-control form-control-sm" maxlength="1000"
  	 												style="resize: none; height: 50px; margin-top: 10px;"> </textarea>

  	 											<input class="btn btn-orange" type="button" id="insertReCommentBtn"
  	 												style="margin-top: 30px;" onclick="insertReComment()"
  	 												value="답글 등록">
  	 											<input class="btn btn-primary" type="button"
  	 												style="margin-top: 30px;" 
  	 												value="취소" onclick="deleteReCommnetBox()">
  	 			   	 						</form>
  	 			   	 						</div>
  	 			   	 						`)   
  	 			   	 	   	 	})

			
  	 					
  	 				},
  	 				error : function(){
  	 					console.log("댓글 리스트조회용 ajax 통신 실패");
  	 				}
  	 			});
  	 			
  	 		} 
   	 		
				var	deleteReCommnetBox =  function(){
		   	 			$("#reCommentBox").hide();
		   	 			$(".replyBtn1").show();
		   	 			$(".replyBtn2").show();

		   	 	}
				

				 function selectReComentList(pno,bno){
	 
						$.ajax({
							
							url : 'selectReComentList.co',
							type : 'post',
							async:false,
							data : {
								pno : pno,
								bno : bno
							},
							success :  function(list){
							
								list.forEach((r => {
									
									commentBox.append(`
											<div class='reCommentBox' style="padding-left:40px;">
		  	 								<br>
		  	 								<b class='font-weight-bold'>ㄴ\${r.name}</b>님의 한마디  
		  	 								<br>
		  	 								
		  	 								<textarea name="comment" class="comment form-control form-control-sm" style="resize:none;"  maxlength="1000" disabled> \${r.comment}</textarea>
		  	 										<input type="button" class="btn replyBtn2" onclick="deleteReply('\${r.cno}' , '\${r.pwd}');"  style="font-size:15px;"  value="삭제" >
		  	 										<input type="hidden" name="cno" value=\${r.cno}>
		  	 										<input type="hidden" name="pwd" value=\${r.pwd}>
											</div>
		  	 								`)	
								}));
						
							},
							error : function(e){
								console.log("통신실패")
							}
							
						})
							
				 }
			
				function deleteReply(cno, pwd){
					
					console.log("삭제비번 :" + pwd);
							
					 var checkPwd = prompt("댓글 암호를 입력하세요");
					 console.log("입력 비번 :" + checkPwd);
					 if(checkPwd == pwd){
						$.ajax({
							url:'deleteReply.co',
							type:'post',
							data:{
								cno : cno,
								pwd : pwd
							},
							success : function (result,result2){
								if(result > 0){
									alert("삭제되었습니다.");
									location.reload();
									
								}else{
									alert("댓글 삭제 실패");
								}
		  	 					
		  	 				},
		  	 				error:function(request, status, error){
		  	 					console.log("request"+request);
		  	 					console.log("status"+status);
		  	 					console.log("error"+error);
		  	 				}
							
						})						
					}else if(checkPwd != null){
						alert("암호가 다릅니다.");
					}

				}

 	</script>
</body>

</html>