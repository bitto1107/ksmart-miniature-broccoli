<%--
Created by IntelliJ IDEA.
User: ksmart
Date: 2024-02-21
Time: 오전 11:33
To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>회원 정보 수정</title>
    <!-- <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/main.css" /> -->
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/main2.css"/>
</head>
<body>
<%@ include file="/db07khb/layout/top.jsp" %>
<%@ include file="/db07khb/layout/left.jsp" %>
<jsp:useBean id="mDaoTbUser" class="kr.or.ksmart.dao.Mdao" />
<jsp:useBean id="member" class="kr.or.ksmart.dto.Member"/>
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
        String sendId = request.getParameter("send_id");
        System.out.println(sendId + "<=sendId");

        String uId;
        String uName;
        int uLevel;
        String uEmail;
        String uPhone;
        String uPw;
        String uAddr;


        member = mDaoTbUser.uSelectForUpdate(sendId);
        uId = member.getuId();
        uPw = member.getuPw();
        uLevel = member.getuLevel();
        uName = member.getuName();
        uEmail = member.getuEmail();
        uPhone = member.getuPhone();
        uAddr = member.getuAddr();

    %>
    <tbody>
    <tr>
        <td><%=uId%>
        </td>
        <td><%=uPw%>
        </td>
        <td><%=uName%>
        </td>
        <td><%=uLevel%>
        </td>
        <td><%=uEmail%>
        </td>
        <td><%=uPhone%>
        </td>
        <td><%=uAddr%>
        </td>
    </tr>
    </tbody>
</table>
<div>
    <br> <%=request.getRequestURI()%> <br>
    <form action="<%=request.getContextPath()%>/db07khb/userupdate/user_update_pro.jsp" method="post">
        <table border="1">
            <tr>
                <td>아이디</td>
                <td><input type="text" name="u_id" size="20" value="<%=uId%>" readonly></td>
            </tr>
            <tr>
                <td>암호</td>
                <td><input type="text" name="u_pw" size="20" value="<%=uPw%>"></td>
            </tr>
            <tr>
                <td>권한</td>
                <td><input type="text" name="u_level" size="20" value="<%=uLevel%>" readonly></td>
            </tr>
            <tr>
                <td>이름</td>
                <td><input type="text" name="u_name" size="20" value="<%=uName%>" readonly></td>
            </tr>
            <tr>
                <td>이메일</td>
                <td><input type="text" name="u_email" size="20" value="<%=uEmail%>"></td>
            </tr>
            <tr>
                <td>휴대폰 번호</td>
                <td><input type="text" name="u_phone" size="20" value="<%=uPhone%>"></td>
            </tr>
            <tr>
                <td>주소</td>
                <td><input type="text" name="u_addr" size="20" value="<%=uAddr%>"></td>
            </tr>
            <tr>
                <td colspan="4"><input type="submit" value="수정"></td>
            </tr>
        </table>
    </form>
</div>
<%

%>
<%@ include file="/db07khb/layout/hadan.jsp" %>
</body>
</html>
