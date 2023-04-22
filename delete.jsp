<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>delete.jsp</title>
</head>
<body>
<%
String url="jdbc:mysql://localhost:3306/guestbook_d";
String user="root";
String password="";
Connection conn=DriverManager.getConnection(url,user,password);

int no = Integer.parseInt(request.getParameter("no"));

ResultSet rs=null;
PreparedStatement stmt = null;
stmt = conn.prepareStatement("DELETE FROM guestbook_t WHERE no=?");
stmt.setInt(1, no);
stmt.executeUpdate();

out.println(no+"번글이 삭제되었습니다");
%>
</body>
</html>