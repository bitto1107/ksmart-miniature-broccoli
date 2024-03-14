<%--
  Created by IntelliJ IDEA.
  User: ksmart
  Date: 2024-02-27
  Time: 오전 8:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<jsp:useBean id="gDaoTbGoods" class="kr.or.ksmart.dao.Gdao"/>
<% request.setCharacterEncoding("utf-8"); %>
<%
    String sendGCode = request.getParameter("send_g_code");
    gDaoTbGoods.gDelete(sendGCode);

    response.sendRedirect(request.getContextPath() + "/db07khb/goodssearch/goods_search_list_gDate.jsp");
%>
