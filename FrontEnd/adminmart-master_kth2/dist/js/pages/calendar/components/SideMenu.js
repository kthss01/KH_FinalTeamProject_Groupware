import Component from "../core/Components.js";
import SideMenuHeader from "./sidemenu/SideMenuHeader.js";
import SideMenuEdit from "./sidemenu/SideMenuEdit.js";
import SideMenuCal from "./sidemenu/SideMenuCal.js";

export default class SideMenu extends Component {

  template () {
    return `
      <div data-component="sidemenu-header"></div>
      <div class="card-body">
        <div data-component="sidemenu-edit"></div>
        <div data-component="sidemenu-cal"></div>
      </div>
    `;
  }

  setState (newState) {
    this.$state = { ...this.$state, ...newState };

    const { event=null, calendars=null } = newState;

    // console.log(this.$state);
    const { edit, cal } = this.$children;

    if (event) {
      edit.setState({ ...event });
    } else if (calendars) {
      edit.setState({ calendars });
      cal.setState({ calendars });
    } else {
      this.render();
    }

  }

  mounted () {
    const $sideMenuHeader = this.$target.querySelector('[data-component="sidemenu-header"]');
    $sideMenuHeader.classList.add("card-body", "border-bottom");

    const $sideMenuEdit = this.$target.querySelector('[data-component="sidemenu-edit"]');
    $sideMenuEdit.classList.add("row", "pb-3", "border-bottom");

    const $sideMenuCal = this.$target.querySelector('[data-component="sidemenu-cal"]');
    $sideMenuCal.classList.add("row", "pt-3");

    const { insertEvent, editEvent, deleteEvent, insertCalendar, editCalendar, deleteCalendar } = this.$props;

    this.$children = {
      header: new SideMenuHeader($sideMenuHeader, {}),
      edit: new SideMenuEdit($sideMenuEdit, {
        insertEvent, editEvent, deleteEvent,
      }),
      cal: new SideMenuCal($sideMenuCal, {
        insertCalendar, editCalendar, deleteCalendar,
      }),
    }
    
  }
}