// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/

var map;
      function initMap() {
        console.log(locationTest.lat);
        console.log(locationTest.lng);
        map = new google.maps.Map(document.getElementById('map'), {
          center: {lat: 40.7549, lng: -73.9840},
          zoom: 12
        });
        var marker = new google.maps.Marker({
          position: {
            lat: locationTest.lat,
            lng: locationTest.lng

          },
          map: map
        });

        console.log(locationName);
        var infoWindowOptions = {
            content: locationName
          };
        var infoWindow = new google.maps.InfoWindow(infoWindowOptions);
            google.maps.event.addListener(marker,'click',function(e){
            infoWindow.open(map, marker);
          });
      }
