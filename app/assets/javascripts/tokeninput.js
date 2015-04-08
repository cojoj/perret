/**
 * Created by cojoj on 10.01.15.
 */


var app = window.app = window.app = {};

app.bindTokenInput = function(list, target, tokenLimit) {
    target.tokenInput(list, {
        theme: "facebook",
        tokenLimit: tokenLimit,
        resultsLimit: 10,
        searchingText: "Wyszukuje",
        noResultsText: "Brak pasujących grup",
        hintText: target.attr('placeholder'),
        searchDelay: 0,
        preventDuplicates: true
    });
}

$.ajax({
    url: '/autocomplete_groups.json',
    success: function(groups) {
        app.groups = groups;
        app.bindTokenInput(groups, $('#tokeninput'), 10);
    }
});


$.ajax({
    url: '/autocomplete_rooms.json',
    success: function(rooms) {
        app.rooms = rooms;
        app.bindTokenInput(rooms, $('#roomsinput'), 1);
    }
});

$(document).on("page:load" ,function() {
    app.bindTokenInput(app.groups, $('#tokeninput'), 10);
    app.bindTokenInput(app.rooms, $('#roomsinput'), 1);
});