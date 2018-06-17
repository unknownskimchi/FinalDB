<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="vo.Board"%>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>My Board - 글  삭제</title>
<style>
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
<form action="delete.do" method="post">
<input type="hidden" name="idx" value="${vo.idx }">
<input type="hidden" name="page" value="${page }" >
<table>
   <tr>
      <td width="100">idx</td><td width="150">작성자</td>
      <td width="150">작성날짜</td><td width="100">조회수</td>
   </tr>
   <tr>
      <td>${vo.idx }</td><td>${vo.name }</td>
      <td>${vo.wdate }</td><td>${vo.readCount }</td>
   </tr>
   <tr>
      <td>제목</td>
      <td colspan="3">${vo.subject }</td>
   </tr>
   <tr height="300">
      <td>내용</td>
      <td colspan="3">
      <c:set var="rn" value="${rn }"/>      
      ${fn:replace(vo.content ,rn,'<br>') }
      </td>
   </tr>
   <tr>
   <td colspan="4" style="text-align:center;">
      글 비밀 번호 : <input type="password" name="password">
      <input type="submit" value="삭제">
      <input type="reset" value="다시쓰기">
      <input type="button" value="글 목록"
        onclick="location.href='list.do'">
   </td></tr>
</table>
</form>


</body>
</html>



