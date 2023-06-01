<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="dao.*" %>
<style>
	div.info {
		width: 50%;
		float: left;
	}
	
	div.list{
		width: 50%;
		float: right;
	}
	
</style>
<%
	String uid = (String) session.getAttribute("id");
    	if (uid == null) {
        	response.sendRedirect("loginForm.jsp");
        	return;
    	}
    
    ArrayList<FeedObj> feeds = (new FeedDAO()).getList();
    
    UserDAO dao = new UserDAO();
    
    UserBean user = dao.getUser(uid);
     
    
    String str = "";
    str += "<center><h1>회원정보<h1><center><hr>";
    str += "<center><button onclick = \"location.href = 'main.jsp'\">메인페이지</button><center>";
    str += "<div class='info'><center>"+user.getName()+"</center><table align='center'>";
    str += "<tr><td colspan=3><hr></td></tr>";
    str += "<tr><td><strong>아이디</strong></td><td>"+ user.getId() +"</td></tr>";
    str += "<tr><td colspan=3><hr></td></tr>";
    str += "<tr><td><Strong>이름</strong></td><td>" + user.getName() +"</td></tr>";
    str += "<tr><td colspan=3><hr></td></tr>";
    str += "<tr><td><strong>회원가입 일시</strong></td><td>" + user.getTs() +"</td></tr></table></div>";
    
    str += "<div class='list'>";
    str += "<center>작성글 리스트</center>";
    str += "<form action = 'feedDelete.jsp' method = 'post'>";
    str += "<table align='center' >";
    str += "<tr><th>체크</th><th>글 번호</th><th>썸네일</th><th>내용</th><th>등록일시</th></tr>";
    str += "<tr><td colspan = 5><hr></td></tr>";
    
    
    for (FeedObj feed : feeds) {
       	if (uid.equals(feed.getId())){
       		String img = feed.getImages(), imgstr = "";
            if (img != null) {
                imgstr = "<img src='images/" + img + "' width=100>";
            }
            
        	str += "<tr><td><input type='checkbox' name='no' value =' "+ feed.getNo() +"'></td>";
        	str += "<td>" + feed.getNo() + "</td>";
        	str += "<td>"+imgstr+"</td>";
            str += "<td>" + feed.getContent() + "</td>";
            str += "<td>" + feed.getTs() + "</td>";
       	}            
    }
    
    str += "<tr><td><input type='submit' value = '선택삭제'></td></tr>";
    str += "</table></form></div>";
    out.print(str);
    
%>
