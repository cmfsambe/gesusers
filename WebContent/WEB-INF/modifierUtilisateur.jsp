<%@page import="beans.Utilisateur"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="inc/header.jsp"/>


	<div id="corps">
		<h1 id="titre-principal">Modification d'un utilisateur</h1>
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
				<input type="password" name="password" value="${ utilisateur.password }">
				<span class="erreur">${ erreurs.password }</span>
			</div>
			<div class="formItem">
				<label>Confirm Password</label>
				<input type="password" name="passwordBis" value="${ utilisateur.password }">
				<span class="erreur">${ erreurs.passwordBis }</span>
			</div>
			<div class="formItem">
				<label></label>
				<input type="submit" value="enregistrer">
			</div>
		</form>
	</div>
	
<c:import url="inc/footer.jsp"/>