import Component from "../core/Components.js";
import axios from '../axios.js'

export default class Reservation extends Component {

    setup () {
        // fullcalendar 설정
        this.config = {
            height: '625px', // calendar 높이 설정
            expandRows: true, // 화면에 맞게 높이 재설정
            slotMinTime: '07:00', // Day 캘린더에서 시작 시간
            slotMaxTime: '24:00', // Day 캘린더에서 종료 시간
            // 헤더에 표시할 툴바
            headerToolbar: {
                start: 'resourceTimelineDay,resourceTimelineWeek,resourceTimelineMonth',
                center: 'title',
                end: 'prev,today,next'
                },
                buttonText: {
                day: '일간',
                week: '주간',
                month: '월간',
            },
            views: {
                resourceTimelineDay: {
                    titleFormat: { year: '2-digit', month: 'numeric', day: 'numeric', weekday: 'short' },
                },
                resourceTimelineWeek: { 
                    titleFormat: { month: 'numeric', day: 'numeric' },
                },
            },
            initialView: 'resourceTimelineDay', // 초기 로드 될 때 보이는 캘린더 화면 (기본 설정 : 달)
            navLinks: true, // 날짜를 선택하면 Day 캘린더나 Week 캘린더로 링크
            editable: true, // 수정 가능
            selectable: true, // 달력 일자 드래그 설정 가능
            nowIndicator: true, // 현재 시간 마크
            dayMaxEvents: true, // 이벤트가 오버되면 높이 제한 (+ 몇개식으로 표현)
            locale: 'ko', // 한국어 설정
            allDayMaintainDuration: true,
            resourceAreaHeaderContent: '예약 목록',
            resourceGroupField: 'category',
            // 임시
            resources: [
              { id: 'a', category: '장소1', title: '회의실 A' },
              { id: 'b', category: '장소1', title: '회의실 B' },
              { id: 'c', category: '장소2', title: '회의실 C' },
              { id: 'd', category: '장소2', title: '회의실 D' },
              { id: 'e', category: '장소3', title: '회의실 E' },
              { id: 'f', category: '장소3', title: '회의실 F' },
              { id: 'g', category: '장소3', title: '회의실 G' },
            ],
            schedulerLicenseKey: 'CC-Attribution-NonCommercial-NoDerivatives'
        };

        // fullcalendar-scheduler 객체 생성
        this.$calendar = new FullCalendar.Calendar(this.$target, this.config);

        
    }

    setState (newState) {
        this.$state = { ...this.$state, ...newState };
        this.render();
    }

    render () {
        this.$target.innerHTML = this.template();
        this.mounted(); 
    }

    mounted () {
        setTimeout(() => {
            this.$calendar.render();
        }, 100);
    }

    setEvent () {

    }
}