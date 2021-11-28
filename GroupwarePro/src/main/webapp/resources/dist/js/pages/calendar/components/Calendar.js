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
      selectOverlap: function(event) {
        return event.rendering === 'background';
      },
      schedulerLicenseKey: 'CC-Attribution-NonCommercial-NoDerivatives',
    };

    // fullcalendar 객체 생성
    this.$calendar = new FullCalendar.Calendar(this.$target, this.config);

    // 이벤트 DB로부터 읽어오는 함수
    this.readEvents = async () => {
      try {
          this.$calendar.getResources().forEach(async (resource) => { 
            const calNo = resource.id;
            // axios를 이용하여 캘린더 번호에 맞는 일정 정보 가져오기
            const res = await axios.get(`selectEvtList.ca?calNo=${calNo}`);

            res.data.forEach((evt) => {
              const resource = this.$calendar.getResourceById(calNo);

              // fullcalendar에 맞게 일정 변경
              const event = {
                id: evt.evtNo,
                title: evt.name,
                start: evt.startDate,
                end: evt.endDate,
                allDay: evt.allDay === '1' ? true: false,
                display: evt.isHoliday === 'Y' ? 'background' : 'auto',
                overlap: evt.isHoliday === 'N',
                backgroundColor: resource.extendedProps.color,
              };

              this.$calendar.addEvent(event);
              this.$calendar.getEventById(event.id).setResources([resource]);
            });
          });
      } catch (err) {
        console.log(err);
      }
    }

    // 캘린더 DB로부터 읽어오는 함수
    this.readCalendars = async (empNo) => {
      try {
        const res = await axios.get(`selectCalList.ca?empNo=${empNo}`);

        res.data.forEach((calendar) => {
          this.$calendar.addResource({
            id: calendar.calNo,
            title: calendar.name,
            extendedProps: {
              color: calendar.color,
            },
          });
        });
      } catch (err) {
        console.log(err);
      }
    }

    // 캘린더 렌더를 위한 함수
    this.loadCalendar = async (empNo) => {
      try {
        const { renderCalendar } = this.$props;
  
        await this.readCalendars(empNo);
  
        renderCalendar({ calendars: this.$calendar.getResources() });

        await this.readEvents(); // resource id에 calNo를 넣음

        // fullcalendar 렌더
        this.$calendar.render();
      } catch (err) {
        console.log(err);
      }
    }
  }

  setState (newState) {
    this.$state = { ...this.$state, ...newState };

    const { event=null, calendar=null, status, showCal=null } = newState;
    const { renderCalendar } = this.$props;

    // 일정 상태 변경시
    if (event) {
      const resource = this.$calendar.getResourceById(event.calNo);

      switch (status) {
        // 일정 추가
        case 'insert':
          this.$calendar.addEvent( {
            ...event,
            backgroundColor: resource.extendedProps.color,
          } );
          this.$calendar.getEventById(event.id).setResources([resource]);
        break;
        // 일정 수정
        case 'update':
          const evt = this.$calendar.getEventById(event.id);
          evt.setProp("title", event.title);
          evt.setProp("backgroundColor", resource.extendedProps.color);
          evt.setDates(event.start, event.end);
          evt.setAllDay(event.allDay);
          evt.setResources([resource]);
        break;
        // 일정 삭제
        case 'delete':
          this.$calendar.getEventById(event.id).remove();
        break;
      }
    // 캘린더 상태 변경시 
    } else if (calendar) {
      const resource = this.$calendar.getResourceById(calendar.calNo);

      switch (status) {
        // 캘린더 추가
        case 'insert':
          this.$calendar.addResource({
            id: calendar.calNo,
            title: calendar.name,
            extendedProps: {
              color: calendar.color,
            },
          });
        break;
        // 캘린더 수정
        case 'update':
          resource.setProp('title', calendar.name);
          resource.setExtendedProp('color', calendar.color);

          resource.getEvents().forEach((event) => {
            event.setProp('backgroundColor', calendar.color);
          });
        break;
        // 캘린더 삭제
        case 'delete':
          resource.getEvents().forEach((event) => {
            event.remove();
          })
          resource.remove();
        break;
      }

      renderCalendar({ calendars: this.$calendar.getResources() });
    // 캘린더 보이기 상태 변경시
    } else if (showCal) {
      const { calNo, isShow } = showCal;
      const resource = this.$calendar.getResourceById(calNo);

      resource.getEvents().forEach((event) => {
        // 휴가는 그냥 background로 무조건 보이게
        if (event.display !== 'background') {
          event.setProp('display', isShow ? 'auto' : 'none');
        }
      });
    } else {
      this.render();
    }
  }

  render () {
    this.$target.innerHTML = this.template();

    this.loadCalendar(empNo); // 임시로 사원번호 넣음

    this.mounted(); 
  }

  setEvent() {
    const { selectEvent, editEvent } = this.$props;

    // 이벤트 생성
    this.$calendar.on('select', (info) => {

      // App Component selectEvent 호출
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
      const resources = this.$calendar.getEventById(info.event.id).getResources();

      // App Component selectEvent 호출
      selectEvent({
        id: info.event.id,
        title: info.event.title,
        start: info.event.start,
        end: info.event.end,
        allDay: info.event.allDay,
        calNo: resources[0].id,
      })
    });
  
    // 이벤트 드랍 (일정에서 드래그로 이동)
    this.$calendar.on('eventDrop', (info) => {
      const { id, title, start, end, allDay } = info.event;
      const { id: calNo } = info.event.getResources()[0];

      // App Component editEvent 호출
      editEvent({
        id, title, start, end, allDay, calNo,
      });
    });

    // 이벤트 리사이즈 (일정에서 이벤트 기간 조정)
    this.$calendar.on('eventResize', (info) => {
      const { id, title, start, end, allDay } = info.event;
      const { id: calNo } = info.event.getResources()[0];

      // App Component editEvent 호출
      editEvent({
        id, title, start, end, allDay, calNo,
      });
    });
  }
}