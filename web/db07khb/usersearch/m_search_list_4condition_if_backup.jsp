<%--
  Created by IntelliJ IDEA.
  User: ksmart
  Date: 2024-02-22
  Time: 오전 9:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>회원 검색</title>
</head>
<body>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>
<button type="button" class="navyBtn" onClick="location.href='<%=request.getContextPath()%>/minsert/m_insert_form.jsp';">회원 가입</button>
<button type="button" class="navyBtn" onClick="location.href='<%=request.getContextPath()%>/mlist/m_list.jsp';">회원 리스트</button>
<br><br><%@include file="user_search_form.jsp"%>

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

    try{

            String jdbcDriver = "jdbc:mysql://localhost:3306/db07khb?" +
                    "useUnicode=true&characterEncoding=utf8";
            String dbId = "dbid07khb";
            String dbPw = "dbpw07khb";
            connectionTbUser = DriverManager.getConnection(jdbcDriver, dbId, dbPw);

            // System.out.printf("%s <= connection \n", connectionTbUser);
            if (connectionTbUser != null) {
                out.println("연결 성공");
            }else {
                out.println("연결 실패");
            }
            preparedStatementTbUser = connectionTbUser.prepareStatement("select * from tb_user");
            System.out.printf("%s <= prepared statement \n", preparedStatementTbUser);
        request.setCharacterEncoding("UTF-8"); // 검색창에 입력한 값이 한글일때 깨지지 않게
        String sk = request.getParameter("sk");
        String srValue = request.getParameter("sr_value");
        System.out.printf("%s <= sk의 값\n", sk);
        System.out.printf("%s <= srValue 값\n", srValue);

        if (sk == null && srValue == null) {
            System.out.printf("1. sk, sr_value null 조건\n");
            preparedStatementTbUser = connectionTbUser.prepareStatement("select * from tb_user");
            // select * from tb_user;
        }else if(sk != null && srValue.equals("")) {
            System.out.printf("2. sk null이 아니고 srValue 공백\n");
            preparedStatementTbUser = connectionTbUser.prepareStatement("select * from tb_user");
            // select * from tb_user;
        }else if(sk != null && srValue != null) {
            System.out.printf("3. sk, sr_value null이 아닌 조건\n");
            preparedStatementTbUser = connectionTbUser.prepareStatement("select * from tb_user where " + sk + " = ?");
            preparedStatementTbUser.setString(1, srValue);
            /*if (sk.equals("m_id")) {
                System.out.printf("3-1. sk = m_id condition\n");
                preparedStatementTbUser = connectionTbUser.prepareStatement("select * from tb_user where u_id = ?");
                preparedStatementTbUser.setString(1, srValue);
                // select * from tb_user where u_id =?
            }else if(sk.equals("m_level")) {
                System.out.printf("3-2. sk = m_level condition\n");
                preparedStatementTbUser = connectionTbUser.prepareStatement("select * from tb_user where u_level =?");
                preparedStatementTbUser.setString(1, srValue);
                // select * from tb_user where u_level =?
            }else if(sk.equals("m_name")) {
                System.out.printf("3-3. sk = m_name condition\n");
                preparedStatementTbUser = connectionTbUser.prepareStatement("select * from tb_user where u_name =?");
                preparedStatementTbUser.setString(1, srValue);
                // select * from tb_user where u_name =?
            }else if(sk.equals("m_email")) {
                System.out.printf("3-4. sk = m_email condition\n");
                preparedStatementTbUser = connectionTbUser.prepareStatement("select * from tb_user where u_email =?");
                preparedStatementTbUser.setString(1, srValue);
                // select * from tb_user where u_email =?
            }else if(sk.equals("m_addr")) {
                System.out.printf("3-5. sk = m_addr condition\n");
                preparedStatementTbUser = connectionTbUser.prepareStatement("select * from tb_user where u_addr =?");
                preparedStatementTbUser.setString(1, srValue);
                // select * from tb_user where u_addr =?
            }*/
        }
        System.out.printf("%s <= preparedStatementTbUser\n", preparedStatementTbUser);

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
        <td><button type="button" class="editBtn" onClick="location.href='<%= request.getContextPath()%>/mupdate/m_update_form.jsp?send_id=<%=resultSetTbUser.getString(1)%>';">회원 정보 수정</button></td>
        <td><button type="button" class="deleteBtn" onClick="location.href='<%= request.getContextPath()%>/mdelete/m_delete_action.jsp?send_id=<%=resultSetTbUser.getString(1)%>';">회원 정보 삭제</button></td>
    </tr>
    </tbody>

        <%
            }
            }catch (SQLException ex) {
                out.println(ex.getMessage());
                ex.printStackTrace();
            }finally {
                if (resultSetTbUser != null) {
                    try { resultSetTbUser.close(); } catch(SQLException ex) {}
                }
                if (preparedStatementTbUser != null) {
                    try { preparedStatementTbUser.close(); } catch(SQLException ex) {}
                }
                if (connectionTbUser != null) {
                    try { connectionTbUser.close(); } catch(SQLException ex) {}
                }
            }

%>
</body>
</html>
