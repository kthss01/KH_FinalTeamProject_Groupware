import Component from "../../core/Components.js";
import DateRangePicker from "./daterangepicker/DateRangePicker.js";

export default class SideMenuEdit extends Component {

  template () {
    return `
      <div class="col-12">
        <button id="addEventBtn" type="button" class="btn btn-outline-dark btn-block mb-1">일정 등록</button>
        <input type="hidden" name="id" class="form-control">
        <input type="text" name="title" class="form-control text-center mb-1" placeholder="일정명">
        <input type="text" name="startDate" class="form-control form-control-sm text-center mb-1" placeholder="시작일">
        <input type="text" name="endDate" class="form-control form-control-sm text-center mb-1" placeholder="종료일">
        <div class="btn-group btn-group-sm d-flex">
          <button id="editEventBtn" type="button" class="btn btn-outline-primary">수정</button>
          <button id="deleteEventBtn" type="button" class="btn btn-outline-danger">삭제</button>
        </div>
      </div>
    `;
  } 

  setState (newState) {
    this.$state = { ...this.$state, ...newState };

    const { id, title, start, end } = this.$state;

    // console.log(this.$state);

    if (title || start || end) {

      const { daterangepicker } = this.$children;
      daterangepicker.setState({ ...this.$state });

      const inputId = this.$target.querySelector('input[name="id"]');
      inputId.value = id;

      const inputTitle = this.$target.querySelector('input[name="title"]');
      inputTitle.value = title;
    
    } else {
      this.render();
    }

  }

  mounted () {
    this.$children = {
      daterangepicker: new DateRangePicker(document.getElementById('jquery'), {}),
    }
  }

  setEvent () {

    const { insertEvent, editEvent, deleteEvent } = this.$props;

    // 이벤트 생성
    this.addEvent('click', '#addEventBtn', ({ target }) => {
      const id = this.$target.querySelector('input[name="id"]').value;
      const title = this.$target.querySelector('input[name="title"]').value;
      const start = this.$target.querySelector('input[name="startDate"]').value;
      const end = this.$target.querySelector('input[name="endDate"]').value;

      console.log('add', id, title, start, end);

      insertEvent({ id:'', title, start, end });
    });

    // 이벤트 수정
    this.addEvent('click', '#editEventBtn', ({ target }) => {
      const id = this.$target.querySelector('input[name="id"]').value;
      const title = this.$target.querySelector('input[name="title"]').value;
      const start = this.$target.querySelector('input[name="startDate"]').value;
      const end = this.$target.querySelector('input[name="endDate"]').value;

      console.log('add', id, title, start, end);

      editEvent({ id, title, start, end });
    });

    // 이벤트 삭제
    this.addEvent('click', '#deleteEventBtn', ({ target }) => {
      const id = this.$target.querySelector('input[name="id"]').value;
      const title = this.$target.querySelector('input[name="title"]').value;
      const start = this.$target.querySelector('input[name="startDate"]').value;
      const end = this.$target.querySelector('input[name="endDate"]').value;

      console.log('add', id, title, start, end);

      deleteEvent({ id, title, start, end });
    });

  }

}