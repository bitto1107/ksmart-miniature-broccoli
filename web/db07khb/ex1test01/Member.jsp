<%--
  Created by IntelliJ IDEA.
  User: ksmart
  Date: 2024-02-29
  Time: 오후 1:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="kr.or.ksmart.dto.Member" %>

<%
    Member member = new Member();
    member.setuId("id004");
    member.setuPw("<PASSWORD>");
    member.setuEmail("<EMAIL>");
    member.setuName("John Doe");
    member.setuPhone("010-1234-5678");
    member.setuAddr("서울특별시 마포구 마포대로 123");
    member.setuLevel(1);

    String uId = member.getuId();
    String uPw = member.getuPw();
    String uEmail = member.getuEmail();
    String uName = member.getuName();
    String uPhone = member.getuPhone();
    String uAddr = member.getuAddr();
    int uLevel = member.getuLevel();

    System.out.printf("%s \n", member);
    System.out.printf(" uId = %s,\n uPw = %s,\n uEmail = %s,\n " +
            "uName=%s,\n uPhone = %s,\n " +
            "uAddr = %s,\n uLevel = %s\n",
            uId, uPw, uEmail, uName, uPhone, uAddr, uLevel);

%>
