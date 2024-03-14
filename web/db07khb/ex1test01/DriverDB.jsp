<%--
  Created by IntelliJ IDEA.
  User: ksmart
  Date: 2024-02-29
  Time: 오전 9:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="kr.or.ksmart.driverdb.DriverDB" %>
<%@ page import="java.sql.Connection" %>
<%
    Connection connectionToTest;
    DriverDB driverDB = new DriverDB();
    connectionToTest = driverDB.driverDbconnection();
    System.out.printf("%s <== connectionToTest\n", connectionToTest);
%>
