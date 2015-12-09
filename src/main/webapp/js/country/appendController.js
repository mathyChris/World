/**
 * @author java
 */

//	1. route 설정하는 부분
 	app.config(function($routeProvider) { 
		
 		console.log("/append config ... "); 
	
 		$routeProvider.when("/append" , { // main.jsp 의 <div data-ng-view> 부분으로 들어간다. 
			
 			templateUrl: "append.jsp", 
 			controller : "appendController"	
		
 		}) ; 
		
 	});


//	2. detailController 설정 부분 	
app.controller('appendController', function($scope, $http, URL){ // $http는 Ajax를 사용하기 위한 것 
	
	console.log("appendController..."); 
	console.log("URL.POST_ITEM_APPEND = " + URL.POST_ITEM_APPEND); 

	$scope.$parent.title = "Append City View"; 	
 
	
	}); 

