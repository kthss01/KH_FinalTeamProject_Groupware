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
							class="page-title text-truncate text-dark font-weight-medium mb-1">커뮤니티</h4>
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
							<select
								class="custom-select custom-select-set form-control bg-white border-0 custom-shadow custom-radius">
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
					<button class="btn btn-primary " onclick="">카테고리 신청하기</button>

					<div class="col-12">
						<div class="card">
							<div class="container" style="padding: 50px;">

								<div class="form-group">



									<label style="display: inline" class="mr-sm-2 font-weight-bold"">작성자</label>
									<span id="nickname">${ b.nickname }</span> <br>
									<br> <label style="display: inline"
										class="mr-sm-2  font-weight-bold" for="inlineFormCustomSelect">글
										제목</label> <span id="title">${ b.title }</span> <input
										id="updateTitle" style="display: inline-block; width: 600px;"
										type="text" class="form-control form-control-sm"
										value="${ b.title }"> <br>
									<br> <label id="dateLabel" style="display: inline"
										class="mr-sm-2  font-weight-bold"">작성날짜</label> <span
										id="enrollDate"> ${ b.CDate } </span> <span id="updateDate">
										<c:set var="today" value="<%=new java.util.Date()%>" /> <!-- 현재날짜 -->
										<c:set var="date">
											<fmt:formatDate value="${today}" pattern="yyyy-MM-dd" />
										</c:set> <c:out value="${date}" />
									</span>



								</div>
								<label style="display: inline" class="mr-sm-2  font-weight-bold"
									for="inlineFormCustomSelect">내용</label><br>
								<br>

								<div id="summernote" style="min-height: 200px;">
									${b.content }</div>
								<c:if test="${not empty at}">
									<div id="imgBox" style="margin-bottom: 50px;">
										<c:forEach items="${ at }" var="at">
											<img class="col-5" style="margin: auto;"
												src="${ pageContext.servletContext.contextPath }/resources/upload_files/${at.changeName}">

										</c:forEach>
									</div>

									<div id="imgUpdate" style="margin-top: 50px; display: none;">
										<h3>첨부파일 수정</h3>

										<c:forEach items="${ at }" var="at" varStatus="status">

											<div style="font-size: 12px;">
												<span class="current_file">기존 파일 ${status.count} <i
													class="icon-close"></i></span> <br />
												<p>${at.originName}</p>
											</div>
										</c:forEach>

										<button id="btn-upload" type="button"
											style="border: 1px solid #ddd; outline: none;">파일 추가</button>
										<input id="input_file" multiple="multiple" type="file"
											style="display: none;"> <span
											style="font-size: 10px; color: gray;">※첨부파일은 게시물 당 최대
											4개까지 등록이 가능합니다. 초과하실 경우 기존에 등록되어 있는 파일이 교체됩니다.</span>
										<div class="data_file_txt" id="data_file_txt"
											style="margin: 40px;">


											<span>추가 파일</span> <br />
											<div id="articlefileChange"></div>
										</div>
									</div>

								</c:if>

								<button id="updateFormBtn" class="btn btn-primary"
									onclick="edit()" type="button" style="margin-top: 50px;">수정</button>
								<button id="deleteBtn" class="btn btn-danger"
									style="margin-top: 50px;" onclick="deleteBoard()">삭제</button>
								<button id="updateBtn" class="btn btn-secondary"
									onclick="updateBoard()" style="margin-top: 50px;">수정완료</button>



								<div class="card-footer"
									style="margin-top: 50px; min-height: 500px; padding: 50px;">
									<h4>댓글 목록</h4>
									총 <span id="rcount"></span>개
									<div id="commentBox"></div>



									<hr>
									<h4 style="margin-bottom: 25px;">댓글 쓰기</h4>

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
		
		selectReplyList();
		
		$('#updateBtn').hide();
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

    
    

	
	var edit = function() {
		$('#updateFormBtn').hide();
		$('#deleteBtn').hide();
		$('#updateBtn').show();
		$('#enrollDate').hide();
		$('#updateDate').show();
		$('#title').hide();
		$('#title').hide();
		$('#title').hide();
		$('#updateTitle').show();
		$('#imgBox').hide();
		$('#imgUpdate').show();
		$('#dateLabel').text('수정날짜');
		
		
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
		
		var pwd = prompt("삭제는 작성 시 입력한 암호가 필요합니다.");
		
	}
	

	 /**
	  * 첨부파일로직
	  */

	  
	  
	 $(function () {
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
	       var reader = new FileReader();
	       reader.onload = function (e) {
	         content_files.push(f);
	         $('#articlefileChange').append(
	        		'<div id="file' + fileNum + '" onclick="fileDelete(\'file' + fileNum + '\')">'
	        		+ '<font style="font-size:12px">' + f.name + '</font>'  
	        		+ '<i style="font-size:10px;" class="icon-close"></i>' 
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
	     var no = fileNum.replace(/[^0-9]/g, "");
	     content_files[no].is_delete = true;
	 	$('#' + fileNum).remove();
	 	fileCount --;
	     console.log(content_files);
	 }			 
 		

	  
		 function updateBoard(){
			    var bno= ${b.bno};
			   	var content = $('#summernote').summernote('code');
			   	var title = $('#updateTitle').val();
			   	
			   	console.log("bno : " + bno);
			   	console.log("content : " + content);
			   	console.log("title : " + title);
				   	
  				 $.ajax({				 
				type: "POST",
		  	      url: 'updateBoard.co',
		      	  data : {
		      		  bno : bno,
		      		  content :  content,
		      		  title : title
		      	  },
		  	      success: function () {
		  	    	  alert('글 업데이트 ajax성공');
		 				  registerAction();
	
		  	      },
		  	      error: function (xhr, status, error) {
		  	    	alert("서버오류로 지연되고있습니다. 잠시 후 다시 시도해주시기 바랍니다.");
	
		  	      }
					 
				 });  
  				 
		 } 
  	 		function insertComment(){
  	 			
  	 			var formData = $("#replyForm").serialize();
  	 			
  	 			$.ajax({
  	 				type:'post',
  	 				url : 'insertReply.co',
  	 				data : formData,
  	 				dataType : 'json',
  	 				success : function (result){
						if(result > 0){
							alert("댓글이 성공적으로 등록되었습니다.");
							$("#replyContent").val("");
							selectReplyList();
							
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
  	 		
   	 		function selectReplyList(){
  	 			var bno = ${b.bno};
  	 			$.ajax({
  	 				url:"selectReplyList.co",
  	 				data:{bno : bno},
  	 				type:"post",
  	 				dataType : 'json',
  	 				success:function(list){
  	 					
  	 					console.log(list);
  	 					console.log(list.length);
  	 					
  	 					 	 					
  	 					$("#rcount").text(list.length);

  	 					list.forEach((r => {
  	 						console.log(r);
  	 						commentBox.append(`
  	 								<br>
  	 								<b>작성자 :  </b> \${r.name} 
  	 								<br>
  	 								
  	 								<textarea name="comment" class="comment form-control form-control-sm" style="resize:none"  maxlength="1000" disabled> \${r.comment}</textarea>
  	 								<input type="button" class ="btn reComment replyBtn" value="답글">
  	 										<input type="button" class="btn replyBtn" value="수정">
  	 										<input type="button" class="btn replyBtn" value="삭제" >
  	 										<input type="hidden" name="cNum" value=\${r.cno}>
  	 		
  	 								`)	
  	 							/* electNestedList(r.cno); */
  	 					}));
  	 					
  	 					
  	 					
  	 					
  	 					
  	 			   	 	$(".reComment").on("click",function(){
  	 			   	 				$(".replyBtn").hide();
  	 			   	 	/*  			var cno = $(this).next().next().next().val();*/
  	 			   	 	 				$(this).next().after(`
  	 			   	 							<div id="reCommentBox" style="margin-left:50px;">
  	 			   	 						<br>
  	 			   	 						<form method="post" > 
  	 			   	 						<input type="hidden" name="bno" value="">
  	 			   	 						<input type="hidden" name="cno" value="">  	 			   	 		
  	 												ㄴ<input type="hidden" name="bno" value="${b.bno }"> <label
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
  	 												style="resize: none; height: 50px; margin-top: 10px;"> </textarea>

  	 											<input class="btn btn-orange" type="button" id="insertReCommentBtn"
  	 												style="margin-top: 30px;" 
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
		   	 			$(".replyBtn").show();

		   	 	}
		    	 		


 	</script>
</body>

</html>