function initialize() {
	lat = parseFloat(incident.substr(0, incident.indexOf(', ')))
	lng = parseFloat(incident.substr(incident.indexOf(', ')+2, incident.length))
  var mapOptions = {
    center: { lat: lat, lng: lng},
    zoom: 14
  };
  var myLatlng = new google.maps.LatLng(-1.2137278, 36.8928517);
  map = new google.maps.Map(document.getElementById('incident-map'),
      mapOptions);
  var marker = new google.maps.Marker({
    position: new google.maps.LatLng(lat, lng),
    map: map,
    animation: google.maps.Animation.DROP,
    // title: incident.user_name + " (" + incident.user_phone + ")"
  });
}
$(function() {
	google.maps.event.addDomListener(window, 'load', initialize);
});