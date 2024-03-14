<%--
  Created by IntelliJ IDEA.
  User: ksmart
  Date: 2024-02-13
  Time: 오후 2:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.SQLException" %>

<%
    request.setCharacterEncoding("utf-8");
    Connection conn = null;
    PreparedStatement pstmt = null;
//화면에서 입력자료 받아서 콘솔창에 출력 시작
    String uId = request.getParameter("u_id");
    String uPw = request.getParameter("u_pw");
    String uLevel = request.getParameter("u_level");
    String uName = request.getParameter("u_name");
    String uEmail = request.getParameter("u_email");
    String uPhone = request.getParameter("u_phone");
    String uAddr = request.getParameter("u_addr");

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
            conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);

        System.out.println(conn + "<-- conn");
    System.out.println(conn.getClass() + "<-- conn.getClass()");

    pstmt = conn.prepareStatement(
            "INSERT INTO tb_user VALUES (?, ?, ?, ?, ?, ?, ?)");
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        try {
            pstmt.setString(1, uId);
            pstmt.setString(2, uPw);
            pstmt.setString(3, uLevel);
            pstmt.setString(4, uName);
            pstmt.setString(5, uEmail);
            pstmt.setString(6, uPhone);
            pstmt.setString(7, uAddr);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }


        try {
            int result = pstmt.executeUpdate();
            System.out.println(result + "<-- result");
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }



    }finally{
    //06단계 :statement 또는 prepareStatement객체 종료(close())
    if (pstmt != null) try { pstmt.close(); } catch(SQLException ignored) {}
    //07단계 :Connection 객체 종료(close())
    if (conn != null) try { conn.close(); } catch(SQLException ignored) {}
    }

    response.sendRedirect(request.getContextPath() + "/mlist/m_list.jsp");
%>