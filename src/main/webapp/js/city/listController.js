/**
 * @author java
 */

//	1. route 설정하는 부분 ==> SPA 을 실현
 	app.config(function($routeProvider) { 
		
 		console.log("/list config ... "); 
	
 		$routeProvider.when("/list" , { // main.jsp 의 <div data-ng-view> 부분으로 들어간다. 
			
 			templateUrl: "list.jsp", 
 			controller : "listController"	
		
 		}) ; 
		
 	});


//	2. listController 부분 	
app.controller('listController', function($scope, $http, URL){ // $http는 Ajax를 사용하기 위한 것 
	// 'URL' from "main.jsp" 
	
	console.log("listController..."); 
	console.log("URL.GET_PAGE_BASE = " + URL.GET_PAGE_BASE); 
	
	$scope.$parent.title = "List City View"; 

	
//	var url_all = "/Employee/city";   // 임시로 하드 코딩 
//	var url_page = "/Employee/city/page/";
	
	var url_all = URL.GET_LIST;  
	var url_page = URL.GET_PAGE_BASE;
		
		
		$scope.pageNo = 1  ;
		$scope.cities = []; 
		$scope.paging = {} ; 
 
		
		$scope.selectPage = function(){ 
		
			$http.get(URL.GET_PAGE_BASE + $scope.pageNo).success(function(data, status, headers, config) {
				
				console.dir(data);
// 				alert("Success in url_all...."); 
			
				// firefox의 요소검사의 웹콘솔에서 보면 2개의 data인 cities 와 paging 를 넘기는데 이를 받아서 저장한다.  
				$scope.cities = data.cities ; // cities배열에 data로 넘어오는 cities를 저장, firefox 의 요소 검사에 console에 나오는 data 이름인 cities 를 사용 
				$scope.paging = data.paging ; 
				
			}) ;
 
	
	};
	
	
		$scope.selectPage(); 
	
	$scope.prevClick = function(pageNo) {
			
			console.log("PrevClick()...pageNo = " + pageNo); 
		
		$scope.pageNo = pageNo;
		$scope.selectPage(); 
		
	};


	$scope.nextClick = function(pageNo) {
		
		console.log("NextClick()...pageNo = " + pageNo); 
		
		$scope.pageNo = pageNo;
		$scope.selectPage(); 
		
	}; 
	
	
	$scope.pageClick = function(pageNo) {
		
		console.log("PageClick()...pageNo = " + pageNo); 
			
			$scope.pageNo = pageNo;
			$scope.selectPage(); 
					
		};
		
 
	
	}); 

