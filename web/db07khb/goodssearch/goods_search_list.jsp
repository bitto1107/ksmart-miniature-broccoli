<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>
<%@ page import="kr.or.ksmart.driverdb.DriverDB" %>
<% request.setCharacterEncoding("utf-8"); %>

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
<%@ include file="/db07khb/goodssearch/goods_search_form.jsp" %>
상품 리스트(회원테이블과 join검색1) <br>
<table width="100%" border="1">
	<thead>
	<tr>
		<th>아이디</th>
		<th>이름</th>
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
request.setCharacterEncoding("utf-8");	//post한글처리
String startDate = request.getParameter("start_date");
String endDate = request.getParameter("end_date");
System.out.println(startDate + "<- startDate ");
System.out.println(endDate + "<- endDate ");
PreparedStatement preparedStatementTbGoods = null;
ResultSet resultSetTbGoods = null;
		Connection connectionTbGoods;
		DriverDB driverDB = new DriverDB();
		connectionTbGoods = driverDB.driverDbconnection();

String selectQuery1="select tb_user.*, tb_goods.* " +
"from tb_user inner join tb_goods on tb_user.u_id = tb_goods.u_id  order by g_date";
System.out.println(selectQuery1 + "<- selectQuery1 ");

String selectQuery2="select tb_user.*, tb_goods.* " +
"from tb_user inner join tb_goods on tb_user.u_id = tb_goods.u_id "+
"and DATE_FORMAT(g_date,'%Y-%m-%d') between ? and ? " +  
"order by g_date";
System.out.println(selectQuery2 + "<- selectQuery2 ");
try{
	String jdbcDriver = "jdbc:mysql://localhost:3306/db07khb?" +
			"useUnicode=true&characterEncoding=utf8";
	String dbId = "dbid07khb";
	String dbPw = "dbpw07khb";
	connectionTbGoods = DriverManager.getConnection(jdbcDriver, dbId, dbPw);
//02단계 :DB연결(Connection)끝
	System.out.println(connectionTbGoods + "<-- connectionTbGoods ");
//쿼리실행 준비 단계 : 다양한 조건문을 작성 하면 끝
	if(startDate ==null && endDate ==null){
		preparedStatementTbGoods = connectionTbGoods.prepareStatement(selectQuery1);
	} else if (startDate !=null && endDate !=null) {
		preparedStatementTbGoods = connectionTbGoods.prepareStatement(selectQuery1);
	} else{
		preparedStatementTbGoods = connectionTbGoods.prepareStatement(selectQuery2);
		preparedStatementTbGoods.setString(1, startDate);
		preparedStatementTbGoods.setString(2, endDate);
	}
	
//쿼리실행 준비 단계 : 다양한 조건문을 작성 하면 끝

	resultSetTbGoods = preparedStatementTbGoods.executeQuery();
	System.out.println(resultSetTbGoods + "<-- resultSetTbGoods user_search_form.jsp");
	//System.out.println(resultSetTbGoods.next() + "<-- resultSetTbGoods.next() m_search_form.jsp");
	while(resultSetTbGoods.next()){
		System.out.println("while 반복 횟수");
%>		
		
		<tr>
		<td><%= resultSetTbGoods.getString("u_id")%></td>
		<td><%= resultSetTbGoods.getString("u_name")%></td>
		
		<td><%= resultSetTbGoods.getString("g_code")%></td>
		<td><%= resultSetTbGoods.getString("g_name")%></td>
		<td><%= resultSetTbGoods.getString("g_cate")%></td>
		<td><%= resultSetTbGoods.getString("g_price")%></td>
		<td><%= resultSetTbGoods.getString("g_color")%></td>
		<td><%= resultSetTbGoods.getString("g_size")%></td>
		<td><%= resultSetTbGoods.getString("g_date")%></td>
		<td><%= resultSetTbGoods.getString("g_desc")%></td>
		<td>
			<button type="button" class="navyBtn" onClick="location.href=
					'<%= request.getContextPath() %>/db07khb/goodsupdate/goods_update_form.jsp?send_g_code=<%= resultSetTbGoods.getString("g_code")%>';">수정버튼</button>
		</td>
		<td>
			<button type="button" class="navyBtn" onClick="location.href=
					'<%= request.getContextPath() %>/db07khb/goodsdelete/goods_delete_pro.jsp?send_g_code=<%= resultSetTbGoods.getString("g_code")%>';">삭제버튼</button>

		</td>
	</tr>			
<%		
	}		
		
} catch(SQLException ex) {
	out.println(ex.getMessage());
	ex.printStackTrace();
} finally {
	// 6. 사용한 Statement 종료
	if (resultSetTbGoods != null) try { resultSetTbGoods.close(); } catch(SQLException ex) {}
	if (preparedStatementTbGoods != null) try { preparedStatementTbGoods.close(); } catch(SQLException ex) {}
	
	// 7. 커넥션 종료
	if (connectionTbGoods != null) try { connectionTbGoods.close(); } catch(SQLException ex) {}
}
%>
</table>			 
<%@ include file="/db07khb/layout/hadan.jsp" %>

</body>
</html>
