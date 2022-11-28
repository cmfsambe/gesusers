<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="inc/header.jsp" %>

	<div id="corps">
	
		<h1 id="titre-principal">Déconnection réussie</h1>
	
		<form method="post">
			<p align="center"> ${ connectedUser }, vous vous êtes déconnecté avec success!</p>
			<div class="formItem">
				<label></label>
				<input type="submit" align="center" value= "continuer" name="deconnecter">
			</div>
		</form>
	</div>
<%@include file="inc/footer.jsp" %>