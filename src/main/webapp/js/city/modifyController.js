/**
 * @author java
 */

//	1. route 설정하는 부분
 	app.config(function($routeProvider) { 
		
 		console.log("/modify config ... "); 
	
 		$routeProvider.when("/modify" , { // main.jsp 의 <div data-ng-view> 부분으로 들어간다. 
			
 			templateUrl: "modify.jsp", 
 			controller : "modifyController"	
		
 		}) ; 
		
 	});


//	2. detailController 설정 부분 	
app.controller('modifyController', function($scope, $http, URL){ // $http는 Ajax를 사용하기 위한 것 
	
	console.log("modifyController..."); 
	console.log("URL.PUT_ITEM_MODIFY_BASE = " + URL.PUT_ITEM_MODIFY_BASE); 

	$scope.$parent.title = "Modify City View"; 	
 
	
	}); 

