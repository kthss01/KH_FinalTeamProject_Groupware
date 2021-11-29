import Component from "../../core/Components.js";
import axios from '../../axios.js'

export default class ReservationDetail extends Component {

  setup () {
    // fullcalendar 설정
    this.config = {
      height: '625px', // calendar 높이 설정
      expandRows: true, // 화면에 맞게 높이 재설정
      slotMinTime: '07:00', // Day 캘린더에서 시작 시간
      slotMaxTime: '24:00', // Day 캘린더에서 종료 시간
      datesAboveResources: true,
      // 헤더에 표시할 툴바
      headerToolbar: {
        start: 'resourceTimeGridDay,resourceTimeGridDays',
        center: 'title',
        end: 'prev,today,next'
      },
      buttonText: {
        day: '일간',
      },
      views: {
        resourceTimeGridDay: {
          titleFormat: { year: '2-digit', month: 'numeric', day: 'numeric', weekday: 'short' },
        },
        resourceTimeGridDays: { 
          type: 'resourceTimeGrid',
          duration: { days: 3 },
          titleFormat: { month: 'numeric', day: 'numeric' },
          buttonText: '3일간',
        },
      },
      initialView: 'resourceTimeGridDay', // 초기 로드 될 때 보이는 캘린더 화면 (기본 설정 : 달)
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
      schedulerLicenseKey: 'CC-Attribution-NonCommercial-NoDerivatives'
    };

    // fullcalendar-scheduler 객체 생성
    this.$calendar = new FullCalendar.Calendar(this.$target, this.config);

    const { ascNo } = this.$props;

    // 이벤트 DB로부터 읽어오는 함수
    this.readEvents = async () => {
      try {
        const res = await axios.get(`selectRezListForCat.rez?ascNo=${ascNo}`);
        console.log(res.data);

        res.data.forEach((as) => {
          const resource = this.$calendar.getResourceById(as.asNo);

          if (!resource)
            return true;

          const event = {
            id: as.rezNo,
            title: as.name,
            start: as.startDate,
            end: as.endDate,
            allDay: as.allDay === '1' ? true: false,
            backgroundColor: resource.extendedProps.color,
            resourceId: resource.id,
            overlap: false,
            extendedProps: {
              empNo: as.empNo,
              empName: as.empName,
            },
          };

          if (empNo !== as.empNo) {
              event.display = 'background';
          }

          this.$calendar.addEvent(event);
        });
      } catch (err) {
        console.log(err);
      }
    }

    // 캘린더 DB로부터 읽어오는 함수
    this.readAssets = async () => {
      try {
        const res = await axios.get(`selectAsListForCat.rez?ascNo=${ascNo}`);

        console.log(res.data);

        res.data.forEach((asset) => {
          this.$calendar.addResource({
            id: asset.asNo,
            title: asset.name,
            extendedProps: {
              ascNo: asset.ascNo,
              color: asset.color,
              category: asset.category.name,
            },
          });
        });

      } catch (err) {
        console.log(err);
      }
    }

    // 캘린더 렌더를 위한 함수
    this.loadCalendar = async () => {
      try {
        const { renderAsset } = this.$props;

        await this.readAssets();
  
        await this.readEvents(); // resource id에 calNo를 넣음

        // console.log(this.$calendar.getResources());
  
        renderAsset({ assets: this.$calendar.getResources() });

        // fullcalendar 렌더
        this.$calendar.render();
      } catch (err) {
        console.log(err);
      }
    }
  }

  setState (newState) {
    this.$state = { ...this.$state, ...newState };

    const { event=null, status } = newState;
    const { renderAsset } = this.$props;

    // 예약 상태 변경 시
    if (event) {
      const resource = this.$calendar.getResourceById(event.asNo);

      switch (status) {
        case 'insert':
          this.$calendar.addEvent( {
            id: event.id,
            title: event.title,
            start: event.start,
            end: event.end,
            allDay: event.allDay,
            backgroundColor: resource.extendedProps.color,
            overlap: false,
            extendedProps: {
              empNo: event.empNo,
              empName: event.empName,
            },
          } );

          this.$calendar.getEventById(event.id).setResources([resource]);
        break;
        case 'update':
          const evt = this.$calendar.getEventById(event.id);
          evt.setProp("title", event.title);
          evt.setDates(event.start, event.end);
          evt.setAllDay(event.allDay);
          evt.setProp('backgroundColor', resource.extendedProps.color);

          this.$calendar.getEventById(event.id).setResources([resource]);
        break;
        case 'delete':
          this.$calendar.getEventById(event.id).remove();
        break;
      }

      renderAsset({ assets: this.$calendar.getResources() });

    } else {
      this.render();
    }      
  }

  render () {
    this.$target.innerHTML = this.template();

    this.loadCalendar();

    this.mounted(); 
  }

  setEvent () {
    const { selectEvent, editEvent, selectAsset, selectCategory } = this.$props;

    // 이벤트 생성
    this.$calendar.on('select', (info) => {

      selectEvent({
        id: '',
        title: '',
        start: info.start,
        end: info.end,
        allDay: info.allDay,
        asNo: info.resource.id,
      });
    });

    // 이벤트 조회
    this.$calendar.on('eventClick', (info) => {
      const resources = this.$calendar.getEventById(info.event.id).getResources();

      selectEvent({
        id: info.event.id,
        title: info.event.title,
        start: info.event.start,
        end: info.event.end,
        allDay: info.event.allDay,
        asNo: resources[0].id,
        display: info.event.display,
        empName: info.event.extendedProps.empName,
      })
    });
  
    // 이벤트 드랍 (일정에서 드래그로 이동)
    this.$calendar.on('eventDrop', (info) => {
      const { id, title, start, end, allDay } = info.event;
      const { id: asNo } = info.event.getResources()[0];

      editEvent({
        id, title, start, end, allDay, asNo,
      });
    });

    // 이벤트 리사이즈 (일정에서 이벤트 기간 조정)
    this.$calendar.on('eventResize', (info) => {
      const { id, title, start, end, allDay } = info.event;
      const { id: asNo } = info.event.getResources()[0];

      editEvent({
        id, title, start, end, allDay, asNo,
      });
    });
  }
}