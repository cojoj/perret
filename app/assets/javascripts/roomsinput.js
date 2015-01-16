/**
 * Created by robert on 15.01.15.
 */

$(document).ready(function () {
    $.ajax({
        url: '/autocompleterooms.json',
        success: function(rooms) {
            $('#roomsinput').tokenInput(rooms, {
                theme: "facebook",
                tokenLimit: 10,
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