<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
        <aside class="left-sidebar" data-sidebarbg="skin6">
            <!-- Sidebar scroll-->
            <div class="scroll-sidebar" data-sidebarbg="skin6">
                <!-- Sidebar navigation-->
                <nav class="sidebar-nav">
                    <ul id="sidebarnav">
                        <li class="sidebar-item"> 
	                        <a id="homeBtn" class="sidebar-link sidebar-link" href="managerMain.me" aria-expanded="false">
		                        <i data-feather="home" class="feather-icon"></i>
		                        <span class="hide-menu">HOME</span>
	                        </a>
                        </li>
                        
                        <li class="list-divider"></li>
                        <li class="nav-small-cap"><span class="hide-menu">MENU</span></li>

                        <li class="sidebar-item">
                         <a class="sidebar-link has-arrow" href="javascript:void(0)" aria-expanded="false">
                         	<i data-feather="file-text" class="feather-icon"></i>
                         	<span class="hide-menu"> 메뉴 1</span></a>
                            <ul aria-expanded="false" class="collapse  first-level base-level-line">
                                <li class="sidebar-item"><a href="boardList.li" class="sidebar-link"><span
                                            class="hide-menu"> 
                                        </span></a>
                                </li>

                            </ul>
                        </li>
                        
                        <li class="sidebar-item" id="categoryMenuBtn">
                         <a class="sidebar-link has-arrow" href="javascript:void(0)"  aria-expanded="false">
                         <i data-feather="file-text" class="feather-icon"></i>
                         <span  class="hide-menu"> 메뉴 2 </span></a>
                            <ul aria-expanded="false" class="collapse first-level base-level-line" id="categroyMenu">
										<!-- 커뮤니티 메뉴 (카테고리) 리스트 출력 -->
                                
                            </ul>
                        </li>
                       
                       		    <li class="sidebar-item"> <a class="sidebar-link sidebar-link" href="loginForm.me"
                                aria-expanded="false"><i data-feather="message-square" class="feather-icon"></i><span
                                    class="hide-menu"> 메뉴 3</span></a></li>

                        <li class="sidebar-item"> <a class="sidebar-link sidebar-link" href="${ pageContext.servletContext.contextPath }/calendar.ca"
                                aria-expanded="false"><i data-feather="calendar" class="feather-icon"></i><span
                                    class="hide-menu"> 메뉴 4</span></a></li>
                                    
                        <li class="sidebar-item"> <a class="sidebar-link sidebar-link" href="work.hr"
                                aria-expanded="false"><i data-feather="briefcase" class="feather-icon"></i><span
                                    class="hide-menu"> 메뉴 5</span></a></li> 
                        <li class="sidebar-item"> <a class="sidebar-link sidebar-link" href="main.ap"
                                aria-expanded="false"><i data-feather="edit" class="feather-icon"></i><span
                                    class="hide-menu"> 메뉴 6</span></a></li>               

                      
                        <li class="list-divider"></li>

                        <li class="sidebar-item"> <a class="sidebar-link sidebar-link" href="authentication-login1.html"
                     aria-expanded="false"><i data-feather="log-out" class="feather-icon"></i><span
                         class="hide-menu">Logout</span></a></li>
             
                    </ul>
                    <div style="height:50px;">
                    </div>
                </nav>
                <!-- End Sidebar navigation -->
            </div>
            <!-- End Sidebar scroll-->
        </aside>

    <script src="${ pageContext.servletContext.contextPath }/resources/assets/libs/jquery/dist/jquery.min.js"></script>

	<script>
		$(function(){
			var categoryBox = $("#categroyMenu");
			$.ajax({
				url:'categoryList.co',
				post:'post',
				dataType:'json',
				success:function(list){
					$.each(list,function(i,obj){

						categoryBox.append(`
								<li class="sidebar-item">
                                <a href="boardList.co?cno=\${ obj.cno }&cname=\${ obj.cname }" class="sidebar-link ">
                                	<span class="hide-menu"> \${ obj.cname } </span>
                                </a>
                                </li>
								`) 
			 		}) 				
				}
			})
			
		})
	</script>

	
</body>
</html>