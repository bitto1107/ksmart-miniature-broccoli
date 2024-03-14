<%--
  Created by IntelliJ IDEA.
  User: ksmart
  Date: 2024-02-13
  Time: 오후 2:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%= request.getRequestURI() %> <br>
<form action="<%= request.getContextPath() %>/minsert/user_insert_action.jsp" method="post">
    <table border="1">
        <tr>
            <td>아이디</td>
            <td><input type="text" name="u_id" size="20"></td>
        <tr>
        <tr>
            <td>암호</td>
            <td><input type="password" name="u_pw" size="20"></td>
        <tr>
        <tr>
            <td>권한 레벨</td>
            <td><input type="text" name="u_level" size="20"></td>
        <tr>
        <tr>
            <td>이름</td>
            <td><input type="text" name="u_name" size="20"></td>
        <tr>
        <tr>
            <td>이메일</td>
            <td><input type="text" name="u_email" size="20"></td>
        <tr>
        <tr>
            <td>휴대폰 번호</td>
            <td><input type="text" name="u_phone" size="20"></td>
        <tr>
        <tr>
            <td>회원 주소</td>
            <td><input type="text" name="u_addr" size="20"></td>
        <tr>
        <tr>
            <td colspan="4"><input type="submit" value="회원가입버튼"></td>
        </tr>
    </table>
</form>