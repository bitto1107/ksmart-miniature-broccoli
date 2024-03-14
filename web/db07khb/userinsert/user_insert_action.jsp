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
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.SQLException" %>
<%@ page import="kr.or.ksmart.driverdb.DriverDB" %>

<%
    request.setCharacterEncoding("utf-8");
    PreparedStatement preparedStatementTbUser = null;
//화면에서 입력자료 받아서 콘솔창에 출력 시작
    String uId = request.getParameter("u_id");
    String uPw = request.getParameter("u_pw");
    String uLevel = request.getParameter("u_level");
    String uName = request.getParameter("u_name");
    String uEmail = request.getParameter("u_email");
    String uPhone = request.getParameter("u_phone");
    String uAddr = request.getParameter("u_addr");


    Connection connectionTbUser = null;
    try {
        DriverDB driverDB = new DriverDB();
        connectionTbUser = driverDB.driverDbconnection();

        try {

            System.out.println(connectionTbUser + "<-- connectionTbUser");
            System.out.println(connectionTbUser.getClass() + "<-- connectionTbUser.getClass()");

            preparedStatementTbUser = connectionTbUser.prepareStatement(
                    "INSERT INTO tb_user VALUES (?, ?, ?, ?, ?, ?, ?)");
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        try {
            preparedStatementTbUser.setString(1, uId);
            preparedStatementTbUser.setString(2, uPw);
            preparedStatementTbUser.setString(3, uLevel);
            preparedStatementTbUser.setString(4, uName);
            preparedStatementTbUser.setString(5, uEmail);
            preparedStatementTbUser.setString(6, uPhone);
            preparedStatementTbUser.setString(7, uAddr);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }


        try {
            int result = preparedStatementTbUser.executeUpdate();
            System.out.println(result + "<-- result");
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }


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

    response.sendRedirect(request.getContextPath() + "/db07khb/userlist/user_list.jsp");
%>