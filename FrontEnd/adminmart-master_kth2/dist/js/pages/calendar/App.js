import Component from './core/Components.js';
import SideMenu from './components/SideMenu.js';
import Calendar from './components/Calendar.js';

export default class App extends Component {

  setup() {

    this.$state = {

    };
  }

  template () {
    return `
      <div data-component="calendar-sidemenu"></div>
      <div data-component="calendar-main"></div>
    `;
  }

  mounted () {
    const $calendarSidemenu = this.$target.querySelector('[data-component="calendar-sidemenu"]');
    $calendarSidemenu.classList.add("col-lg-3", "border-right", "pr-0");

    const $calendarMain = this.$target.querySelector('[data-component="calendar-main"]');
    $calendarMain.classList.add("col-lg-9");
    $calendarMain.style.height = '650px';

    // 필요시 기능 {} binding 해줘야 함 (이벤트는 해당 컴포넌트에서 처리)
    new SideMenu($calendarSidemenu, {});
    new Calendar($calendarMain, {});
  }

  // events

}