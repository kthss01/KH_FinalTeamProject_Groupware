import Component from "../../core/Components.js";
import CalendarForm from "./CalendarForm.js";

export default class CalendarEnroll extends Component {

  setup () {

  }

  template () {
    return `
     <div data-component="calendar-form"></div>
    `;
  }

  mounted () {
    const $calendarForm = this.$target.querySelector('[data-component="calendar-form"]');
    $calendarForm.classList.add("card-body");

    new CalendarForm($calendarForm, {});
  }

}