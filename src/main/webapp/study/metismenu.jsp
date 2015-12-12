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

<title>metismenu.jsp</title>

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
		
		
		$scope.title = "Metis Menu Example" ; 
		$scope.click = function() {
			
			log.dir("Click!!");
			$scope.title = "click!!"; 
			
		}
		
		
		$('#menu').metisMenu({
			
// 			toggle : false //아래 생성한 두 개의 리스트 각각 toggle 의 닫혔다 열렸다 함. 설정 안하면 한쪽만 열림.
		});
		
	});
	
</script>



<!-- 글자 크기를 화면 크기에 따라 자동으로 조절해주는 예  -->
<style type="text/css">

	.font-size{
	
		font-size : 10px ; 
		color : red ; 
	}
	
	
	@media (min-width:768px) { /* media curry는 css3 에서 등장, 최소 크기가 768 이상에서 글자 크기를 50px 로 변경*/
	
		.font-size{
		
			font-size : 50px  ;
			color : green  ;
		}
	
	}
	


</style>

</head>

<body data-ng-controller="mainController" class="container">

	<h1><a href="#" class="btn btn-primary font-size" data-ng-click="click()"> {{title}} </a></h1>
	
	<ul class="metismenu" id="menu">
	  <li class="active">
	    <a href="#"> Menu 1 </a>
	    <ul class="fa-ul">
	    	
	    	<li><i class="fa-li fa fa-spinner fa-2x fa-fw" style="color: red"></i> City1 </li>
	    	<li><i class="fa-li fa fa-circle-o-notch fa-2x fa-fw" style="color: green"></i> City2 </li>
	    	<li><i class="fa-li fa fa-refresh  fa-2x fa-fw" style="color: orange"></i>  City3 </li>
	 
	    </ul>
	  </li>
	  <li class="active">
	    <a href="#"> Menu 2 </a>
	    <ul class="fa-ul">
	    
	    	<li><i class="fa-li fa fa-spinner fa-2x fa-fw" style="color: red"></i> Country1 </li>
	    	<li><i class="fa-li fa fa-circle-o-notch fa-2x fa-fw" style="color: green"></i> Country2 </li>
	    	<li><i class="fa-li fa fa-refresh  fa-2x fa-fw" style="color: orange"></i> Country3 </li>
	  
	    </ul>
	  </li>
	
	  </ul>
	

</body>

</html>







