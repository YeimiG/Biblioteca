
package Config;

import java.sql.*;

public class Conexion {
    Connection con;
    public Conexion(){
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            //Class.forName("com.mysql.cj.jdbc.Driver");
           con = DriverManager.getConnection("jdbc:sqlserver://PC-YEIMI:1433;databaseName=ProyectoDSl;user=proyecto;password=12345;");
            //con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ejemplobd?useTimeZone=true&serverTimezone=UTC&autoReconnect=true&useSSL=false","root","root");
        } catch (ClassNotFoundException | SQLException e) {
            System.err.println("Error: \n"+e.getClass()+"\n"+e.getMessage());
        }
    }
    public Connection getConnection(){
        return con;
    }
}
