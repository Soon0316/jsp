<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script>
	function pw_filter(){
		var pw = document.tform.ps.value;
		var pw_check = document.tform.ps2.value;
		
		if(pw != pw_check){
			alert("패스워드가 일치해야 합니다");
			return false;
		}
		else if (pw.length < 4){
			alert("패스워드 4자리 이상 입력해야 합니다");
			return false;
		}
		
		document.tform.action = "signup.jsp";
		document.tform.target = "_self";    //현재 창에서 signup.jsp 열기
		return true;
	}
	
	function Id_check(){
		 var id = document.tform.id.value;
		
		 if(id == ""){
			 alert("아이디를 입력해야 합니다");
			 return;
		 }
		 
		 document.tform.action = "confirmId.jsp";
		 document.tform.method = "post";       
		 document.tform.target = "_blank";    //새창으로 confirmId.jsp 열기
		 document.tform.submit();
		 
	}
	
</script>

<form name="tform" onsubmit = "return pw_filter()">
<table align=center>
<tr><td colspan=2 align=center height=40><b>회원가입</b><td></tr>
<tr>
    <td align=right>아이디&nbsp;</td>
    <td><input type="text" name="id" placeholder="Email address" required></td>
    <td><button onclick ="Id_check()">중복확인</button></td>
</tr>
<tr>
    <td align=right>패스워드&nbsp;</td>
    <td><input type="password" name="ps" required></td>
</tr>
<tr> 
    <td align=right>패스워드(확인)&nbsp;</td>
    <td><input type="password" name="ps2" required></td>
</tr>
<tr>
    <td align=right>이름&nbsp;</td>
    <td><input type="text" name="name" required></td> 
</tr>
<tr>
    <td colspan=2 align=center height=50>
        <input type="submit" value = "회원가입하기" >
    </td>
</tr>
</table>
</form>
</body>
</html>