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

    const { selectEvent, insertEvent, editEvent, deleteEvent, renderCalendar, insertCalendar, editCalendar, deleteCalendar } = this;

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
      }),
      calendar: new Calendar($calendarMain, { 
        ...this.$state,
        selectEvent: selectEvent.bind(this),
        editEvent: editEvent.bind(this),
        renderCalendar: renderCalendar.bind(this),
      })
    };
  }
  selectEvent (event) {

    console.log(event);

    const { sideMenu } = this.$children;

    sideMenu.setState({ event });
  }

  async insertEvent (event) {
    const { calendar } = this.$children;

    console.log('app', event);

    // console.log(new Date(event.start), new Date(event.end));

    try {
      const res = await axios.post(`insertEvent.ca`, null, {
        params: {
          name: event.title,
          startDate: new Date(event.start + ' UTC'),
          endDate: new Date(event.end + ' UTC'),
          allDay: event.allDay ? '1' : '0',
          calNo: event.calNo,
        }
      });

      console.log(res);
      event.id = res.data;

      calendar.setState({ event, status: 'insert' });

    } catch (err) {
      console.log(err);
    }
  }

  async editEvent (event) {
    const { calendar } = this.$children;

    console.log('app', event);

    try {
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

      calendar.setState({ event, status: 'update' });

    } catch (err) {
      console.log(err);
    }

  }

  async deleteEvent (event) {
    const { calendar } = this.$children;

    // console.log('app', event);

    try {
      await axios.delete(`deleteEvent.ca?evtNo=${event.id}`);

      calendar.setState({ event, status: 'delete' });
    } catch (err) {
      console.log(err);
    }
    
  }

  renderCalendar (calendars) {
    const { sideMenu } = this.$children;

    sideMenu.setState({ ...calendars });
  }

  async insertCalendar (cal) {
    const { calendar } = this.$children;

    console.log(cal);

    try {
      const res = await axios.post(`insertCalendar.ca`, null, {
        params: { 
          name: cal.name, 
          color: cal.color,
          empNo: empNo, 
        }
      });

      // console.log(res.data);

      cal.calNo = res.data;

      calendar.setState({ calendar: cal, status: 'insert' });

    } catch (err) {
      console.log(err);
    }
  }

  async editCalendar (cal) {
    const { calendar } = this.$children;

    // console.log(cal);

    try {
      await axios.put(`updateCalendar.ca`, null, {
        params: { 
          name: cal.name, 
          color: cal.color,
          calNo: cal.calNo,
          empNo: empNo,           
        }
      });

      calendar.setState({ calendar: cal, status: 'update' });

    } catch (err) {
      console.log(err);
    }
  }

  async deleteCalendar (cal) {
    const { calendar } = this.$children;

    // console.log(cal);

    try {
      await axios.delete(`deleteCalendar.ca?calNo=${cal.calNo}`);

      calendar.setState({ calendar: cal, status: 'delete' });

    } catch (err) {
      console.log(err);
    }
  }
}