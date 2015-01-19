/**
 * Created by robert on 15.01.15.
 */

$(document).ready(function () {
    $.ajax({
        url: '/autocomplete_rooms.json',
        success: function(rooms) {
            $('#roomsinput').tokenInput(rooms, {
                theme: "facebook",
                tokenLimit: 1,
                resultsLimit: 10,
                searchingText: "Wyszukuje",
                noResultText: "Brak pasujących sal",
                hintText: "Wpisz nazwę sali",
                searchDelay: 0,
                preventDuplicates: true
            })
        }
    })
});