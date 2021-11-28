<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>


<style>


aside>*{

background-color: rgba(0,0,0,.78);
color: white;


}


</style>

<body>
        <aside class="left-sidebar" data-sidebarbg="skin6">
            <!-- Sidebar scroll-->
            <div class="scroll-sidebar" data-sidebarbg="skin6">
                <!-- Sidebar navigation-->
                <nav class="sidebar-nav">
                    <ul id="sidebarnav">
                        
                       	<li class="sidebar-item"> 
                       		<a class="sidebar-link sidebar-link has-arrow" href="#"  aria-expanded="false">
                       			<i data-feather="member" class="icon-people"></i>
                       			<span class="hide-menu">멤버 관리</span>
                       		</a>
                       		
                       		<ul aria-expanded="false" class="collapse first-level base-level-line">
                       			<li class="sidebar-item">
                       				<a href="managerMemberList.me" class="sidebar-link">
                       					<span> <b> 멤버 조회 </b></span>
                       				</a>
                       			</li>
                       		</ul>
                                    
                        </li>
						
						<li class="sidebar-item"> 
                       		<a class="sidebar-link sidebar-link has-arrow" href="#"  aria-expanded="false">
                       			<i data-feather="member" class="icon-list"></i>
                       			<span class="hide-menu">커뮤니티 관리</span>
                       		</a>
                       		
                       		<ul aria-expanded="false" class="collapse first-level base-level-line">
                       			<li class="sidebar-item">
                       				<a href="managerCommunityList.me" class="sidebar-link">
                       					<span> <b> 커뮤니티 관리 </b></span>
                       				</a>
                       			</li>
                       			<li class="sidebar-item">
                       				<a href="managerCommProposal.me" class="sidebar-link">
                       					<span> 신규 개설 </span>
                       				</a>
                       			</li>
                       		</ul>
                                    
                        </li>
						 <li class="sidebar-item"> 
                       		<a href="popupNoticeList.no" class="sidebar-link">
                       			<i data-feather="member" class="icon-bulb"></i>
                       			<span class="hide-menu"><b>팝업 공직사항 </b></span>
                       		</a>
                       	</li>
                        
                         <li class="sidebar-item"> 
                       		<a class="sidebar-link sidebar-link has-arrow" href="#"  aria-expanded="false">
                       			<i data-feather="member" class="icon-chart"></i>
                       			<span class="hide-menu"> 설문 </span>
                       		</a>
                       		
                       		<ul aria-expanded="false" class="collapse first-level base-level-line">
                       			<li class="sidebar-item">
                       				<a href="managerSurveyListForm.sv" class="sidebar-link">
                       					<span> <b> 설문 관리 </b></span>
                       				</a>
                       			</li>
                       		</ul>
                                    
                        </li>
                        
						
                                    
                           <!-- <button class="btn btn-dark btn btn-default btn-sm" onclick="applyForm();">식권 신청</button> -->  

                      
                        <li class="list-divider"></li>

             
                    </ul>
                    <div style="height:50px;">
                    </div>
                </nav>
                <!-- End Sidebar navigation -->
            </div>
            <!-- End Sidebar scroll-->
        </aside>

    <script src="${ pageContext.servletContext.contextPath }/resources/assets/libs/jquery/dist/jquery.min.js"></script>
	<script type="text/javascript">
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
	
	<script>
		function apply(){
			
			location.href="applyForm.bo";
		}
	</script>

	
</body>
</html>