package kr.or.ksmart.driverdb;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DriverDB {
    public Connection driverDbconnection() throws ClassNotFoundException, SQLException {
        Connection connectionToMethod;
        System.out.println("01 Loaded Driver DB Connection and driverDbconnection method is called");
        Class.forName("com.mysql.cj.jdbc.Driver");
        String jdbcDriver = "jdbc:mysql://localhost:3306/db07khb?" +
                "useUnicode=true&characterEncoding=utf8";
        String dbId = "dbid07khb";
        String dbPw = "dbpw07khb";
        connectionToMethod = DriverManager.getConnection(jdbcDriver, dbId, dbPw);
        return connectionToMethod;
    }
}
