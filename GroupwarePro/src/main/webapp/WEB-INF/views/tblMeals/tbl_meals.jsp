<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang='en'>
  <head>
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
          editable: true,//수정가능여부
          droppable: true, // this allows things to be dropped onto the calendar
          drop: function(info) {
            // is the "remove after drop" checkbox checked?
            if (checkbox.checked) {
              // if so, remove the element from the "Draggable Events" list
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
    
    
    function loadingEvents(){//selectlist
      	var return_value=null;
    	$.ajax({
    		type:'GET',
  	      	url:"list.bo",
  	      	dataType:'json',
  	      	async:false
    	      
    	      
    	})
    	.done(function(result){
    		console.log(result);
    		
    		return_value=[];
    		
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
  
  
  <div style="float:left; width:80%">
  	<div style="height:30px; text-align:center; font-size:35px; margin-bottom:30px; font-weight:bold">
  		<div style="width:60%; float:left; text-align:right">월간 식단표</div>
  		<div style="width:40%; float:left; text-align:right">
  		<button style="width:120px; height:40px; vertical-align:middle; font-size:17px; cursor:pointer" onclick="register();">식단표 등록</button>
  		</div>
  	
  	</div>
    <div id='calendar'></div>
  </div>
  
  <script>
  	function register(){
  		location.href="registerForm.bo"; 
  	}
  </script>
  
  
  
  
  </body>
</html>