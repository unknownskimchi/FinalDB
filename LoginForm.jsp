<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>LOGIN</title>
<style type="text/css">
.container{	
	width: 200px;
	height: 200px;
	padding: 50px;
	margin: 100px
}
input {
	padding: 6px;
}
</style>
</head>

<body>
<%
	String login = request.getParameter("login");

	if(login != null && login.equals("no")){
		out.print("<script>");
		out.print("alert('로그인이 필요한 페이지 입니다.');");
		out.print("</script>");
	}
%>

<div class="container">
<form action="LoginProc.jsp" method="POST">
아이디 : <br>
<input type="text" name="uid"><br>
패스워드 : <br>
<input type="password" name = "pwd"><br><br>
<input type="submit" value = "LOGIN">&nbsp;&nbsp;
<input type="button" value="HOME" onclick="location.href='index.jsp'">
</form>
</div>
</body>
</html>