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
          selectOverlap: function(event) {
            return event.rendering === 'background';
          },
          schedulerLicenseKey: 'CC-Attribution-NonCommercial-NoDerivatives'
      };

      // fullcalendar-scheduler 객체 생성
      this.$calendar = new FullCalendar.Calendar(this.$target, this.config);

    // 이벤트 DB로부터 읽어오는 함수
      this.readEvents = async () => {
        try {
              const res = await axios.get(`selectRezList.rez`);
              // console.log(res.data);
  
              res.data.forEach((as) => {
                const resource = this.$calendar.getResourceById(as.asNo);
                // console.log(as, resource);
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
                // console.log(event);

                const empNo = 201; // 임시
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
  
          // console.log(res.data);
  
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

          // console.log(this.categories);

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
    
          // console.log(this.$calendar.getResources());
    
          renderCategories({ categories: this.categories });

          renderAsset({ assets: this.$calendar.getResources() });
  
          await this.readEvents(); // resource id에 calNo를 넣음
  
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
  
      // console.log(status, asset);
  
      if (event) {
  
        // console.log(status);
        // console.log(event);
        
        const resource = this.$calendar.getResourceById(event.asNo);
        // console.log(resource);

        switch (status) {
          case 'insert':
            // console.log('insert', event);

            this.$calendar.addEvent( {
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
            } );

            this.$calendar.getEventById(event.id).setResources([resource]);
          break;
          case 'update':
            const evt = this.$calendar.getEventById(event.id);
            evt.setProp("title", event.title);
            evt.setDates(event.start, event.end);
            evt.setAllDay(event.allDay);
            evt.setProp('backgroundColor', resource.extendedProps.color);

            this.$calendar.getEventById(event.id).setResources([resource]);
          break;
          case 'delete':
            this.$calendar.getEventById(event.id).remove();
          break;
        }
  
        // console.log(this.$calendar);
  
      } else if (asset) {
        const resource = this.$calendar.getResourceById(asset.asNo);
  
        switch (status) {
          case 'insert':
            // console.log(asset);
            // console.log(this.$calendar.getResources());
            this.$calendar.addResource({
              id: asset.asNo,
              category: asset.ascName,
              title: asset.name,
              extendedProps: {
                ascNo: asset.ascNo,
                color: asset.color,
              },
            });
            // console.log(this.$calendar.getResources());
          break;

          case 'update':
            resource.setProp('title', asset.name);
            resource.setProp('category', asset.ascName);
            resource.setExtendedProp('color', asset.color);
            resource.setExtendedProp('ascNo', asset.ascNo);
  
            resource.getEvents().forEach((event) => {
              event.setProp('backgroundColor', asset.color);
            });
          break;

          case 'delete':
            resource.getEvents().forEach((event) => {
              event.remove();
            })
            resource.remove();
          break;
        }
  
        this.$calendar.refetchResources();

        renderAsset({ assets: this.$calendar.getResources() });
      } else if (category) {
        // console.log(category);
        // console.log(this.$calendar.getResources());
        const resources = this.$calendar.getResources().filter(resource => resource.extendedProps.ascNo == category.ascNo);
        // console.log(resources);

        switch (status) {
          case 'insert':
            // console.log(this.categories);
            this.categories.push(category);
          break;

          case 'update':
            const cat = this.categories.find(cat => cat.ascNo == category.ascNo);
            cat.name = category.name;
            cat.el.groupValue = category.name;
            cat.el.querySelector('.fc-datagrid-cell-main').textContent = category.name;
            resources.forEach(resource => {
              resource.category = category.name;
            });
          break;

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

    mounted () {

    }

    setEvent () {
      const { selectEvent, editEvent, selectAsset, selectCategory } = this.$props;

      // 이벤트 생성
      this.$calendar.on('select', (info) => {
  
        // console.log(info);
  
        selectEvent({
          id: '',
          title: '',
          start: info.start,
          end: info.end,
          allDay: info.allDay,
          asNo: info.resource.id,
        });
      });
  
      // 이벤트 조회
      this.$calendar.on('eventClick', (info) => {
  
        // console.log(info.event);
        const resources = this.$calendar.getEventById(info.event.id).getResources();
        // console.log(resources);
  
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
    
      // 이벤트 드랍 (일정에서 드래그로 이동)
      this.$calendar.on('eventDrop', (info) => {
        const { id, title, start, end, allDay } = info.event;
        const { id: asNo } = info.event.getResources()[0];
        // console.log('eventDrop', id, title, start, end, allDay, asNo);
  
        editEvent({
          id, title, start, end, allDay, asNo,
        });
      });
  
      // 이벤트 리사이즈 (일정에서 이벤트 기간 조정)
      this.$calendar.on('eventResize', (info) => {
        const { id, title, start, end, allDay } = info.event;
        const { id: asNo } = info.event.getResources()[0];
        // console.log('eventResize', id, title, start, end, allDay, asNo);
  
        editEvent({
          id, title, start, end, allDay, asNo,
        });
      });

      // 자산 조회
      this.$calendar.setOption('resourceLabelDidMount', (arg) => {
        arg.el.addEventListener('click', () => {
          // console.log(arg.resource);

          const resource = this.$calendar.getResourceById(arg.resource.id);

          const { id, title, } = resource;
          const { ascNo, color, category, } = resource.extendedProps;
          // console.log(id, title, category, ascNo, color);

          selectAsset({
            id, title, color, ascNo, category, 
          });
        })
      });

      // 카테고리 조회
      this.$calendar.setOption('resourceGroupLabelDidMount', (arg) => {
        // console.log('category mount');
        const category = this.categories.find((category) => category.name === arg.groupValue);
        category.el = arg.el;

        arg.el.addEventListener('click', () => {
          // console.log(arg);
          // console.log(arg.groupValue);

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