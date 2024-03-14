<%--
Created by IntelliJ IDEA.
User: ksmart
Date: 2024-02-21
Time: 오전 11:33
To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>회원 정보 수정</title>
    <!-- <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/main.css" /> -->
    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/main2.css"/>
</head>
<body>
<%@ include file="/module/top.jsp" %>
<%@ include file="/module/left.jsp" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%=request.getRequestURI()%> <br>
회원 리스트 <br>
<table width="100%" border="1">
    <thead>
    <tr>
        <th>아이디</th>
        <th>패스워드</th>
        <th>권한 레벨</th>
        <th>이름</th>
        <th>이메일</th>
        <th>휴대폰 번호</th>
        <th>주소</th>
    </tr>
    </thead>

    <%
        String send_id = request.getParameter("send_id");
        System.out.println(send_id + "<=send_id");

        Connection connectionTbUser = null;
        PreparedStatement preparedStatementTbUser = null;
        ResultSet resultSetTbUser = null;

//    Class.forName("com.mysql.jdbc.Driver");

        String m_id = null;
        String m_name = null;
        String m_level = null;
        String m_email = null;
        String m_phone = null;
        String m_pw = null;
        String m_addr = null;
        try {

            String jdbcDriver = "jdbc:mysql://localhost:3306/db07khb?" +
                    "useUnicode=true&characterEncoding=utf8";
            String dbId = "dbid07khb";
            String dbPw = "dbpw07khb";
            connectionTbUser = DriverManager.getConnection(jdbcDriver, dbId, dbPw);
            m_id = null;
            m_pw = null;
            m_level = null;
            m_name = null;
            m_email = null;
            m_phone = null;
            m_addr = null;

            System.out.printf("%s <= connection \n", connectionTbUser);
            if (connectionTbUser != null) {
                out.println("연결 성공");
            } else {
                out.println("연결 실패");
            }
            preparedStatementTbUser = connectionTbUser.prepareStatement("select * from tb_user where tb_user.u_id = ?");
            preparedStatementTbUser.setString(1, send_id);

            resultSetTbUser = preparedStatementTbUser.executeQuery();
            if (resultSetTbUser.next()) {
//    while (resultSetTbUser.next()) {
                m_id = resultSetTbUser.getString(1);
                m_pw = resultSetTbUser.getString(2);
                m_level = resultSetTbUser.getString(3);
                m_name = resultSetTbUser.getString(4);
                m_email = resultSetTbUser.getString(5);
                m_phone = resultSetTbUser.getString(6);
                m_addr = resultSetTbUser.getString(7);
    %>
    <tbody>
    <tr>
        <td><%=resultSetTbUser.getString(1)%>
        </td>
        <td><%=resultSetTbUser.getString(2)%>
        </td>
        <td><%=resultSetTbUser.getString(3)%>
        </td>
        <td><%=resultSetTbUser.getString(4)%>
        </td>
        <td><%=resultSetTbUser.getString(5)%>
        </td>
        <td><%=resultSetTbUser.getString(6)%>
        </td>
        <td><%=resultSetTbUser.getString(7)%>
        </td>
    </tr>
    </tbody>

    <%
            }
        } catch (SQLException ex) {
            out.println(ex.getMessage());
            ex.printStackTrace();
        } finally {
            if (resultSetTbUser != null) {
                try {
                    resultSetTbUser.close();
                } catch (SQLException ex) {
                }
            }
            if (preparedStatementTbUser != null) {
                try {
                    preparedStatementTbUser.close();
                } catch (SQLException ex) {
                }
            }
            if (connectionTbUser != null) {
                try {
                    connectionTbUser.close();
                } catch (SQLException ex) {
                }
            }
        }

    %>
</table>
<div>
    <br> <%=request.getRequestURI()%> <br>
    <form action="<%=request.getContextPath()%>/mupdate/m_update_action.jsp" method="post">
        <table border="1">
            <tr>
                <td>아이디</td>
                <td><input type="text" name="m_id" size="20" value="<%=m_id%>" readonly></td>
            <tr>
            <tr>
                <td>암호</td>
                <td><input type="text" name="m_pw" size="20" value="<%=m_pw%>"></td>
            <tr>
            <tr>
                <td>권한</td>
                <td><input type="text" name="m_level" size="20" value="<%=m_level%>" readonly></td>
            <tr>
            <tr>
                <td>이름</td>
                <td><input type="text" name="m_name" size="20" value="<%=m_name%>" readonly></td>
            <tr>
            <tr>
                <td>이메일</td>
                <td><input type="text" name="m_email" size="20" value="<%=m_email%>"></td>
            <tr>
            <tr>
                <td>휴대폰 번호</td>
                <td><input type="text" name="m_phone" size="20" value="<%=m_phone%>"></td>
            <tr>
            <tr>
                <td>주소</td>
                <td><input type="text" name="m_addr" size="20" value="<%=m_addr%>"></td>
            <tr>
            <tr>
                <td colspan="4"><input type="submit" value="수정"></td>
            </tr>
        </table>
    </form>
</div>
<%

%>
<%@ include file="/module/hadan.jsp" %>
</body>
</html>
