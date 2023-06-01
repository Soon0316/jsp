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

    if (dao.exists(user.getId())) {%>
       	<script>if (!alert("이미 가입한 회원입니다.")){
       		history.go(-1);
       	}</script>
        <%return;
    }%>
   <% 
   if (dao.insert(user)) {%>
      <script>alert("회원 가입이 완료되었습니다.");
    	  location.href = "loginForm.jsp";
      </script>
      <%
    }
    else {%>
      <script>alert("회원 가입 중 오류가 발생하었습니다.")</script>
      <%return;
	}%>

