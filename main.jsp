<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="dao.*" %>

<%
    String uid = (String) session.getAttribute("id");
    if (uid == null) {
        response.sendRedirect("loginForm.jsp");
        return;
    }
    
    session.setAttribute("id", uid);
    
    ArrayList<FeedObj> feeds = (new FeedDAO()).getList();
    
	UserDAO dao = new UserDAO();
    
    UserBean user = dao.getUser(uid);
    
    String str = "";
    str += "<center><h1>MAIN</h1></center>";
    str += "<center><a href='withdrawForm.jsp'><button>회원탈퇴</button></a> ";
    str += "<a href='updateForm.jsp'><button>회원정보수정</button></a> ";
    str += "<a href='feedAddForm.jsp'><button>글쓰기</button></a> ";
    str += "<a href='logout.jsp'><button>로그아웃</button></a></center>";
    str += "<table style = 'background-color:lightgray;'>";
    str += "<tr><td><strong>"+ user.getName() +"</strong>님 로그인 중</td></tr>";
    str += "<tr><td><a href='userInfo.jsp'><button>회원정보 확인</button></a></td></tr></table><hr>";
    str += "<table align=center style='width: 1000px;'>";
    for (FeedObj feed : feeds) {
        String img = feed.getImages(), imgstr = "";
        if (img != null) {
            imgstr = "<img src='images/" + img + "' width=500>";
        }
        
        str += "<tr><td>" + feed.getId() + "</td></tr>";
        str += "<tr><td>" + feed.getContent() + "</td></tr>";
        str += "<tr><td>" + feed.getTs() + "</td></tr>";
        str += "<tr><td style ='height:auto'>" + imgstr + "</td></tr>";
        str += "<tr><td colspan=3><hr></td></tr>";
    }
    str += "</table>";
    out.print(str);
%>