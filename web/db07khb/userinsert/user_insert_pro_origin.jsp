<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.SQLException" %>
<%@ page import="kr.or.ksmart.driverdb.DriverDB" %>
<% request.setCharacterEncoding("utf-8"); // post방식 한글이 깨지지 않게 처리 %>
<jsp:useBean id="member" class="kr.or.ksmart.dto.Member" />

<%
	PreparedStatement preparedStatementTbUser = null;
//화면에서 입력자료 받아서 콘솔창에 출력 시작
	String uId = request.getParameter("u_id");
	String uPw = request.getParameter("u_pw");
	int uLevel = Integer.parseInt(request.getParameter("u_level"));
	String uName = request.getParameter("u_name");
	String uEmail = request.getParameter("u_email");
	String uPhone = request.getParameter("u_phone");
	String uAddr = request.getParameter("u_addr");
	System.out.println(uId + "<-- uId /db07khb/userinsert/user_insert_pro.jsp");
	System.out.println(uPw + "<-- uPw /db07khb/userinsert/user_insert_pro.jsp");
	System.out.println(uLevel + "<-- uLevel /db07khb/userinsert/user_insert_pro.jsp");
	System.out.println(uName + "<-- uName /db07khb/userinsert/user_insert_pro.jsp");
	System.out.println(uEmail + "<-- uEmail /db07khb/userinsert/user_insert_pro.jsp");
//화면에서 입력자료 받아서 콘솔창에 출력 끝

	member.setuId(uId);
	member.setuPw(uPw);
	member.setuLevel(uLevel);
	member.setuName(uName);
	member.setuEmail(uEmail);
	member.setuPhone(uPhone);
	member.setuAddr(uAddr);
	//JDBC 프로그램 순서
	//01단계 :드라이버 로딩 시작
	Connection connectionTbUser;
	DriverDB driverDB = new DriverDB();
	connectionTbUser = driverDB.driverDbconnection();
	//01단계 :드라이버 로딩 끝
	
	try{
//02단계 :DB연결(Connection)시작
		System.out.println(connectionTbUser + "<-- connectionTbUser");
		System.out.println(connectionTbUser.getClass() + "<-- connectionTbUser.getClass()");
		
		
//02단계 :DB연결(Connection)끝
//03단계 :Query실행을 위한 statement 또는 prepareStatement객체생성 시작
		preparedStatementTbUser = connectionTbUser.prepareStatement(
				"INSERT INTO tb_user VALUES (?, ?, ?, ?, ?,?,?)");
		System.out.println(preparedStatementTbUser + "<-- preparedStatementTbUser 1");
		System.out.println(preparedStatementTbUser.getClass() + "<-- preparedStatementTbUser.getClass() 1");
//insert into tb_member values('id001','pw001','관리자','홍01','email01');
		preparedStatementTbUser.setString(1, member.getuId());
		preparedStatementTbUser.setString(2, member.getuPw());
		preparedStatementTbUser.setInt(3, member.getuLevel());
		preparedStatementTbUser.setString(4, member.getuName());
		preparedStatementTbUser.setString(5, member.getuEmail());
		preparedStatementTbUser.setString(6, member.getuPhone());
		preparedStatementTbUser.setString(7, member.getuAddr());

		System.out.println(preparedStatementTbUser + "<-- preparedStatementTbUser 2");
		
//03단계 :Query실행을 위한 statement 또는 prepareStatement객체생성 끝
//04단계 :Query실행 시작
		preparedStatementTbUser.executeUpdate();
//04단계 :Query실행 끝
//05단계 :Query실행결과 사용 (insert의 경우 생략 가능단계)

	}finally{
		//06단계 :statement 또는 prepareStatement객체 종료(close())
		if (preparedStatementTbUser != null) try { preparedStatementTbUser.close(); } catch(SQLException ex) {}
		//07단계 :Connection 객체 종료(close())
		if (connectionTbUser != null) try { connectionTbUser.close(); } catch(SQLException ex) {}
	}
	response.sendRedirect(request.getContextPath() + "/db07khb/userlist/user_list.jsp");
%>