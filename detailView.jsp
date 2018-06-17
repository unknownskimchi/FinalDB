<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="vo.Board"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>My Board - 글  상세보기</title>
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
   
.replyList{
      width: 550px; 
      background: #eee; 
      padding: 8px;
      display: block;
      margin: 3px auto;
      border-bottom: 1px solid #fff;
}
.name {
   width:150px;
   display: inline-block;
   font-weight:bold;
}
.wdate{
   width:200px;
   display: inline-block;
   color: #ccc;
   font-size:80%;   
   font-weight:bold;
}
.update{
   width:150px;
   display: inline-block;
}
</style>
</head>
<body> <!-- 애트리뷰트 :vo,page -->
<h3 style="text-align: center;">My Board(ver 1.0)</h3>
<table>
   <tr>
      <td width="100">idx</td><td width="150">작성자</td>
      <td width="150">작성날짜</td><td width="100">조회수</td>
   </tr>
   <tr>
      <td>${vo.idx }</td><td>${vo.name }</td>
      <td>${vo.wdate}</td><td>${vo.readCount }</td>
   </tr>
   <tr>
      <td>제목</td>
      <td colspan="3">${vo.subject}</td>
   </tr>
   <tr height="300">
      <td>내용</td>
      <td colspan="3">
      <c:set var="rn" value="${rn}" />
      ${fn:replace(vo.content,rn,'<br>') }
   </tr>
   <tr>
   <td colspan="4" style="text-align:center;">
      <input type="button" value="글 수정"
        onclick="location.href='select.do?idx=${vo.idx }&exec=update&page=${page}'">
      <input type="button" value="글 삭제"
        onclick="location.href='select.do?idx=${vo.idx }&exec=delete&page=${page}'">
      <input type="button" value="글 목록"
        onclick="location.href='list.do?page=${page}'">
   </td></tr>
</table>
<!-- 댓글 수정, 삭제를 위하여 기존 값을 form 태그로 넘김. -->
<script type="text/javascript">
   function displaySet(exe,idx,name,content,cmd){
      obj = document.frm;
      obj.idx.value=idx;
      obj.exe.value=exe; //exec :2( 댓글 수정), 3(댓글 삭제)
      obj.name.value=name;
      while(content.indexOf("<br>") != -1){
      content = content.replace("<br>","\n");
      }
      obj.content.value=content;
      obj.cmd.value=cmd;
   }
</script>

<!--  댓글 입력  -->
<br>
<form action="reply.do" method="post" name="frm">
<!-- 댓글 수정,삭제를 위한 파라미터 -->
<input type="hidden" name="idx" value="1"> <!-- 댓글 수정/삭제 할때 자바스크립트 함수에서 value 변경 -->
<input type="hidden" name="exe" value="1"> <!-- exe :1(댓글 추가) -->
<!-- ref : 메인글의 idx 컬럼 값 -->
<input type="hidden" name="page" value="${page}">
<input type="hidden" name="ref" value="${vo.idx}" >

<table>
   <tr><th colspan="4">댓글</th></tr>
   <tr>
      <td width="100">이름</td>
      <td width="150"><input type="text" name="name"></td>
      <td width="100">비밀번호</td>
      <td width="150"><input type="password" name="password"></td>
   </tr>
   <tr>
      <td>내용</td>
      <td colspan="3"><textarea cols="60" rows="5" name="content"></textarea></td>
   </tr>
   <tr>
      <td colspan="4">
      <input type="submit" value="저장" name="cmd" >
      <input type="reset" value="다시쓰기" >
      </td>
   </tr>


</table>
</form>

<!--  댓글 리스트  -->
<%-- ${clist} --%>
<c:forEach var="co" items="${clist}">
<div class="replyList">
   <span class="name">${co.name }</span>
   <span class="wdate">${co.rdate}</span>
   <c:set var="content" value="${co.content}" />
   <c:set var="content" value="${fn:replace(content,rn,'<br>') }" />
   <span class="update">
   <a href="javascript:displaySet(2,'${co.idx}','${co.name}','${content}','수정')">
   수정</a>&nbsp;
   <a href="javascript:displaySet(3,'${co.idx}','${co.name}','${content}','삭제')">
   삭제</a></span>
   <div style="padding-top: 10px;">
      ${content}<!-- request.getAttribute("clist"); -->
   </div>
</div>
</c:forEach>



</body>
</html>



