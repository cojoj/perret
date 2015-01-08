/**
 * Created by cojoj on 03.01.15.
 */

$(document).on('ready page:change', function () {
    $('#start_date_picker').datepicker({
        format: 'YYYY-MM-DD',
        direction: 'bottom',
        pickTime: false
    });
    $('#end_date_picker').datepicker({
        format: 'YYYY-MM-DD',
        direction: 'bottom',
        pickTime: false
    });
    $("#start_date_picker").on("dp.change", function (e) {
        $('#end_date_picker').data("DateTimePicker").setMinDate(e.date.add(1, 'days'));
    });
    $("#end_date_picker").on("dp.change", function (e) {
        $('#start_date_picker').data("DateTimePicker").setMaxDate(e.date);
    });
})