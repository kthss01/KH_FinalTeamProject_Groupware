import Component from "../../core/Components.js";

export default class SideMenuLikeCal extends Component {

  template () {
    return `
      <div class="col-9">
          <button class="btn btn-link btn btn-block font-weight-bold text-left" data-toggle="collapse" data-target="#likeCalendar">관심 캘린더</button>
      </div>
      <div class="col-3">
          <button class="btn btn-outline-secondary btn-sm rounded-circle"><i class="fas fa-pencil-alt"></i></button>
      </div>
      <div class="col-12">
          <div id="likeCalendar" class="collapse show pl-2">
              <div class="custom-control custom-checkbox">
                  <input type="checkbox" class="custom-control-input" id="customCheck2" name="example1">
                  <label class="custom-control-label" for="customCheck2">전체</label>
              </div>
              <div class="custom-control custom-checkbox">
                  <div class="row">
                      <div class="col-10">
                          <input type="checkbox" class="custom-control-input" id="customCheck3" name="example1">
                          <label class="custom-control-label" for="customCheck3">다른 일정 (부서)</label>
                      </div>
                      <div class="col-2">
                          <i class="fa fa-circle" style="color: rgba(64, 64, 228, 0.712);"></i>
                      </div>
                  </div>
              </div>
              <div class="custom-control custom-checkbox">
                  <div class="row">
                      <div class="col-10">
                          <input type="checkbox" class="custom-control-input" id="customCheck4" name="example1">
                          <label class="custom-control-label" for="customCheck4">다른 일정 (사원)</label>
                      </div>
                      <div class="col-2">
                          <i class="fa fa-circle" style="color: rgba(255, 192, 224, 0.712);"></i>
                      </div>
                  </div>
              </div>
          </div>
      </div>
      <div class="col-12 mt-1 pl-4">
          <button class="btn btn-link btn-sm btn-block text-muted text-left">+ 관심 캘린더 추가</button>
      </div>
    `;
  }

}