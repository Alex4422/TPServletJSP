package model;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
    private static Connection connection=null;


    public static Connection getConnection(){

        if (connection == null){
            try {
                String driverName = "com.mysql.cj.jdbc.Driver";
                Class.forName(driverName);
            } catch (Exception e) {
                System.out.println(">>>>>>>>> Driver jdbc not found");
                throw new RuntimeException(e);
            }
            String databaseURL = "jdbc:mysql://localhost:8889/shop_products";
            String user = "root";
            String password = "root";

            try {
                Connection con = DriverManager.getConnection(databaseURL, user, password);
                connection = con;
            }catch (Exception ex){
                System.out.println("ex:  " + ex );
                return null;
            }
            System.out.println(">>>>>>>>>>>>>>>>> The connection at the DB is OK ");
        }

        System.out.println("conn: " + connection );
        return connection;
    }
}
