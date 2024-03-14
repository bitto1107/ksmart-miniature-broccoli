<%--
  Created by IntelliJ IDEA.
  User: ksmart
  Date: 2024-02-22
  Time: 오전 9:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<html>
<head>
    <title>회원 검색</title>
</head>
<body>

<form action="<%=request.getContextPath()%>/db07khb/usersearch/user_search_list.jsp" METHOD="post">
    <label>
        <select name="sk">
            <option value="u_id">아이디</option>
            <option value="u_level">권한</option>
            <option value="u_name">이름</option>
            <option value="u_email">이메일</option>
            <option value="u_addr">주소</option>
        </select>
    </label>
    <label>
        <input type="text" name="sr_value" size="20">
    </label>
    <input type="submit" value="검색">
</form>
</body>
</html>
