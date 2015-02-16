function initialize(lat, lang, container) {
	// lat = parseFloat(incident.substr(0, incident.indexOf(', ')))
	// lng = parseFloat(incident.substr(incident.indexOf(', ')+2, incident.length))
  var mapOptions = {
    scrollwheel: false,
    center: { lat: lat, lng: lang},
    zoom: 10
  };
  var myLatlng = new google.maps.LatLng(-1.2137278, 36.8928517);
  map = new google.maps.Map(document.getElementById(container),
      mapOptions);
  var marker = new google.maps.Marker({
    position: new google.maps.LatLng(lat, lang),
    map: map,
    animation: google.maps.Animation.DROP,
    // title: incident.user_name + " (" + incident.user_phone + ")"
  });
}

$(function() {
	// lat = parseFloat(incident.substr(0, incident.indexOf(', ')))
 //  	lng = parseFloat(incident.substr(incident.indexOf(', ')+2, incident.length))
	google.maps.event.addDomListener(window, 'load', initialize(-1.3048035, 36.8473969, 'locamap'));
});