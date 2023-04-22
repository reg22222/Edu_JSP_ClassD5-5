<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>update_db.jsp</title>
</head>
<body>
<%
String url="jdbc:mysql://localhost:3306/guestbook_d";
String user="root";
String password="";
Connection conn=DriverManager.getConnection(url,user,password);

int no = Integer.parseInt(request.getParameter("no"));
String fix_title = request.getParameter("fix_title");
String fix_content = request.getParameter("fix_content");
String fix_writer = request.getParameter("fix_writer");

ResultSet rs=null;
PreparedStatement stmt = null;
stmt = conn.prepareStatement("UPDATE guestbook_t SET title=?,content=?,writer=? WHERE no=?");

stmt.setString(1, fix_title);
stmt.setString(2, fix_content);
stmt.setString(3, fix_writer);
stmt.setInt(4, no);
stmt.executeUpdate();
%>
</body>
</html>