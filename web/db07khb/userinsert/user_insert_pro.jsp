<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% request.setCharacterEncoding("utf-8"); // post방식 한글이 깨지지 않게 처리 %>
<jsp:useBean id="member" class="kr.or.ksmart.dto.Member" />
<jsp:useBean id="mDaoTbUser" class="kr.or.ksmart.dao.Mdao" />

<%
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

	mDaoTbUser.uInsert(member);

	response.sendRedirect(request.getContextPath() + "/db07khb/userlist/user_list.jsp");
%>