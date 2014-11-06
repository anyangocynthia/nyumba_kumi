// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap
//= require flexslider
//= require leaflet
//= require underscore
//= require gmaps/google
//= require_tree .

map = {};
$(document).ready(function(){ 

	// var myIcon = L.icon({
	// 	iconUrl: window.location.origin + '/assets/leaflet/marker-icon.png',
	// 	iconSize: [20, 20],
	// 	iconAnchor: [10, 10],
	// 	labelAnchor: [6, 0] // as I want the label to appear 2px past the icon (10 + 2 - 6)
	// });

	// //mapping for home, /posts[blog] and /countries pages
	// // if($.inArray(window.location.pathname, ['/user', '/users/', '/dashboard', '/posts', '/countries'] > -1)){ 

	// 	// foreach city in the whole hacktrip
	// 	map = L.map('map', {
	// 		scrollWheelZoom: false,
	// 		zoomControl: true,
	// 		doubleClickZoom: true,
	// 		// attributionControl: false,
	// 		// }).setView([53, 8], 5); 
	// 		}).setView([50, -10], 5); 
	// 	var markersgroup = []
			   
	// 	// L.tileLayer('http://{s}.tile.cloudmade.com/5e9427487a6142f7934b07d07a967ba3/997/256/{z}/{x}/{y}.png', {
	// 	// L.tileLayer('http://a.tiles.mapbox.com/v3/techytimo.ic2cif8j/{z}/{x}/{y}.png', {
	// 	L.tileLayer('http://{s}.tile.osm.org/{z}/{x}/{y}.png', {
	// 	  attribution: '© <a href="http://openstreetmap.org/copyright">OpenStreetMap</a> contributors',
	// 	  maxZoom: 18,
	// 	  opacity: 0.5
	// 	}).addTo(map);
	// 	$.get('/citiez', function(data){ //create markers for all cities in country

	// 		$.each(data, function(key, city){
	// 			// console.log(city.name);
	// 			coords = city.map;
	// 			lat = parseFloat(coords.substr(0, coords.indexOf(', ')))
	// 			lng = parseFloat(coords.substr(coords.indexOf(', ')+2, coords.length))
	// 			// console.log(lat);
	// 			// console.log(lng);
	// 			var marker = L.marker([lat, lng], {
	// 						icon: myIcon
	// 						})
	// 						.bindLabel('<a href="/cities/'+city.slug+'">'
	// 									+city.name+'</a>', { 
	// 						noHide: true,
	// 						direction: 'auto'
	// 						})
	// 						.addTo(map);
	// 			var popup = L.popup()
	// 			    // .setLatLng(latlng)
	// 			    .setContent('<a href="/cities/'+city.slug+'">'
	// 			    			+city.name+'</a><br />'
	// 			    			+'<a href="/events/'+city.event_id+'">'+city.theme+'</a><br />'
	// 			    			+city.dates+'</p>')
	// 			    .openOn(marker);
	// 			marker.bindPopup(popup)

	// 			marker._icon.onmouseover = function(){
	// 				marker.openPopup()
	// 			}

	// 			markersgroup.push([lat, lng])
	// 			// markersgroup.push(marker.getLatLng())
	// 			// console.log(marker.getLatLng());
	// 		})
			
	// 		// map.fitBounds(markersgroup);
	// 		// setTimeout(function(){ map.panBy([0, -20]); }, 1000)

	// 		// custom parallax effect... 
	// 		pos = 0
	// 		$(window).scroll(function(){ 
	// 			// console.log(pos);
	// 			// console.log($(window).scrollTop());
	// 			// map.panBy([0, -($(window).scrollTop()/10-pos)]);
	// 			// pos = $(window).scrollTop()/10
	// 			map.panBy([0, -($(window).scrollTop()-pos)]);
	// 			pos = $(window).scrollTop()
	// 			// scroll = $(window).scrollTop() > pos ? $(window).scrollTop()-pos : pos - $(window).scrollTop())
	// 			// pos = $(window).scrollTop() > pos ? $(window).scrollTop()-pos : pos - $(window).scrollTop())
	// 		})

	// 	})
	// 	.fail(function() {
	// 		console.log('check your db bro...');
	// 	})

	// // }
}

