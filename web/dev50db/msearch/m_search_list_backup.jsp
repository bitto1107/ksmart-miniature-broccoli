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
<br><br><%@include file="m_search_form.jsp"%>

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
            // select * from tb_user;
        }else if(sk != null && srValue.equals("")) {
            System.out.printf("2. sk null이 아니고 srValue 공백\n");
            // select * from tb_user;
        }else if(sk != null && srValue != null) {
            System.out.printf("3. sk, sr_value null이 아닌 조건\n");
            if (sk.equals("m_id")) {
                System.out.printf("3-1. sk = m_id condition\n");
                // select * from tb_user where u_id =?
            }else if(sk.equals("m_level")) {
                System.out.printf("3-2. sk = m_level condition\n");
                // select * from tb_user where u_level =?
            }else if(sk.equals("m_name")) {
                System.out.printf("3-3. sk = m_name condition\n");
                // select * from tb_user where u_name =?
            }else if(sk.equals("m_email")) {
                System.out.printf("3-4. sk = m_email condition\n");
                // select * from tb_user where u_email =?
            }else if(sk.equals("m_addr")) {
                System.out.printf("3-5. sk = m_addr condition\n");
                // select * from tb_user where u_addr =?
            }
        }


            %>
</body>
</html>
