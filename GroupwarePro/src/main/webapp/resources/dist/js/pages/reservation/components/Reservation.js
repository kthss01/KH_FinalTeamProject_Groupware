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
      resourceAreaHeaderContent: '자산 목록',
      resourceGroupField: 'category',
      resourceAreaWidth: "20%",
      selectOverlap: function(event) {
        return event.rendering === 'background';
      },
      schedulerLicenseKey: 'CC-Attribution-NonCommercial-NoDerivatives'
    };

    // fullcalendar-scheduler 객체 생성
    this.$calendar = new FullCalendar.Calendar(this.$target, this.config);

    // 예약 DB로부터 읽어오는 함수
    this.readEvents = async () => {
      try {
        // axios를 이용하여 DB로부터 예약 조회
        const res = await axios.get(`selectRezList.rez`);

        res.data.forEach((as) => {
          const resource = this.$calendar.getResourceById(as.asNo);
          // resource 없으면 continue
          if (!resource)
            return true;

          const event = {
            id: as.rezNo,
            title: as.name,
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

    // 자산 DB로부터 읽어오는 함수
    this.readAssets = async () => {
      try {
        // axios를 이용하여 DB 자산 조회
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

    // 자산목록 DB로부터 읽어오는 함수
    this.readCategories = async () => {
      try {
        // axios를 이용하여 DB 자산목록 조회
        const res = await axios.get(`selectAsCatList.rez`);

        this.categories = res.data;
      } catch (err) {
        console.log(err);
      }
    }

    // 캘린더 렌더를 위한 함수
    this.loadCalendar = async () => {
      try {
        const { renderAsset, renderCategories } = this.$props;
  
        await this.readCategories();
        await this.readAssets();
        await this.readEvents(); // resource id에 calNo를 넣음

        renderCategories({ categories: this.categories });
        renderAsset({ assets: this.$calendar.getResources() });

        // fullcalendar 렌더
        this.$calendar.render();
      } catch (err) {
        console.log(err);
      }
    }
  }

  setState (newState) {
    this.$state = { ...this.$state, ...newState };

    const { event=null, asset=null, category=null, status } = newState;
    const { renderAsset, renderCategories } = this.$props;

    // 예약 상태 변경시
    if (event) {
      const resource = this.$calendar.getResourceById(event.asNo);

      switch (status) {
        // 예약 추가
        case 'insert':
          this.$calendar.addEvent({
            id: event.id,
            title: event.title,
            start: event.start,
            end: event.end,
            allDay: event.allDay,
            backgroundColor: resource.extendedProps.color,
            overlap: false,
            extendedProps: {
              empNo: event.empNo,
              empName: event.empName,
            },
          });

          this.$calendar.getEventById(event.id).setResources([resource]);
        break;
        // 예약 수정
        case 'update':
          const evt = this.$calendar.getEventById(event.id);
          evt.setProp("title", event.title);
          evt.setDates(event.start, event.end);
          evt.setAllDay(event.allDay);
          evt.setProp('backgroundColor', resource.extendedProps.color);

          this.$calendar.getEventById(event.id).setResources([resource]);
        break;
        // 예약 삭제
        case 'delete':
          this.$calendar.getEventById(event.id).remove();
        break;
      }

      renderAsset({ assets: this.$calendar.getResources() });
    // 자산 상태 변경시
    } else if (asset) {
      const resource = this.$calendar.getResourceById(asset.asNo);

      switch (status) {
        // 자산 추가
        case 'insert':
          this.$calendar.addResource({
            id: asset.asNo,
            category: asset.ascName,
            title: asset.name,
            extendedProps: {
              ascNo: asset.ascNo,
              color: asset.color,
            },
          });
        break;
        // 자산 수정
        case 'update':
          resource.setProp('title', asset.name);
          resource.setProp('category', asset.ascName);
          resource.setExtendedProp('color', asset.color);
          resource.setExtendedProp('ascNo', asset.ascNo);

          resource.extendedProps.icon.style.color = asset.color;

          resource.getEvents().forEach((event) => {
            event.setProp('backgroundColor', asset.color);
          });
        break;
        // 자산삭제
        case 'delete':
          resource.getEvents().forEach((event) => {
            event.remove();
          })
          resource.remove();
        break;
      }

      this.$calendar.refetchResources();

      renderAsset({ assets: this.$calendar.getResources() });
    // 자산목록 상태 변경시
    } else if (category) {
      const resources = this.$calendar.getResources().filter(resource => resource.extendedProps.ascNo == category.ascNo);

      switch (status) {
        // 자산목록 추가
        case 'insert':
          this.categories.push(category);
        break;

        // 자산목록 수정
        case 'update':
          const cat = this.categories.find(cat => cat.ascNo == category.ascNo);
          cat.name = category.name;
          cat.el.groupValue = category.name;
          cat.el.querySelector('.fc-datagrid-cell-main').textContent = category.name;
          resources.forEach(resource => {
            resource.category = category.name;
          });
        break;

        // 자산목록 삭제
        case 'delete':
          this.categories = this.categories.filter(cat => cat.ascNo != category.ascNo);
          resources.forEach(resource => {
            resource.getEvents().forEach((event) => {
              event.remove();
            })
            resource.remove();
          });
        break;
      }

      this.$calendar.refetchResources();

      renderCategories({ categories: this.categories });
    } else {
      this.render();
    }      
  }

  render () {
    this.$target.innerHTML = this.template();

    this.loadCalendar();

    this.mounted(); 
  }

  setEvent () {
    const { selectEvent, editEvent, selectAsset, selectCategory } = this.$props;

    // 예약 생성
    this.$calendar.on('select', (info) => {
      selectEvent({
        id: '',
        title: '',
        start: info.start,
        end: info.end,
        allDay: info.allDay,
        asNo: info.resource.id,
      });
    });

    // 예약 조회
    this.$calendar.on('eventClick', (info) => {
      const resources = this.$calendar.getEventById(info.event.id).getResources();

      selectEvent({
        id: info.event.id,
        title: info.event.title,
        start: info.event.start,
        end: info.event.end,
        allDay: info.event.allDay,
        asNo: resources[0].id,
        display: info.event.display,
        empName: info.event.extendedProps.empName,
      })
    });
  
    // 이벤트 드랍 (예약에서 드래그로 이동)
    this.$calendar.on('eventDrop', (info) => {
      const { id, title, start, end, allDay } = info.event;
      const { id: asNo } = info.event.getResources()[0];

      editEvent({
        id, title, start, end, allDay, asNo,
      });
    });

    // 이벤트 리사이즈 (예약에서 이벤트 기간 조정)
    this.$calendar.on('eventResize', (info) => {
      const { id, title, start, end, allDay } = info.event;
      const { id: asNo } = info.event.getResources()[0];

      editEvent({
        id, title, start, end, allDay, asNo,
      });
    });

    // 자산 조회
    this.$calendar.setOption('resourceLabelDidMount', (arg) => {
      const resource = this.$calendar.getResourceById(arg.resource.id);

      const { id, title, } = resource;
      const { ascNo, color, category, } = resource.extendedProps;

      const tag = arg.el.querySelector('.fc-icon');
      const icon = document.createElement("i");
      icon.style.color = color;
      icon.classList.add("fa", "fa-circle");
      tag.appendChild(icon);

      resource.setExtendedProp("icon", icon);

      arg.el.addEventListener('click', () => {
        selectAsset({
          id, title, color, ascNo, category, 
        });
      })
    });

    // 카테고리 조회
    this.$calendar.setOption('resourceGroupLabelDidMount', (arg) => {
      const category = this.categories.find((category) => category.name === arg.groupValue);
      category.el = arg.el;

      arg.el.addEventListener('click', () => {
        const category = this.categories.find((category) => category.el === arg.el);
        const name = category.name;
        const ascNo = category.ascNo;

        selectCategory({
          name, ascNo
        });
      })
    });
  }
}