<html dir="ltr" lang="ko">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<head>
 <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="${ pageContext.servletContext.contextPath }/resources/assets/images/favicon.png">
    <title>GroupWare new Account</title>
    <!-- Custom CSS -->
    
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
 
    
    <link href="${ pageContext.servletContext.contextPath }/resources/assets/extra-libs/c3/c3.min.css" rel="stylesheet">
    <link href="${ pageContext.servletContext.contextPath }/resources/assets/libs/chartist/dist/chartist.min.css" rel="stylesheet">
    <link href="${ pageContext.servletContext.contextPath }/resources/assets/extra-libs/jvector/jquery-jvectormap-2.0.2.css" rel="stylesheet" />
    <!-- Custom CSS -->
    <link href="${ pageContext.servletContext.contextPath }/resources/dist/css/style.min.css" rel="stylesheet">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
</head>
<style>


.buttonArea{

}

.buttonArea> button{
	width:95px;
	height:45px;
	text-align:center;
	font-weight:bold;
}


.hidden{
	display:none !important;
}

</style>
<body>

	 <div class="preloader">
        <div class="lds-ripple">
            <div class="lds-pos"></div>
            <div class="lds-pos"></div>
        </div>
    </div>
    
    <div id="main-wrapper" data-theme="light" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full"
        data-sidebar-position="fixed" data-header-position="fixed" data-boxed-layout="full">
        <div class="page-wrapper">
            <div class="page-breadcrumb">
                <div class="row">
                    <div class="col-10">
                       
                        <div class="card">
                    <br>
                            <div class="d-block info" style="text-align:center; height:100%">
                            		
                            		<div class="card-body" style="text-align:center;">
                            		<h5 class="card-subtitle"> 계정 타입 선택 </h5>
                            		<br>
                            		<div class="buttonArea btn-list">
                            			<button class="btn waves-effect waves-light btn-danger employee" name="employee" value="employee"> 일반 </button><br>
                            			<button class="btn waves-effect waves-light btn-dark manager"  name="manager" value="manager" disabled="disabled"> 관리자  </button>
                            			<br>
                            			<br>
                            			<button class="btn waves-effect waves-light btn-dark manager"  name="manager" value="manager" onclick="location.href='${pageContext.servletContext.contextPath}'"> 취소</button>
                            		</div>
                            		
                            		</div>
                            </div>
                           
                          <div class="card memberForm hidden" style="padding:18px 25px 18px 25px;">
                          	<h4 class="card-title font-weight-bold">새로운 계정 생성</h4>
                          	
                          	<span class="card-subtitle memberType">--</span>
                          	
                          	<div class="card-body">
                            <form action="insertMember.me" method="POST" class="enroll memberForm" id="enroll" name="enroll">
                            	<ul class="ref navbar-nav">
                            		<%-- 
									<li>
										<div class="card-body">
											<h4 class="card-body"> 프로필 사진</h4>
											<img class="profile-image" src="${ pageContext.servletContext.contextPath }/resources/assets/images/users/profile-pic.jpg">
										</div>
									--%>
									<li class="form-group row">
										<div class="card-body">
											<h3 class="card-title"> 사번 </h3>
											<input type="text" class="form-control empNo" name="empNo" required>
											<button type="button" class="btn waves-effect waves-light btn-secondary validationCheck">사번 확인</button>
											<div class="valid-feedback valid-empNo-text"></div>
											<div class="invalid-feedback invalid-empNo-text"></div>
										</div>
									</li>
                            		<li>
                            			<div class="card-body">
											<h3 class="card-title"> 아이디 </h3>
											<input type="text" class="form-control loginId" name="loginId" oninput="idInputHandler(this)" required>
											<br>
											<h6 class="card-subtitle" style="color:rgba(0,0,0,.42); font-size:11px;">아이디는 영문, 숫자만 입력 가능합니다</h6>
											<div class="invalid-feedback invalid-loginId-text"></div>
										</div>
                            		</li>
                            		<li>
                            			<div class="card-body">
											<h3 class="card-title"> 비밀번호 </h3>
											<input type="password" class="form-control loginPwd" name="loginPwd" onChange="passWordLengthCheck();" required>
										</div>
                            		</li>
                            		<li>
                            			<div class="card-body">
											<h3 class="card-title"> 비밀번호 확인 </h3>
											<input type="password" class="form-control loginPwdCheck" name="loginPwdCheck" onChange="passWordCheck();" required>
											<div class="valid-feedback pwd-valid-text"></div>
											<div class="invalid-feedback pwd-invalid-text"></div>
										</div>
                            		</li>
                            		<li>
                            			<div class="btn-list">
                            				<button type="button" class="btn waves-effect waves-light btn-primary" onclick="doubleCheck();">생성</button>
                            				<button type="button" class="btn waves-effect waves-light btn-secondary" onclick="history.back();">취소</button>
                            			</div>
                            		</li>

                            		</ul>
                            </form>
                            </div>
                          </div>
                        </div>
                            
                            
                            <script>
							
                            var pwd = document.querySelector(".loginPwd");
                            
                            function doubleCheck(){
                            	 if(passWordCheck()){
                            		 if($(".valid-empNo-text").text() != ""){
                            			if(idDuplicationCheck()){
                            				document.querySelector(".invalid-loginId-text").innerHTML = '';
                            				window.alert('성공적으로 계정을 생성했습니다.')
                               			 document.querySelector(".enroll").submit();
                            			}else{
                            				window.alert('유효하지 않은 아이디 입니다. 다른 아이디를 입력해주십쇼.');
                            			}
                            		 
                            		 }else{
                            			 window.alert('유효하지 않은 사원번호 입니다.')
                            		 }
                            	 }else{
                            		 window.alert('입력된 정보가 옳바르지 않습니다.');
                            	 }
                            	
                            }
                            
                            
                            
                            function passWordLengthCheck(){
                            	if( (pwd.value.length < 4) || (pwd.value.length > 16)){
                            		window.alert("비밀번호는 최소 4자 이상  16자 이하여야 합니다.");
                            		pwd.innerHTML='';
                            	}
                            	
                            }
                            
                            function isPasswordMatch(){
                            	
                            	if(passWordCheck()){
                            		check.classList.add("is-valid");
                        			document.querySelector(".pwd-valid-text").innerHTML = '비밀번호가 일치합니다.';
                        			check.innerHTML='';
                            	} else{
                            		check.classList.add("is-invalid");
                        			document.querySelector(".pwd-invalid-text").innerHTML = '비밀번호가 일치하지 않습니다!';
                        			check.innerHTML='';
                            	}
                            	
                            }
                            
                            
                            function passWordCheck(){
                            	var password = pwd.value;
                            	var check = document.querySelector(".loginPwdCheck");
                            	var passwordCheck = check.value;
                           
                            		if ( password == passwordCheck){
                            			return true;
                            		} else {
                            			return false;
                            		}
                            }
                            
                            function idInputHandler(e){
                            	e.value = e.value.replace(/[^a-zA-Z0-9]/gi,'');
                            }
                            
                            	
                        	$(function(){
                        		$(".manager").click(function(){
                        			$(".memberType").text("관리자");
                        			var info = document.querySelector(".info");
                        			var memberForm = document.querySelector(".memberForm");
                        			
                        			info.classList.add("hidden");
                        			memberForm.classList.remove("hidden");
                        		});
                        	});
                            
                        	$(function(){
                        		$(".employee").click(function(){
                        			$(".memberType").text("일반");
                        			var info = document.querySelector(".info");
                        			var memberForm = document.querySelector(".memberForm");
                        			
                        			info.classList.add("hidden");
                        			memberForm.classList.remove("hidden");
                        		})
                        	})	
                        	
                        	
                        	
                        	
                        	
                        	$(function(){
                        		$(".validationCheck").click(function(){
                        			var empNo = document.querySelector(".empNo").value;
                        			$.ajax({
                                     	url:'checkMember.me',
                                     	type:'get',
                                     	data: {
                                     		empNo : empNo
                                     	},
                                     	datatype:'text',
                                     	success : function(data){
                                     		var result = data;
                                     		if ( result == "valid"){
	                                     		document.querySelector(".empNo").classList.add("is-valid");
	                                     		document.querySelector(".valid-empNo-text").innerHTML = '사원 번호가 정상적으로 확인되었습니다.';
	                                     		document.querySelector(".invalid-empNo-text").innerHTML = '';
                                     		}else{
                                     			document.querySelector(".empNo").classList.add("is-invalid");
                                     			document.querySelector(".valid-empNo-text").innerHTML = '';
                                     			document.querySelector(".invalid-empNo-text").innerHTML = '퇴사한 사원 또는 존재하지 않는 사원입니다.';
                                     		}
                                     	}
                                	 }); 
                        		})
                        	})
                        	
                        	function idDuplicationCheck(){
                        		var result;
                        		var loginId = document.querySelector(".loginId").value;
                        		$.ajax({
                        			url:'checkMemberId.me',	
                        			type:'get',
                        			data:{
                        				loginId : loginId
                        			},
                        			async:false,
                        			datatype:'text',
                        			success: function(data){
                        				if (data == 'invalid') {
                        					document.querySelector(".invalid-loginId-text").innerHTML = '유효하지 않은 아이디 입니다.';
                        					result = false;
                        				}else {
                        					result = true;
                        				}
                        			}
                        			
                        		});
                        		return result;
                        	}
                              		
                              		
                              		
                            
                        	
                            
                            </script>
                            
	
						<!-- 
							<script>
								var update = document.querySelector(".update");
								var info = document.querySelector(".info");
								
								var cancle = document.querySelector(".cancle");
								var updateBtn = document.querySelector(".updateInfo");
									
								var changeToUpdate =()=> {
									update.classList.remove("hidden");
									info.classList.add("hidden");
								}
								var changeToInfo =()=> {
									info.classList.remove("hidden");
									update.classList.add("hidden"); 								
								}
								
								cancle.addEventListener("click",changeToInfo);
								updateBtn.addEventListener("click",changeToUpdate);
							</script>                            
                      -->
                        </div>
                    </div>
                </div>
                </div>
            
            
            <div class="container-fluid">
            <footer class="footer text-center text-muted">
                All Rights Reserved by Adminmart. Designed and Developed by <a
                    href="https://wrappixel.com">WrapPixel</a>.
            </footer>
        </div>
         </div>
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
    <!--This page JavaScript -->
    <script src="${ pageContext.servletContext.contextPath }/resources/assets/extra-libs/c3/d3.min.js"></script>
    <script src="${ pageContext.servletContext.contextPath }/resources/assets/extra-libs/c3/c3.min.js"></script>
    <script src="${ pageContext.servletContext.contextPath }/resources/assets/libs/chartist/dist/chartist.min.js"></script>
    <script src="${ pageContext.servletContext.contextPath }/resources/assets/libs/chartist-plugin-tooltips/dist/chartist-plugin-tooltip.min.js"></script>
    <script src="${ pageContext.servletContext.contextPath }/resources/assets/extra-libs/jvector/jquery-jvectormap-2.0.2.min.js"></script>
    <script src="${ pageContext.servletContext.contextPath }/resources/assets/extra-libs/jvector/jquery-jvectormap-world-mill-en.js"></script>
    <script src="${ pageContext.servletContext.contextPath }/resources/dist/js/pages/dashboards/dashboard1.min.js"></script>


</body>
</html>