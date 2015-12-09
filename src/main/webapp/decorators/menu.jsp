<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>  
<%@ taglib prefix="sitemesh" tagdir="/WEB-INF/tags/sitemesh" %>  

<!DOCTYPE html>
<html lang="ko" data-ng-app="worldApp">

<head>


<title><sitemesh:write property='title'/></title>

    <sitemesh:write property='head'/>

</head>


<!-- 원래 main.jsp 에 있던 nav를 여기에 가져다 놓는다.  -->
<!-- Static navbar -->
<!--       <nav class="navbar navbar-default navbar-static-top"> --><!--  상단 navi bar 가 static  -->
    
<!--       <nav class="navbar navbar-default navbar-fixed-top"> -->

<nav class="navbar navbar-default {{StaticOrFixed}}">
    
      <div class="container-fluid">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">Project name</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav">
            <li class="active"><a href="#">Home</a></li>
            <li><a href="#">About</a></li>
            <li><a href="#">Contact</a></li>
            
            <li><a href="/World/jsp/city/main.jsp">City</a></li>
            <li><a href="/World/jsp/country/main.jsp">Country</a></li>
            
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Dropdown <span class="caret"></span></a>
              <ul class="dropdown-menu">
                <li><a href="#">Action</a></li>
                <li><a href="#">Another action</a></li>
                <li><a href="#">Something else here</a></li>
                <li role="separator" class="divider"></li>
                <li class="dropdown-header">Nav header</li>
                <li><a href="#">Separated link</a></li>
                <li><a href="#">One more separated link</a></li>
              </ul>
            </li>
          </ul>
          <ul class="nav navbar-nav navbar-right">
            <li class="active">
            	<a href="" data-ng-click="setMenuStyle('navbar-static-top')">Default </a>
            </li>
            <li><a href="" data-ng-click="setMenuStyle('navbar-static-top')">Static top</a></li>
            <li><a href="" data-ng-click="setMenuStyle('navbar-fixed-top')">Fixed top</a></li>
          </ul>
        </div><!--/.nav-collapse -->
      </div><!--/.container-fluid -->
    </nav>



<body data-ng-controller="mainController" class="container">
	

  <sitemesh:write property='body'/>
  
  
<!-- <hr> -->
<!-- <h1> Menu Employee World </h1> -->
<!-- <hr>   -->
  

</body>

</html>







