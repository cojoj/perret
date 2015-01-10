/**
 * Created by cojoj on 10.01.15.
 */
$(document).on('ready', function () {
    $.ajax({
        url: '/autocomplete.json',
        success: function(groups) {
            $('#tokeninput').tokenInput(groups, {
                theme: "facebook",
                tokenLimit: 10,
                resultsLimit: 10,
                searchingText: "",
                noResultText: "Brak pasujących grup",
                hintText: "",
                searchDelay: 0
            })
        }
    })
})