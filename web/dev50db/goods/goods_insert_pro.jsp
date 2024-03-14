<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>

<%
request.setCharacterEncoding("utf-8");
String uId = request.getParameter("u_id");
String gName = request.getParameter("g_name");
String gCate = request.getParameter("g_cate");
String gPrice = request.getParameter("g_price");
String gColor = request.getParameter("g_color");
String gSize = request.getParameter("g_size");
String gDesc = request.getParameter("g_desc");
//콘솔창에 출력한다
System.out.println(uId + "<-- uId goods_insert_pro.jsp");
System.out.println(gName + "<-- gName goods_insert_pro.jsp");
System.out.println(gCate + "<-- gCate goods_insert_pro.jsp");
System.out.println(gPrice + "<-- gPrice goods_insert_pro.jsp");
System.out.println(gColor + "<-- gColor goods_insert_pro.jsp");
System.out.println(gSize + "<-- gSize goods_insert_pro.jsp");
System.out.println(gDesc + "<-- gDesc goods_insert_pro.jsp");

Connection connectionTbGoods = null;
PreparedStatement preparedStatementTbGoods = null;
ResultSet resultSetTbGoods = null;
PreparedStatement preparedStatementTbGoodsInsert = null;
ResultSet resultSetTbGoodsInsert = null;

Class.forName("com.mysql.jdbc.Driver");
try{
	String jdbcDriver = "jdbc:mysql://localhost:3306/db07khb?" +
			"useUnicode=true&characterEncoding=utf8";
	String dbId = "dbid07khb";
	String dbPw = "dbpw07khb";
	connectionTbGoods = DriverManager.getConnection(jdbcDriver, dbId, dbPw);
	//preparedStatementTbGoods = connectionTbGoods.prepareStatement("select max(CAST(substring(g_code,7) AS DECIMAL)) from tb_goods");
	preparedStatementTbGoods = connectionTbGoods.prepareStatement("select max(CAST(substring(g_code,7) AS DECIMAL)) as maxcol from tb_goods");
	
	resultSetTbGoods = preparedStatementTbGoods.executeQuery();
	
	int max = 0;
	String tempCode = "goods_";
	String gCode = "goods_1";
	if(resultSetTbGoods.next()){
		max = resultSetTbGoods.getInt(1);
		//max = resultSetTbGoods.getInt("maxcol");
		System.out.println(max + "<-- max 1");
		max = max + 1;
		System.out.println(max + "<-- max 2");
		gCode = tempCode + max;	//예) goods_3
	}
	System.out.println(gCode + "<-- g_code");
/*  1단계 최대값을 구해서 상품코드 생성 End	*/	
	preparedStatementTbGoodsInsert = connectionTbGoods.prepareStatement(
	"INSERT INTO tb_goods VALUES (?, ?, ?, ?, ?, ?, ?, now(), ?)");
	preparedStatementTbGoodsInsert.setString(1, gCode);
	preparedStatementTbGoodsInsert.setString(2, uId);
	preparedStatementTbGoodsInsert.setString(3, gName);
	preparedStatementTbGoodsInsert.setString(4, gCate);
	preparedStatementTbGoodsInsert.setString(5, gPrice);
	preparedStatementTbGoodsInsert.setString(6, gColor);
	preparedStatementTbGoodsInsert.setString(7, gSize);
	preparedStatementTbGoodsInsert.setString(8, gDesc);
	
	int insertResult = preparedStatementTbGoodsInsert.executeUpdate();
	System.out.println(insertResult + "<-- insertResult 상품등록결과");
	

	//resultSetTbGoodsInsert.close();
	//preparedStatementTbGoodsInsert.close();
} catch(SQLException ex) {
	out.println(ex.getMessage());
	ex.printStackTrace();
} finally {
	if (resultSetTbGoods != null) try { resultSetTbGoods.close();  } catch(SQLException ex) {}
	if (preparedStatementTbGoods != null) try { preparedStatementTbGoods.close();  } catch(SQLException ex) {}
	if (connectionTbGoods != null) try { connectionTbGoods.close(); } catch(SQLException ex) {}
	response.sendRedirect(request.getContextPath()+"/mgsearch/mg_search_list.jsp");
}



%>