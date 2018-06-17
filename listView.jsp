<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MyBoardList</title>
<style type = "text/css">
   table,td{
      border: 1px solid #ccc;
      border-collapse: collapse;
      padding: 6px;
      margin: auto;
      text-align: center;
   }
</style>
</head>
<body>
<h3 style="text-align: center;">My Board(ver 1.0)</h3>
<div style = "text-align: right;width:700px;margin:auto;">
총 ${plist.totalCount } 개 글 /
현재 ${plist.currentPage } 페이지  /
총 ${plist.totalPage } 페이지</div>
<table>
   <tr><td width="50">Idx</td>
      <td width="250">제목</td>
      <td width="150">작성자</td>
      <td width="150">작성날짜</td>
      <td width="50">조회수</td>
   </tr>
<c:forEach var="vo" items="${list}">
   <tr>
      <td>${vo.idx}</td>
      <td style="text-align: left;">
      <a href="select.do?idx=${vo.idx }&page=${plist.currentPage}">
      ${vo.subject }</a>&nbsp;&nbsp;..[${vo.replyCount}]
      <!-- vo의 날짜가 오늘인지 체크 -->
      <jsp:useBean id="now" class="java.util.Date" />
      <c:if test="${vo.wdate.year == now.year && 
               vo.wdate.month == now.month &&
               vo.wdate.date == now.date}" >      
      </c:if>
      </td>
      <td>${vo.name }</td>
      <td>
<!--       //오늘 입력된 새 글 이면 시간, 아니면 날짜 출력 -->
      <c:choose>
      <c:when test="${vo.wdate.year == now.year && 
               vo.wdate.month == now.month &&
               vo.wdate.date == now.date}" >   
      <fmt:formatDate value="${vo.wdate }" type="time"/>
      </c:when>
      <c:otherwise>
      <fmt:formatDate value="${vo.wdate }" type="date"/>
      </c:otherwise>
      </c:choose>
      </td>
      <td>${vo.readCount }</td>
   </tr>
</c:forEach>
</table>
<div style="text-align: right;width:700px;margin:auto;">
<br>
<input type="button" value="글쓰기" 
      onclick="location.href='insert.do'">
</div>
<div style="text-align: center;">
<c:if test="${plist.currentPage > 10 }">
   <input type="button" value="&lt;&lt;" 
      onclick="location.href='?page=${plist.currentPage-10}'">
</c:if>
<c:choose>
<c:when test="${plist.currentPage == 1 }">
      <input type='button' value='&lt;' disabled>   
</c:when>
<c:otherwise>
   <input type="button" value="&lt;" 
      onclick="location.href='?page=${plist.currentPage-1}'">
</c:otherwise>
</c:choose>

<!--   currentPage (1) 15 ?  (2) 20 ?  (3)  6   ?
       startPage   (1)   11    (2) 11    (3)  1
-->
<c:forEach var="i" begin="${plist.startPage}" end="${plist.endPage }">
<c:choose> 
<c:when test="test=${i == plist.currentPage }">
      <input type="button" value="${i }" style="color: green;" disabled>
</c:when>
<c:otherwise>
      <input type="button" value="${i }"
        onclick="location.href='?page=${i}'">
</c:otherwise>        
</c:choose>      
</c:forEach>
<c:choose>   
   <c:when test="${plist.currentPage > plist.totalPage }">
      <input type='button' value='&gt;' disabled>
   </c:when>
   <c:otherwise>
   <input type="button" value="&gt;" 
      onclick="location.href='?page=${plist.currentPage + 1}'">
   </c:otherwise>      
</c:choose>
<c:if test="${plist.endPage < plist.totalPage }">
   <input type="button" value="&gt;&gt;" 
      onclick="location.href='?page=${plist.endPage + 1}'">
</c:if>
</div>
<a href="today.jsp?page=${plist.currentPage}">오늘 읽은 글 목록</a>
</body>
</html>