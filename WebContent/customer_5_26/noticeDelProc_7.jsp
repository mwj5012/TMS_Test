<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
%>
<%
String seq = request.getParameter("c");

//db connect 
String sql = "DELETE FROM notices WHERE seq = ?";

//드라이버로드
Class.forName("oracle.jdbc.driver.OracleDriver");

//접속
String url="jdbc:oracle:thin:@localhost:1521:xe";
String user="hr";
String pw="123456";
Connection con=DriverManager.getConnection(url, user, pw);

//실행
PreparedStatement pstmt = con.prepareStatement(sql);
pstmt.setString(1, seq);
int af = pstmt.executeUpdate(); //return이 int :delete된 개수가 af로 들어감.
if(af > 0){ //delete가 되었다면
	response.sendRedirect("notice_1.jsp");
} else {
	out.write("삭제 오류");
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>noticeDelProc_7</title>
</head>
<body>
	<h3>noticeDelProc_7</h3>
	
	<%=seq %>
</body>
</html>