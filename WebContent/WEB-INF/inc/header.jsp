<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page language="java" contentType="text/html"  pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Gestion des utilisateurs</title>
	<link rel="stylesheet" href="<c:url value="/css/design.css"/>">
	<script src="<c:url value="/js/script.js"/>"></script>
</head>
<body>
	<div id="entete">Gestion des utilisateurs</div>
	<div id="menu">
		<ul>
			<li><a href="<c:url value="/accueil"/>">Accueil</a></li>
			
			<c:choose>
			<c:when test="${sessionScope.isConnected }">
				<li><a href="<c:url value="/list"/>">Lister</a></li>
				<li><a href="<c:url value="/add"/>">Ajouter</a></li>
				<li><a href="<c:url value="/logout"/>">Déconnection</a></li>
			</c:when>
			<c:otherwise>
				<li><a href="<c:url value="/login"/>">Connection</a></li>
			</c:otherwise>
			</c:choose>
			
		</ul>
	</div>