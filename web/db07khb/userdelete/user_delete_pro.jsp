        <%--
  Created by IntelliJ IDEA.
  User: ksmart
  Date: 2024-02-21
  Time: 오후 3:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="mDaoTbUser" class="kr.or.ksmart.dao.Mdao" />
<% request.setCharacterEncoding("utf-8"); // post방식 한글이 깨지지 않게 처리 %>
<%
    String sendId = request.getParameter("send_id");
    mDaoTbUser.uDelete(sendId);

    response.sendRedirect(request.getContextPath() + "/db07khb/userlist/user_list.jsp");
%>