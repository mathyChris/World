/**
 * @author java
 */

//	1. route 설정하는 부분
 	app.config(function($routeProvider) { 
		
 		console.log("/delete config ... "); 
	
 		$routeProvider.when("/delete" , { // main.jsp 의 <div data-ng-view> 부분으로 들어간다. 
			
 			templateUrl: "delete.jsp", 
 			controller : "deleteController"	
		
 		}) ; 
		
 	});


//	2. detailController 설정 부분 	
app.controller('deleteController', function($scope, $http, URL){ // $http는 Ajax를 사용하기 위한 것 
	
	console.log("deleteController..."); 
	console.log("URL.DELETE_ITEM_DELETE_BASE = " + URL.DELETE_ITEM_DELETE_BASE); 

	$scope.$parent.title = "Delete City View"; 	
 
	
	}); 

