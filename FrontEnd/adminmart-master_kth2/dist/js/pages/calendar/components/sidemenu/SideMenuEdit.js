import Component from "../../core/Components.js";
import DateRangePicker from "./daterangepicker/DateRangePicker.js";

export default class SideMenuEdit extends Component {

  template () {
    return `
      <div class="col-12">
        <button id="addEventBtn" type="button" class="btn btn-outline-dark btn-block mb-1">일정 등록</button>
        <div id="editEventBtnGroup" class="btn-group d-none mb-1">
          <button id="editEventBtn" type="button" class="btn btn-outline-primary" disabled>수정</button>
          <button id="deleteEventBtn" type="button" class="btn btn-outline-danger" disabled>삭제</button>
        </div>
        <select name="calendar" class="custom-select custom-select-sm mb-1">
          <option selected value="1">기본 캘린더</option>
          <option value="2">부서 캘린더</option>
          <option value="3">전사 캘린더</option>
        </select>
        <input type="hidden" name="id" class="form-control">
        <input type="text" name="title" class="form-control form-control-sm text-center mb-1" placeholder="일정명">
        <div class="custom-control custom-control-sm custom-checkbox">
          <input type="checkbox" class="custom-control-input" name="allDay" id="allDayCheck">
          <label class="custom-control-label" for="allDayCheck">AllDay</label>
        </div>
        <input type="text" name="startDate" class="form-control form-control-sm text-center mb-1" placeholder="시작일">
        <input type="text" name="endDate" class="form-control form-control-sm text-center mb-1" placeholder="종료일">
      </div>
    `;
  } 

  setState (newState) {
    this.$state = { ...this.$state, ...newState };

    const { id, title, start, end, allDay } = this.$state;

    console.log(this.$state);

    if (title || start || end) {
      const editEventBtnGroup = this.$target.querySelector('#editEventBtnGroup');
      const addEventBtn = this.$target.querySelector('#addEventBtn');

      if (id === '') {
        addEventBtn.classList.remove("d-none");
        editEventBtnGroup.classList.remove("d-flex");
        editEventBtnGroup.classList.add("d-none");
      } else {
        addEventBtn.classList.add("d-none");
        editEventBtnGroup.classList.remove("d-none");
        editEventBtnGroup.classList.add("d-flex");
      }

      const { daterangepicker } = this.$children;
      daterangepicker.setState({ ...this.$state });

      const inputId = this.$target.querySelector('input[name="id"]');
      inputId.value = id;

      const inputTitle = this.$target.querySelector('input[name="title"]');
      inputTitle.value = title;

      const checkAllDay = this.$target.querySelector('input[name="allDay"]');
      checkAllDay.checked = allDay;
    
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
      const allDay = this.$target.querySelector('input[name="allDay"]').checked;

      // console.log('add', id, title, start, end);

      insertEvent({ id:'', title, start, end, allDay });
    });

    // 이벤트 수정
    this.addEvent('click', '#editEventBtn', ({ target }) => {
      const id = this.$target.querySelector('input[name="id"]').value;
      const title = this.$target.querySelector('input[name="title"]').value;
      const start = this.$target.querySelector('input[name="startDate"]').value;
      const end = this.$target.querySelector('input[name="endDate"]').value;
      const allDay = this.$target.querySelector('input[name="allDay"]').checked;

      console.log('edit', id, title, start, end, allDay);

      editEvent({ id, title, start, end, allDay });
    });

    // 이벤트 삭제
    this.addEvent('click', '#deleteEventBtn', ({ target }) => {
      const id = this.$target.querySelector('input[name="id"]').value;
      const title = this.$target.querySelector('input[name="title"]').value;
      const start = this.$target.querySelector('input[name="startDate"]').value;
      const end = this.$target.querySelector('input[name="endDate"]').value;
      const allDay = this.$target.querySelector('input[name="allDay"]').checked;

      // console.log('delete', id, title, start, end);

      deleteEvent({ id, title, start, end, allDay });
    });

  }

}