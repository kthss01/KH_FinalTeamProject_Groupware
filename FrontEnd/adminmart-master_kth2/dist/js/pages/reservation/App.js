import Component from './core/Components.js';
import Reservation from './components/Reservation.js';
import axios from './axios.js'

export default class App extends Component {

    setup() {
        this.$state = {};
    }

    template () {
        return `
            
            <div class="col-lg-12">
                <div class="card-body">
                    <div id="calendar" data-component="reservation-main"></div>
                </div>
            </div>
        `;
    }

    mounted () {
        const $reservationMain = this.$target.querySelector('[data-component="reservation-main"]');

        this.$children = {
            reservation: new Reservation($reservationMain, {})
        };
    }

    // events
}