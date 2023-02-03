<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Administrator</title>
    <link rel="stylesheet" type="text/css" href="assets/Login/css/style.css">
    <link href="https://fonts.googleapis.com/css?family=Poppins:600&display=swap" rel="stylesheet">
     <link rel="stylesheet" href="assets/General/bootstrap/css/bootstrap.min.css">
    <script src="https://kit.fontawesome.com/a81368914c.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>

   <h1>Back Office Administrateur</h1>
     <form method="POST" action="/login" class="card-body mx-auto w-50 bg-gradient-success p-3">
     		      		<div class="form-group">
     		      			<input type="text" class="form-control rounded-left"  name="email" value="${email}" required>
     		      		</div>
                         <div class="form-group d-flex">
                           <input type="password" class="form-control rounded-left" placeholder="Mot de passe" name="mdp" value="${mdp}" required>
                         </div>
                         <div class="form-group">
                             <button type="submit" class="form-control btn btn-primary rounded submit px-3">connexion</button>
                         </div>

                         <div class="form-group d-md-flex">
                             <%
                                 if(request.getParameter("error")!=null){ %>
                                     <p style="color:red;">Connexion échouée, veuillez réessayer</p>
                             <% } %>
                         </div>
     	          </form>
</body>
</html>
--%>
