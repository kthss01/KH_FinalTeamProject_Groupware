<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang='en'>
  <head>
  	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="${ pageContext.servletContext.contextPath }/resources/assets/images/favicon.png">
    <title>Adminmart Template - The Ultimate Multipurpose admin template</title>
    <!-- This page css -->
    <!-- Custom CSS -->
    <link href="${ pageContext.servletContext.contextPath }/resources/dist/css/style.min.css" rel="stylesheet">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
  
  
  
    <meta charset='utf-8' />
    <link href='${ pageContext.servletContext.contextPath }/resources/fullcalendar/main.css' rel='stylesheet' />
    <script src='${ pageContext.servletContext.contextPath }/resources/fullcalendar/main.js'></script>
    <script src='${ pageContext.servletContext.contextPath }/resources/locales/ko.js'></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script>
	
    var calendar=null;
    
    document.addEventListener('DOMContentLoaded', function() {
        var Calendar = FullCalendar.Calendar;
        var Draggable = FullCalendar.Draggable;

        var containerEl = document.getElementById('external-events');
        var calendarEl = document.getElementById('calendar');
        var checkbox = document.getElementById('drop-remove');

        // initialize the external events
        // -----------------------------------------------------------------
      	//default event
        //var all_events=null;
        //all_events=loadingEvents();


        new Draggable(containerEl, {
          itemSelector: '.fc-event',
          eventData: function(eventEl) {
            return {
              title: eventEl.innerText
            };
          }
        });

        // initialize the calendar
        // -----------------------------------------------------------------

        calendar = new Calendar(calendarEl, {
          headerToolbar: {
            left: 'prev,next today',
            center: 'title',
            right: 'dayGridMonth,timeGridWeek,timeGridDay'
          },
          editable: true,
          droppable: true, 
          drop: function(info) {
            if (checkbox.checked) {
            
              info.draggedEl.parentNode.removeChild(info.draggedEl);
            }
          },
          locale:'ko'
        });

        loadingEvents();

        calendar.render();
      });
    
    
    //1.전체이벤트데이터추출-->2.추출된 데이터를ㅁ ajax로 서버에 전송하여 db에 저장
    function allSave(){
    	var allEvent=calendar.getEvents();
    	console.log(allEvent);
    	
    	//allday:true
    	//_def
    	
    	
    	
    	var events=new Array();
    	for(var i=0; i<allEvent.length; i++){
    		//alert(allEvent[i]._def.title);
    		
    		
    		
    		
    		var obj=new Object();
    		obj.title=allEvent[i]._def.title;
    		//obj.allday=allEvent[i]._def.allDay;
    		obj.start=allEvent[i]._instance.range.start;
    		obj.end=allEvent[i]._instance.range.end;
    		
    		
    		
    		
    		events.push(obj);
    		
    	}
    	var jsondata=JSON.stringify(events);
    	
    	console.log("jsondata출력 !!"+jsondata);
    
    	
    	
    	//savedata(jsondata);
    	
    	
    }
    
    
    function loadingEvents(){
      	var return_value=null;
    	$.ajax({
    		type:'GET',
  	      	url:"list.bo",
  	      	dataType:'json',
  	      	async:false
    	      
    	      
    	})
    	.done(function(result){
    		console.log(result);
    		
    		for (var value of result) {
    			 var event = {
    			 title: value.lnc,
    			 start: value.startDate,
    			 end: value.endDate,
    			 
    			};
    			calendar.addEvent(event);
    		}		
    		
    	})
    	.fail(function(request,status,error){
  
 	      alert("FAILED:");
 	      
 	    })
  
    }

    

    
    function savedata(jsondata){//insert
    	//서버에 넘기기
    	$.ajax({
    		type:"POST",
    		url:"insert.bo",
    		traditional:true,
    		contentType: 'application/json',
    		data:{ alldata:jsondata },
    		dataType:'json',
    		async:false
    		
    	})
    	.done(function(result){
    		alert("성공");
    	})
    	.fail(function(request,status,error){
    		alert("FAILED:"+error);
    		
    	})
    	
    	
    }

    </script>
  </head>
  <body>
  	
  	
  	<div id="main-wrapper" data-theme="light" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full" data-sidebar-position="fixed" data-header-position="fixed" data-boxed-layout="full">   
        
        <!-- ============================================================== -->
        <!-- Topbar header - style you can find in pages.scss -->
        <!-- ============================================================== -->
        <jsp:include page="../common/header.jsp"/>
        <!-- ============================================================== -->
        <!-- End Topbar header -->
        <!-- ============================================================== -->
        
        <!-- ============================================================== -->
        <!-- Left Sidebar - style you can find in sidebar.scss  -->
        <jsp:include page="../common/sidebar.jsp"/>
        </div>
        
       
          
        <div id='external-events'>
    <p>
      <strong>월간 식단표</strong>
    </p>

    <div class='fc-event fc-h-event fc-daygrid-event fc-daygrid-block-event'>
      <div class='fc-event-main'>tblMeals 1</div>
    </div>
    <div class='fc-event fc-h-event fc-daygrid-event fc-daygrid-block-event'>
      <div class='fc-event-main'>tblMeals 2</div>
    </div>
    <div class='fc-event fc-h-event fc-daygrid-event fc-daygrid-block-event'>
      <div class='fc-event-main'>tblMeals 3</div>
    </div>
    <div class='fc-event fc-h-event fc-daygrid-event fc-daygrid-block-event'>
      <div class='fc-event-main'>tblMeals 4</div>
    </div>
    <div class='fc-event fc-h-event fc-daygrid-event fc-daygrid-block-event'>
      <div class='fc-event-main'>tblMeals 5</div>
    </div>

    <p>
      <input type='checkbox' id='drop-remove' />
      <label for='drop-remove'>remove after drop</label>
    </p>
  </div>
  
  
  <div style="float:right; width:80%;">
  	<div style="height:30px; text-align:center; font-size:35px; margin-bottom:30px; font-weight:bold">
  		<div style="width:60%; float:left; text-align:right">월간 식단표</div>
  		<div style="width:40%; float:left; text-align:right"><button style="width:120px; height:40px; vertical-align:middle; font-size:17px; cursor:pointer" onclick="register();">식단표 등록</button></div>     
  	
  	</div>
  	
  	
    <div id='calendar'></div>
    
    
    </div>
    
    
        
    
  
  
  	
  
  <script>
  	function register(){
  		location.href="registerForm.bo"; 
  	}
  </script>
  
  <!--  -->
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
  
  
  </body>
</html>