<%@page import="java.sql.PreparedStatement"%>
<%@page import="db.DBConn"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	request.setCharacterEncoding("UTF-8");

	Connection conn = DBConn.getMySqlConnection();
	
	Statement stmt = conn.createStatement();
	
	String id = request.getParameter("id");
	String password = request.getParameter("pwd");
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	String age = request.getParameter("age");
	
	String sql = "insert into usertable values(?,?,?,?,?)";
	
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, id);
	pstmt.setString(2, password);
	pstmt.setString(3, name);
	pstmt.setString(4, email);
	pstmt.setString(5, age);
	
	pstmt.execute();
	conn.commit();
	response.sendRedirect("index.jsp");
	DBConn.close(conn);
%>