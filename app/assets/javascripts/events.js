// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/
//



var map;
      function initMap() {
        map = new google.maps.Map(document.getElementById('map'), {
          center: {lat: 40.7549, lng: -73.9840},
          zoom: 12
        });
        if (locationTest.constructor === Array) {
          var infowindow = new google.maps.InfoWindow();

          var marker, i;

          for (i = 0; i < locationTest.length; i++){
            marker = new google.maps.Marker({
            position: {
                lat: locationTest[i].lat,
                lng: locationTest[i].lng
              },
            map: map
           });
           google.maps.event.addListener(marker,'click',(function(marker, i) {
             return function() {
               infowindow.setContent('<a href="/events/'+locationTest[i].eventid + '">' + locationTest[i].marker + '</a>'
              );
               infowindow.open(map, marker);
             }
           })(marker, i));
          }

        } else {
          var marker = new google.maps.Marker({
            position: {
              lat: locationTest.lat,
              lng: locationTest.lng
            },
            map: map
          });

          var infoWindowOptions = {
            content: locationName
          };
          var infoWindow = new google.maps.InfoWindow(infoWindowOptions);
          google.maps.event.addListener(marker,'click',function(e){
            infoWindow.open(map, marker);
          });
        }
      }
