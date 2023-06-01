<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.*" %>
<%
	request.setCharacterEncoding("utf-8");
	
	String No[] = request.getParameterValues("no");
	FeedDAO dao = new FeedDAO();
	
	int length = No.length;
	
	for (int i = 0; i < length; i++){
		if (!dao.deleteNo(No[i])){%>
		<script>alert("선택한 글을 삭제하지 못했습니다"); location.href = "userInfo.jsp";</script>
		<% return;
		}	
	}%>
	
<script>alert("총<%= length %>개의 글을 삭제했습니다"); location.href = "userInfo.jsp";</script>