<%@page import="beans.Utilisateur"%>
<%@page import="java.util.ArrayList"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="inc/header.jsp"></jsp:include>

	<div id="corps">
		<h1 id="titre-principal">Bienvenue ${connectedUser}</h1>
	</div>
	
<%@include file="inc/footer.jsp" %>