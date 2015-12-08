<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>    

<!DOCTYPE html>
<html lang="ko" data-ng-app="worldApp">

<head>


<title><sitemesh:write property='title'/></title>


    <sitemesh:write property='head'/>

</head>

<body data-ng-controller="mainController" class="container">
	
<hr>
<h1> Menu Employee World </h1>
<hr>


  <sitemesh:write property='body'/>

</body>

</html>







