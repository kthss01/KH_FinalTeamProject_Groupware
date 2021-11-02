import Component from "../../core/Components.js";

export default class SideMenuHeader extends Component {

  template () {
    return `
      <h4 class="card-title mt-2 font-weight-bold">캘린더</h4>
      <a href="/enroll" class="btn btn-outline-dark btn-block" data-link>일정 등록</a>
    `
  }

}