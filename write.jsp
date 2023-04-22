<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>write.jsp</title>
</head>
<body>
<h1>write.jsp</h1>
<%
String url="jdbc:mysql://localhost:3306/guestbook_d";
String user="root";
String password="";
Connection conn=DriverManager.getConnection(url,user,password);
%>
<%
String title= request.getParameter("title");
String content= request.getParameter("content");
String writer= request.getParameter("writer");

//INSERT (prepared스타일문장사용)
PreparedStatement stmt = null;
stmt = null;
stmt = conn.prepareStatement("INSERT INTO guestbook_t (title,content,writer) VALUES (?,?,?)");
stmt.setString(1,title);
stmt.setString(2,content);
stmt.setString(3,writer);
stmt.executeUpdate();
%>
</body>
</html>




