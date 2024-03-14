<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
String id = request.getParameter("id");
String pw = request.getParameter("pw");
System.out.println(id + "<- id ");
System.out.println(pw + "<- pw ");
String dbid = "id001";
String dbpw = "pw001";
String dbname = "일길동";
String dblevel = "관리자";	//구매자 또는 판매자 또는 관리자로 변경 후 테스트
String msg = null;
if(id.equals(dbid)){
	System.out.println("1-1 아이디 일치");
	if(pw.equals(dbpw)){
		System.out.println("2-1 로그인성공");
		session.setAttribute("S_ID", dbid);
		session.setAttribute("S_NAME", dbname);
		session.setAttribute("S_LEVEL", dblevel);
		//response.sendRedirect(request.getContextPath() + "/index.jsp");
		msg = "로그인성공";
	}else{
		System.out.println("2-2 비번 불일치");
		msg = "비번 불일치";
	}
}else{
	System.out.println("1-2 아이디 불일치");
	msg = "아이디 불일치";
}
%>
<script type="text/javascript">
	alert('<%= msg %>');
	location.href='<%= request.getContextPath()%>/index.jsp';
</script>


