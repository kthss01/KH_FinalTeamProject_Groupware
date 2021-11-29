import Component from './core/Components.js';
import SideMenu from './components/SideMenu.js';
import axios from './axios.js'

export default class App extends Component {

    setup() {
      // router 설정
      this.router = this.$props.router;
      this.router.setApp(this);

      this.$state = {
      };
    }

    template () {
        return `
        <div class="col-lg-3 border-right pr-0" data-component="reservation-sidemenu"></div>
        <div class="col-lg-9">
            <div class="card-body">
                <div id="calendar" data-component="reservation-main"></div>
            </div>
        </div>
        `;
    }

    setState (newState) {
      this.$state = { ...this.$state, ...newState };

      const { isRoute=null, url=null } = newState;

      // route 상태 변경시
      if (isRoute) {
        const $reservationMain = this.$target.querySelector('[data-component="reservation-main"]');
        const Component = this.router.router();

        const index = url.indexOf('reservation/');
        const id = index !== -1 ?  url.substring(index + 'reservation/'.length) : -1;

        const { selectEvent, insertEvent, editEvent, deleteEvent } = this;
        const { renderAsset, selectAsset, insertAsset, editAsset, deleteAsset } = this;
        const { renderCategories, selectCategory, insertCategory, editCategory, deleteCategory } = this;

        this.$children.calendar = new Component($reservationMain, {
            ...this.$state,
            selectEvent: selectEvent.bind(this),
            editEvent: editEvent.bind(this),
            renderAsset: renderAsset.bind(this),
            selectAsset: selectAsset.bind(this),
            renderCategories: renderCategories.bind(this),
            selectCategory: selectCategory.bind(this),
            ascNo: id,
        });
      } else {
        this.render();
      }
    }

    mounted () {
      const $reservationSidemenu = this.$target.querySelector('[data-component="reservation-sidemenu"]');
      const $reservationMain = this.$target.querySelector('[data-component="reservation-main"]');
      const Component = this.router.router();

      const { selectEvent, insertEvent, editEvent, deleteEvent } = this;
      const { renderAsset, selectAsset, insertAsset, editAsset, deleteAsset } = this;
      const { renderCategories, selectCategory, insertCategory, editCategory, deleteCategory } = this;

      this.$children = {
        sideMenu: new SideMenu($reservationSidemenu, {
            ...this.$state,
            insertEvent: insertEvent.bind(this),
            editEvent: editEvent.bind(this),
            deleteEvent: deleteEvent.bind(this),
            insertAsset: insertAsset.bind(this),
            editAsset: editAsset.bind(this),
            deleteAsset: deleteAsset.bind(this),
            insertCategory: insertCategory.bind(this),
            editCategory: editCategory.bind(this),
            deleteCategory: deleteCategory.bind(this),
        }),
        calendar: new Component($reservationMain, {
            ...this.$state,
            selectEvent: selectEvent.bind(this),
            editEvent: editEvent.bind(this),
            renderAsset: renderAsset.bind(this),
            selectAsset: selectAsset.bind(this),
            renderCategories: renderCategories.bind(this),
            selectCategory: selectCategory.bind(this),
        })
      };
    }

    // 예약 선택
    selectEvent (event) {
      const { sideMenu } = this.$children;
  
      sideMenu.setState({ event });
    }
    
    // 예약 추가
    async insertEvent (event) {
      const { calendar } = this.$children;

      // 시작일 종료일 미입력 처리
      if (!event.start || !event.end) {
        alert("시작일 또는 종료일을 입력해주세요");
        return;
      }

      // 예약명 미입력 처리
      if (!event.title) {
        alert("예약명을 입력해주세요");
        return;
      }

      try {
        // axios를 이용하여 DB 예약 추가
        const res = await axios.post(`insertReservation.rez`, null, {
            params: {
                name: event.title,
                startDate: new Date(event.start + ' UTC'),
                endDate: new Date(event.end + ' UTC'),
                allDay: event.allDay ? '1' : '0',
                asNo: event.asNo,
                empNo: event.empNo, 
            }
        });

        // DB로부터 받은 예약번호 설정
        event.id = res.data;

        // calendar 예약 상태 변경
        calendar.setState({ event, status: 'insert' });
      } catch (err) {
          console.log(err);
      }
    }

    // 예약 수정
    async editEvent (event) {
      const { calendar } = this.$children;

      try {
        // axios를 이용하여 DB 예약 수정
        await axios.put(`updateReservation.rez`, null, {
            params: {
              rezNo: event.id,
              name: event.title,
              startDate: new Date(event.start + ' UTC'),
              endDate: new Date(event.end + ' UTC'),
              allDay: event.allDay ? '1' : '0',
              asNo: event.asNo,
            }
        });

        // calendar 예약 상태 변경
        calendar.setState({ event, status: 'update' });
      } catch (err) {
          console.log(err);
      }
    }

    // 예약 삭제
    async deleteEvent (event) {
      const { calendar } = this.$children;

      try {
        // axios를 이용하여 DB 예약 삭제
        await axios.delete(`deleteReservation.rez?rezNo=${event.id}`);

        // calendar 예약 상태 변경
        calendar.setState({ event, status: 'delete' });
      } catch (err) {
          console.log(err);
      }
    }

    // 자산 렌더링 (다른 Component에서)
    renderAsset (assets) {
      const { sideMenu } = this.$children;

      sideMenu.setState({ ...assets });
    }

    // 자산 선택
    async selectAsset (as) {
      const { sideMenu } = this.$children;

      sideMenu.setState({ as });
    }

    // 자산 추가
    async insertAsset (as) {
      const { calendar } = this.$children;
  
      // 자산명 미입력 처리
      if (!as.name) {
        alert("자산명을 입력해주세요");
        return;
      }

      try {
        // axios를 이용하여 DB 자산 추가
        const res = await axios.post(`insertAsset.rez`, null, {
          params: { 
            name: as.name, 
            color: as.color,
            ascNo: as.ascNo,
          }
        });
  
        // DB로부터 받은 자산번호 설정
        as.asNo = res.data;
  
        // calendar 자산 상태 변경
        calendar.setState({ asset: as, status: 'insert' });
      } catch (err) {
        console.log(err);
      }
    }

    // 자산 수정
    async editAsset (as) {
      const { calendar } = this.$children;
  
      try {
        // axios를 이용하여 DB 자산 수정
        await axios.put(`updateAsset.rez`, null, {
          params: { 
            name: as.name, 
            color: as.color,
            ascNo: as.ascNo,
            asNo: as.asNo,           
          }
        });
  
        // calendar 자산 상태 변경
        calendar.setState({ asset: as, status: 'update' });
      } catch (err) {
        console.log(err);
      }
    }

    // 자산 삭제
    async deleteAsset (as) {
      const { calendar } = this.$children;
  
      try {
        // axios를 이용하여 DB 자산 삭제
        await axios.delete(`deleteAsset.rez?asNo=${as.asNo}`);
  
        // calenadr 자산 상태 변경
        calendar.setState({ asset: as, status: 'delete' });
      } catch (err) {
        console.log(err);
      }
    }

    // 자산목록 렌더링 (다른 Component)
    async renderCategories (categories) {
      const { sideMenu } = this.$children;

      sideMenu.setState({ ...categories });
    }

    // 자산목록 선택
    async selectCategory (cat) {
      const { sideMenu } = this.$children;

      sideMenu.setState({ cat });
    }

    // 자산목록 추가
    async insertCategory (cat) {
      const { calendar } = this.$children;
  
      // 자산목록 미입력 처리
      if (!cat.name) {
        alert("자산목록명을 입력해주세요");
        return;
      }

      try {
        // axios를 이용하여 DB 자산 추가
        const res = await axios.post(`insertAssetCategory.rez`, null, {
          params: { 
            name: cat.name, 
          }
        });
  
        // DB로부터 받은 자산목록번호 설정
        cat.ascNo = res.data;
  
        // calendar 자산목록 상태 변경
        calendar.setState({ category: cat, status: 'insert' });
      } catch (err) {
        console.log(err);
      }
    }

    // 자산목록 수정
    async editCategory (cat) {
      const { calendar } = this.$children;
  
      try {
        // axios를 이용하여 DB 자산목록 수정
        await axios.put(`updateAssetCategory.rez`, null, {
          params: { 
            name: cat.name, 
            ascNo: cat.ascNo,
          }
        });
  
        // calendar 자산목록 상태 변경
        calendar.setState({ category: cat, status: 'update' });
      } catch (err) {
        console.log(err);
      }
    }

    // 자산목록 삭제
    async deleteCategory (cat) {
      const { calendar } = this.$children;
  
      try {
        // axios를 이용하여 DB 자산목록 삭제
        await axios.delete(`deleteAssetCategory.rez?ascNo=${cat.ascNo}`);
  
        // calendar 자산목록 상태 변경
        calendar.setState({ category: cat, status: 'delete' });
      } catch (err) {
        console.log(err);
      }
    }
}