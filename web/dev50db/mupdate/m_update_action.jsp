<%--
  Created by IntelliJ IDEA.
  User: ksmart
  Date: 2024-02-21
  Time: 오전 11:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.SQLException" %>

<%
    request.setCharacterEncoding("utf-8");
    Connection connectionTbUser = null;
    PreparedStatement preparedStatementTbUser = null;
//화면에서 입력자료 받아서 콘솔창에 출력 시작
    String uId = request.getParameter("m_id");
    String uPw = request.getParameter("m_pw");
    String uLevel = request.getParameter("m_level");
    String uName = request.getParameter("m_name");
    String uEmail = request.getParameter("m_email");
    String uPhone = request.getParameter("m_phone");
    String uAddr = request.getParameter("m_addr");

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
    } catch (ClassNotFoundException e) {
        throw new RuntimeException(e);
    }

    try{
        String jdbcDriver = "jdbc:mysql://localhost:3306/db07khb?" +
                "useUnicode=true&characterEncoding=utf8";
        String dbUser = "dbid07khb";
        String dbPass = "dbpw07khb";

        try {
            connectionTbUser = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);

            System.out.println(connectionTbUser + "<-- connectionTbUser");
            System.out.println(connectionTbUser.getClass() + "<-- connectionTbUser.getClass()");

            preparedStatementTbUser = connectionTbUser.prepareStatement(
                    "update tb_user set u_pw=?, u_email=?, u_phone=?, u_addr=? where u_id = ?");
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

            preparedStatementTbUser.setString(1, uPw);
            preparedStatementTbUser.setString(2, uEmail);
            preparedStatementTbUser.setString(3, uPhone);
            preparedStatementTbUser.setString(4, uAddr);
            preparedStatementTbUser.setString(5, uId);

            int resultSetTbUser = preparedStatementTbUser.executeUpdate();
            System.out.println(resultSetTbUser + "<-- result");




    }finally{
        //06단계 :statement 또는 prepareStatement객체 종료(close())
        if (preparedStatementTbUser != null) try { preparedStatementTbUser.close(); } catch(SQLException ignored) {}
        //07단계 :Connection 객체 종료(close())
        if (connectionTbUser != null) try { connectionTbUser.close(); } catch(SQLException ignored) {}
    }
    response.sendRedirect(request.getContextPath() + "/mlist/m_list.jsp");
%>