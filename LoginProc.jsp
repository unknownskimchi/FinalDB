<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="db.DBConn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<% 

	Connection conn = DBConn.getMySqlConnection();
	Statement stmt = conn.createStatement();

	String uid = request.getParameter("uid");
	String pwd = request.getParameter("pwd");
	
	String sql = "select * from usertable where id ='"+ uid + "' and password ='"+pwd+"'";
	
	ResultSet rs = stmt.executeQuery(sql);

	if(rs.next()){
		session.setAttribute("uid", uid);
		session.setAttribute("name", rs.getString("name"));
		
		response.sendRedirect("index.jsp");
	}else{
		out.print("<script>");
		out.print("alert('패스워드 또는 아이디가 잘못된 값 입니다.');");
		out.print("history.back();");
		out.print("</script>");
	}
	
	
%>

    
    
    
    