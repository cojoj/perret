/**
 * Created by cojoj on 08.01.15.
 */
$(document).on('ready page:change', function () {
    $( "#tags" ).autocomplete({
        source: '/autocomplete.json',
        minLength: 2
    });
})