import Component from "../../core/Components.js";

export default class SideMenuCal extends Component {

  setup() {
    this.calendarTemplate = (calendar) => {
      return `
      <div class="col-12 mb-2">
          <div class="input-group">
              <div class="input-group-prepend">
                  <div class="input-group-text bg-white">
                      <input type="checkbox">
                  </div>
              </div>
              <input type="hidden" name="calNo" value="${calendar.calNo}">
              <button class="btn btn-sm text-white text-center calMenu" style="background-color: ${calendar.color}; width: 120px; transition: all .35s; opacity: 0.75;">${calendar.name}</button>
          </div>
      </div>
      `;
    };
  }

  template () {
    return `
    <div class="col-12 pb-1 mb-2 border-bottom">
        <button id="addCalendarBtn" type="button" class="btn btn-outline-dark btn-block mb-1">캘린더 추가</button>
        <div id="editCalendarBtnGroup" class="btn-group d-none mb-1">
          <button id="editCalendarBtn" type="button" class="btn btn-outline-primary">수정</button>
          <button id="cancelCalendarBtn" type="button" class="btn btn-outline-dark"><i class="far fa-hand-point-up"></i></button>
          <button id="deleteCalendarBtn" type="button" class="btn btn-outline-danger">삭제</button>
        </div>
        <div class="input-group mb-1">
            <input type="hidden" id="calNo">
            <input type="text" id="name" class="form-control" placeholder="캘린더명" style="width: 100px;">
            <input type="color" id="color" class="form-control p-1" value="#0275d8">
        </div>
    </div>
    `;
  }

  setState (newState) {
    this.$state = { ...this.$state, ...newState };

    const { calendars } = this.$state;

    this.render(calendars);
  }

  render (calendars) {
    this.$target.innerHTML = this.template();

    if (calendars) {
      // console.log(calendars);
      this.$target.innerHTML += calendars.map(calendar => {
        return this.calendarTemplate(calendar);
      }).join('');
    }

    this.mounted(); 
  }

  setEvent () {
    // 캘린더 템플릿 Hover Event
    this.addEvent('mouseover', '.calMenu', ({ target }) => {
      // console.log(target, 'mouseover target');
      target.style.opacity= 1;
    });
    this.addEvent('mouseout', '.calMenu', ({ target }) => {
      // console.log(target, 'mouseout target');
      target.style.opacity= 0.75;
    });

    const rgb2hex = (rgb) => `#${rgb.match(/^rgb\((\d+),\s*(\d+),\s*(\d+)\)$/).slice(1).map(n => parseInt(n, 10).toString(16).padStart(2, '0')).join('')}`

    // 캘린더 선택
    this.addEvent('click', '.calMenu', ({ target }) => {
      // console.log(target, 'calMenu select');
      const calNo = target.previousElementSibling.value;
      const name = target.innerText;
      const color = target.style.backgroundColor;
      
      // console.log(calNo, name, color);

      this.$target.querySelector('#calNo').value = calNo;
      this.$target.querySelector('#name').value = name;
      this.$target.querySelector('#color').value = rgb2hex(color);

      const editCalendarBtnGroup = this.$target.querySelector('#editCalendarBtnGroup');
      const addCalendarBtn = this.$target.querySelector('#addCalendarBtn');

      addCalendarBtn.classList.add("d-none");
      editCalendarBtnGroup.classList.remove("d-none");
      editCalendarBtnGroup.classList.add("d-flex");
    });

    const { insertCalendar, editCalendar, deleteCalendar } = this.$props;

    // 캘린더 추가
    this.addEvent('click', '#addCalendarBtn', ({ target }) => {
      // console.log('addCalendarBtn');

      const calNo = this.$target.querySelector('#calNo').value;
      const name = this.$target.querySelector('#name').value;
      const color = this.$target.querySelector('#color').value;
      
      // console.log(calNo, name, color);

      insertCalendar({ calNo, name, color });
    });

    // 캘린더 수정
    this.addEvent('click', '#editCalendarBtn', ({ target }) => {
      // console.log('editCalendarBtn');

      const calNo = this.$target.querySelector('#calNo').value;
      const name = this.$target.querySelector('#name').value;
      const color = this.$target.querySelector('#color').value;

      editCalendar({ calNo, name, color });
    });

    // 캘린더 삭제
    this.addEvent('click', '#deleteCalendarBtn', ({ target }) => {
      // console.log('deleteCalendarBtn');

      const calNo = this.$target.querySelector('#calNo').value;
      const name = this.$target.querySelector('#name').value;
      const color = this.$target.querySelector('#color').value;

      deleteCalendar({ calNo, name, color });
    });

    // 이벤트 등록버튼으로 되돌리기
    this.addEvent('click', '#cancelCalendarBtn', ({ target }) => {
      const editCalendarBtnGroup = this.$target.querySelector('#editCalendarBtnGroup');
      const addCalendarBtn = this.$target.querySelector('#addCalendarBtn');

      addCalendarBtn.classList.remove("d-none");
      editCalendarBtnGroup.classList.remove("d-flex");
      editCalendarBtnGroup.classList.add("d-none");
    });
  }
}