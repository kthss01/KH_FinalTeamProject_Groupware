import Component from './core/Components.js';
import SideMenu from './components/SideMenu.js';

export default class App extends Component {

  setup() {
    this.$state = {
      
    };
  }

  template () {
    return `
      <div data-component="calendar-sidemenu"></div>
    `;
  }

  mounted () {
    const $calendarSidemenu = this.$target.querySelector('[data-component="calendar-sidemenu"]');
    $calendarSidemenu.classList.add("col-lg-3", "border-right", "pr-0");

    new SideMenu($calendarSidemenu, {});
  }

}