import Component from "../../core/Components.js";

export default class SideMenuHeader extends Component {

  template () {
    return `
      <h4 class="card-title font-weight-bold">예약</h4>
      <a href="/spring/reservation" class="btn btn-outline-dark btn-block mt-1" data-link>Home</a>
    `
  }

}