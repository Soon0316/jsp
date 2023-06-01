<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.UserDAO" %>
<%
	request.setCharacterEncoding("utf-8");

%>

	<jsp:useBean id="user" class="dao.UserBean">
		<jsp:setProperty name="user" property="*" />
	</jsp:useBean>

<%
	UserDAO dao = new UserDAO();
	
	if (dao.update(user)) {%>
		<script>alert("수정이 완료되었습니다");location.href = "loginForm.jsp";</script>
		<%
	}
	else {%>
		<script>alert("오류가 발생했습니다\n다시 입력해주시기 바랍니다"); history.go(-1);</script>
		<%return;
	}%>
	
