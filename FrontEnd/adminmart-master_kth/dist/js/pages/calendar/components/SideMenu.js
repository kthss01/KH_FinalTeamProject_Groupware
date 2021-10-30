import Component from "../core/Components.js";
import SideMenuHeader from "./sidemenu/SideMenuHeader.js";
import SideMenuMyCal from "./sidemenu/SideMenuMyCal.js";
import SideMenuLikeCal from "./sidemenu/SideMenuLikeCal.js";
import SideMenuPubCal from "./sidemenu/SideMenuPubCal.js";

export default class SideMenu extends Component {

  template () {
    return `
      <div data-component="sidemenu-header"></div>
      <div class="card-body pl-0">
          <div data-component="sidemenu-mycal"></div>
          <div data-component="sidemenu-likecal"></div>
          <div data-component="sidemenu-pubcal"></div>
      </div>
      <div class="card-footer">
        <button class="btn btn-outline-secondary btn-block">
          <i class="fas fa-cog"></i> 캘린더 설정
        </button>
      </div>
    `;
  }

  mounted () {
    const $sideMenuHeader = this.$target.querySelector('[data-component="sidemenu-header"]');
    $sideMenuHeader.classList.add("card-body", "border-bottom");

    const $sideMenuMyCal = this.$target.querySelector('[data-component="sidemenu-mycal"]');
    $sideMenuMyCal.classList.add("row", "mb-3");

    const $sideMenuLikeCal = this.$target.querySelector('[data-component="sidemenu-likecal"]');
    $sideMenuLikeCal.classList.add("row", "border-bottom", "pb-3");

    const $sideMenuPubCal = this.$target.querySelector('[data-component="sidemenu-pubcal"]');
    $sideMenuPubCal.classList.add("row", "mt-3");

    new SideMenuHeader($sideMenuHeader, {});
    new SideMenuMyCal($sideMenuMyCal, {});
    new SideMenuLikeCal($sideMenuLikeCal, {});
    new SideMenuPubCal($sideMenuPubCal, {});
  }

}