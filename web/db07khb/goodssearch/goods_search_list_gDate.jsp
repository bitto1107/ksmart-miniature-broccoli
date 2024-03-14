<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="kr.or.ksmart.dto.Goods" %>
<%@ page import="java.util.List" %>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="gDaoTbGoods" class="kr.or.ksmart.dao.Gdao" />
<jsp:useBean id="mDaoTbGoods" class="kr.or.ksmart.dao.Mdao" />

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<!-- <link rel="stylesheet" type="text/css" href="/layoutMG/css/main.css" /> -->
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/main2.css" />
<style>
table {
  font-family: arial, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

td, th {
  border: 1px solid #dddddd;
  text-align: left;
  padding: 8px;
}

tr:nth-child(even) {
  background-color: #dddddd;
}
</style>
</head>

<body>
<%@ include file="/db07khb/layout/top.jsp" %>
<%@ include file="/db07khb/layout/left.jsp" %>
<%@ include file="/db07khb/goodssearch/goods_search_form_gDate.jsp" %>
상품 리스트(회원테이블과 join검색1) <br>
<table width="100%" border="1">
	<thead>
	<tr>
		<th>아이디</th>
		<th>상품코드</th>
		<th>상품명</th>
		<th>분류</th>
		<th>가격</th>
		<th>색상</th>
		<th>사이즈</th>
		<th>등록일</th>
		<th>상세</th>
		<th>수정</th>
		<th>삭제</th>
	</tr>
	</thead>
	<%
String startDate = request.getParameter("start_date");
String endDate = request.getParameter("end_date");

		List<Goods> goodsList;
		goodsList = gDaoTbGoods.goodsSearchForDate(startDate,endDate);

		for (int i = 0; i < goodsList.size(); i++) {
			Goods goods = goodsList.get(i);
	%>
	<tbody>
	<tr class="goods-search-list">
	    <td><%=goods.getuId()%></td>
	    <td><%=goods.getgCode()%></td>
	    <td><%=goods.getgName()%></td>
	    <td><%=goods.getgCategory()%></td>
	    <td><%=goods.getgPrice()%></td>
	    <td><%=goods.getgColor()%></td>
	    <td><%=goods.getgSize()%></td>
	    <td><%=goods.getgDate()%></td>
	    <td><%=goods.getgDescription()%></td>
		<td>
			<button type="button" class="navyBtn" onClick="location.href=
					'<%= request.getContextPath() %>/db07khb/goodsupdate/goods_update_form.jsp?send_g_code=<%= goods.getgCode()%>';">수정버튼</button>
		</td>
		<td>
			<button type="button" class="navyBtn" onClick="location.href=
					'<%= request.getContextPath() %>/db07khb/goodsdelete/goods_delete_pro.jsp?send_g_code=<%= goods.getgCode()%>';">삭제버튼</button>
		</td>
	</tr>

	</tbody>

	<%

		}

		%>
</table>			 
<%@ include file="/db07khb/layout/hadan.jsp" %>

</body>
</html>
