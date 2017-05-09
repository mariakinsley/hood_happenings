// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/
var map;
      function initMap() {
        map = new google.maps.Map(document.getElementById('map'), {
          center: {lat: 40.730610, lng: -73.935242},
          zoom: 12
        });
        var marker = new google.maps.Marker({
          position: {lat: 40.7080, lng: -74.0067},
          map: map
        });
        var infoWindowOptions = {
            content: 'NYCDA!'
            };
        var infoWindow = new google.maps.InfoWindow(infoWindowOptions);
            google.maps.event.addListener(marker,'click',function(e){
            infoWindow.open(map, marker);
          });
      }
