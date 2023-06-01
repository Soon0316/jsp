<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.*" %>
	
<%
	request.setCharacterEncoding("utf-8");

	String uid = request.getParameter("id");
	String upass = request.getParameter("ps");
	
    UserDAO dao = new UserDAO();
	FeedDAO fdao = new FeedDAO();
    
    int check = dao.login(uid, upass);
    
    if(check == 1){%>
    	<script>alert("해당 회원정보가 없습니다."); location.href = "withdrawForm.jsp"</script>
    <%
    }
    else if(check == 2){%>
    	<script>alert("비밀번호가 일치하지 않습니다."); location.href = "withdrawForm.jsp"</script>
    <%
    }
    else {
    	dao.delete(uid);
    	fdao.delete(uid);
    	session.invalidate();%>
    	<script>alert("회원탈퇴가 정상적으로 처리되었습니다"); location.href = "loginForm.jsp"</script>
    <%
    }%>
	
	
