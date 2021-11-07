import Component from "../../core/Components.js";

export default class SideMenuCal extends Component {

  template () {
    return `
    <div class="col-12 pb-1 mb-2 border-bottom">
        <button id="addCalendarBtn" type="button" class="btn btn-outline-dark btn-block mb-1">캘린더 추가</button>
        <div id="editCalendarBtnGroup" class="btn-group d-none mb-1">
          <button id="editCalendarBtn" type="button" class="btn btn-outline-primary" disabled>수정</button>
          <button id="deleteCalendarBtn" type="button" class="btn btn-outline-danger" disabled>삭제</button>
        </div>
        <div class="input-group mb-1">
            <input type="text" class="form-control" placeholder="캘린더명" style="width: 90px;">
            <input type="color" class="form-control" value="#0275d8">
        </div>
    </div>
    
    <div class="col-12">
        <div class="input-group">
            <div class="input-group-prepend">
                <div class="input-group-text bg-white">
                    <input type="checkbox">
                </div>
            </div>
            <input type="text" class="form-control text-white text-center" style="cursor: pointer; background-color: #0275d8;" readonly value="기본 캘린더">
        </div>
    </div>
    `;
  }

}