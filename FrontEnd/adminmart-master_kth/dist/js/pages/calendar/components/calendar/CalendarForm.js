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
            <div class="custom-control custom-checkbox">
              <input type="checkbox" class="custom-control-input" id="private" name="private">
              <label class="custom-control-label" for="private">비공개</label>
            </div>
            <!-- 툴팁 -->
          </div>
        </div>
          
        <div class="row mb-3">
          <div class="col-2">일정</div>
          <div class="col-7">
            <!-- daterangepicker -->
            <input type="text" class="form-control" name="datetimes">
          </div>
          <div class="col-3">
            <div class="custom-control custom-checkbox">
              <input type="checkbox" class="custom-control-input" id="isAllday" name="isAllday">
              <label class="custom-control-label" for="isAllday">종일</label>
            </div>
            <div class="custom-control custom-checkbox">
              <input type="checkbox" class="custom-control-input" id="isPublic" name="isPublic">
              <label class="custom-control-label" for="isPublic">전사일정</label>
            </div>
          </div>
        </div>
        
        <div class="row mb-3">
          <div class="col-2">내 캘린더</div>
          <div class="col-4">
            <select name="myCalendar" id="myCalendar" class="custom-select">
              <option value="public">운영팀</option>
              <option value="basic" selected>(기본) 내 일</option>
            </select>
          </div>
          <div class="col-6">
            <div class="row">
              <div class="col-6 clearfix">
                <div class="custom-control custom-checkbox float-right">
                  <input type="checkbox" class="custom-control-input" id="isAlarm" name="isAlarm">
                  <label class="custom-control-label" for="isAlarm">미리알림</label>
                </div>
              </div>
              <div class="col-6">
                <select name="alarm" id="alarm" class="custom-select">
                  <option value="00:30" selected>15분 전</option>
                  <option value="00:30">30분 전</option>
                  <option value="01:00">1시간 전</option>
                  <option value="24:00">1일 전</option>
                  <option value="48:00">2일 전</option>
                </select>
              </div>
            </div>
          </div>
        </div>
        
        <div class="row mb-3">
          <div class="col-2">참석자
            <!-- 툴팁 -->
          </div>
          <div class="col-5">
            <ul class="list-group list-group-horizontal">
              <li class="list-group-item rounded-pill small">허은주 대표이사</li>
            </ul>
            <!-- 참석자 2인 이상이면 ~ 외 몇 명으로 표기 -->
          </div>
          <div class="col-5 clearfix">
            <button class="btn btn-success float-right">목록</button>
            <button class="btn btn-primary float-right mr-2">선택</button>
            <button class="btn btn-dark float-right mr-2">추가</button>
          </div>
        </div>

        <div class="row mb-3">
          <div class="col-2">장소</div>
          <div class="col-10">
            <input type="text" class="form-control" id="calLocation" name="location" placeholder="장소를 입력해주세요">
          </div>
        </div>

        <div class="row mb-3">
          <div class="col-2">내용</div>
          <div class="col-10">
            <textarea class="form-control" id="calContent" name="content" style="width: 100%; resize: none;" placeholder="내용을 입력해주세요" ></textarea>
          </div>
        </div>

        <div class="row mb-3">
          <div class="col-2 border-bottom">예약하기
            <!-- 툴팁 -->
          </div>
          <div class="col-6">
            <!-- Nav pills -->
            <ul class="nav nav-tabs">
              <li class="nav-item">
                <a href="#asset1" class="nav-link active" data-toggle="tab">회의</a>
              </li>
              <li class="nav-item">
                <a href="#asset2" class="nav-link" data-toggle="tab">기기</a>
              </li>
              <li class="nav-item">
                <a href="#asset3" class="nav-link" data-toggle="tab">휴식</a>
              </li>
              <li class="nav-item">
                <a href="#asset5" class="nav-link" data-toggle="tab">기타</a>
              </li>
            </ul>
          </div>
          <div class="col-4 border-bottom">
            <!-- 예약 상황 표시 -->
            <!-- 예약 : asset1 취소 이런 형태 -->
          </div>
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

  mounted () {

  }

}