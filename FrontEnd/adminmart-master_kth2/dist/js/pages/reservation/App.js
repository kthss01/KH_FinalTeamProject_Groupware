import Component from './core/Components.js';
import Reservation from './components/Reservation.js';
import SideMenu from './components/SideMenu.js';
import axios from './axios.js'

export default class App extends Component {

    setup() {
        this.$state = {};
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

    mounted () {
        const $reservationSidemenu = this.$target.querySelector('[data-component="reservation-sidemenu"]');
        const $reservationMain = this.$target.querySelector('[data-component="reservation-main"]');

        const { selectEvent, insertEvent, editEvent, deleteEvent, renderCalendar, insertCalendar, editCalendar, deleteCalendar } = this;

        this.$children = {
            sideMenu: new SideMenu($reservationSidemenu, {
                ...this.$state,
                insertEvent: insertEvent.bind(this),
                editEvent: editEvent.bind(this),
                deleteEvent: deleteEvent.bind(this),
                insertCalendar: insertCalendar.bind(this),
                editCalendar: editCalendar.bind(this),
                deleteCalendar: deleteCalendar.bind(this),
            }),
            calendar: new Reservation($reservationMain, {
                ...this.$state,
                selectEvent: selectEvent.bind(this),
                editEvent: editEvent.bind(this),
                renderCalendar: renderCalendar.bind(this),
            })
        };
    }

    // events
    selectEvent (event) {
        console.log(event);
    
        const { sideMenu } = this.$children;
    
        sideMenu.setState({ event });
    }
    
    async insertEvent (event) {
        const { calendar } = this.$children;

        console.log('app', event);

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

            console.log(res);
            event.id = res.data;

            calendar.setState({ event, status: 'insert' });

        } catch (err) {
            console.log(err);
        }
    }

    async editEvent (event) {
        const { calendar } = this.$children;

        console.log('app', event);

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

    renderCalendar (calendars) {
        const { sideMenu } = this.$children;

        sideMenu.setState({ ...calendars });
    }

    async insertCalendar (cal) {
        const { calendar } = this.$children;
    
        console.log(cal);
    
        try {
          const res = await axios.post(`insertCalendar.ca`, null, {
            params: { 
              name: cal.name, 
              color: cal.color,
            }
          });
    
          // console.log(res.data);
    
          cal.calNo = res.data;
    
          calendar.setState({ calendar: cal, status: 'insert' });
    
        } catch (err) {
          console.log(err);
        }
    }
    
    async editCalendar (cal) {
        const { calendar } = this.$children;
    
        // console.log(cal);
    
        try {
          await axios.put(`updateCalendar.ca`, null, {
            params: { 
              name: cal.name, 
              color: cal.color,
              calNo: cal.calNo,
              empNo: empNo,           
            }
          });
    
          calendar.setState({ calendar: cal, status: 'update' });
    
        } catch (err) {
          console.log(err);
        }
    }
    
    async deleteCalendar (cal) {
        const { calendar } = this.$children;
    
        // console.log(cal);
    
        try {
          await axios.delete(`deleteCalendar.ca?calNo=${cal.calNo}`);
    
          calendar.setState({ calendar: cal, status: 'delete' });
    
        } catch (err) {
          console.log(err);
        }
    }
}