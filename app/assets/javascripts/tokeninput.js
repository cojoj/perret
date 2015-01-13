/**
 * Created by cojoj on 10.01.15.
 */
$(document).ready(function () {
    $.ajax({
        url: '/autocomplete.json',
        success: function(groups) {
            $('#tokeninput').tokenInput(groups, {
                theme: "facebook",
                tokenLimit: 10,
                resultsLimit: 10,
                searchingText: "Wyszukuje",
                noResultText: "Brak pasujących grup",
                hintText: "Wpisz nazwę grupy",
                searchDelay: 0,
                preventDuplicates: true
            })
        }
    })
});