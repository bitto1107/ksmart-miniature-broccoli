<%--
  Created by IntelliJ IDEA.
  User: ksmart
  Date: 2024-02-27
  Time: 오전 8:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>상품 정보 수정</title>
    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/main2.css"/>
</head>
<body>
<% request.setCharacterEncoding("utf-8"); // post방식 한글이 깨지지 않게 처리 %>
<%@ include file="/db07khb/layout/top.jsp" %>
<%@ include file="/db07khb/layout/left.jsp" %>
<jsp:useBean id="gDaoTbGoods" class="kr.or.ksmart.dao.Gdao" />
<jsp:useBean id="goods" class="kr.or.ksmart.dto.Goods" />
    <%=request.getRequestURI()%> <br>
상품 리스트 <br>
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
</tr>
</thead>
<%
String sendGCode = request.getParameter("send_g_code");
System.out.printf("%s <-- gCode \n", sendGCode);

String uId;
String gName;
String gCategory;
String gPrice;
String gColor;
String gSize;
String gDate;
String gDescription;

goods = gDaoTbGoods.gSelectForUpdate(sendGCode);
uId = goods.getuId();
gName = goods.getgName();
gCategory = goods.getgCategory();
gPrice = goods.getgPrice();
gColor = goods.getgColor();
gSize = goods.getgSize();
gDate = goods.getgDate();
gDescription = goods.getgDescription();

%>
<tbody>
<tr>
    <td><%=uId%></td>
    <td><%=sendGCode%></td>
    <td><%=gName%></td>
    <td><%=gCategory%></td>
    <td><%=gPrice%></td>
    <td><%=gColor%></td>
    <td><%=gSize%></td>
    <td><%=gDate%></td>
    <td><%=gDescription%></td>
</tr>
</table>
<div>
    <br> <%= request.getRequestURI()%> <br>
    <form action="<%=request.getContextPath()%>/db07khb/goodsupdate/goods_update_pro.jsp" method="post">
        <table border="1">
            <tr>
                <td>아이디</td>
                <td><input type="text" name="u_id" size="20" value="<%=uId%>" readonly></td>
            </tr>
            <tr>
                <td>상품명</td>
                <td><input type="text" name="g_name" size="20" value="<%=gName%>"></td>
            </tr>
            <tr>
                <td>상품코드</td>
                <td><input type="text" name="g_code" size="20" value="<%=sendGCode%>" readonly></td>
            </tr>
            <tr>
                <td>분류</td>
                <td><input type="text" name="g_category" size="20" value="<%=gCategory%>"></td>
            </tr>
            <tr>
                <td>가격</td>
                <td><input type="text" name="g_price" size="20" value="<%=gPrice%>"></td>
            </tr>
            <tr>
                <td>색상</td>
                <td><input type="text" name="g_color" size="20" value="<%=gColor%>"></td>
            </tr>
            <tr>
                <td>사이즈</td>
                <td><input type="text" name="g_size" size="20" value="<%=gSize%>"></td>
            </tr>
            <tr>
                <td>등록일</td>
                <td><input type="text" name="g_date" size="20" value="<%=gDate%>" readonly></td>
            </tr>
            <tr>
                <td>상세</td>
                <td><input type="text" name="g_description" size="20" value="<%=gDescription%>"></td>
            </tr>
            <tr>
                <td><input type="submit" value="수정"></td>
            </tr>
        </table>
    </form>
</div
<%@include file="/db07khb/layout/hadan.jsp"%>
</body>
</html>



