<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    session.invalidate();
%>
<script>alert("로그아웃을 완료하였습니다"); location.href = "loginForm.jsp";</script>
