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

    const { selectEvent, insertEvent, editEvent, deleteEvent } = this;

    // 필요시 기능 {} binding 해줘야 함 (이벤트는 해당 컴포넌트에서 처리)
    this.$children = {
      sideMenu: new SideMenu($calendarSidemenu, { 
        ...this.$state,
        insertEvent: insertEvent.bind(this),
        editEvent: editEvent.bind(this),
        deleteEvent: deleteEvent.bind(this),
      }),
      calendar: new Calendar($calendarMain, { 
        ...this.$state,
        selectEvent: selectEvent.bind(this),
      })
    };
  }
  selectEvent (event) {

    // console.log(event);

    const { sideMenu } = this.$children;

    sideMenu.setState({ event });
  }

  async insertEvent (event) {
    const { calendar } = this.$children;

    console.log('app', event);

    console.log(new Date(event.start), new Date(event.end));

    const res = await axios.post(`insertEvent.ca`, null, {
      params: {
        name: event.title,
        startDate: new Date(event.start + ' UTC'),
        endDate: new Date(event.end + ' UTC'),
        calNo: 1,
      }
    });

    // console.log(res);
    event.id = res.data;

    calendar.setState({ event, status: 'insert' });
  }

  async editEvent (event) {
    const { calendar } = this.$children;

    console.log('app', event);

    // calendar.setState({ event });
  }

  async deleteEvent (event) {
    const { calendar } = this.$children;

    console.log('app', event);
    
    // calendar.setState({ event });
  }
}