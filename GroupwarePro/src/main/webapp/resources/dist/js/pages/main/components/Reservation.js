import Component from "../core/Components.js";
import axios from '../axios.js'

export default class Reservation extends Component {

  setup () {
    // fullcalendar 설정
    this.config = {
      contentHeight: 225,
      headerToolbar: {
        start: 'title',
        center: 'listMonth',
        end: 'today prev,next',
      },
      expandRows: true, // 화면에 맞게 높이 재설정
      slotMinTime: '07:00', // Day 캘린더에서 시작 시간
      slotMaxTime: '24:00', // Day 캘린더에서 종료 시간
      initialView: 'listMonth', // 초기 로드 될 때 보이는 캘린더 화면 (기본 설정 : 달)
      navLinks: true, // 날짜를 선택하면 Day 캘린더나 Week 캘린더로 링크
      nowIndicator: true, // 현재 시간 마크
      dayMaxEvents: true, // 이벤트가 오버되면 높이 제한 (+ 몇개식으로 표현)
      locale: 'ko', // 한국어 설정
      allDayMaintainDuration: true,
      resourceAreaHeaderContent: '자산 목록',
      resourceGroupField: 'category',
      schedulerLicenseKey: 'CC-Attribution-NonCommercial-NoDerivatives'
    };

    // fullcalendar-scheduler 객체 생성
    this.$calendar = new FullCalendar.Calendar(this.$target, this.config);

    // 이벤트 DB로부터 읽어오는 함수
    this.readEvents = async () => {
      try {
        const res = await axios.get(`selectRezList.rez`);

        res.data.forEach((as) => {
          const resource = this.$calendar.getResourceById(as.asNo);
          // resource 없으면 continue
          if (!resource)
            return true;

          const title = `${resource.title}(${resource.extendedProps.category}) - ${as.name}`;

          const event = {
            id: as.rezNo,
            title: title,
            start: as.startDate,
            end: as.endDate,
            allDay: as.allDay === '1' ? true: false,
            backgroundColor: resource.extendedProps.color,
            resourceId: resource.id,
            overlap: false,
            extendedProps: {
              empNo: as.empNo,
              empName: as.empName,
            },
          };

          if (empNo !== as.empNo) {
              event.display = 'background';
          }

          this.$calendar.addEvent(event);
        });
      } catch (err) {
        console.log(err);
      }
    }

    // 캘린더 DB로부터 읽어오는 함수
    this.readAssets = async () => {
      try {
        const res = await axios.get(`selectAsWithCatList.rez`);

        res.data.forEach((asset) => {
          this.$calendar.addResource({
            id: asset.asNo,
            category: asset.category.name,
            title: asset.name,
            extendedProps: {
              ascNo: asset.ascNo,
              color: asset.color,
            },
          });
        });

      } catch (err) {
        console.log(err);
      }
    }

    this.readCategories = async () => {
      try {
        const res = await axios.get(`selectAsCatList.rez`);

        this.categories = res.data;
      } catch (err) {
        console.log(err);
      }
    }

    // 캘린더 렌더를 위한 함수
    this.loadCalendar = async () => {
      try {
        await this.readCategories();
        await this.readAssets();
        await this.readEvents(); // resource id에 calNo를 넣음

        // fullcalendar 렌더
        this.$calendar.render();
      } catch (err) {
        console.log(err);
      }
    }
  }

  render () {
    this.$target.innerHTML = this.template();

    this.loadCalendar();

    this.mounted(); 
  }
}