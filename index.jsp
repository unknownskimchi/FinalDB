<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>HOME</title>
<style type="text/css">
.container{
	width:200px;
	height:200px;
	padding:50px;
	margin:100px auto;
	background-color: #ccc;
}
</style>
</head>
<body>
<%
	String logout = request.getParameter("LOGOUT");
	if(logout != null){
		out.print("<script>");
		out.print("alert('로그아웃 되었습니다.');");
		out.print("</script>");
	}
%>
<div class="container">
<%
//로그인 상태가 아닐때
	if(session.getAttribute("uid")==null){
%>
	<a href="LoginForm.jsp">로그인</a>&nbsp;&nbsp;
	<a href="joinForm.jsp">회원가입</a><br>
<%	
	}else{
%>
	<%=session.getAttribute("name") %>님 환영합니다. <br>
	<a href="Logout.jsp">로그아웃</a>&nbsp;&nbsp;<br>
	<a href="list.do">게시판</a>
<%
	}
%>
</div>
</body>
</html>