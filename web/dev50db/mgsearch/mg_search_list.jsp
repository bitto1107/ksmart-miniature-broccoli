<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>

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
<%@ include file="/layout/top.jsp" %>
<%@ include file="/layout/left.jsp" %>
<%@ include file="/mgsearch/mg_search_form.jsp" %>
상품 리스트(회원테이블과 join검색1) <br>
<table width="100%" border="1">
<tr>
	<td>아이디</td><td>이름</td><td>상품코드</td><td>상품명</td><td>분류</td><td>가격</td><td>색상</td><td>사이즈</td><td>등록일</td><td>상세</td><td>수정</td><td>삭제</td>
</tr>
<%
request.setCharacterEncoding("utf-8");	//post한글처리
String startDate = request.getParameter("start_date");
String endDate = request.getParameter("end_date");
System.out.println(startDate + "<- startDate ");
System.out.println(endDate + "<- endDate ");
Connection connectionTbGoods = null;
PreparedStatement preparedStatementTbGoods = null;
ResultSet resultSetTbGoods = null;
Class.forName("com.mysql.jdbc.Driver");
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
//쿼리실행 준비 단계 : 다양한 조건문을 작성 하면 끝!~~~~~~~~~~~	
	if(startDate ==null && endDate ==null){
		preparedStatementTbGoods = connectionTbGoods.prepareStatement(selectQuery1);
	} else if (startDate !=null && endDate !=null) {
		preparedStatementTbGoods = connectionTbGoods.prepareStatement(selectQuery1);
	} else{
		preparedStatementTbGoods = connectionTbGoods.prepareStatement(selectQuery2);
		preparedStatementTbGoods.setString(1, startDate);
		preparedStatementTbGoods.setString(2, endDate);
	}
	
//쿼리실행 준비 단계 : 다양한 조건문을 작성 하면 끝!~~~~~~~~~~~	

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
			<button type="button" class="navyBtn" onClick="location.href='<%= request.getContextPath() %>/userupdate/user_update_form.jsp?send_id=<%= resultSetTbGoods.getString("u_id")%>';">수정버튼</button>
		</td>
		<td>
			<button type="button" class="navyBtn" onClick="location.href='<%= request.getContextPath() %>/userdelete/user_delete_action.jsp?send_id=<%= resultSetTbGoods.getString("u_id")%>';">삭제버튼</button>

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
<%@ include file="/layout/hadan.jsp" %>

</body>
</html>
