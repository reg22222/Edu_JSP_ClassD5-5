<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>update.jsp</title>
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
stmt = conn.prepareStatement("SELECT * FROM guestbook_t WHERE no=?");
stmt.setInt(1, no);
rs = stmt.executeQuery();

//rs를 이용해서 해당글의 모든내용을 출력하는 코드를 작성하세요!! 
// search2.jsp 의 출력부분을 이용하면됩니다.
out.println("<table border='1'>");
out.println("<tr><td>글번호</td><td>글제목</td><td>글내용</td><td>글쓴이</td><td>글쓴날짜</td><td>조회수</td></tr>");
while (rs.next()) { 
 out.println("<tr>"); 
 out.println("<td>"+rs.getString("no")+"</td>");
 String html_no = rs.getString("no");
 //================== <form> ===================================
 out.println("<form method='GET' action='update_db.jsp'>");
 	out.println("<input type='hidden' name='no' value="+html_no+">");
 	out.println("<td><input type='text' name='fix_title' value="+rs.getString("title") + "></td>");
 	out.println("<td><input type='text' name='fix_content' value="+rs.getString("content")+"></td>");
 	out.println("<td><input type='text' name='fix_writer' value="+rs.getString("writer")+"></td>");	
//============================================================
 out.println("<td>"+rs.getString("date")+"</td>");
 out.println("<td>"+rs.getString("views")+"</td>");
 out.println("</tr>");
} 
out.println("<tr><td colspan='6'><input type='submit' value='send'></td></tr>");
out.println("</form>");
out.println("</table>");
%>
</body>
</html>