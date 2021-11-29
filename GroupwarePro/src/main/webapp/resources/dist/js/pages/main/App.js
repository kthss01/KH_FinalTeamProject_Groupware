import Component from './core/Components.js';
import Calendar from './components/Calendar.js';
import Reservation from './components/Reservation.js';

export default class App extends Component {
  
  setup() {
    this.$state = {};

  }

  render () {
    this.mounted();
  }

  mounted () {
    const $calendar = document.querySelector('#calendar');

    const $reservation = document.querySelector('#reservation');


    // 필요시 기능 {} binding 해줘야 함 (이벤트는 해당 컴포넌트에서 처리)
    this.$children = {
        calendar: new Calendar($calendar, { }),
        reservation: new Reservation($reservation, {  }),
    };
  }

}