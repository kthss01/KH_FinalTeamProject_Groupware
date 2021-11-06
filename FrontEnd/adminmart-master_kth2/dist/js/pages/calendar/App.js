import Component from './core/Components.js';
import SideMenu from './components/SideMenu.js';
import Calendar from './components/Calendar.js';

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

    const { selectDate } = this;

    // 필요시 기능 {} binding 해줘야 함 (이벤트는 해당 컴포넌트에서 처리)
    this.$childreb = {
      sideMenu: new SideMenu($calendarSidemenu, { 
        ...this.$state,
      }),
      calendar: new Calendar($calendarMain, { 
        ...this.$state,
        selectDate: selectDate.bind(this),
      })
    };
  }

  selectDate (date) {
    // console.log(date);

    const { sideMenu } = this.$childreb;

    sideMenu.setState({ date })
  }
}