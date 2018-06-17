<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>
</head>
<body>

<div class ="container">

<form action =" join.jsp" method ="post">

아이디:<br>

<input type ="text" name = "id" required> <br>    <!--  required = not null / 널 허용 x -->

패스워드: <br>

<input type="password" name = "pwd" required> <br>

이름: <br>

<input type="text" name= "name" required > <br>

이메일: <br>

<input type= "text" name="email"><br>

나이:<br>
<input type ="number" name="age"> <br><br>

<input type ="submit" value ="회원 가입"> &nbsp; &nbsp;
<input type ="reset" value ="다시쓰기">

</form>	


</div>

</body>
</html>