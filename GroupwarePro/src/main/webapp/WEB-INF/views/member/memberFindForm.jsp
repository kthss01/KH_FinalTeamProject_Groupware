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
                            <div class="d-block mainWrapper" style="text-align:center; height:100%">
                            		
                            		
                            		<div class="card-body idSearchWrapper" style="text-align:center;">
                            				<br>
                            				<h3 class="card-title font-weight-bold">분실 계정 찾기</h3>
                            				<hr>
                            				<br>
                            				<input type="text" placeholder="사번" class="empNo" name="empNo">
                            				<div class="valid-feedback valid-empNo-text"></div>
											<div class="invalid-feedback invalid-empNo-text"></div>
										
                            				<br>
                            				<div class="btn-list">
                            					<br>
                            					<button type="button" class="btn waves-effect waves-light btn-success empCheck" id="empCheck">아이디 찾기</button><br>
                            					<br>
                            					<button type="button" class="btn waves-effect waves-light btn-secondary searchPwd" id="searchPwd">비밀번호 찾기</button>
                            					<h6><a class="searchPwd" id="searchPwd" style="cursor:pointer;">비밀번호를 잊으셨나요?</a></h6>
                            				</div>
                            		</div>
                            			
                            			<!-- 계정 찾기 결과 영역  -->
                            			<div class="card-body resultForm hidden">
                            			
                            			<h3 class="card-title">아이디:</h3>
                            			<br>
                            			<span class="font-weight-bold resultId"></span>
                            			<br>
                            				<div class="btn-list">
                            				<button type="button" class="btn waves-effect waves-light btn-primary" style="margin: 5px 15px 5px 15px;" onclick="location.href='${ pageContext.servletContext.contextPath }'">로그인  화면</button>
                            				<br>
                            				<br>
                            				<button type="button" class="btn waves-effect waves-light btn-secondary searchPwd" id="searchPwd">비밀번호 찾기</button>
                            				</div>
                            			</div>
                            			<!-- 계정 찾기 결과 영역 끝 -->
                            			<!-- 비밀번호 찾기 결과 영역  -->
                            			<div class="card-body memberCheckWrapper hidden">
                            			<form class="pwdSet" style="">
                            				<div class="form-group col-md-15" style="text-align:center;">
                            				<input type="text" placeholder="사번" class="empNo2" name="empNo2">
                            				<div class="valid-feedback valid-empNo-text"></div>
											<div class="invalid-feedback invalid-empNo-text"></div>
                            				</div>

											<div class="form-group col-md-15">
                            				<input type="text" placeholder="아이디" class="loginId" name="loginId">
                            				</div>
                            				<button type="button" class="btn waves-effect waves-light btn-primary setNewPwd" style="margin: 5px 15px 5px 15px;"> 확인</button>
                            				<button type="button" class="btn waves-effect waves-light btn-light canclePwd"> 뒤로 </button>
                            			</form>
                            			</div>
                            			<!-- 비밀번호 찾기 결과 영역 끝 -->
                            			<!-- 새로운 비밀번호 설정 영역  -->
                            			<div class="card-body newPwdSetWrapper hidden">
                            			<form class="setNewPassword" action="updatePassword.me">
        									
        									<h4 class="card-title font-weight-bold">새로운 비밀번호 설정</h4>                    				
		                            				
                            				<div class="form-group col-md-15">
                            				<input type="text" class="updateEmpNo" name="updateEmpNo" readonly style="display:none;">
                            				<input type="password" placeholder="새로운 비밀번호" class="newPwd" name="newPwd">
                            				</div>

											<div class="form-group col-md-15">
                            				<input type="password" placeholder="새로운 비밀번호 확인" class="newPwdCheck" name="newPwdCheck">
                            				</div>
                            				<button type="button" class="btn waves-effect waves-light btn-primary" style="margin: 5px 15px 5px 15px;" onclick="doubleCheckPwd();">비밀번호 변경</button>
                            			</form>
                            			</div>
                            			<!-- 새로운 비밀번호 설정 영역  끝-->
                            			<br>
                            			<br>
                            			 <a class="font-weight-bold align-self-center" href="${pageContext.servletContext.contextPath}" style="cursor:pointer;">로그인 화면으로</a>
                            			<pre style="color:rgba(0,0,0,0.58); padding:20px 10px 20px 10px; border:1px solid rgba(0,0,0,.48);">
<b class="font-weight-bold">이용자 계정 정보 분실 및 복원에 대한 안내사항</b>
                      
- 개인 정보 보호를 위하여 We - Canvas 이용자의 일부 정보는 이용자 본인 외에는 수정 또는 열람이 불가능합니다.
- 만약 서비스 이용 중 개인 정보 또는 비밀번호를 잊은 경우에는 서비스 관리자가 임의로 분실된 이용자 계정을 복원하기 힘듭니다.

- 아이디를 분실하신 경우 계정 신청 시 등록한 사원 번호를 통해 확인 가능합니다.
- 비밀번호를 분실하신 경우 서비스 새로운 비밀번호를 설정하여 주십시오.
                            			
                            			</pre>
                            			
                            		</div>
                            		
                            		
                            </div>
                           
                        </div>
                            
                            
                            <script>
                            
                            $(function(){
                        		$(".empCheck").click(function(){
                        			var empNo = document.querySelector(".empNo").value;
                        			if(empNo=="" || empNo == null){
                        				alert('사원 번호를 입력하십시오');           			
                        			} else{
                        			
                        			$.ajax({
                                     	url:'searchLoginId.me',
                                     	type:'get',
                                     	data: {
                                     		empNo : empNo
                                     	},
                                     	datatype:'text',
                                     	success : function(data){
                                     		var result = data;
                                     		if ( result != "" || result != null){
	                                     		document.querySelector(".resultForm").classList.remove("hidden");
	                                     		document.querySelector(".idSearchWrapper").classList.add("hidden");
	                                     		document.querySelector(".resultId").innerHTML = data;
                                     		}else{
                                     			document.querySelector(".empNo").classList.add("is-invalid");
                                     			document.querySelector(".valid-empNo-text").innerHTML = '';
                                     			document.querySelector(".invalid-empNo-text").innerHTML = '퇴사한 사원 또는 존재하지 않는 사원입니다.';
                                     		}
                                     	}
                                	 });
                        			
                        			}
                        		})
                        	})
                        	
                        	$(function(){
                        		$(".setNewPwd").click(function(){
                        			var empNo = document.querySelector(".empNo2").value;
                        			var loginId = document.querySelector(".loginId").value;
                        			$.ajax({
                                     	url:'checkEmpNoAndId.me',
                                     	type:'get',
                                     	data: {
                                     		empNo : empNo,
                                     		loginId : loginId
                                     	},
                                     	datatype:'text',
                                     	success : function(data){
                                     		var result = data;
                                     		if ( result == "valid"){
	                                     		document.querySelector(".memberCheckWrapper").classList.add("hidden");
	                                     		document.querySelector(".newPwdSetWrapper").classList.remove("hidden");
	                                     		document.querySelector(".updateEmpNo").value = empNo;
                                     		}else{
                                     			document.querySelector(".empNo").classList.add("is-invalid");
                                     			document.querySelector(".valid-empNo-text").innerHTML = '';
                                     			document.querySelector(".invalid-empNo-text").innerHTML = '입력한 정보와 일치하는 값이 없습니다.';
                                     		}
                                     	}
                                	 }); 
                        		})
                        		$(".canclePwd").click(function(){
                        			document.querySelector(".idSearchWrapper").classList.remove("hidden");
                        			document.querySelector(".resultForm").classList.add("hidden");
                        			document.querySelector(".memberCheckWrapper").classList.add("hidden");
                        		})
                        	})
                        	
                        	$(function(){
                        		$(".searchPwd").click(function(){
                        			document.querySelector(".idSearchWrapper").classList.add("hidden");
                        			document.querySelector(".resultForm").classList.add("hidden");
                        			document.querySelector(".memberCheckWrapper").classList.remove("hidden");
                        		})
                        	})
                        	
                            
                            
                            function doesPasswordMatch(){
                            	var password = document.querySelector(".newPwd").value;
                            	var passwordCheck = document.querySelector(".newPwdCheck").value;
                            		if ( password == passwordCheck){
                            			return true;
                            		} else {
                            			return false;
                            		}
                            }  		
                            
                            function doubleCheckPwd(){
                            	
                            	var pwd = document.querySelector(".newPwd");
                            	if( (pwd.value.length > 4) || (pwd.value.length < 16)){
                            		
                            		if(doesPasswordMatch()){
                            			window.alert("성공적으로 비밀번호를 수정하였습니다.");
                            			document.querySelector(".setNewPassword").submit();
                            		}else{
                            			window.alert("비밀번호가 일치하지 않습니다.")
                            		}
                            		
                            	} else {
                            		window.alert("비밀번호는 최소 4자 이상  16자 이하여야 합니다.");
                            		pwd.innerHTML='';
                            	}
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