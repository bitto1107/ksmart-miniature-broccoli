<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
    String S_ID = (String) session.getAttribute("S_ID");
    String S_NAME = (String) session.getAttribute("S_NAME");
    String S_LEVEL = (String) session.getAttribute("S_LEVEL");
    String sLevelTitle = null;
    System.out.println(S_ID + "<- S_ID ");
    System.out.println(S_NAME + "<- S_NAME ");
    System.out.println(S_LEVEL + "<- S_LEVEL ");

%>
<!-- Begin Wrapper -->
<div id="wrapper">

    <!-- Begin Header -->
    <div id="header">
        /layout/top.jsp <br/>
        상단메뉴 <br/>
        <%
            if (S_LEVEL == null) {
        %>
        <!-- 1-1 로그인 전 화면 시작 -->
        <a href="<%= request.getContextPath() %>/index.jsp">00HOME</a>
        <a href="<%= request.getContextPath() %>/db07khb/userinsert/user_insert_form.jsp">01회원가입</a><br/><br/>
        <form action="<%= request.getContextPath() %>/db07khb/userlogin/user_login_pro.jsp" method="post">
            id : <input type="text" name="id">
            pw : <input type="password" name="pw">
            <input type="submit" value="로그인버튼">
        </form>
        <!-- 1-1 로그인 전 화면 끝 -->
        <%
        } else {
            if (S_LEVEL.equals("3")) {
        %>
        <a href="<%= request.getContextPath() %>/index.jsp">00HOME</a>
        <a href="<%= request.getContextPath() %>/db07khb/userinsert/user_insert_form.jsp">01회원가입</a>
        <a href="<%= request.getContextPath() %>/db07khb/goodssearch/goods_search_list_gDate.jsp">04-01상품등록일기준검색</a> <br/><br/>
        <%
        } else if (S_LEVEL.equals("2")) {
        %>
        <a href="<%= request.getContextPath() %>/index.jsp">00HOME</a>
        <a href="<%= request.getContextPath() %>/db07khb/userinsert/user_insert_form.jsp">01회원가입</a>
        <a href="<%= request.getContextPath() %>/db07khb/goodsinsert/goods_insert_form.jsp">03상품등록</a>
        <a href="<%= request.getContextPath() %>/db07khb/goodssearch/goods_search_list_gDate.jsp">04-01상품등록일기준검색</a> <br/><br/>
        <a href="<%= request.getContextPath() %>/db07khb/goodssearch/goods_search_list_gDate_gCategory.jsp">04-02상품등록일&카테고리기준검색</a> <br/><br/>
        <%
        } else if (S_LEVEL.equals("1")) {
        %>
        <a href="<%= request.getContextPath() %>/index.jsp">00HOME</a>
        <a href="<%= request.getContextPath() %>/db07khb/userinsert/user_insert_form.jsp">01회원가입</a>
        <a href="<%= request.getContextPath() %>/db07khb/usersearch/user_search_list.jsp">02회원검색</a>
        <a href="<%= request.getContextPath() %>/db07khb/goodsinsert/goods_insert_form.jsp">03상품등록</a>
        <a href="<%= request.getContextPath() %>/db07khb/goodssearch/goods_search_list_gDate.jsp">04-01상품등록일기준검색</a> <br/><br/>
        <a href="<%= request.getContextPath() %>/db07khb/goodssearch/goods_search_list_gDate_gCategory.jsp">04-02상품등록일&카테고리기준검색</a> <br/><br/>
        <%
            }
            switch (S_LEVEL) {
                case "1":
                    sLevelTitle = "관리자";
                    break;
                case "2":
                    sLevelTitle = "판매자";
                    break;
                case "3":
                    sLevelTitle = "구매자";
                    break;
            }
        %>

        <!-- 1-2 로그인 후 화면 시작 -->
        <%= S_NAME %> 님 <%= sLevelTitle %> 권한으로 로그인 중
        <a href="<%= request.getContextPath() %>/db07khb/userlogin/user_logout.jsp">로그아웃</a>
        <!-- 1-2 로그인 후 화면 끝 -->
        <%
            }
        %>

    </div>
    <!-- End Header -->