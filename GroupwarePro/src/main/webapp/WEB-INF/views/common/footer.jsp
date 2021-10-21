<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    /* div{border:1px solid red;} */
    #footer{
        width:80%;
        height:200px;
        margin:auto;
        margin-top:50px;
    }
    #footer-1{
        width:100%;
        height:20%;
        border-top:1px solid lightgray;
        border-bottom:1px solid lightgray;
    }
    #footer-2{
        width:100%;
        height:80%;
    }
    #footer-1, #footer-2{
        padding-left:50px
    }

    #footer-1 > a{
        text-decoration:none;
        font-weight: 600;
        margin:10px;
        line-height: 40px;
        color: black;
    }
    #footer-2>p{
        margin: 0;
        padding:10px;
        font-size: 13px;
    }
    #p2{
        text-align:center;
    }
</style>
</head>
<body>
	<div id="footer">
        <div id="footer-1">
            <a href="#">이용약관</a> | 
            <a href="#">개인정보취급방침</a> | 
            <a href="#">인재채용</a> | 
            <a href="#">고객센터</a> 
        </div>

        <div id="footer-2">
            <p id="p1">
                강남지원 1관 : 서울특별시 강남구 테헤란로14길 6 남도빌딩 2F, 3F, 4F, 5F <br>
                강남지원 2관 : 서울특별시 강남구 테헤란로10길 9 그랑프리 빌딩 4F, 5F, 7F <br>
                강남지원 3관 : 서울특별시 강남구 테헤란로 130 호산빌딩 5F, 6F <br>
                종로지원 : 서울특별시 중구 남대문로 120 대일빌딩 2F, 3F <br>
                당산지원 : 서울특별시 영등포구 선유동2로 57 이레빌딩 (구관) 19F, 20F 
            </p>
            <p id="p2">Copyright ⓒ 1998-2019 KH Information Educational Institute All Right Reserved</p>     
        </div>
    </div>
</body>
</html>