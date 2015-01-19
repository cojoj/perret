/**
 * Created by cojoj on 10.01.15.
 */

$(document).on("ready page:load" ,function() {
    $.ajax({
        url: '/autocomplete_rooms.json',
        success: function(rooms) {
            $('#roomsinput').tokenInput(rooms, {
                theme: "facebook",
                tokenLimit: 1,
                resultsLimit: 10,
                searchingText: "Wyszukuje",
                noResultsText: "Brak pasujących sal",
                hintText: "Wpisz nazwę sali",
                searchDelay: 0,
                preventDuplicates: true
            });
        }
    });

    $.ajax({
        url: '/autocomplete_groups.json',
        success: function(groups) {
            $('#tokeninput').tokenInput(groups, {
                theme: "facebook",
                tokenLimit: 10,
                resultsLimit: 10,
                searchingText: "Wyszukuje",
                noResultsText: "Brak pasujących grup",
                hintText: "Wpisz nazwę grupy",
                searchDelay: 0,
                preventDuplicates: true
            });
        }
    });

});