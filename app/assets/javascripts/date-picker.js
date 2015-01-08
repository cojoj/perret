/**
 * Created by cojoj on 03.01.15.
 */

$(document).on('ready page:change', function () {
    $('#start_date_picker').datepicker({
        dateFormat: 'yy-mm-dd'
    });
    $('#end_date_picker').datepicker({
        dateFormat: 'yy-mm-dd'
    });
})