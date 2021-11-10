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

        this.$children = {
            sideMenu: new SideMenu($reservationSidemenu, {}),
            reservation: new Reservation($reservationMain, {})
        };
    }

    // events
}