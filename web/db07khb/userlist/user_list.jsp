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
<%@ page import="java.util.List" %>
<jsp:useBean id="mDaoTbUser" class="kr.or.ksmart.dao.Mdao" />
<%@ page import="kr.or.ksmart.dto.Member" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>회원 검색</title>
    <!-- <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/main.css" /> -->
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/main2.css"/>
</head>
<body>
<%@ include file="/db07khb/layout/top.jsp" %>
<%@ include file="/db07khb/layout/left.jsp" %>
<button type="button" class="navyBtn"
        onClick="location.href='<%=request.getContextPath()%>/db07khb/userinsert/user_insert_form.jsp';">회원 가입
</button>
<button type="button" class="navyBtn"
        onClick="location.href='<%=request.getContextPath()%>/db07khb/usersearch/user_search_list.jsp';">회원 검색
</button>
<br>
<br><%=request.getRequestURI()%> <br>
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
    <tbody>
    <%
        List<Member> userList;
        userList = mDaoTbUser.uAllSelect();
        for (int i = 0; i < userList.size(); i++) {

    %>
    <tr>
        <td><%=userList.get(i).getuId()%></td>
        <td><%=userList.get(i).getuPw()%></td>
        <td><%=userList.get(i).getuLevel()%></td>
        <td><%=userList.get(i).getuName()%></td>
        <td><%=userList.get(i).getuEmail()%></td>
        <td><%=userList.get(i).getuPhone()%></td>
        <td><%=userList.get(i).getuAddr()%></td>
        <td>
        <button type="button" class="editBtn"
                onClick="location.href='<%=request.getContextPath()%>/db07khb/userupdate/user_update_form.jsp?send_id=<%=userList.get(i).getuId()%>';">
            회원 정보 수정
        </button>
        </td>
        <td>
            <button type="button" class="deleteBtn"
                    onClick="location.href='<%=request.getContextPath()%>/db07khb/userdelete/user_delete_pro.jsp?send_id=<%=userList.get(i).getuId()%>';">
                회원 정보 삭제
            </button>
        </td>
    </tr>

    <%

        }

    %>
    </tbody>
</table>

<%@ include file="/db07khb/layout/hadan.jsp" %>
</body>
</html>