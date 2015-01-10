/**
 * Created by cojoj on 03.01.15.
 */

$(document).on('ready page:change', function () {
    $('#start_date_picker').datepicker({
        dateFormat: 'yy-mm-dd',
        onSelect: function (dateValue) {
            $("#end_date_picker").datepicker("option", "minDate", dateValue);
        }
    });

    $('#end_date_picker').datepicker({
        dateFormat: 'yy-mm-dd'
    });
});