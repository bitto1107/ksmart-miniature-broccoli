<%--
  Created by IntelliJ IDEA.
  User: ksmart
  Date: 2024-02-29
  Time: 오전 11:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="kr.or.ksmart.driverdb.DriverDbToDev50db"%>
<%@ page import="java.sql.Connection" %>

<%
    DriverDbToDev50db ddb = new DriverDbToDev50db();
    Connection connectionToDev = ddb.driverDbConnection();
    System.out.printf("%s <-- connectionToDev\n", connectionToDev);
%>
