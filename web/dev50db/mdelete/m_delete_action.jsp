<%--
  Created by IntelliJ IDEA.
  User: ksmart
  Date: 2024-02-21
  Time: 오후 3:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.SQLException" %>

<%
    String send_id = request.getParameter("send_id");
    request.setCharacterEncoding("utf-8");
    Connection connectionTbUser = null;
    PreparedStatement preparedStatementTbUser = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
    } catch (ClassNotFoundException e) {
        throw new RuntimeException(e);
    }

    try {
        String jdbcDriver = "jdbc:mysql://localhost:3306/db07khb?" +
                "useUnicode=true&characterEncoding=utf8";
        String dbUser = "dbid07khb";
        String dbPass = "dbpw07khb";

        try {
            connectionTbUser = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
            System.out.println(connectionTbUser + "<-- connectionTbUser");
            System.out.println(connectionTbUser.getClass() + "<-- connectionTbUser.getClass()");

            preparedStatementTbUser = connectionTbUser.prepareStatement(
                    "delete from tb_user where u_id = ?");
            preparedStatementTbUser.setString(1, send_id);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        preparedStatementTbUser.executeUpdate();


    } finally {
        //06단계 :statement 또는 prepareStatement객체 종료(close())
        if (preparedStatementTbUser != null) try {
            preparedStatementTbUser.close();
        } catch (SQLException ignored) {
        }
        //07단계 :Connection 객체 종료(close())
        if (connectionTbUser != null) try {
            connectionTbUser.close();
        } catch (SQLException ignored) {
        }
    }
    response.sendRedirect(request.getContextPath() + "/mlist/m_list.jsp");
%>