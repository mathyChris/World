<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>    

<!DOCTYPE html>

<html lang="ko" data-ng-app="worldApp">

<head>

<meta name="viewport" content="width=device-width, initial-scale=1.0"> <!-- reponsive app 구현위해  -->

<meta charset="UTF-8">

<%@ include file="/commons.jspf" %>

<title>main.jsp</title>


<!-- URL Resolve -->
<c:url var ="URL_GET_LIST" 				value="/city/"/>
<c:url var ="URL_GET_PAGE_BASE" 		value="/city/page/"/> <%-- /city/page/{pageNo} --%>
<c:url var ="URL_GET_ITEM_BASE" 		value="/city/"/>	  <%-- /city/{id} --%>


<c:url var ="URL_POST_LIST_APPEND" 		value="/city/"/>
<c:url var ="URL_POST_ITEM_APPEND" 		value="/city/"/>

<c:url var ="URL_PUT_LIST_MODIFY" 		value="/city/"/>
<c:url var ="URL_PUT_ITEM_MODIFY_BASE"	value="/city/"/>  <%-- /city/{id} --%>



<c:url var ="URL_DELETE_ITEM_DELETE_BASE" value="/city/"/>  <%-- /city/{id} --%>



<script type="text/javascript">

//{} 는 객체 생성 
	var urls = { 
			
			GET_LIST : 			"${URL_GET_LIST}" , 
			GET_PAGE_BASE : 	"${URL_GET_PAGE_BASE}" , 
			GET_ITEM_BASE : 	"${URL_GET_ITEM_BASE}", 
			
			
			POST_LIST_APPEND : 	"${URL_POST_LIST_APPEND}",
			POST_ITEM_APPEND : 	"${URL_POST_ITEM_APPEND}",
			
			PUT_LIST_MODIFY : 	"${URL_PUT_LIST_MODIFY}",
			PUT_ITEM_MODIFY_BASE : 	"${URL_PUT_ITEM_MODIFY_BASE}",
			
			
			DELETE_ITEM_DELETE_BASE : 	"${URL_DELETE_ITEM_DELETE_BASE}"
			
	}; 

	var deps = [ 
	            
	            'ngRoute',
	            'ngAnimate',
	            'ngTouch',
	            'angular-loading-bar' // chart , progress 이든 dependency 로 사용하기 위해 여기에 추가하면 된다. 
	            
	           ];

	var app = angular.module('worldApp', deps); 
	
	
	
	// in default webpage, 디폴트 페이지로 /list 를 붙여 보여줌 , 상단 내비 바를 눌러도 화면 loading되게 함....
	app.config(function($routeProvider) {
		
		
		$routeProvider.otherwise({
			
			redirectTo: "/list" // 이걸 추가하면 아래의 $location.path("/list")를 없애도 된다. 
			
		}); 
		
	}); 
	
	
	// constant 의 사용 
	app.constant("URL", urls) ;  // angular 의 factory 에 넣은 것과 같다. 따라서 얼마든지 여러 곳에 injection 가능(여기저기 사용 가능) 
	// listControl.js ==> using 'URL' in "app.controller(~ , URL)"

	
	
	
	// angular 의 문법, router 설정 ==> provider 로 ...
// 	app.config(function($routeProvider) { 	// 설정하는 부분 
		
// 		console.log("Route config ... "); 
	
// 		$routeProvider.when("/list" , {  // 부분 페이지가 아래에 들어간다. <div data-ng-view>로 ...
			
// 			templateUrl: "list.html", 
// 			controller : "listController"	
		
		
// 		}) ; 
		
// 	});
	
	
	// 
	app.controller('mainController', function($scope, $http, $location) { // 모델 설정 ==> scope 
		
		console.log("mainController...");
		
//		$location.path("/list") ; //  automatic, adding '#/list' to URL in 'URL window', 위의 app.config를 붙이면 생략 가능 
		// http://localhost:8080/Employee/city/main.html#/list
		
		
		
// bootstrap_js를 다운 받아서 아래 두 군데 ($scope.StaticOrFixed 와 $scope.setMenuStyle() )에서  static/fixed 를 구현하도록 함... 
		$scope.StaticOrFixed = "navbar-static-top" ; 
		
		// navi-bar change to Fixed or Static
		$scope.setMenuStyle = function(str){
			
			
			$scope.StaticOrFixed = str; 
			
		}; 
	
	});
////////////////////////////////////////////////////////	
	
	
	
</script>



<c:url var="listController" value="/js/country/listController.js"/>
<c:url var="detailController" value="/js/country/detailController.js"/>

<c:url var="appendController" value="/js/country/appendController.js"/>
<c:url var="modifyController" value="/js/country/modifyController.js"/>
<c:url var="deleteController" value="/js/country/deleteController.js"/>

<script type="text/javascript" src="${listController}"></script>
<script type="text/javascript" src="${detailController}"></script>

<script type="text/javascript" src="${appendController}"></script>
<script type="text/javascript" src="${modifyController}"></script>
<script type="text/javascript" src="${deleteController}"></script>



</head>

<body data-ng-controller="mainController" class="container">

 
	<h1 style="background-color : red"> Country : {{title}} </h1>
	
	<div data-ng-view> <!--  -->
	
	
	</div>

</body>

</html>







