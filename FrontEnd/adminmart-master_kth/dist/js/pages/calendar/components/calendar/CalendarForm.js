import Component from "../../core/Components.js";

export default class CalendarForm extends Component {

  setup () {

  }

  template () {
    return `
      <div class="row mb-3 border-bottom d-flex">
        <h4 class="card-title mr-auto mt-2">일정 등록</h4>
        <button class="btn btn-primary btn-small mr-2 mb-2">확인</button>
        <button class="btn btn-dark btn-small mr-2 mb-2">취소</button>
      </div>
      
      <form action="">
        <div class="row mb-3">
          <div class="col-9">
            <input type="text" class="form-control" id="calName" name="name" placeholder="일정명을 입력해주세요">
          </div>
          <div class="col-3">
            <div class="form-check">
              <label class="form-check-label">
                <input type="checkbox" class="form-check-input" name="private">비공개
              </label>
              <!-- 툴팁 -->
            </div>
          </div>
          </div>
          
          <div class="row mb-3">
          <div class="col-3">일정</div>
          <div class="col-6">
            <!-- daterangepicker -->
          </div>
          <div class="col-3">
            <div class="form-check">
              <label class="form-check-label">
                <input type="checkbox" class="form-check-input" name="isPublic">전사일정
              </label>
            </div>
          </div>
        </div>
        
        <div class="row mb-3">
          <div class="col-3">내 캘린더</div>
          <div class="col-6">
            <select name="myCalendar" id="myCalendar" class="custom-select">
              <option value="public">운영팀</option>
              <option value="basic" selected>(기본) 내 일</option>
            </select>
          </div>
          <div class="col-3">
            <button class="btn btn-info btn-sm">알람 추가</button>
          </div>
        </div>
        
        <div class="row mb-3">
          <div class="col-3">참석자
            <!-- 툴팁 -->
          </div>
          <div class="col-5">
            <ul class="list-group list-group-horizontal">
              <li class="list-group-item rounded-pill small">허은주 대표이사</li>
            </ul>
          </div>
          <div class="col-4 clearfix">
            <button class="btn btn-success btn-sm float-right">목록</button>
            <button class="btn btn-primary btn-sm float-right">선택</button>
            <button class="btn btn-dark btn-sm float-right">추가</button>
          </div>
        </div>

        <div class="row mb-3">
          <div class="col-3">장소</div>
          <div class="col-9">
            <input type="text" class="form-control" id="calLocation" name="location" placeholder="장소를 입력해주세요">
          </div>
        </div>

        <div class="row mb-3">
          <div class="col-3">내용</div>
          <div class="col-9">
            <textarea class="form-control" id="calContent" name="content" style="width: 100%; resize: none;" placeholder="내용을 입력해주세요" ></textarea>
          </div>
        </div>

        <div class="row mb-3">
          <div class="col-3">예약하기
            <!-- 툴팁 -->
          </div>
          <div class="col-9">
            <!-- 예약 상황 표시 -->
          </div>
        </div>     
        
        <div class="row mb-2">
          <!-- Nav pills -->
          <ul class="nav nav-pills">
            <li class="nav-item">
              <a href="#asset1" class="nav-link active" data-toggle="pill">본사 1층 회의실</a>
            </li>
            <li class="nav-item">
              <a href="#asset2" class="nav-link" data-toggle="pill">본사 6층 회의실</a>
            </li>
            <li class="nav-item">
              <a href="#asset3" class="nav-link" data-toggle="pill">빔 프로젝터</a>
            </li>
            <li class="nav-item">
              <a href="#asset4" class="nav-link" data-toggle="pill">빔 프로젝터2</a>
            </li>
          </ul>
        </div>

        <div class="row">
          <!-- Tab panes -->
          <div class="tab-content">
            <div class="tab-pane container active" id="asset1">
              <!-- table 형태로 자산 목록 표시 -->
              asset1
            </div>
            <div class="tab-pane container fade" id="asset2">
              <!-- table 형태로 자산 목록 표시 -->
              asset2
            </div>
            <div class="tab-pane container fade" id="asset3">
              <!-- table 형태로 자산 목록 표시 -->
              asset3
            </div>
            <div class="tab-pane container fade" id="asset4">
              <!-- table 형태로 자산 목록 표시 -->
              asset4
            </div>
          </div>
        </div>
      </form>
    `;
  }

}