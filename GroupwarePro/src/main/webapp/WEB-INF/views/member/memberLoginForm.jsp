<!DOCTYPE html>
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
    <title>Groupware</title>
    <!-- Custom CSS -->
    <link href="${ pageContext.servletContext.contextPath }/resources/assets/extra-libs/c3/c3.min.css" rel="stylesheet">
    <link href="${ pageContext.servletContext.contextPath }/resources/assets/libs/chartist/dist/chartist.min.css" rel="stylesheet">
    <link href="${ pageContext.servletContext.contextPath }/resources/assets/extra-libs/jvector/jquery-jvectormap-2.0.2.css" rel="stylesheet" />
    <!-- Custom CSS -->
    <link href="${ pageContext.servletContext.contextPath }/resources/dist/css/style.min.css" rel="stylesheet">

<style>

<!--
.loginBox{
    background-color: rgba(255,255,255,.97);
    height: 800px;
    width: 100%;
    
    text-align: center;
    
    
    margin-top: 400px;
    margin-bottom: 250px;

}

.card{
	height:100%;
	text-align:center;
	display:inline-block
}

.card-body{
	
	box-shadow: 10px 4px 15px 0px rgba(0,0,0,0.63);
	hegiht: 100%px;
	width: 600px;
	border-radius:5px;
	
}


.btn-list{
    margin: 45px 10px 15px 10px;    
}



.loginBtn{
    font-size: 16px;
    width: 80px;
}
.cancleBtn{
    font-size: 16px;
    width: 80px;
}

.new{
	float:center;
	font-size: 19px;
}

.newAcc{

	text_decoration:none;

}

.light-logo{
	
	height:50px;
	width: 95px;
	
	margin-bottom: 30px;

}



.row{
	
	display:flex;	
	justify-content:center;
	text-align:center;
}


.loginId {
	margin-left:25px;
}
.loginPwd {
	margin-left:10px; 
}

</style>
</head>

<body>
    


    <div class="loginBox">
    				
        <div class="wrapper">
            <img src="${ pageContext.servletContext.contextPath }/resources/assets/images/logo-icon.png" alt="homepage" class="light-logo" />
            <h3 class="card-title"> WE CANVAS</h3>
            <br>
			
			<div class="card">
				<div class="card-body">
	            <form id="loginForm" class="loginForm mt-5" action="login.me" method="post">
	                   					
					<div class="form-body">
						
						<div class="form-gorup">
						
							<div class="row">
							
							<label class="login-id" for="loginId">아이디 </label>
								<div class="cold-md-5">
									<input type="text" class="loginId form-control" name="loginId" id="loginId" placeholder="로그인 입력">
								</div>
							</div>
						
						</div>	
						<br>
						
						<div class="form-gorup">
						
							<div class="row">
							<label class="login-id" for="loginPwd">비밀번호 </label>
								<div class="cold-md-5">
									<input type="password" class="loginPwd form-control" name="loginPwd" id="loginPwd" placeholder="비밀번호 입력">
								</div>
							</div>
						
						</div>					
					
					</div>				          	      
            
          	 	 <div class="btn-list">
           	    		<button type="submit" id="loginBtn" class="loginBtn btn waves-effect waves-light btn-secondary"> 로그인 </button>
          	    		<button type="button" id="cancle" class="cancleBtn btn waves-effect waves-light btn-light"> 취소</button>
         	 	 </div>

            </form>
        		</div>
        		<br>
        		<div class="new">    
				<a id="newAcc" class="newAcc" href="enrollForm.me" > 계정 신청</a>
        		</div>
        	</div>
        	
        	
        
        </div>
        			
       </div>





            <footer class="footer text-center text-muted">
                All Rights Reserved by kingSunHyo Designed and Developed by <a> KingSunHyo</a>.
            </footer>


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
    <!-- This Page JS -->
    <script src="${ pageContext.servletContext.contextPath }/resources/assets/extra-libs/prism/prism.js"></script>

</body>
</html>