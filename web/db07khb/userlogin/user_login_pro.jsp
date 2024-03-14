        <%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="member" class="kr.or.ksmart.dto.Member" />
<jsp:useBean id="mDaoTbUser" class="kr.or.ksmart.dao.Mdao" />

<%

    String id = request.getParameter("id");
    String pw = request.getParameter("pw");
    System.out.println(id + "<- id ");
    System.out.println(pw + "<- pw ");

    String u_id;
    String u_name;
    String u_level;
    String msg;


    msg = mDaoTbUser.uLoginCheck(id, pw);

    if (msg.equals("success")){
        member = mDaoTbUser.uGetForSession(id);
        u_id = member.getuId();
        u_level = String.valueOf(member.getuLevel());
        u_name = member.getuName();
        session.setAttribute("S_ID", u_id);
        session.setAttribute("S_NAME", u_name);
        session.setAttribute("S_LEVEL", u_level);
    }

%>
<script type="text/javascript">
    alert('<%=msg%>');
    location.href='<%=request.getContextPath()%>/index.jsp';
</script>


