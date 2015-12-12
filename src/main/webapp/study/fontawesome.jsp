<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>    

<!DOCTYPE html>
<html lang="ko" data-ng-app="worldApp">

<head>

<meta name="viewport" content="width=device-width, initial-scale=1.0"> <!-- mobile 환경에서 responsive web 구현하기 위한 부분 -->

<meta charset="UTF-8">

<%@ include file="/commons.jspf" %>

<title>fontawesome.jsp</title>

<script type="text/javascript">

// 	 setting to use 'module' 

	var deps = [
	            
	            'ngRoute',
	            'ngAnimate',
	            'ngTouch',
	            'angular-loading-bar'
	            
	           ];

	var app = angular.module('worldApp', deps);
	
	app.controller('mainController', function($scope, $http) {
		
		console.log("mainController...");
		
		
		$scope.title = "Font-Awesome Example" ; 
		$scope.click = function() {
			
			log.dir("Click!!");
			$scope.title = "click!!"; 
			
		}
		
	});
	
</script>

</head>

<body data-ng-controller="mainController" class="container">

	<h1><a href="#" class="btn btn-primary" data-ng-click="click()" > {{title}} </a></h1>
	
	<div><i class="fa fa-spinner fa-spin fa-2x"></i></div>
	<i class="fa fa-spinner fa-pulse fa-3x"></i>
	<div><i class="fa fa-circle-o-notch fa-spin fa-4x"></i></div>
	<div><i class="fa fa-refresh fa-spin fa-5x"></i></div>
	<div><i class="fa fa-cog fa-spin fa-5x"></i></div>
	<div><i class="fa fa-cog fa-spin fa-5x"></i></div>
	

</body>

</html>







