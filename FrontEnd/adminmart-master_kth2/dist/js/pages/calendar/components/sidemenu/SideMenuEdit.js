import Component from "../../core/Components.js";
import DateRangePicker from "./daterangepicker/DateRangePicker.js";

export default class SideMenuEdit extends Component {

  template () {
    return `
      <div class="col-12">
        <button type="button" class="btn btn-outline-dark btn-block mb-1">일정 등록</button>
        <input type="text" name="title" class="form-control text-center mb-1" placeholder="일정명">
        <input type="text" name="startDate" class="form-control form-control-sm text-center mb-1" placeholder="시작일">
        <input type="text" name="endDate" class="form-control form-control-sm text-center mb-1" placeholder="종료일">
        <div class="btn-group btn-group-sm d-flex">
          <button type="button" class="btn btn-outline-primary">수정</button>
          <button type="button" class="btn btn-outline-danger">삭제</button>
        </div>
      </div>
    `;
  } 

  setState (newState) {
    this.$state = { ...this.$state, ...newState };

    const { date=null, title=null } = this.$state;

    if (date || title) {
      if (date) {
        const { daterangepicker } = this.$children;
        daterangepicker.setState({ date });
      }
      console.log('test', title);
      if (title) {        
        const inputTitle = this.$target.querySelector('input[name="title"]');
        inputTitle.value = title;
      }
    } else {
      this.render();
    }
  }

  mounted () {
    this.$children = {
      daterangepicker: new DateRangePicker(document.getElementById('jquery'), {}),
    }
  }

}