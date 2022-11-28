<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="inc/header.jsp" %>

	<div id="corps">
		<h1 id="titre-principal">Veuillez entrer vos identifiants</h1>
		
		<c:if test="${connectionFailed == true }">
			<p class="errorMessage">Erreur, veuillez réessayer!</p>
		</c:if>
		<form method="post">
			<div class="formItem">
				<label>Identifiant: </label>
				<input type="text" name="identifiant" value="${ login }">
			</div>
			<div class="formItem">
				<label>Mot de passe: </label>
				<input type="password" name="motdepasse">
			</div>
			<div class="formItem">
				<label></label>
				<input type="submit" value="Se connecter">
			</div>
		</form>
	</div>
<%@include file="inc/footer.jsp" %>