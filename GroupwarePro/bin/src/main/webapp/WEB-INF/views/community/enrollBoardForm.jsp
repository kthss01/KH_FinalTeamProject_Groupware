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


<link rel="stylesheet"
	href="${ pageContext.servletContext.contextPath }/resources/summernote/summernote-lite.css">

<style>
.filebox .upload-name {
	display: inline-block;
	height: 40px;
	padding: 0 10px;
	vertical-align: middle;
	border: 1px solid #dddddd;
	width: 78%;
	color: #999999; . filebox label { display : inline-block;
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
}
</style>



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
							class="page-title text-truncate text-dark mb-1  font-weight-bold">커뮤니티</h4>
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
							<div class="card-body">
								<h4 class="card-title font-weight-bold">글 작성</h4>


							</div>


							<div class="container" style="padding: 50px;">
<!-- 								<form name="dataForm" id="dataForm">
 -->
									<div class="form-group" style="position: relative">


										<label class="mr-sm-2  font-weight-bold" for="selectCategory">카테고리
											선택</label> <select class="custom-select mr-sm-2" id="selectCategory"
											name="cno"
											style="width: 150px; height: 33px; font-size: 13px;">
											<c:forEach items="${ categoryList }" var="c"  varStatus="i">												
			                                 	<c:choose>
												    <c:when test="${cno eq c.cno}">
			                                 			<option value="${c.cno}" selected>${c.cname}  </option>        	
												    </c:when>
												    <c:otherwise>
			                                 			<option value="${c.cno}">${c.cname} </option>        	
												    </c:otherwise>
												</c:choose>	                                 
			                                   </c:forEach>
											
											
											
											
										</select> <br> <label style="display: inline"
											class="mr-sm-2 font-weight-bold" for="inlineFormCustomSelect">작성자</label>
										<input id='nickname' name="nickname" type="text"
											class="form-control form-control-sm"
											style="display: inline-block; width: 200px;"
											placeholder="닉네임을 입력하세요"> <label
											style="display: block" class="mr-sm-2  font-weight-bold"
											for="inlineFormCustomSelect">글 제목</label> 
										<input id='title'
											name="title" type="text" class="form-control form-control-sm"
											style="margin-bottom: 10px;" placeholder="글 제목을 입력하세요">
										<label style="display: inline"
											class="mr-sm-2  font-weight-bold"
											for="inlineFormCustomSelect">작성날짜</label>

										<c:set var="today" value="<%=new java.util.Date()%>" />
										<!-- 현재날짜 -->
										<c:set var="date">
											<fmt:formatDate value="${today}" pattern="yyyy-MM-dd" />
										</c:set>

										<input name="CDate" type="date" class="form-control"
											value="${date}" readonly> <label
											style="display: inline" class="mr-sm-2  font-weight-bold"
											for="inlineFormCustomSelect">내용</label>

										<textarea id="summernote" name="content"></textarea>

										<div class="filebox mr-sm-2" style="margin-top: 15px; padding-bottom:30px;">
											<!-- 										<label style="display: inline;"
												class="mr-sm-2  font-weight-bold" for="uploadFile">첨부파일</label>
											<br> <input
												class="upload-name mr-sm-2 form-control form-control-sm"
												style="max-width: 400px;" placeholder="선택된 파일 없음"> <label
												for="file">찾기</label> <input style="display: none;"
												type="file" id="file" name="uploadFile">
												 -->

											<h2>파일업로드</h2>
											<button id="btn-upload" type="button"
												style="border: 1px solid #ddd; outline: none;">파일
												추가</button>
											<input id="input_file" multiple="multiple" type="file"
												style="display: none;"> <span
												style="font-size: 10px; color: gray;">※첨부파일은 최대 4개까지
												등록이 가능합니다.</span>
											<div class="data_file_txt" id="data_file_txt"
												style="margin: 40px;">
												<span>첨부 파일</span> <br />
												<div id="articlefileChange"></div>
											</div>

											<input  style="position: absolute; right: 0;" type="button" onclick ="insertBoard()"
												class="btn btn-warning" value="글 등록">
										</div>
							
										
									</div>
<!-- 								</form>
 -->							</div>
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
		$(function() {
			//여기 아래 부분
			$('#summernote').summernote(
					{
						height : 500, // 에디터 높이
						minHeight : null, // 최소 높이
						maxHeight : null, // 최대 높이
						focus : true, // 에디터 로딩후 포커스를 맞출지 여부
						lang : "ko-KR", // 한글 설정
						placeholder : '최대 4000자까지 쓸 수 있습니다.', //placeholder 설정
						toolbar : [
								// [groupName, [list of button]]
								[
										'style',
										[ 'bold', 'italic', 'underline',
												'clear' ] ],
								[
										'font',
										[ 'strikethrough', 'superscript',
												'subscript' ] ],
								[ 'fontsize', [ 'fontsize' ] ],
								[ 'color', [ 'color' ] ],
								[ 'para', [ 'ul', 'ol', 'paragraph' ] ],
								[ 'height', [ 'height' ] ] ]

					});

			
	 		// input file 파일 첨부시 fileCheck 함수 실행
	
		$("#input_file").on("change", fileCheck);

		});

		
		
		$("#file").on('change', function() {
			var fileName = $("#file").val();
			$(".upload-name").val(fileName);
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
		 var totalCount = 10;
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
		        		+ '<img src="/img/icon_minus.png" style="width:20px; height:auto; vertical-align: middle; cursor: pointer;"/>' 
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

		 /*
		  * 폼 submit 로직
		  */

		  function insertBoard(){
 	 		    var cno= $('#selectCategory option:selected').val();
 	 		   	var nickname = $('#nickname').val();
			   	var content = $('#summernote').val();
			   	var title = $('#title').val();
			   	
			   	
			 $.ajax({				 
				  type: "POST",
	    	      url: 'insertBoard.co',
	        	  data : {
	        		  cno : cno,
	        		  nickname : nickname,
	        		  content :  content,
	        		  title : title
	        	  },
	    	      success: function (data) {
	    	    	  alert('게시글이 등록되었습니다.');
       				  registerAction();

	    	      },
	    	      error: function (xhr, status, error) {
	    	    	alert("서버오류로 지연되고있습니다. 잠시 후 다시 시도해주시기 바랍니다.");

	    	      }
				 
			 });
		 }
		  
		 	function registerAction(){
 	 	    var cno= $('#selectCategory option:selected').val();
 		 	
		 	var form = $("form")[0];        
		  	var formData = new FormData(form);
		 		for (var x = 0; x < content_files.length; x++) {
		 			// 삭제 안한것만 담아 준다. 
		 			if(!content_files[x].is_delete){
		 				 formData.append("article_file", content_files[x]);
		 			}
		 		}
		    /*
		    * 파일업로드 multiple ajax처리
		    */    
		   	$.ajax({		 	
		    	      type: "POST",
		    	   	  enctype: "multipart/form-data",
		    	      url: 'insertAttachment.co',
		        	  data : formData,
		        	  processData: false,
		    	      contentType: false,
		    	      success: function () {
		    				location.href='boardList.co?cno='+cno;
		    	      },
		    	      error: function (xhr, status, error) {
		    	    	alert("서버오류로 지연되고있습니다. 잠시 후 다시 시도해주시기 바랍니다.");

		    	      }
		    	    });
		 	}
		 
		 </script>


</body>

</html>