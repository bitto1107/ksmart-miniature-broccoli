        <%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="gDaoTbGoods" class="kr.or.ksmart.dao.Gdao" />
<jsp:useBean id="goods" class="kr.or.ksmart.dto.Goods" />
<% request.setCharacterEncoding("utf-8"); // post방식 한글이 깨지지 않게 처리 %>

<%
    String uId = request.getParameter("u_id");
    String gName = request.getParameter("g_name");
    String gCategory = request.getParameter("g_cate");
    String gPrice = request.getParameter("g_price");
    String gColor = request.getParameter("g_color");
    String gSize = request.getParameter("g_size");
    String gDescription = request.getParameter("g_desc");
//콘솔창에 출력한다
    System.out.println(uId + "<-- uId goods_insert_pro.jsp");
    System.out.println(gName + "<-- gName goods_insert_pro.jsp");
    System.out.println(gCategory + "<-- gCategory goods_insert_pro.jsp");
    System.out.println(gPrice + "<-- gPrice goods_insert_pro.jsp");
    System.out.println(gColor + "<-- gColor goods_insert_pro.jsp");
    System.out.println(gSize + "<-- gSize goods_insert_pro.jsp");
    System.out.println(gDescription + "<-- gDescription goods_insert_pro.jsp");

    goods.setuId(uId);
    goods.setgName(gName);
    goods.setgCategory(gCategory);
    goods.setgPrice(gPrice);
    goods.setgColor(gColor);
    goods.setgSize(gSize);
    goods.setgDescription(gDescription);

    gDaoTbGoods.gInsert(goods);
    response.sendRedirect(request.getContextPath() + "/db07khb/goodssearch/goods_search_list_gDate.jsp");

%>