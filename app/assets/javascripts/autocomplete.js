/**
 * Created by cojoj on 08.01.15.
 */
$(document).on('ready', function () {

    function split( val ) {
        return val.split( /,\s*/ );
    }

    function extractLast( term ) {
        return split( term ).pop();
    }

    $.ajax({
        url: '/autocomplete.json',
        success: function(groups) {
            $( "#tags" )
                .bind( "keydown", function( event ) {
                    if ( event.keyCode === $.ui.keyCode.TAB &&
                        $( this ).autocomplete( "instance" ).menu.active ) {
                        event.preventDefault();
                    }
                })
                .autocomplete({
                    source: function( request, response ) {
                        response( $.ui.autocomplete.filter(groups, extractLast(request.term)) );
                    },
                    minLength: 0,
                    focus: function() {
                        return false;
                    },
                    select: function(event, ui) {
                        var terms = split( this.value );
                        terms.pop();
                        terms.push( ui.item.value );
                        terms.push( "" );
                        this.value = terms.join( ", " );
                        return false;
                    }
                });
        }
    });
})