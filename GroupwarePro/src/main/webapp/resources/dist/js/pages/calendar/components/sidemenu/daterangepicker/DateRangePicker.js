import Component from "../../../core/Components.js";

export default class DateRangePicker extends Component {

  setup() {
    $(function() {
      $('input[name="startDate"], input[name="endDate"]').daterangepicker({
        timePicker: true,
        locale: {
          format: 'YYYY-MM-DD HH:mm'
        },
        autoApply: true,
        autoUpdateInput: false
      }, function(start, end, label) {
          const selectedStartDate = start.format('YYYY-MM-DD HH:mm');
          const selectedEndDate = end.format('YYYY-MM-DD HH:mm');
          
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

    const { start:startDate, end:endDate, allDay } = this.$state;

    const start = moment(startDate).format('YYYY-MM-DD HH:mm');
    const end = moment(endDate).format('YYYY-MM-DD HH:mm');

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

    this.render();
  }

}