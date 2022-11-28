<%@page import="beans.Utilisateur"%>
<%@page import="java.util.ArrayList"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="inc/header.jsp"></jsp:include>

	<div id="corps">
		<h1 id="titre-principal">Liste des utilisateurs</h1>
		<c:choose>
			<c:when test="${empty utilisateurs }">
				<p>La liste des utilisateurs est pour le moment vide</p>
			</c:when>
			<c:otherwise>
				<table border="1">
					<tr>
						<th>ID</th>
						<th>Pr�nom</th>
						<th>Nom</th>
						<th>Login</th>
						<th>Password</th>
						<th colspan="2">Actions</th>
					</tr>
					<c:forEach var="utilisateur" items="${utilisateurs}">
						<tr>
							<td><c:out value= "${utilisateur.id}"/></td>
							<td><c:out value= "${utilisateur.nom}"/></td>
							<td><c:out value= "${utilisateur.prenom}"/></td>
							<td><c:out value= "${utilisateur.login}"/></td>
							<td><c:out value= "${utilisateur.password}"/></td>
							<td><a href="update?id=${utilisateur.id}">Modifier</a></td>
							<td><a href="delete?id=${utilisateur.id}" onclick="return confirmSuppression()">Supprimer</a></td>
						</tr>
					</c:forEach>
				</table>
			</c:otherwise>
		</c:choose>
	</div>
	
<%@include file="inc/footer.jsp" %>