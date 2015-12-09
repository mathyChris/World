/**
 * @author java
 */

//	1. route 설정하는 부분
 	app.config(function($routeProvider) { 
		
 		console.log("/detail config ... "); 
	
 		$routeProvider.when("/detail" , { // main.jsp 의 <div data-ng-view> 부분으로 들어간다. 
			
 			templateUrl: "detail.jsp", 
 			controller : "detailController"	
		
 		}) ; 
		
 	});


//	2. detailController 설정 부분 	
app.controller('detailController', function($scope, $http, URL){ // $http는 Ajax를 사용하기 위한 것 
	
	console.log("detailController..."); 
	console.log("URL.GET_ITEM_BASE = " + URL.GET_ITEM_BASE); 

	$scope.$parent.title = "Detail City View"; 	
 
	
	}); 

