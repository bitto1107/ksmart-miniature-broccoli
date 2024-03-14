package kr.or.ksmart.driverdb;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DriverDbToDev50db {
    public Connection driverDbConnection() throws ClassNotFoundException, SQLException {
        Connection connectionToDev50db = null;
        Class.forName("com.mysql.jdbc.Driver");
        String jdbcDriver = "jdbc:mysql://localhost:3306/db07khb?" +
                "useUnicode=true&characterEncoding=utf8";
        String dbId = "dev50id";
        String dbPw = "dev50pw";
        connectionToDev50db = DriverManager.getConnection(jdbcDriver, dbId, dbPw);

        return connectionToDev50db;
    }
}
