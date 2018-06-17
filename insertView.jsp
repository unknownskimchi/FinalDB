<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>My Board - 새 글 쓰기</title>
<style type="text/css">
   table,td,th{
      border: 1px solid #ccc;
      border-collapse: collapse;
      padding: 6px;
      margin: auto;
   }
   th{
      text-align: center;
   }
</style>
</head>
<body>
<h3 style="text-align: center;">My Board(ver 1.0)</h3>
<form action="insert.do" method="post">
<input type="hidden" name="ip" value="<%=request.getRemoteAddr() %>" >
<table>
   <tr><th>작성자 </th>
      <td><input type="text" name="name"></td>
   </tr>
   <tr><th>글 비밀번호 </th>
      <td><input type="password" name="password"></td>
   </tr>
   <tr><th>제목 </th>
      <td><input type="text" name="subject" size="50"></td>
   </tr>
   <tr><th>내용</th>
      <td><textarea rows="15" cols="70" name="content"></textarea></td>
   </tr>
   <tr>
   <td colspan="2">
      <input type="submit" value="저장">&nbsp;&nbsp;
      <input type="reset" value="다시쓰기">&nbsp;&nbsp;
      <input type="button" value="글 목록" 
            onclick="location.href='list.do'">
   </td></tr>
</table>
</form>
</body>
</html>






