function position_map_box() {
    var $html = $('html');
    var oxfordshire_right;
    if ($html.hasClass('ie6') || $html.hasClass('ie7')) {
        oxfordshire_right = '-480px';
    } else {
        oxfordshire_right = '0em';
    }
    
    var map_box_width = 464;
    var map_box_height = 464;
    // Do the same as CSS (in case resized from mobile).
    $('#map_box').prependTo('.content').css({
        zIndex: 1, position: 'absolute',
        top: '1em', left: '', right: oxfordshire_right, bottom: '',
        width: map_box_width + 'px', height: map_box_height +'px',
        margin: 0
    });
    if($('#map_box').length) {
        if (! $('#occ-map-instructions').length) {
            $('#map_box').after("<div id='occ-map-instructions'><p>" +
                "Click on a pin and then on the &ldquo;details&rdquo; link to see an individual report detail.</p></div>");
        }
        var mb_y = $('#map_box').position().top + map_box_height ;
        $('#occ-map-instructions').show().css({
            left: '',
            right: oxfordshire_right,
            bottom: '',
            top: mb_y +'px',
            width: map_box_width
        });
    }
    
}

function map_fix() {}
var slide_wards_down = 1;

