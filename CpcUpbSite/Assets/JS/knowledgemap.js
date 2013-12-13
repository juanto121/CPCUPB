

function initialize() {
    var moonTypeOptions = {
        getTileUrl: function (coord, zoom) {
            var normalizedCoord = getNormalizedCoord(coord, zoom);
            if (!normalizedCoord) {
                return null;
            }
            var bound = Math.pow(2, zoom);
            return '//mw1.google.com/mw-planetary/sky/skytiles_v1/' +
                normalizedCoord.x + '_' + (bound - normalizedCoord.y - 1) + '_'
                + zoom + '.jpg';
        },
        tileSize: new google.maps.Size(256, 256),
        maxZoom: 9,
        minZoom: 6,
        radius: 1738000,
        name: 'Moon'
    };

    var moonMapType = new google.maps.ImageMapType(moonTypeOptions);

    var myLatlng = new google.maps.LatLng(-2, 2);
    var mapOptions = {
        center: myLatlng,
        zoom: 7,
        streetViewControl: false,
        mapTypeControl: false,
        scrollwheel: true,
        zoomControl: false

    };

    var map = new google.maps.Map(document.getElementById('map-canvas'),
        mapOptions);
    map.mapTypes.set('moon', moonMapType);
    map.setMapTypeId('moon');


    var infoWindow = new google.maps.InfoWindow();
    for (i = 0; i < markers.length; i++) {
        var data = markers[i];
        var latit = data.lat.replace(/,/g, '.');
        var longi = data.lng.replace(/,/g, '.');
        
        var Latlng = new google.maps.LatLng(latit, longi);
        var marker = new google.maps.Marker({
            position: Latlng,
            map: map,
            title: data.title,
            icon: data.micon
        });
        (function (marker, data) {
            var content = '<div id="content">' +
                '<h4>' + data.title + '</h4>' +
                '<hr />' +
                '<p>' + data.description + '</p>' + 
                '<a href="\Problem.aspx?p=' + data.id + '">' + 'Go to Problem' + '</a>' +
                '</div>';
                          
            google.maps.event.addListener(marker, "click", function (e) {
                infoWindow.setContent(content);
                infoWindow.open(map, marker);
            });
        })(marker, data);
    }


    for (k = 0; k < edges.length; k++) {
        var dt = edges[k];
        var slatit = dt.SLat.replace(/,/g, '.');
        var slongi = dt.SLng.replace(/,/g, '.');
        var tlatit = dt.TLat.replace(/,/g, '.');
        var tlongi = dt.TLng.replace(/,/g, '.');
        var polylineCoords = [new google.maps.LatLng(slatit,slongi), new google.maps.LatLng(tlatit,tlongi)];
        var path = new google.maps.Polyline({
            path: polylineCoords,
            strokeColor: '#00E5EE',
            strokeOpacity: 1.0,
            strokeWeight: 1
        });
        path.setMap(map);
    }


    
      
}

// Normalizes the coords that tiles repeat across the x axis (horizontally)
// like the standard Google map tiles.
function getNormalizedCoord(coord, zoom) {
    var y = coord.y;
    var x = coord.x;

    // tile range in one direction range is dependent on zoom level
    // 0 = 1 tile, 1 = 2 tiles, 2 = 4 tiles, 3 = 8 tiles, etc
    var tileRange = 1 << zoom;

    // don't repeat across y-axis (vertically)
    if (y < 0 || y >= tileRange) {
        return null;
    }

    // repeat across x-axis
    if (x < 0 || x >= tileRange) {
        x = (x % tileRange + tileRange) % tileRange;
    }

    return {
        x: x,
        y: y
    };
}




