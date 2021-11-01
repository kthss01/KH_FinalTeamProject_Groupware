import Component from "../../core/Components.js";

export default class SideMenuPubCal extends Component {

  template () {
    return `
      <div class="col-12">
          <div class="custom-control custom-checkbox">
              <div class="row pl-2">
                  <div class="col-10">
                      <input type="checkbox" class="custom-control-input" id="customCheck5" name="example1">
                      <label class="custom-control-label" for="customCheck5">전사 일정</label>
                  </div>
                  <div class="col-2">
                      <i class="fa fa-circle" style="color: rgba(165, 42, 42, 0.699)"></i>
                  </div>
              </div>
          </div>
          <div class="custom-control custom-checkbox">
              <div class="row pl-2">
                  <div class="col-10">
                      <input type="checkbox" class="custom-control-input" id="customCheck6" name="example1">
                      <label class="custom-control-label" for="customCheck6">임원 일정</label>
                  </div>
                  <div class="col-2">
                      <i class="fa fa-circle" style="color: rgba(131, 233, 30, 0.712)"></i>
                  </div>
              </div>
          </div>
      </div>
    `
  }

}