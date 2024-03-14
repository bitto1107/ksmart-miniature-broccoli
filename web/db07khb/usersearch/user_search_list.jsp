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
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>회원 검색</title>
    <!-- <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/main.css" /> -->
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/main2.css"/>
</head>
<body>
<%@ include file="/db07khb/layout/top.jsp" %>
<%@ include file="/db07khb/layout/left.jsp" %>
<%@ page import="kr.or.ksmart.dto.Member" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="kr.or.ksmart.dao.Mdao" %>
<%@ page import="java.util.List" %>
<% request.setCharacterEncoding("utf-8"); // post방식 한글이 깨지지 않게 처리 %>
<button type="button" class="navyBtn" onClick="location.href='<%=request.getContextPath()%>/db07khb/userinsert/user_insert_form.jsp';">회원 가입</button>
<button type="button" class="navyBtn" onClick="location.href='<%=request.getContextPath()%>/db07khb/userlist/user_list.jsp';">회원 리스트</button><br><br>
<%@include file="user_search_form.jsp"%>
<jsp:useBean id="mdaoTbUser" class="kr.or.ksmart.dao.Mdao" />
<%=request.getRequestURI()%> <br>
회원 검색 리스트 <br>
<table width="100%" border="1">
    <thead>
    <tr class="member-search-head">
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
            String sk = request.getParameter("sk");
            String srValue = request.getParameter("sr_value");
            System.out.printf("%s <= sk의 값\n", sk);
            System.out.printf("%s <= srValue 값\n", srValue);

            List<Member> userList;

            userList = mdaoTbUser.uSearch(sk, srValue);

            for (int i = 0; i < userList.size(); i++) {
        %>
    <tbody>
    <tr  class="member-search-list">
        <td><%=userList.get(i).getuId()%></td>
        <td><%=userList.get(i).getuPw()%></td>
        <td><%=userList.get(i).getuLevel()%></td>
        <td><%=userList.get(i).getuName()%></td>
        <td><%=userList.get(i).getuEmail()%></td>
        <td><%=userList.get(i).getuPhone()%></td>
        <td><%=userList.get(i).getuAddr()%></td>
        <td><button type="button" class="editBtn" onClick="location.href=
                '<%=request.getContextPath()%>/db07khb/userupdate/user_update_form.jsp?send_id=<%=userList.get(i).getuId()%>';">회원 정보 수정</button></td>
        <td><button type="button" class="deleteBtn" onClick="location.href=
                '<%=request.getContextPath()%>/db07khb/userdelete/user_delete_pro.jsp?send_id=<%=userList.get(i).getuId()%>';">회원 정보 삭제</button></td>
    </tr>
    </tbody>

        <%
            }
        %>
    </table>
    <%@ include file="/db07khb/layout/hadan.jsp" %>
</body>
</html>