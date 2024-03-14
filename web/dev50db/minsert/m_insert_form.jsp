<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>기본 페이지</title>
    <!-- <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/main.css" /> -->
    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/main2.css"/>
</head>
<body>
<%@ include file="/module/top.jsp" %>
<%@ include file="/module/left.jsp" %>

<button type="button" class="navyBtn" onClick="location.href='<%=request.getContextPath()%>/mlist/m_list.jsp';">회원 리스트
</button>
<button type="button" class="navyBtn"
        onClick="location.href='<%=request.getContextPath()%>/msearch/m_search_list.jsp';">회원 검색
</button>
<br><br>
<%= request.getRequestURI() %> <br>
<form action="<%= request.getContextPath() %>/minsert/m_insert_action.jsp" method="post">
    <table border="1">
        <tr>
            <td>아이디</td>
            <td><input type="text" name="m_id" size="20"></td>
        <tr>
        <tr>
            <td>암호</td>
            <td><input type="text" name="m_pw" size="20"></td>
        <tr>
        <tr>
            <td>권한</td>
            <td><input type="text" name="m_level" size="20"></td>
        <tr>
        <tr>
            <td>이름</td>
            <td><input type="text" name="m_name" size="20"></td>
        <tr>
        <tr>
            <td>이메일</td>
            <td><input type="text" name="m_email" size="20"></td>
        <tr>
        <tr>
            <td colspan="4"><input type="submit" value="회원가입버튼"></td>
        </tr>
    </table>
</form>
<%@ include file="/module/hadan.jsp" %>
</body>
</html>