import Component from "../core/Components.js";
import axios from '../axios.js'

export default class Calendar extends Component {

  setup () {
    // fullcalendar 설정
    this.config = {
      contentHeight: 225,
      headerToolbar: {
        start: 'title',
        center: 'listMonth',
        end: 'today prev,next',
      },
      expandRows: true, // 화면에 맞게 높이 재설정
      slotMinTime: '07:00', // Day 캘린더에서 시작 시간
      slotMaxTime: '24:00', // Day 캘린더에서 종료 시간
      initialView: 'listMonth', // 초기 로드 될 때 보이는 캘린더 화면 (기본 설정 : 달)
      navLinks: true, // 날짜를 선택하면 Day 캘린더나 Week 캘린더로 링크
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
            const res = await axios.get(`selectEvtList.ca?calNo=${calNo}`);

            res.data.forEach((evt) => {
              const resource = this.$calendar.getResourceById(calNo);
              const start = moment(evt.startDate).format('MM월 DD일');
              const end = moment(evt.endDate).format('MM월 DD일');

              const title = `${evt.name} [${start} - ${end}]`;

              const event = {
                id: evt.evtNo,
                title: title,
                start: evt.startDate,
                end: evt.endDate,
                allDay: evt.allDay === '1' ? true: false,
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
        await this.readCalendars(empNo);
        await this.readEvents(); // resource id에 calNo를 넣음

        // fullcalendar 렌더
        this.$calendar.render();
      } catch (err) {
        console.log(err);
      }
    }
  }

  render () {
    this.$target.innerHTML = this.template();

    this.loadCalendar(empNo); // 임시로 사원번호 넣음

    this.mounted(); 
  }
}