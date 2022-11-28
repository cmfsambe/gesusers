<%@ page contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="inc/header.jsp"></jsp:include>

	<div id="corps">
		<h1 id="titre-principal">Ajout d'un utilisateur</h1>
		<p class="messageBox ${ status ? 'succes' : 'erreur' }">${ statusMessage }</p>
		<form method="post">
			<div class="formItem">
				<label>Nom</label>
				<input type="text" name="nom" value="${ utilisateur.nom }">
				<span class="erreur">${ erreurs.nom }</span>
			</div>
			<div class="formItem">
				<label>Prénom</label>
				<input type="text" name="prenom" value="${ utilisateur.prenom }">
				<span class="erreur">${ erreurs.prenom }</span>
			</div>
			<div class="formItem">
				<label>Login</label>
				<input type="text" name="login" value="${ utilisateur.login }">
				<span class="erreur">${ erreurs.login }</span>
			</div>
			<div class="formItem">
				<label>Password</label>
				<input type="password" name="password">
				<span class="erreur">${ erreurs.password }</span>
			</div>
			<div class="formItem">
				<label>Confirm Password</label>
				<input type="password" name="passwordBis">
				<span class="erreur">${ erreurs.passwordBis }</span>
			</div>
			<div class="formItem">
				<label></label>
				<input type="submit" value="ajouter">
			</div>
		</form>
	</div>
<%@include file="inc/footer.jsp" %>