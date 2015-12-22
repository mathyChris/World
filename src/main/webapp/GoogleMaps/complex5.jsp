<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false" trimDirectiveWhitespaces="true"%>

<!DOCTYPE html>
<html>
  <head>
    <title>Place searches</title>
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
	
/* 	#floating-panel2 {
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
	} */

    </style> 
    
    <div id="floating-panel1">
    
      <input id="address" type="textbox" value="Input Here" >
      <input id="submit" type="button" value="PlaceSearch">
      <input onclick="myLocatin();" type=button value="MyLocation">
<!--       <input id="submit3" type="button" value="MyLocation"> -->
      <br>
      <!-- <button id="drop" onclick="drop()">Drop Markers</button> -->
      
      <input onclick="drop();" type=button value="Favorite">
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
  
  
  var Insadong = [
                  
          		{ lat: 37.561686,  lng: 126.986431}, 
          		{ lat: 	37.574057, lng:126.985843 }, 
          		{ lat: 37.564031,  lng: 126.983833 },
          		{ lat: 37.572023,  lng:126.986449 }, 
          		{ lat: 37.571705, lng: 126.986566}, 
          		{ lat: 37.573249, lng: 126.986097 }, 
          		{ lat: 37.574616, lng: 126.985169 }, 
          		{ lat: 37.571804, lng: 126.986774 }, 
          		{ lat: 37.574206, lng: 126.984294 }, 
          		{ lat: 37.575258, lng: 126.983615}


  ];
  
  var kyungbokyok = [
                  
          		{ lat: 37.579772,  lng: 126.971048}, 
          		{ lat: 	37.577734, lng:126.971536 }, 
          		{ lat: 37.5765,  lng: 126.970888 },
          		{ lat: 37.577822,  lng:126.980505 }, 
          		{ lat: 37.576099, lng: 126.973327}, 
          		{ lat: 37.574645, lng: 126.970956 }, 
          		{ lat: 37.576016, lng: 126.973047 }, 
          		{ lat: 37.577362, lng: 126.972625 }, 
          		{ lat: 37.579469, lng: 126.972506 }, 
          		{ lat: 37.578374, lng: 126.973669}


  ];
  
  var hongdaeyok = [
                    
             		{ lat: 37.548402,  lng: 126.919895}, 
             		{ lat: 	37.555738, lng:126.925689 }, 
             		{ lat: 37.551111,  lng: 126.922638},
             		{ lat: 37.552088,  lng:126.921257 }, 
             		{ lat: 37.550383, lng: 126.919789}, 
             		{ lat: 37.552223, lng:126.922645 }, 
             		{ lat: 37.551371, lng: 126.922032 }, 
             		{ lat: 37.556202, lng: 126.928236 }, 
             		{ lat: 37.556385, lng: 126.92978 }, 
             		{ lat: 37.549406, lng: 126.918513}


  ];
  
  var gundaeyok = [
                    
             		{ lat: 37.540893,  lng:127.070208}, 
             		{ lat: 37.540558,  lng:127.067067 }, 
             		{ lat: 37.543116,  lng: 127.070582},
             		{ lat: 37.542923,  lng:127.071646 }, 
             		{ lat: 37.542931, lng:127.071645}, 
             		{ lat: 37.539327, lng:127.067351 }, 
             		{ lat: 37.542627, lng: 127.071032 }, 
             		{ lat: 37.538893, lng: 127.07567 }, 
             		{ lat:37.537762, lng: 127.072598 }, 
             		{ lat:37.540227, lng:127.06742}


  ];
  
    
    </script>
    
    
    <script>
    
		var map ;
		var infowindow ;
		var service ; 
	    var markers = [] ;
	    var address ;
	    var results = [] ; 

function initMap() {
	
	var directionsDisplay = new google.maps.DirectionsRenderer() ;
	var directionsService = new google.maps.DirectionsService();
	 infowindow = new google.maps.InfoWindow();
	
	var kangnam = {lat: 37.497780, lng: 127.027715} ; 

	  map = new google.maps.Map(document.getElementById('map'), {
	  	
	    center: kangnam,
	    zoom: 15
	    
	  });
	  
	  
////////////////////////////// Transition //////////////////////////////////////////////////////////


	  directionsDisplay.setMap(map);
		
	  document.getElementById('submit2').addEventListener('click', function() {
		  
		  calculateAndDisplayRoute(directionsService, directionsDisplay);
		    
	  });
	 

 //////////////////////////// food search ////////////////////////////////////////////////
 
  
  document.getElementById('submit4').addEventListener('click', function(){
	  
	 service = new google.maps.places.PlacesService(map);
	 address = document.getElementById('address').value;
	 
	 
	
  	 var foodType = document.getElementById('foodType').value;
  	 var geocoder = new google.maps.Geocoder();
  	 geocoder.geocode({'address': address}, function(results, status) {
  		 
  	   if(status === google.maps.GeocoderStatus.OK){
  	      map.setCenter(results[0].geometry.location);
  	      
//   	      var marker = new google.maps.Marker({
//   	        map: resultsMap,
//   	        position: results[0].geometry.location
//   	      });
  	      
//   	 }); 
  	
	  	service.nearbySearch({
// 	    location: kangnam,
//      location: slocation,
		location : results[0].geometry.location, 
	    radius: 700,
	    types: ['food'],
	    name : [foodType] 
	  }, callback);
	  	
  	  }else {
  		  
  	      alert('Geocode was not successful for the following reason: ' + status);
      }
	  	
  	 }); 	
 

  	
  	}); // eventListener
   
/////////////////////////////   place search   /////////////////////////////////////////////// 

  var geocoder = new google.maps.Geocoder();

  document.getElementById('submit').addEventListener('click', function() {
  	
    geocodeAddress(geocoder, map);
    
  });
  
  
  //////////////////////////////// add marker///////////////////////////////////////////////////////////
  
   map.addListener('click', function(event) {
	   
    addMarker(event.latLng);
    
  });
  
  addMarker();
  
} // # init end 


//////////////////////////1. Geolocation///////////////////////////////////////////

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


  function handleLocationError(browserHasGeolocation, infoWindow, pos) {


	  infoWindow.setPosition(pos);
	  infoWindow.setContent(browserHasGeolocation ?
	  'Error: The Geolocation service failed.' :
	  'Error: Your browser doesn\'t support geolocation.');
	  }



/////////////////////////////// 2. Drop ///////////////////////////////////


function drop() {
	
  clearMarkers();
  
  address = document.getElementById('address').value;
  
// default places 
//   for (var i = 0; i < neighborhoods.length; i++) {
	  	
// 	    addMarkerWithTimeout(neighborhoods[i], i * 200);
	  
// 	  }
  
  
  address = document.getElementById('address').value; // 한글 변환 문제 
  
	  if(address == "강남역" || address == "gangnam"){
		  
		  for (var i = 0; i < gangnam.length; i++) {
		  	
		    addMarkerWithTimeout(gangnam[i], i * 200);
		  
		  }
		  
	  }
	  else if( address == "잠실역" || address == "jamsil") {
		  
		  for (var i = 0; i < jamsil.length; i++) {
			  	
			    addMarkerWithTimeout(jamsil[i], i * 200);
			  
		  }
		  
	  }else if( address == "이태원" || address == "itaewon" ){
	  
		  	  
		  for (var i = 0; i < itaewon.length; i++) {
			  	
			    addMarkerWithTimeout(itaewon[i], i * 200);
			  
		  }
		  
	  }else if( address == "동대문역" || address == "dongdaemun" ){
		  	  
		  for (var i = 0; i < dongdaemun.length; i++) {
			  	
			    addMarkerWithTimeout(dongdaemun[i], i * 200);
			  
		  }
		  
	  }else if( address == "인사동" || address == "insa dong" ){
		  	  
		  for (var i = 0; i < Insadong.length; i++) {
			  	
			  addMarkerWithTimeout(Insadong[i], i * 200);
			  
		  }
		  
	  }else if( address == "경복궁역" || address == "kyungbok station" ){
		  	  
		  for (var i = 0; i < kyungbokyok.length; i++) {
			  	
			  addMarkerWithTimeout(kyungbokyok[i], i * 200);
			  
		  }
	  }else if( address == "홍대역" || address == "hongdae station" || address == "hongdae"){
		  	  
		  for (var i = 0; i < hongdaeyok.length; i++) {
			  	
			  addMarkerWithTimeout(hongdaeyok[i], i * 200);
			  
		  }
	  }else if( address == "건대역" || address == "gundae station" || address == "gundae"){
		  	  
		  for (var i = 0; i < gundaeyok.length; i++) {
			  	
			  addMarkerWithTimeout(gundaeyok[i], i * 200);
			  
		  }
	  }
  
}

function addMarkerWithTimeout(position, timeout) {
	
// 	deleteMarkers(); 
	
  window.setTimeout(function() {
	  
    markers.push(new google.maps.Marker({
    	
      position: position,
      map: map,
      animation: google.maps.Animation.DROP
      
    }));
    
  }, timeout);
  
}

   
  
///////////////////////////////// 3. geocodeAddress ///////////////////////////////////////////

  function geocodeAddress(geocoder, resultsMap) {	
  	
//     var address = document.getElementById('address').value;
    address = document.getElementById('address').value;
    
    geocoder.geocode({'address': address}, function(results, status) {
    	
      if (status === google.maps.GeocoderStatus.OK) {
      	
        resultsMap.setCenter(results[0].geometry.location);
        
        var marker = new google.maps.Marker({
          map: resultsMap,
          position: results[0].geometry.location
        });
        
       // Ã¬Â ÂÃ«Â³Â´ Ã­ÂÂÃ¬ÂÂ  Ã«ÂÂÃ¬ÂÂ°ÃªÂ¸Â° -> Kangnam 
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



///////////////////////////// food search //////////////////////////////////////////////////

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

//////////////////////////////// commons ///////////////////////////////////////

function addMarker(location) {
	
  var marker = new google.maps.Marker({
  	
    position: location,
    map: map
    
  });
  
  markers.push(marker);
  
} 


function deleteMarkers() {
	
  clearMarkers();
  markers = [];
  
}


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

/////////////////////////////// transition ////////////////////////////////////////////////////

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


    </script>
  </head>
  <body>
    <div id="map"></div>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDBJgr932MqoEUFSo0u5NDb2OZu9DuBPVg&signed_in=true&libraries=places&callback=initMap" async defer></script>
  </body>
</html>




