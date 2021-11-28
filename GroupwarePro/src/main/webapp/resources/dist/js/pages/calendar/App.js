import Component from './core/Components.js';
import SideMenu from './components/SideMenu.js';
import Calendar from './components/Calendar.js';
import axios from './axios.js'

export default class App extends Component {
  
  setup() {
    this.$state = {};

  }

  template () {
    return `
      <div class="col-lg-3 border-right pr-0" data-component="calendar-sidemenu"></div>
      <div class="col-lg-9">
        <div class="card-body">
          <div id="calendar" data-component="calendar-main"></div>
        </div>
      </div>
    `;
  }

  mounted () {
    const $calendarSidemenu = this.$target.querySelector('[data-component="calendar-sidemenu"]');
    const $calendarMain = this.$target.querySelector('[data-component="calendar-main"]');

    const { selectEvent, insertEvent, editEvent, deleteEvent, renderCalendar } = this;
    const { insertCalendar, editCalendar, deleteCalendar, showCalendar } = this;

    // 필요시 기능 {} binding 해줘야 함 (이벤트는 해당 컴포넌트에서 처리)
    this.$children = {
      sideMenu: new SideMenu($calendarSidemenu, { 
        ...this.$state,
        insertEvent: insertEvent.bind(this),
        editEvent: editEvent.bind(this),
        deleteEvent: deleteEvent.bind(this),
        insertCalendar: insertCalendar.bind(this),
        editCalendar: editCalendar.bind(this),
        deleteCalendar: deleteCalendar.bind(this),
        showCalendar: showCalendar.bind(this),
      }),
      calendar: new Calendar($calendarMain, { 
        ...this.$state,
        selectEvent: selectEvent.bind(this),
        editEvent: editEvent.bind(this),
        renderCalendar: renderCalendar.bind(this),
      })
    };
  }

  // 일정 선택
  selectEvent (event) {
    const { sideMenu } = this.$children;

    sideMenu.setState({ event });
  }

  // 일정 추가
  async insertEvent (event) {
    const { calendar } = this.$children;

    // 시작일 또는 종료일 미입력 처리
    if (!event.start || !event.end) {
      alert("시작일 또는 종료일을 입력해주세요");
      return;
    }

    // 일정명 미입력 처리
    if (!event.title) {
      alert("일정명을 입력해주세요");
      return;
    }

    try {
      // axios를 이용하여 DB에 일정 추가
      const res = await axios.post(`insertEvent.ca`, null, {
        params: {
          name: event.title,
          startDate: new Date(event.start + ' UTC'),
          endDate: new Date(event.end + ' UTC'),
          allDay: event.allDay ? '1' : '0',
          calNo: event.calNo,
        }
      });

      // DB로부터 일정번호 설정
      event.id = res.data;

      // calendar에서 일정 상태 변경
      calendar.setState({ event, status: 'insert' });
    } catch (err) {
      console.log(err);
    }
  }

  // 일정 수정
  async editEvent (event) {
    const { calendar } = this.$children;

    try {
      // axios를 이용하여 DB에 일정 수정
      await axios.put(`updateEvent.ca`, null, {
        params: {
          evtNo: event.id,
          name: event.title,
          startDate: new Date(event.start + ' UTC'),
          endDate: new Date(event.end + ' UTC'),
          allDay: event.allDay ? '1' : '0',
          calNo: event.calNo,
        }
      });

      // calendar에서 일정 상태 변경
      calendar.setState({ event, status: 'update' });
    } catch (err) {
      console.log(err);
    }

  }

  // 일정 삭제
  async deleteEvent (event) {
    const { calendar } = this.$children;

    try {
      // axios를 이용하여 DB에 일정 삭제
      await axios.delete(`deleteEvent.ca?evtNo=${event.id}`);

      // calendar에 일정 상태 변경
      calendar.setState({ event, status: 'delete' });
    } catch (err) {
      console.log(err);
    }
  }

  // 캘린더 렌더링 (Calendar말고 다른 Component에서)
  renderCalendar (calendars) {
    const { sideMenu } = this.$children;

    // sideMenu에서 일정 캘린더 상태 변경
    sideMenu.setState({ ...calendars });
  }

  // 캘린더 추가
  async insertCalendar (cal) {
    const { calendar } = this.$children;

    // 캘린더명 미입력 처리
    if (!cal.name) {
      alert("캘린더명을 입력해주세요");
      return;
    }

    try {
      // axios를 이용하여 DB에 캘린더 추가
      const res = await axios.post(`insertCalendar.ca`, null, {
        params: { 
          name: cal.name, 
          color: cal.color,
          empNo: empNo, 
        }
      });

      // DB로부터 캘린더번호 설정
      cal.calNo = res.data;

      // calendar에 캘린더 상태 변경
      calendar.setState({ calendar: cal, status: 'insert' });
    } catch (err) {
      console.log(err);
    }
  }

  //
  async editCalendar (cal) {
    const { calendar } = this.$children;

    try {
      // axios를 이용하여 DB에 캘린더 수정
      await axios.put(`updateCalendar.ca`, null, {
        params: { 
          name: cal.name, 
          color: cal.color,
          calNo: cal.calNo,
          empNo: empNo,           
        }
      });

      // calendar에 캘린더 상태 변경
      calendar.setState({ calendar: cal, status: 'update' });
    } catch (err) {
      console.log(err);
    }
  }

  async deleteCalendar (cal) {
    const { calendar } = this.$children;

    try {
      // axios를 이용하여 DB에 캘린더 삭제
      await axios.delete(`deleteCalendar.ca?calNo=${cal.calNo}`);

      // calendar에 캘린더 상태 변경
      calendar.setState({ calendar: cal, status: 'delete' });
    } catch (err) {
      console.log(err);
    }
  }

  showCalendar (calNo, isShow) {
    const { calendar } = this.$children;

    // calendar에 캘린더 상태 변경
    calendar.setState({
      showCal: { calNo, isShow, }
    });
  }
}