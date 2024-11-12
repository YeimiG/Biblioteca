<%-- 
    Document   : index
    Created on : 27 oct 2024, 11:53:11 a. m.
    Author     : YEIMI
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <title>Página Principal</title>
</head>
<body class="align">

  <div class="grid align__item">

    <div class="register">

      
      <h2>Bienvenidos</h2>

      <form action="" method="post" class="form">

        <div class="form__field">
        <a href="InicioSesion.jsp" class="form__button">Iniciar Sesión</a>
        <a href="registrar.jsp" class="form__button">Registrarse</a>
       </div>


      </form>


 <% 
                String message = request.getParameter("message");
                if (message != null) { 
            %>
                <div id="successMessage" class="alert alert-success mt-3 text-center" role="alert">
                    <%= message %>
                </div>
            <% 
                } 
            %>

            
             
            

            <c:if test="${not empty param.error}">
                <div class="alert alert-danger mt-3">${param.error}</div>
            </c:if>
        
   
    <script>
        setTimeout(function() {
            var successMessage = document.getElementById("successMessage");
            if (successMessage) {
                successMessage.style.display = "none";
            }
        }, 2000);
    </script>
    </div>

  </div>

</body>
</html>


