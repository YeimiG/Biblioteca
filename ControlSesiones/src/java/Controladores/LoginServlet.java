/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controladores;

import java.io.IOException;
import java.sql.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import Config.Conexion;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        // Dependiendo de la acción, se realiza el registro o inicio de sesión
        if ("registrar".equals(action)) {
            registrarUsuario(request, response);
        } else if ("login".equals(action)) {
            iniciarSesion(request, response);
        }
    }

    // Método para registrar un nuevo usuario
    private void registrarUsuario(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String nombreCompleto = request.getParameter("nombreCompleto");
        String usuario = request.getParameter("usuario");
        String email = request.getParameter("email");
        String clave = request.getParameter("clave");
        String fechaNacimiento = request.getParameter("fecha_nacimiento");

        // Verificar la conexión a la base de datos
        try (Connection conn = new Conexion().getConnection()) {
            if (conn == null) {
                response.sendRedirect("error.jsp?error=No se pudo conectar a la base de datos");
                return;
            }

            String query = "INSERT INTO usuarios (nombreCompleto, usuario, email, clave, fecha_nacimiento) VALUES (?, ?, ?, ?, ?)";
            try (PreparedStatement pstmt = conn.prepareStatement(query)) {
                pstmt.setString(1, nombreCompleto);
                pstmt.setString(2, usuario);
                pstmt.setString(3, email);
                pstmt.setString(4, clave);  // Guardamos la contraseña tal cual, en texto claro (no recomendable)
                pstmt.setString(5, fechaNacimiento);

                int rowsAffected = pstmt.executeUpdate();
                if (rowsAffected > 0) {
                    response.sendRedirect("index.jsp?message=Registro exitoso. Por favor, inicie sesion.");
                } else {
                    response.sendRedirect("registrar.jsp?error=Error al registrar el usuario");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }

    // Método para iniciar sesión
    private void iniciarSesion(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String usuario = request.getParameter("usuario");
        String clave = request.getParameter("clave");

        // Verificar la conexión a la base de datos
        try (Connection conn = new Conexion().getConnection()) {
            if (conn == null) {
                response.sendRedirect("error.jsp?error=No se pudo conectar a la base de datos");
                return;
            }

            String query = "SELECT * FROM usuarios WHERE usuario = ?";
            try (PreparedStatement pstmt = conn.prepareStatement(query)) {
                pstmt.setString(1, usuario);
                ResultSet rs = pstmt.executeQuery();

                if (rs.next()) {
                    String storedPassword = rs.getString("clave"); // Recuperamos la contraseña almacenada (en texto claro)

                    // Verificar si la contraseña ingresada coincide con la almacenada
                    if (clave.equals(storedPassword)) {
                        // Inicio de sesión exitoso
                        HttpSession session = request.getSession();
                        session.setAttribute("usuario", usuario);
                        response.sendRedirect("Menu.jsp"); // Redirigir al menu
                    } else {
                        // Contraseña incorrecta
                        response.sendRedirect("InicioSesion.jsp?error=Usuario o clave incorrectos");
                    }
                } else {
                    // Usuario no se encontró
                    response.sendRedirect("InicioSesion.jsp?error=Usuario no encontrado");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }

}
