import Component from "../core/Components.js";

export default class Calendar extends Component {

  setup () {

  }

  template () {
    return `
      <div class="card-body b-l calender-sidebar">
          <div id="calendar"></div>
      </div>
    `;
  }

  mounted () {

    const calendarEl = this.$target.querySelector('#calendar');
    const calendar = new FullCalendar.Calendar(calendarEl, {
        height: '600px', // calendar 높이 설정
        expandRows: true, // 화면에 맞게 높이 재설정
        slotMinTime: '08:00', // Day 캘린더에서 시작 시간
        slotMaxTime: '20:00', // Day 캘린더에서 종료 시간
        // 헤더에 표시할 툴바
        headerToolbar: {
          left: 'prev,next today',
          center: 'title',
          right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
        },
        initialView: 'dayGridMonth', // 초기 로드 될 때 보이는 캘린더 화면 (기본 설정 : 달)
        initialDate: '2021-07-15', // 초기 날짜 설정 (설정안하면 default 오늘 날짜)
        navLinks: true, // 날짜를 선택하면 Day 캘린더나 Week 캘린더로 링크
        editable: true, // 수정 가능
        selectable: true, // 달력 일자 드래그 설정 가능
        nowIndicator: true, // 현재 시간 마크
        dayMaxEvents: true, // 이벤트가 오버되면 높이 제한 (+ 몇개식으로 표현)
        locale: 'ko', // 한국어 설정
        eventAdd: function (obj) {
          // 이벤트가 추가되면 발생하는 이벤트
          console.log(obj);
        },
        eventChange: function (obj) {
          // 이벤트가 수정되면 발생하는 이벤트
          console.log(obj);
        },
        eventRemove: function (obj) {
          // 이벤트가 삭제되면 발생하는 이벤트
          console.log(obj);
        },
        select: function (arg) {
          // 캘린더에서 드래그로 이벤트를 생성할 수 있음
          const title = prompt('Event Title:');
          if (title) {
            calendar.addEvent({
              title: title,
              start: arg.start,
              end: arg.end,
              allDay: arg.allDay
            });
          }
          calendar.unselect();
        },
        // 이벤트
        events: [{
          title: 'All Day Event',
          start: '2021-07-01',
        },
        {
          title: 'Long Event',
          start: '2021-07-07',
          end: '2021-07-10'
        },
        {
          groupId: 999,
          title: 'Repeating Event',
          start: '2021-07-09T16:00:00'
        },
        {
          groupId: 999,
          title: 'Repeating Event',
          start: '2021-07-16T16:00:00'
        },
        {
          title: 'Conference',
          start: '2021-07-11',
          end: '2021-07-13'
        },
        {
          title: 'Meeting',
          start: '2021-07-12T10:30:00',
          end: '2021-07-12T12:30:00'
        },
        {
          title: 'Lunch',
          start: '2021-07-12T12:00:00'
        },
        {
          title: 'Meeting',
          start: '2021-07-12T14:30:00'
        },
        {
          title: 'Happy Hour',
          start: '2021-07-12T17:30:00'
        },
        {
          title: 'Dinner',
          start: '2021-07-12T20:00:00'
        },
        {
          title: 'Birthday Party',
          start: '2021-07-13T07:00:00'
        },
        {
          title: 'Click for Google',
          url: 'http://google.com/', // 클릭시 해당 url로 이동
          start: '2021-07-28'
        }
      ]
    });
    // 캘린더 랜더링
    setTimeout(() => {
      calendar.render();
    }, 100);
  }

}