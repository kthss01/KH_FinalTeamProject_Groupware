import Component from "../core/Components.js";
import SideMenuHeader from "./sidemenu/SideMenuHeader.js";
import SideMenuEdit from "./sidemenu/SideMenuEdit.js";
import SideMenuCategory from "./sidemenu/SideMenuCategory.js";
import SideMenuAsset from "./sidemenu/SideMenuAsset.js";

export default class SideMenu extends Component {

  template () {
    return `
      <div data-component="sidemenu-header"></div>
      <div class="card-body">
        <div data-component="sidemenu-edit"></div>
        <div data-component="sidemenu-category"></div>
        <div data-component="sidemenu-asset"></div>
      </div>
    `;
  }

  setState (newState) {
    this.$state = { ...this.$state, ...newState };

    const { event=null, assets=null, categories=null, cat=null, as=null } = newState;

    // console.log(this.$state);
    const { edit, asset, category } = this.$children;

    
    if (event) {
      edit.setState({ ...event });
    } else if (assets) {
      edit.setState({ assets });
    } else if (as) {
      asset.setState({ asset: as })
    } else if (categories) {
      asset.setState({ categories });
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

    const { insertEvent, editEvent, deleteEvent } = this.$props;
    const { insertAsset, editAsset, deleteAsset } = this.$props;

    this.$children = {
      header: new SideMenuHeader($sideMenuHeader, {}),
      edit: new SideMenuEdit($sideMenuEdit, {
        insertEvent, editEvent, deleteEvent,
      }),
      category: new SideMenuCategory($sideMenuCategory, {

      }),
      asset: new SideMenuAsset($sideMenuAsset, {
        insertAsset, editAsset, deleteAsset,
      }),
    }
    
  }
}