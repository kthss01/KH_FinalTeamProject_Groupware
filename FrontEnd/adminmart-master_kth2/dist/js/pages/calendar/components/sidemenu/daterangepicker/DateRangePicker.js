import Component from "../../../core/Components.js";

export default class DateRangePicker extends Component {

  setup() {
    $(function() {
      $('input[name="startDate"], input[name="endDate"]').daterangepicker({
        timePicker: true,
        locale: {
          format: 'M/DD HH:mm'
        },
        autoApply: true,
        autoUpdateInput: false
      }, function(start, end, label) {
          const selectedStartDate = start.format('M/DD HH:mm');
          const selectedEndDate = end.format('M/DD HH:mm');
          
          const startInput = $('input[name="startDate"]');
          const endInput = $('input[name="endDate"]');

          const startInputData = startInput.data('daterangepicker');
          startInputData.setStartDate(selectedStartDate);
          startInputData.setEndDate(selectedEndDate);

          const endInputData = endInput.data('daterangepicker');
          endInputData.setStartDate(selectedStartDate);
          endInputData.setEndDate(selectedEndDate);

          startInput.val(selectedStartDate);
          endInput.val(selectedEndDate);
      });
    });
  }

  setState (newState) {
    this.$state = { ...this.$state, ...newState };

    if (this.$state.date) {

      const { date } = this.$state;

      console.log(date);

      const start = moment(date.start).format('M/DD HH:mm');
      const end = date.allDay ? moment(date.end).subtract(1, 'milliseconds').format('M/DD HH:mm') : moment(date.end).format('M/DD HH:mm');


      console.log(start, end);

      const startInput = $('input[name="startDate"]');
      const endInput = $('input[name="endDate"]');

      const startInputData = startInput.data('daterangepicker');
      startInputData.setStartDate(start);
      startInputData.setEndDate(end);

      const endInputData = endInput.data('daterangepicker');
      endInputData.setStartDate(start);
      endInputData.setEndDate(end);

      startInput.val(start);
      endInput.val(end);

    } 

    this.render();
  }

}