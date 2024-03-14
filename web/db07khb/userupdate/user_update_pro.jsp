        <%--
  Created by IntelliJ IDEA.
  User: ksmart
  Date: 2024-02-21
  Time: 오전 11:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% request.setCharacterEncoding("utf-8"); // post방식 한글이 깨지지 않게 처리 %>
<jsp:useBean id="member" class="kr.or.ksmart.dto.Member" />
<jsp:useBean id="mDaoTbUser" class="kr.or.ksmart.dao.Mdao" />
<%
//화면에서 입력자료 받아서 콘솔창에 출력 시작
String uId = request.getParameter("u_id");
String uPw = request.getParameter("u_pw");
String uName = request.getParameter("u_name");
String uEmail = request.getParameter("u_email");
String uPhone = request.getParameter("u_phone");
String uAddr = request.getParameter("u_addr");

member.setuId(uId);
member.setuPw(uPw);
member.setuName(uName);
member.setuEmail(uEmail);
member.setuPhone(uPhone);
member.setuAddr(uAddr);

mDaoTbUser.uUpdate(member);

response.sendRedirect(request.getContextPath() + "/db07khb/userlist/user_list.jsp");
%>