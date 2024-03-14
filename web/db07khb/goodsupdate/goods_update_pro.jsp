<%--
  Created by IntelliJ IDEA.
  User: ksmart
  Date: 2024-02-27
  Time: 오전 8:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="goods" class="kr.or.ksmart.dto.Goods" />
<jsp:useBean id="gDaoTbGoods" class="kr.or.ksmart.dao.Gdao" />


<%
String uId = request.getParameter("u_id");
String gCode = request.getParameter("g_code");
String gName = request.getParameter("g_name");
String gPrice = request.getParameter("g_price");
String gCategory = request.getParameter("g_category");
String gColor = request.getParameter("g_color");
String gSize = request.getParameter("g_size");
String gDate = request.getParameter("g_date");
String gDescription = request.getParameter("g_description");

goods.setuId(uId);
goods.setgCode(gCode);
goods.setgName(gName);
goods.setgPrice(gPrice);
goods.setgCategory(gCategory);
goods.setgColor(gColor);
goods.setgSize(gSize);
goods.setgDate(gDate);
goods.setgDescription(gDescription);

gDaoTbGoods.gUpdate(goods);

response.sendRedirect(request.getContextPath() + "/db07khb/goodssearch/goods_search_list_gDate.jsp");

%>