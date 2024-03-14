<%--
  Created by IntelliJ IDEA.
  User: ksmart
  Date: 2024-02-29
  Time: 오후 3:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="kr.or.ksmart.dao.Mdao" %>
<%@ page import="kr.or.ksmart.dto.Member" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="kr.or.ksmart.driverdb.DriverDB" %>

<%
    Member member = new Member();
    member.setuId("id001");
    member.setuPw("<PASSWORD>");
    member.setuName("John Doe");
    member.setuEmail("<EMAIL>");
    member.setuPhone("010-1234-5678");
    member.setuAddr("서울특별시 마포구 마포대로 123");
    member.setuLevel(1);
    Connection connectionToMemberDao;
    DriverDB dDb = new DriverDB();
    connectionToMemberDao = dDb.driverDbconnection();
    Mdao mDao = new Mdao();
    mDao.uInsert(member, connectionToMemberDao);

    System.out.printf("%s \n", mDao);
%>