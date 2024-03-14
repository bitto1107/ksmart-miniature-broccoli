<%--
  Created by IntelliJ IDEA.
  User: ksmart
  Date: 2024-02-13
  Time: 오후 3:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>회원 검색</title>
    <!-- <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/main.css" /> -->
    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/main2.css"/>
</head>
<body>
<%@ include file="/module/top.jsp" %>
<%@ include file="/module/left.jsp" %>
<button type="button" class="navyBtn"
        onClick="location.href='<%=request.getContextPath()%>/minsert/m_insert_form.jsp';">회원 가입
</button>
<button type="button" class="navyBtn"
        onClick="location.href='<%=request.getContextPath()%>/msearch/m_search_list.jsp';">회원 검색
</button>
<br>
<br><%= request.getRequestURI() %> <br>
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
        <th>수정</th>
        <th>삭제</th>
    </tr>
    </thead>
    <%
        Connection connectionTbUser = null;
        PreparedStatement preparedStatementTbUser = null;
        ResultSet resultSetTbUser = null;

        Class.forName("com.mysql.jdbc.Driver");

        try {


            String jdbcDriver = "jdbc:mysql://localhost:3306/db07khb?" +
                    "useUnicode=true&characterEncoding=utf8";
            String dbId = "dbid07khb";
            String dbPw = "dbpw07khb";
            connectionTbUser = DriverManager.getConnection(jdbcDriver, dbId, dbPw);

            // System.out.printf("%s <= connection \n", connectionTbUser);
            if (connectionTbUser != null) {
                out.println("연결 성공");
            } else {
                out.println("연결 실패");
            }
            preparedStatementTbUser = connectionTbUser.prepareStatement("select * from tb_user");

            resultSetTbUser = preparedStatementTbUser.executeQuery();

            while (resultSetTbUser.next()) {
    %>
    <tbody>
    <tr>
        <td><%=resultSetTbUser.getString(1)%></td>
        <td><%=resultSetTbUser.getString(2)%></td>
        <td><%=resultSetTbUser.getString(3)%></td>
        <td><%=resultSetTbUser.getString(4)%></td>
        <td><%=resultSetTbUser.getString(5)%></td>
        <td><%=resultSetTbUser.getString(6)%></td>
        <td><%=resultSetTbUser.getString(7)%></td>
        <td>
            <button type="button" class="editBtn"
                    onClick="location.href='<%= request.getContextPath()%>/mupdate/m_update_form.jsp?send_id=<%=resultSetTbUser.getString(1)%>';">
                회원 정보 수정
            </button>
        </td>
        <td>
            <button type="button" class="deleteBtn"
                    onClick="location.href='<%= request.getContextPath()%>/mdelete/m_delete_action.jsp?send_id=<%=resultSetTbUser.getString(1)%>';">
                회원 정보 삭제
            </button>
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

<%@ include file="/module/hadan.jsp" %>
</body>
</html>