<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false" trimDirectiveWhitespaces="true"%>
    
<!DOCTYPE html>
<html>
  <head>
    <title>Geocoding service</title>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
    <meta charset="utf-8">
    
    <style>
      html, body {
        height: 100%;
        margin: 0;
        padding: 0;
      }
      #map {
        height: 100%;
      }
#floating-panel1 {
  position:absolute;
  top: 10px;
  left: 25%;
  z-index: 5;
  background-color: #fff;
  padding: 5px;
  border: 1px solid #999;
  text-align: center;
  font-family: 'Roboto','sans-serif';
  line-height: 30px;
  padding-left: 10px;
}

#floating-panel2 {
  position: absolute;
  top: 10px;
  left: 25%;
  z-index: 5;
  background-color: #fff;
  padding: 5px;
  border: 1px solid #999;
  text-align: center;
  font-family: 'Roboto','sans-serif';
  line-height: 30px;
  padding-left: 10px;
}

    </style>
  </head>
  <body>
  
  
    <div id="floating-panel1">
      <input id="address" type="textbox" value="Input Here" >
      <input id="submit" type="button" value="PlaceSearch">
      <input onclick="myLocatin();" type=button value="MyLocation">
<!--       <input id="submit3" type="button" value="MyLocation"> -->
      <br>
      <!-- <button id="drop" onclick="drop()">Drop Markers</button> -->
      
      <input onclick="drop();" type=button value="Drop Markers">
      <input onclick="clearMarkers();" type=button value="Hide Markers">
      <input onclick="showMarkers();" type=button value="Show All Markers">
      <input onclick="deleteMarkers();" type=button value="Delete Markers">
      
      <br>
      
      <b> Travel Mode </b>
	    <select id="mode">
	      <option value="DRIVING">Driving</option>
	      <option value="WALKING">Walking</option>
	      <option value="BICYCLING">Bicycling</option>
	      <option value="TRANSIT">Transit</option>
	    </select>
	    <input id="submit2" type="button" value="Search" /> <br>
	    	<b>Start: </b>
				<input type="text" id="start" />
			<b>End: </b>
				<input type="text" id="end" />	
		<br>
		<input id="foodType" type="textbox" value="Input Here" >
        <input id="submit4" type="button" value="FoodSearch">
<!--         <input onclick="foodSearch();" type=button value="FoodSearch"> -->
      
    </div>
    
    <div id="map"></div>
    <script>
    
     var contentString = '<div id="content">'+
      '<div id="siteNotice">'+
      '</div>'+
      '<h1 id="firstHeading" class="firstHeading">...</h1>'+
      '<div id="bodyContent">'+
      '<p><b>Uluru</b>, also referred to as <b>Ayers Rock</b>, is a large ' +
      'sandstone rock formation in the southern part of the '+
      'Northern Territory, central Australia. It lies 335&#160;km (208&#160;mi) '+
      'south west of the nearest large town, Alice Springs; 450&#160;km '+
      '(280&#160;mi) by road. Kata Tjuta and Uluru are the two major '+
      'features of the Uluru - Kata Tjuta National Park. Uluru is '+
      'sacred to the Pitjantjatjara and Yankunytjatjara, the '+
      'Aboriginal people of the area. It has many springs, waterholes, '+
      'rock caves and ancient paintings. Uluru is listed as a World '+
      'Heritage Site.</p>'+
      '<p>Attribution: Uluru, <a href="https://en.wikipedia.org/w/index.php?title=Uluru&oldid=297882194">'+
      'https://en.wikipedia.org/w/index.php?title=Uluru</a> '+
      '(last visited June 22, 2009).</p>'+
      '</div>'+
      '</div>';
    
    var neighborhoods = [
                         
		  {lat: 37.497880, lng:127.027715 },
		  {lat: 37.497980, lng:127.027915 },
		  {lat: 37.497080, lng:127.027215 },
		  {lat: 37.497380, lng:127.024715 },
		  {lat: 37.497580, lng:127.027315 },
		  {lat: 37.497180, lng:127.027815 },
		  
	];
    
    
    
    var itaewon = [
                         
	  {lat: 37.535096, lng:126.994885 },
	  {lat: 37.538088, lng:126.987078 },
	  {lat: 37.542144, lng:126.987495 },
	  {lat: 37.539857, lng:126.991467 },
	  {lat: 37.534445, lng:126.990696 },
	  {lat: 37.535339, lng:126.991578 },
	  {lat: 37.540039, lng:126.993414 },
	  {lat: 37.533642, lng:126.989387 },
	  {lat: 37.537781, lng:127.001003 },
	  {lat: 37.537444, lng:126.988445 }
	               		  
    ];
    
    
    var dongdaemunyok = [
                   
 	  {lat: 37.579312, lng:127.028019 },
 	  {lat: 37.568933, lng:127.008798 },
 	  {lat: 37.568445, lng:127.004909 },
 	  {lat: 37.569037, lng:127.013494 },
 	  {lat: 37.56431,  lng:127.009716 },
 	  {lat: 37.566101, lng:127.006172 },
 	  {lat: 37.570503, lng:127.006874 }
 	        		  
     ];


    
    var jamsil = [
                          
		{ lat: 37.515665, lng: 127.100155 }, 
		{ lat: 37.50918	, lng: 127.104662 }, 
		{ lat: 37.514273, lng: 127.1088 }, 
		{ lat: 37.511477, lng: 127.10762 }, 
		{ lat:37.510481	, lng: 127.110334 }, 
		{ lat: 37.515009, lng: 127.102036 }, 
		{ lat: 37.581444, lng: 126.980859 }, 
		{ lat: 37.513665, lng: 127.104232 }, 
		{ lat: 37.511147, lng: 127.09813 }, 
		{ lat: 37.506809, lng: 127.098254 }


     ];
    
    var gangnam = [
                   
 		{ lat: 37.498258, lng: 127.025151 }, 
 		{ lat: 	37.502673, lng:127.027950 }, 
 		{ lat: 37.499921,  lng: 127.029046 },
 		{ lat: 37.499834,  lng: 127.027122 }, 
 		{ lat: 37.49777, lng: 127.026173}, 
 		{ lat: 37.502525, lng: 127.026651 }, 
 		{ lat: 37.502577, lng: 127.027297 }, 
 		{ lat: 37.502849, lng: 127.027792 }, 
 		{ lat: 37.496959, lng: 127.029812 }, 
 		{ lat: 37.499303, lng: 127.030635}


      ];
    

    var myeongdong = [
                        
		{ lat: 37.561686,  lng: 126.986431}, 
		{ lat: 	37.562746, lng:126.985742 }, 
		{ lat: 37.564031,  lng: 126.983833 },
		{ lat: 37.564615,  lng: 126.984997 }, 
		{ lat: 37.562514, lng: 126.984059 }, 
		{ lat: 37.562719, lng: 126.984024 }, 
		{ lat: 37.563043, lng: 126.984878 }, 
		{ lat: 37.564756, lng: 126.987281 }, 
		{ lat: 37.563018, lng: 126.98364 }, 
		{ lat: 37.563111, lng: 126.983746}


    ];
    
    

    var map ; 
    var markers = [];
    var pos ;
    var infowindow ; 
    var service ;
    
   
    
//////////////////////		### init start 
    
function initMap() {
	
	var directionsDisplay = new google.maps.DirectionsRenderer() ;
	var directionsService = new google.maps.DirectionsService();
	
	
	var kangnam = {lat: 37.497780, lng: 127.027715} ; 
	
  	map = new google.maps.Map(document.getElementById('map'), {
  		  			
    zoom: 17,
    center: {lat: 37.497780, lng: 127.027715} // kangnam station 
//     center: {lat: 37.534472, lng: 126.994349}  // Itaewon 37.534472, 126.994349
   
    
    });
  	
  	
	  directionsDisplay.setMap(map);
		
	  document.getElementById('submit2').addEventListener('click', function() {
		  
		  calculateAndDisplayRoute(directionsService, directionsDisplay);
		    
	  });
	  
	  
// 	  document.getElementById('submit3').addEventListener('click', function() {
		  
// 		  myLocation();
		    
// 	  });

///////////////////////////////// food search /////////////////////////////////////////////

/* 
	  document.getElementById('submit4').addEventListener('click', function() {
		  
		  foodSearch() ; 
		    
	  });
  	 */
  	 
 /*  	 
  	infowindow = new google.maps.InfoWindow();
  	service = new google.maps.places.PlacesService(map);
  	
	  
	  document.getElementById('submit4').addEventListener('click', function(){
	  	
	  	 var foodType = document.getElementById('foodType').value;
	  	
		  	service.nearbySearch({
		    location: kangnam,
		    radius: 500,
		    types: ['food'],
		    name : [foodType] 
		  }, callback);
	  	
	  }); 
   */	
  
  //////////////////////////////////2. add Marker /////////////////////////////////////////////
  
  var geocoder = new google.maps.Geocoder();

  document.getElementById('submit').addEventListener('click', function() {
  	
    geocodeAddress(geocoder, map);
    
  });
  
   map.addListener('click', function(event) {
	   
    addMarker(event.latLng);
    
  });
  
  addMarker();

  
  //////////////////////////1. Geolocation///////////////////////////////////////////
 
//    var infoWindow = new google.maps.InfoWindow({map: map});
  
   infoWindow = new google.maps.InfoWindow({map: map});

  // Try HTML5 geolocation.
   if (navigator.geolocation) {
  	
    navigator.geolocation.getCurrentPosition(function(position) {
    
      pos = {
        lat: position.coords.latitude,
        lng: position.coords.longitude
      };

      infoWindow.setPosition(pos);
      infoWindow.setContent('Location found.');
      
      map.setCenter(pos);
      
    }, function() {
    	
      handleLocationError(true, infoWindow, map.getCenter());
      
    });
    
  } else {
	  
    // Browser doesn't support Geolocation
    handleLocationError(false, infoWindow, map.getCenter());
    
  }  
   
  //////////////////////////////////////////////////////////////////////////

} //# init end 



 ///////////////////////// ### init end 
 
 
 ////////////////////////// 3. my location //////////////////////////// 
 
 function myLocatin(){
	
	var infoWindow = new google.maps.InfoWindow({map: map});
	
   if (navigator.geolocation) {
  	
    navigator.geolocation.getCurrentPosition(function(position) {
    
      pos = {
        lat: position.coords.latitude,
        lng: position.coords.longitude
      };

      infoWindow.setPosition(pos);
      infoWindow.setContent('Location found.');
      
      map.setCenter(pos);
      
    }, function() {
    	
      handleLocationError(true, infoWindow, map.getCenter());
      
    });
    
  } else {
	  
    // Browser doesn't support Geolocation
    handleLocationError(false, infoWindow, map.getCenter());
    
  }

}

/////////////////////////////// 2. Drop ///////////////////////////////////

function drop() {
	
  clearMarkers();
  
//   default places 
//   for (var i = 0; i < neighborhoods.length; i++) {
	  	
// 	    addMarkerWithTimeout(neighborhoods[i], i * 200);
	  
// 	  }
  
  
  var address = document.getElementById('address').value;
  
	  if(address == "강남역" || address == "gangnam"){
		  
		  for (var i = 0; i < gangnam.length; i++) {
		  	
		    addMarkerWithTimeout(gangnam[i], i * 200);
		  
		  }
		  
	  }
	  else if( address == "잠실역" || address == "jamsil") {
	
		  
		  for (var i = 0; i < jamsil.length; i++) {
			  	
			    addMarkerWithTimeout(jamsil[i], i * 200);
			  
		  }
		  

	  }else if( address == "itaewon" ||  address == "이태원" ){
	  
		  	  
		  for (var i = 0; i < itaewon.length; i++) {
			  	
			    addMarkerWithTimeout(itaewon[i], i * 200);
			  
		  }
		  
	  }else if( address == "동대문역" || address == "dongdaemun" ){
		  	  
		  for (var i = 0; i < dongdaemunyok.length; i++) {
			  	
			    addMarkerWithTimeout(dongdaemunyok[i], i * 200);
			  
		  }
		  
	  }else if( address == "명동역" || address == "myeongdong" ){
		  	  
		  for (var i = 0; i < myeongdong.length; i++) {
			  	
			    addMarkerWithTimeout(myeongdong[i], i * 200);
			  
		  }
		  
	  }
  
}

function addMarkerWithTimeout(position, timeout) {
	
  window.setTimeout(function() {
	  
    markers.push(new google.maps.Marker({
      position: position,
      map: map,
      animation: google.maps.Animation.DROP
    }));
  }, timeout);
  
}

/////////////////////////////////3. geocodeAddress ///////////////////////////////////////////

function geocodeAddress(geocoder, resultsMap) {	
	
  var address = document.getElementById('address').value;
  
  geocoder.geocode({'address': address}, function(results, status) {
  	
    if (status === google.maps.GeocoderStatus.OK) {
    	
      resultsMap.setCenter(results[0].geometry.location);
      
      var marker = new google.maps.Marker({
        map: resultsMap,
        position: results[0].geometry.location
      });
      
     // ì ë³´ íì  ëì°ê¸° -> Kangnam 
      var infowindow = new google.maps.InfoWindow({
		    content: contentString
	  });
	
	  marker.addListener('click', function() {
	    infowindow.open(map, marker);
	  });
     // 
      
    } else {
      alert('Geocode was not successful for the following reason: ' + status);
    }
  });
  
  
  
} // geocodeAddress


//////////////////////////////GeoLocation////////////////////////////////////////

	function handleLocationError(browserHasGeolocation, infoWindow, pos) {
		
	
		infoWindow.setPosition(pos);
		infoWindow.setContent(browserHasGeolocation ?
		                      'Error: The Geolocation service failed.' :
		                      'Error: Your browser doesn\'t support geolocation.');
	}



///////////////////////////////// transition /////////////////////////////////////////////////////

function calculateAndDisplayRoute(directionsService, directionsDisplay) {
			
		  var selectedMode = document.getElementById('mode').value;
		  var start = document.getElementById('start').value;
		  var end = document.getElementById('end').value;  
  
  		directionsService.route({
	 	    
		    origin: start ,
		    destination: end ,
		    travelMode: google.maps.TravelMode[selectedMode]
		    
		  }, function(response, status) {
		    if (status == google.maps.DirectionsStatus.OK) {
		      directionsDisplay.setDirections(response);
		    } else {
		      window.alert('Directions request failed due to ' + status);
		    }
		  });
		}
		
//////////////////////////////////// Food search //////////////////////////////////////////////
/*
function foodSearch(){
	
	
// 	var kangnam = {lat: 37.497780, lng: 127.027715} ; 

// 	  map = new google.maps.Map(document.getElementById('map'), {
	  	
// 	    center: kangnam,
// 	    zoom: 17
	    
// 	  }); 

	  infowindow = new google.maps.InfoWindow();

	  service = new google.maps.places.PlacesService(map);
	  
	  
// 	  document.getElementById('submit4').addEventListener('click', function(){
	  	
	  var foodType = document.getElementById('foodType').value ;
	  	
		  	service.nearbySearch({
		    location: kangnam,
		    radius: 500,
		    types: ['food'],
		    name : [foodType] 
		  }, callback);
	  	
// 	  }); 
	
}
*/


function callback(results, status) {
  if (status === google.maps.places.PlacesServiceStatus.OK) {
    for (var i = 0; i < results.length; i++) {
      createMarker(results[i]);
    }
  }
}

function createMarker(place) {
	  
	  
	  addMarker2(place, place.geometry.location); 
	 
	}


function addMarker2(place ,location) {
	
	  var marker = new google.maps.Marker({
	  	
	    position: location,
	    map: map
	    
	  });
	  
	  //
	    google.maps.event.addListener(marker, 'click', function() {
	    infowindow.setContent(place.name);
	    infowindow.open(map, this); }); 
	  //
	  
	  markers.push(marker);
	  
	}


/////////////////////////////////////////////////////////////////////////

// Adds a marker to the map and push to the array.
// function addMarker(location) {
	
//   var marker = new google.maps.Marker({
//     position: location,
//     map: map
//   });
  
//   markers.push(marker);
// }

// Sets the map on all markers in the array.
function setMapOnAll(map) {
  for (var i = 0; i < markers.length; i++) {
    markers[i].setMap(map);
  }
}

// Removes the markers from the map, but keeps them in the array.
function clearMarkers() {
  setMapOnAll(null);
}

// Shows any markers currently in the array.
function showMarkers() {
  setMapOnAll(map);
}

// Deletes all markers in the array by removing references to them.
function deleteMarkers() {
  clearMarkers();
  markers = [];
}

//////////////////////////////////////////////////////////////////////////////////////

    </script>
    
<!--     <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDBJgr932MqoEUFSo0u5NDb2OZu9DuBPVg&signed_in=true&callback=initMap" -->
<!--         async defer> -->
    
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD9zc7f3nY1hhjEex7pz3R9cHruDyaLVqk&signed_in=true&callback=initMap"
        async defer>
    
    // AIzaSyD9zc7f3nY1hhjEex7pz3R9cHruDyaLVqk
    </script>
        
    
        
        
  </body>
</html>



