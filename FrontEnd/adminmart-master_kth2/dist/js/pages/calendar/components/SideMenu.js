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

    if (this.$state.date) {
      const { edit } = this.$children;
      edit.setState({ ...this.$state });
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

    this.$children = {
      header: new SideMenuHeader($sideMenuHeader, {}),
      edit: new SideMenuEdit($sideMenuEdit, {}),
      cal: new SideMenuCal($sideMenuCal, {}),
    }
    
  }

}