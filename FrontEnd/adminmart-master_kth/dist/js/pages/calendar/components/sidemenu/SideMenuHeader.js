import Component from "../../core/Components.js";

export default class SideMenuHeader extends Component {

  template () {
    return `
      <h4 class="card-title mt-2 font-weight-bold">캘린더</h4>
      <button class="btn btn-outline-dark btn-block">일정 등록</button>
    `
  }

}