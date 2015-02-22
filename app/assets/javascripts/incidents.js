function initialize(lat, lang, container) {
	// lat = parseFloat(incident.substr(0, incident.indexOf(', ')))
	// lng = parseFloat(incident.substr(incident.indexOf(', ')+2, incident.length))
  var mapOptions = {
    scrollwheel: false,
    center: { lat: lat, lng: lang},
    zoom: 14
  };
  var myLatlng = new google.maps.LatLng(-1.2137278, 36.8928517);
  map = new google.maps.Map(document.getElementById(container),
      mapOptions);
  var marker = new google.maps.Marker({
    position: new google.maps.LatLng(lat, lang),
    map: map,
    animation: google.maps.Animation.DROP,
    // title: incident.contact_name + " (" + incident.contact_phone + ")"
  });
}

$(function() {
  lat = parseFloat(incident.substr(0, incident.indexOf(', ')))
  lng = parseFloat(incident.substr(incident.indexOf(', ')+2, incident.length))
	google.maps.event.addDomListener(window, 'load', initialize(lat, lng, 'incident-map'));

  // if (window.location.pathname == "/incidents") {
  //   alert("hey")
  // };

  $('#resolve').click(function() {        
    url = $(this).data("url");
    $.ajax({ url: url, type: 'post' })
      .done(function() { 
          window.location.reload();
      });
  });

  $('#false-flag').click(function() {        
    url = $(this).data("url");
    $.ajax({ url: url, type: 'post' })
      .done(function() { 
          window.location.reload();
      });
  });

  $('#send-message').click(function(){
    // if ($(".students_table input:checked").length < 1)
    // {
    //   alert("You have not selected any students to be deleted.");
    //   return false;
    // }
    // else
    // {
    //   students_array = []
    //   $(".students_table input:checked").each(function(){
    //     students_array.push($(this).attr('value'))
    //   });
    //   $('#delete_students').val(students_array);
    //   // contact_num = ("#students_table input:checked").length;
    //   $('#delete_modal #lbl-msg').html('You are about to delete '+String(students_array.length)+' students');
      $('#message_modal')
      .modal('setting', {
        onApprove: function(){
          $(this).find('form').submit();
        }
      })
      .modal('show');
    // }
  });
});