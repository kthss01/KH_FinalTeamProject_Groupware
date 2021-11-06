import Component from "../../core/Components.js";

export default class SideMenuMyCal extends Component {

  template () {
    return `
      <div class="col-9">
          <button class="btn btn-link btn btn-block font-weight-bold text-left" data-toggle="collapse" data-target="#myCalendar">내 캘린더</button>
      </div>
      <div class="col-3">
          <button class="btn btn-outline-secondary btn-sm rounded-circle"><i class="fas fa-pencil-alt"></i></button>
      </div>
      <div class="col-12">
          <div id="myCalendar" class="collapse show pl-2">
              <div class="custom-control custom-checkbox">
                  <div class="row">
                      <div class="col-10">
                          <input type="checkbox" class="custom-control-input" id="customCheck" name="example1">
                          <label class="custom-control-label" for="customCheck">내 일정 (기본)</label>
                      </div>
                      <div class="col-2">
                          <i class="fa fa-circle" style="color: rgba(12, 160, 12, 0.705);"></i>
                      </div>
                  </div>
              </div>
          </div>
      </div>
      <div class="col-12 mt-1 pl-4">
          <button class="btn btn-link btn-sm btn-block text-muted text-left">+ 내 캘린더 추가</button>
      </div>
    `;
  }

}