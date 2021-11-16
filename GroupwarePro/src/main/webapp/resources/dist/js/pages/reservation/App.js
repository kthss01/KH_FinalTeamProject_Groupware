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

      const { isRoute=null } = newState;
      // console.log(isRoute);

      if (isRoute) {
        // console.log('test');
        const $reservationMain = this.$target.querySelector('[data-component="reservation-main"]');
        const Component = this.router.router();

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

    // events
    selectEvent (event) {
        // console.log(event);
    
        const { sideMenu } = this.$children;
    
        sideMenu.setState({ event });
    }
    
    async insertEvent (event) {
        const { calendar } = this.$children;

        // console.log('app', event);

        // console.log(new Date(event.start), new Date(event.end));

        try {
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

            // console.log(res);
            event.id = res.data;

            calendar.setState({ event, status: 'insert' });

        } catch (err) {
            console.log(err);
        }
    }

    async editEvent (event) {
        const { calendar } = this.$children;

        // console.log('app', event);

        try {
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

            calendar.setState({ event, status: 'update' });

        } catch (err) {
            console.log(err);
        }

    }

    async deleteEvent (event) {
        const { calendar } = this.$children;

        // console.log('app', event);

        try {
            await axios.delete(`deleteReservation.rez?rezNo=${event.id}`);

            calendar.setState({ event, status: 'delete' });
        } catch (err) {
            console.log(err);
        }
    
    }

    renderAsset (assets) {
        const { sideMenu } = this.$children;

        sideMenu.setState({ ...assets });
    }

    async selectAsset (as) {
        // console.log(as);
        
        const { sideMenu } = this.$children;

        sideMenu.setState({ as });
    }

    async insertAsset (as) {
        const { calendar } = this.$children;
    
        // console.log(as);
    
        try {
          const res = await axios.post(`insertAsset.rez`, null, {
            params: { 
              name: as.name, 
              color: as.color,
              ascNo: as.ascNo,
            }
          });
    
          // console.log(res.data);
    
          as.asNo = res.data;
    
          calendar.setState({ asset: as, status: 'insert' });
    
        } catch (err) {
          console.log(err);
        }
    }
    
    async editAsset (as) {
        const { calendar } = this.$children;
    
        // console.log(as);
    
        try {
          await axios.put(`updateAsset.rez`, null, {
            params: { 
              name: as.name, 
              color: as.color,
              ascNo: as.ascNo,
              asNo: as.asNo,           
            }
          });
    
          calendar.setState({ asset: as, status: 'update' });
    
        } catch (err) {
          console.log(err);
        }
    }
    
    async deleteAsset (as) {
        const { calendar } = this.$children;
    
        // console.log(as);
    
        try {
          await axios.delete(`deleteAsset.rez?asNo=${as.asNo}`);
    
          calendar.setState({ asset: as, status: 'delete' });
    
        } catch (err) {
          console.log(err);
        }
    }

    async renderCategories (categories) {
        const { sideMenu } = this.$children;

        sideMenu.setState({ ...categories });
    }

    async selectCategory (cat) {
        // console.log(cat);

        const { sideMenu } = this.$children;

        sideMenu.setState({ cat });
    }

    async insertCategory (cat) {
        const { calendar } = this.$children;
    
        // console.log(cat);
    
        try {
          const res = await axios.post(`insertAssetCategory.rez`, null, {
            params: { 
              name: cat.name, 
            }
          });
    
          // console.log(res.data);
    
          cat.ascNo = res.data;
    
          calendar.setState({ category: cat, status: 'insert' });
    
        } catch (err) {
          console.log(err);
        }
    }
    
    async editCategory (cat) {
        const { calendar } = this.$children;
    
        // console.log(cat);
    
        try {
          await axios.put(`updateAssetCategory.rez`, null, {
            params: { 
              name: cat.name, 
              ascNo: cat.ascNo,
            }
          });
    
          calendar.setState({ category: cat, status: 'update' });
    
        } catch (err) {
          console.log(err);
        }
    }
    
    async deleteCategory (cat) {
        const { calendar } = this.$children;
    
        // console.log(cat);
    
        try {
          await axios.delete(`deleteAssetCategory.rez?ascNo=${cat.ascNo}`);
    
          calendar.setState({ category: cat, status: 'delete' });
    
        } catch (err) {
          console.log(err);
        }
    }
}