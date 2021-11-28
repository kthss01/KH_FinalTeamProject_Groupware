import Component from "../core/Components.js";
import SideMenuHeader from "./sidemenu/SideMenuHeader.js";
import SideMenuEdit from "./sidemenu/SideMenuEdit.js";
import SideMenuCategory from "./sidemenu/SideMenuCategory.js";
import SideMenuAsset from "./sidemenu/SideMenuAsset.js";
import SideMenuList from "./sidemenu/SideMenuList.js";

export default class SideMenu extends Component {

  template () {
    return `
      <div data-component="sidemenu-header"></div>
      <div class="card-body">
        <div data-component="sidemenu-edit"></div>
        <div data-component="sidemenu-category"></div>
        <div data-component="sidemenu-asset"></div>
        <div data-component="sidemenu-list"></div>
      </div>
    `;
  }

  setState (newState) {
    this.$state = { ...this.$state, ...newState };

    const { event=null, assets=null, categories=null, cat=null, as=null, events=null } = newState;
    const { edit, asset, category, list } = this.$children;

    // 예약 상태 변경시
    if (event) {
      edit.setState({ ...event });
    // 자산 상태 변경시 (렌더링시)
    } else if (assets) {
      edit.setState({ assets });
      list.setState({ assets });
    // 자산 상태 변경시
    } else if (as) {
      asset.setState({ asset: as })
    // 자산목록 상태 변경시 (렌더링시)
    } else if (categories) {
      asset.setState({ categories });
      category.setState({ categories });
      list.setState({ categories });
    // 자산목록 상태 변경시
    } else if (cat) {
      category.setState({ category: cat });
    } else {
      this.render();
    }
  }

  mounted () {
    const $sideMenuHeader = this.$target.querySelector('[data-component="sidemenu-header"]');
    $sideMenuHeader.classList.add("card-body", "border-bottom");

    const $sideMenuEdit = this.$target.querySelector('[data-component="sidemenu-edit"]');
    $sideMenuEdit.classList.add("row", "pb-3", "border-bottom");
    
    const $sideMenuCategory = this.$target.querySelector('[data-component="sidemenu-category"]');
    $sideMenuCategory.classList.add("row", "pt-3");

    const $sideMenuAsset = this.$target.querySelector('[data-component="sidemenu-asset"]');
    $sideMenuAsset.classList.add("row", "pt-3");

    const $sideMenuList = this.$target.querySelector('[data-component="sidemenu-list"]');
    $sideMenuList.classList.add("row", "pt-3");

    // 관리자 회원만 자산 및 자산 목록 수정 가능하도록 구현
    if (empNo == 200) {
      $sideMenuCategory.classList.remove("d-none");
      $sideMenuAsset.classList.remove("d-none");
      $sideMenuList.classList.add("d-none");
    } else {
      $sideMenuCategory.classList.add("d-none");
      $sideMenuAsset.classList.add("d-none");
      $sideMenuList.classList.remove("d-none");
    }

    const { insertEvent, editEvent, deleteEvent } = this.$props;
    const { insertAsset, editAsset, deleteAsset } = this.$props;
    const { insertCategory, editCategory, deleteCategory } = this.$props;

    this.$children = {
      header: new SideMenuHeader($sideMenuHeader, {}),
      edit: new SideMenuEdit($sideMenuEdit, {
        insertEvent, editEvent, deleteEvent,
      }),
      category: new SideMenuCategory($sideMenuCategory, {
        insertCategory, editCategory, deleteCategory,
      }),
      asset: new SideMenuAsset($sideMenuAsset, {
        insertAsset, editAsset, deleteAsset,
      }),
      list: new SideMenuList($sideMenuList, { }),
    }
  }
}