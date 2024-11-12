
<%-- 
    Document   : registrar
    Created on : 27 oct 2024, 12:48:09 p. m.
    Author     : YEIMI
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <title>Registrarse</title>
    </head>
    <body class="align">

  <div class="grid align__item">

    <div class="register">

      <h2>Inserte sus datos</h2>

      <form action="LoginServlet" method="post" class="mt-4">
            <input type="hidden" name="action" value="registrar">
            
        <div class="form__field">
            <label for="nombreCompleto">Nombre:</label>
          <input type="text" name="nombreCompleto" placeholder="">
        </div>

        <div class="form__field">
           <label for="usuario">Usuario:</label>
          <input type="text" name="usuario" placeholder="">
        </div>
            
          <div class="form__field">
           <label for="email">Email:</label>
          <input type="email" name="email" placeholder="">
        </div>
            
        <div class="form__field">
           <label for="clave">Contraseña:</label>
          <input type="password" name="clave" placeholder="">
        </div>
           
        <div class="form__field">
           <label for="fechaNacimiento">Fecha de Nacimiento:</label>
          <input type="date" name="fechaNacimiento" placeholder="">
        </div> 

        <div class="form__field">
        <button type="submit" class="form__button">Registrarse</button>
        <a href="index.jsp" class="form__button">Regresar</a>
       </div>

         <c:if test="${not empty param.error}">
                <div class="alert alert-danger mt-3">${param.error}</div>
            </c:if>
      </form>



    </div>

  </div>
    </body>

</html>

