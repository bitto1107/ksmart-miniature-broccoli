<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<form action="<%=request.getContextPath()%>/db07khb/goodssearch/goods_search_list_gDate.jsp" method="post">

<input type="date" name="start_date">
<input type="date" name="end_date">

<input type="submit" value="검색버튼">
</form>
