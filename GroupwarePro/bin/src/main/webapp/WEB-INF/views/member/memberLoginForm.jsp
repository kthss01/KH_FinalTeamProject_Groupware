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

.loginBox{
    background-color: rgba(255,255,255,.97);
    height: 245px;
    width: 342px;
    text-align: center;
    border-radius: 5px;
    
    margin-top: 400px;
    margin-bottom: 250px;
    
    box-shadow: 3px 3px 3px 3px rgba(0,0,0,.33);

}

.btn-list{
    margin: 45px 10px 15px 10px;    
}

.loginForm{
   
    display:inline;
}
#idLabel{
    
    padding-top: 25px;
    margin-right: 26px;

}
#pwdLabel{

    margin-right: 10px;
}

.loginId{
    margin-left: 40px;
}
.loginPwd{
    margin-left: 20px;
}

.loginBtn{
    border-radius: 4px;
    font-size: 16px;
    width: 80px;
}
.cancleBtn{
    border-radius: 4px;
    font-size: 16px;
    width: 80px;
}

.newAcc{
		
	display:fixed;
	position:right;
	
}

.new{
	float:right;
	color: rgba(0,0,0,.78);
}


</style>
</head>

<body>
    


    <div class="loginBox container-fluid">
    				
        <div class="loginBox card-body">
            <img src="${ pageContext.servletContext.contextPath }/resources/assets/images/logo-icon.png" alt="homepage" class="light-logo" />
            <br>
                           
            <form id="loginForm" class="loginForm" action="login.me" method="post">
                   					
                
                <label id="idLabel" class="logo-text" for="userId">아이디</label>
                <input type="text" id="loginId" class="loginId" name="loginId" placeholder="아이디를 입력하세요">  <br>
                
                <label id="pwdLabel" class="logo-text" for="loginPwd">패스워드</label>
                <input type="password" id="loginPwd" class="loginPwd" name="loginPwd" placeholder="비밀번호를 입력하세요">
                
                <br>
            
            <div class="btn-list">
                <button type="submit" id="loginBtn" class="loginBtn waves-effect waves-light btn-secondary"> 로그인 </button>
                <button type="button" id="cancle" class="cancleBtn waves-effect waves-light btn-light"> 취소</button>
            </div>

            </form>
        	
        	<div class="new">    
			<a id="newAcc" class="newAcc" href="enrollForm.me" > 계정 신청</a>
        	</div>
        
        </div>
        			
       </div>


            <footer class="footer text-center text-muted">
                All Rights Reserved by kingSunHyo Designed and Developed by <a> KingSunHyo</a>.
            </footer>


    <script src="assets/libs/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap tether Core JavaScript -->
    <script src="assets/libs/popper.js/dist/umd/popper.min.js"></script>
    <script src="assets/libs/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- apps -->
    <!-- apps -->
    <script src="dist/js/app-style-switcher.js"></script>
    <script src="dist/js/feather.min.js"></script>
    <!-- slimscrollbar scrollbar JavaScript -->
    <script src="assets/libs/perfect-scrollbar/dist/perfect-scrollbar.jquery.min.js"></script>
    <script src="assets/extra-libs/sparkline/sparkline.js"></script>
    <!--Wave Effects -->
    <!-- themejs -->
    <!--Menu sidebar -->
    <script src="dist/js/sidebarmenu.js"></script>
    <!--Custom JavaScript -->
    <script src="dist/js/custom.min.js"></script>
    <!-- This Page JS -->
    <script src="assets/extra-libs/prism/prism.js"></script>

</body>
</html>