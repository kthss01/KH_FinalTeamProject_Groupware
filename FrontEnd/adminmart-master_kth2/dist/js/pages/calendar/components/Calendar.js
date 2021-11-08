import Component from "../core/Components.js";
import axios from '../axios.js'

export default class Calendar extends Component {

  setup () {

    // fullcalendar 설정
    this.config = {
      height: '625px', // calendar 높이 설정
      expandRows: true, // 화면에 맞게 높이 재설정
      slotMinTime: '07:00', // Day 캘린더에서 시작 시간
      slotMaxTime: '24:00', // Day 캘린더에서 종료 시간
      // 헤더에 표시할 툴바
      headerToolbar: {
        start: 'timeGridDay,timeGridWeek,dayGridMonth',
        center: 'title',
        end: 'prev,today,next'
      },
      buttonText: {
        day: '일간',
        week: '주간',
        month: '월간',
      },
      views: {
        timeGridDay: {
          titleFormat: { year: '2-digit', month: 'numeric', day: 'numeric', weekday: 'short' },
        },
        timeGridWeek: { 
          titleFormat: { month: 'numeric', day: 'numeric' },
        },
        listYear: {
          titleFormat: { year: 'numeric' }
        }
      },
      initialView: 'dayGridMonth', // 초기 로드 될 때 보이는 캘린더 화면 (기본 설정 : 달)
      navLinks: true, // 날짜를 선택하면 Day 캘린더나 Week 캘린더로 링크
      editable: true, // 수정 가능
      selectable: true, // 달력 일자 드래그 설정 가능
      nowIndicator: true, // 현재 시간 마크
      dayMaxEvents: true, // 이벤트가 오버되면 높이 제한 (+ 몇개식으로 표현)
      locale: 'ko', // 한국어 설정
      allDayMaintainDuration: true,
    };

    // fullcalendar 객체 생성
    this.$calendar = new FullCalendar.Calendar(this.$target, this.config);

    // 이벤트 DB로부터 읽어오는 함수
    this.readEvents = async (calNo) => {
      try {
        const res = await axios.get(`selectEvtList.ca?calNo=${calNo}`);
        // console.log(res);
        
        const events = res.data.map((evt) => {
          // console.log(evt);
          return {
            id: evt.evtNo,
            title: evt.name,
            start: evt.startDate,
            end: evt.endDate,
            allDay: evt.allDay === '1' ? true : false,
          }
        });
    
        return events;
      } catch (err) {
        console.log(err);
      }
    }

    // 캘린더 DB로부터 읽어오는 함수
    this.readCalendars = async (empNo) => {
      try {
        const res = await axios.get(`selectCalList.ca?empNo=${empNo}`);

        // console.log(res.data);
  
        return res.data;

      } catch (err) {
        console.log(err);
      }
    }

    // 캘린더 렌더를 위한 함수
    this.loadCalendar = async (empNo) => {
      try {
        const { renderCalendar } = this.$props;
  
        this.calendars = await this.readCalendars(empNo);
  
        // console.log(this.calendars);
  
        renderCalendar(this.calendars);
  
        this.calendars.forEach(async (calendar, i) => {
          const { calNo } = calendar;
          this.calendars[i].events = await this.readEvents(calNo);
  
          // fullcalendar 객체에 읽어온 이벤트 추가
          this.calendars[i].events.forEach(event => {
            this.$calendar.addEvent({ ...event, backgroundColor: this.calendars[i].color });
          })
        })
  
        // fullcalendar 렌더
        this.$calendar.render();
      } catch (err) {
        console.log(err);
      }
    }
  }

  setState (newState) {
    this.$state = { ...this.$state, ...newState };

    const { event=null, calendar=null, status } = newState;

    const { renderCalendar } = this.$props;

    console.log(status, calendar);

    if (event) {

      // console.log(status);
      console.log(event);

      switch (status) {
        case 'insert':
          var targetCal = this.calendars.find((cal) => cal.calNo == event.calNo);
          targetCal.events.push(event);
          this.$calendar.addEvent({ ...event, backgroundColor: targetCal.color });
        break;
        case 'update':
          let isFind = false;
          this.calendars.forEach((cal) => {
            cal.events.forEach((evt, i) => {
              if (evt.evtNo == event.evtNo) {
                cal.events.splice(i, 1);
                isFind = true;
                return false;
              }
            });
            if (isFind) {
              return false;
            }
          });
          var targetCal = this.calendars.find((cal) => cal.calNo == event.calNo);
          event.backgroundColor = targetCal.color;
          targetCal.events.push(event);
          const evt = this.$calendar.getEventById(event.id);
          evt.setProp("title", event.title);
          evt.setProp("backgroundColor", targetCal.color);
          evt.setDates(event.start, event.end);
          evt.setAllDay(event.allDay);
        break;
        case 'delete':
          var targetCal = this.calendars.find((cal) => cal.calNo == event.calNo);
          targetCal.events = targetCal.events.filter((evt) => evt.evtNo != event.evtno);
          this.$calendar.getEventById(event.id).remove();
        break;
      }

      // console.log(this.$calendar);

    } else if (calendar) {
      switch (status) {
        case 'insert':
          console.log(this.calendars);
          this.calendars.push(calendar);
          console.log(this.calendars);
          renderCalendar(this.calendars);
        break;
        case 'update':
          var targetCal = this.calendars.find((cal) => cal.calNo == calendar.calNo);
          console.log(targetCal);
          if (targetCal.events) {
            targetCal.events.forEach((event) => {
              this.$calendar.getEventById(event.id).setProp('backgroundColor', calendar.color);
            });
          }  
          targetCal.name = calendar.name;
          targetCal.color = calendar.color;
          console.log(this.calendars);
          renderCalendar(this.calendars);
        break;
        case 'delete':
          var targetCal = this.calendars.find((cal) => cal.calNo == calendar.calNo);
          if (targetCal.events) {
            targetCal.events.forEach((event) => {
              this.$calendar.getEventById(event.id).remove();
            });
          }
          this.calendars = this.calendars.filter((cal) => cal.calNo != calendar.calNo);
          console.log(this.calendars);
          renderCalendar(this.calendars);
        break;
      }
    }
    else {
      this.render();
    }

  }

  render () {
    this.$target.innerHTML = this.template();

    this.loadCalendar(201); // 임시로 사원번호 넣음

    this.mounted(); 
  }

  mounted () {
    
  }

  setEvent() {

    const { selectEvent, editEvent } = this.$props;

    // 이벤트 생성
    this.$calendar.on('select', (info) => {

      // console.log(info.title); // undefined

      selectEvent({
        id: '',
        title: '',
        start: info.start,
        end: info.end,
        allDay: info.allDay,
      });
    });

    // 이벤트 조회
    this.$calendar.on('eventClick', (info) => {
   
      // info.event.title = 'test'; // 이런식으로 변경 후 DB 변경
      // info.event.setProp("title", "test");
      // info.event.setProp("backgroundColor", "green");

      selectEvent({
        id: info.event.id,
        title: info.event.title,
        start: info.event.start,
        end: info.event.end,
        allDay: info.event.allDay,
      })
    });
  
    // 이벤트 드랍 (일정에서 드래그로 이동)
    this.$calendar.on('eventDrop', (info) => {
      const { id, title, start, end, allDay } = info.event;
      console.log('eventDrop', id, title, start, end, allDay);

      editEvent({
        id, title, start, end, allDay: allDay ? '1' : '0',
      });
    });

    // 이벤트 리사이즈 (일정에서 이벤트 기간 조정)
    this.$calendar.on('eventResize', (info) => {
      const { id, title, start, end, allDay } = info.event;
      console.log('eventResize', id, title, start, end, allDay);

      editEvent({
        id, title, start, end, allDay: allDay ? '1' : '0',
      });
    });
  }
}