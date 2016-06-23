console.log("linked papi!!!!");

var map;
var allVenues;
function allVenuesMap(venues) {
  // for (i=0; )
  // var myLatLng = {lat: lat, lng: long};
  // var map = new google.maps.Map(document.getElementById('map'), {
  //   zoom: 18,
  //   center: myLatLng
  // });
  //
  // var marker = new google.maps.Marker({
  //   position: myLatLng,
  //   map: map,
  //   title: 'Venue'
  // });
}


function venueMap(lat, long) {
  var myLatLng = {lat: lat, lng: long};

  var map = new google.maps.Map(document.getElementById('map'), {
    zoom: 18,
    center: myLatLng
  });

  var marker = new google.maps.Marker({
    position: myLatLng,
    map: map,
    title: 'Venue'
  });
}

// /////  Adds street view from requested   //////
// var panorama;
// function initialize(destination) {
//   panorama = new google.maps.StreetViewPanorama(document.getElementById('street-view'), {
//     position: {lat: destination.latitude, lng: destination.longitude},
//     pov: {heading: 165, pitch: 0},
//     zoom: 1
//   });
// }
//
/////  Adds map and SearchBox to find a new destination  //////
var destName;
var addressNumber;
var addressStreet;
var addressNeighbourhood;
var addressCity;
var addressCounty;
var addressState;
var addressCountry;
var addressZipcode;
var addressFull;
var website;
var loc = [];

function initAutocomplete() {
  // var geocoder = new.google.maps.Geocoder();
  var map = new google.maps.Map(document.getElementById('mapVenue'), {
    center: {lat: 37.790841, lng: -122.4034689},
    zoom: 12,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  });

  // Create the search box and link it to the UI element.
  var input = document.getElementById('mapSearchBox_pac_input');
  var searchBox = new google.maps.places.SearchBox(input);
  map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);

  // Bias the SearchBox results towards current map's viewport.
  map.addListener('bounds_changed', function() {
    searchBox.setBounds(map.getBounds());
  });

  var markers = [];
  // Listen for the event fired when the user selects a prediction and retrieve
  // more details for that place.

  searchBox.addListener('places_changed', function() {
    var places = searchBox.getPlaces();
    fillForm(places);
    addressFull = places[0].formatted_address;
    // geocoder.geocode({'address': addressFull}, function(results, status) {
    //   if (status == google.maps.GeocoderStatus.OK) {
    //    loc[0] = results[0].geometry.location.lat();
    //    loc[1] = results[0].geometry.location.lng();
    //    alert( loc ); // the place where loc contains geocoded coordinates
    //   } else {
    //    alert("Geocode was not successful for the following reason: " + status);
    //   }
    // });

    if (places.length == 0) {
      return;
    }

    // Clear out the old markers.
    markers.forEach(function(marker) {
      marker.setMap(null);
    });
    markers = [];

    // For each place, get the icon, name and location.
    var bounds = new google.maps.LatLngBounds();
    places.forEach(function(place) {
      var icon = {
        url: place.icon,
        size: new google.maps.Size(71, 71),
        origin: new google.maps.Point(0, 0),
        anchor: new google.maps.Point(17, 34),
        scaledSize: new google.maps.Size(25, 25)
      };

      // Create a marker for each place.
      markers.push(new google.maps.Marker({
        map: map,
        icon: icon,
        title: place.name,
        position: place.geometry.location
      }));

      if (place.geometry.viewport) {
        // Only geocodes have viewport.
        bounds.union(place.geometry.viewport);
      } else {
        bounds.extend(place.geometry.location);
      }
    });
    map.fitBounds(bounds);
  });
}

var lat;

function fillForm (places) {
  console.log(places)
  var lat = places[0].geometry.location.lat();
  destName = places[0].name;
  addressNumber = places[0].address_components[0].long_name;
  addressStreet = places[0].address_components[1].long_name;
  addressNeighbourhood = places[0].address_components[2].long_name;
  addressCity = places[0].address_components[3].long_name;
  addressCounty = places[0].address_components[4].long_name;
  addressState = places[0].address_components[5].long_name;
  addressCountry = places[0].address_components[6].long_name;
  addressZipcode = places[0].address_components[7].long_name;
  addressFull = places[0].formatted_address;
  website = places[0].website;
  document.getElementById('venue_name').setAttribute("value", destName);
  document.getElementById('venue_street_one').setAttribute("value", addressNumber);
  document.getElementById('venue_street_two').setAttribute("value", addressStreet);
  document.getElementById('venue_city').setAttribute("value", addressCity);
  document.getElementById('venue_state').setAttribute("value", addressState);
  document.getElementById('venue_zipcode').setAttribute("value", addressZipcode);
  document.getElementById('venue_email').setAttribute("value", website);
  document.getElementById('venue_full_address').setAttribute("value", addressFull);

  if(places[0].photos) {
    destPhoto_url = places[0].photos[0].getUrl({'maxWidth': 600, 'maxHeight': 400});
    document.getElementById('venue_profile_pic').setAttribute("value", destPhoto_url);
  }

}
