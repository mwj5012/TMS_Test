<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
request.setCharacterEncoding("utf-8");
%>
<%
String sql = "select * from notices order by to_number(seq) desc";
//db connect
//드라이버 로드
Class.forName("oracle.jdbc.driver.OracleDriver");
//접속
String url = "jdbc:oracle:thin:@localhost:1521:xe";
String user = "hr";
String pw = "123456";
Connection con = DriverManager.getConnection(url, user, pw);
//실행
Statement st = con.createStatement();
//결과
ResultSet rs = st.executeQuery(sql);

//여기까지의 상태 : sql에서 select를 가져와서 ResultSet rs에 보관해놓은 상태
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>notice_1</title>
</head>
<body>
	<table width="500" border="1">
		<tr>
			<td>번호</td>
			<td>제목</td>
			<td>작성자</td>
			<td>작성일</td>
			<td>조회수</td>
		</tr>
	<%
	while(rs.next()){
	%>
		<tr>
			<td><%=rs.getString("seq") %></td> <!-- 번호 -->
			<td><a href="noticeDetail_4.jsp?c=<%=rs.getString("seq") %>"><%=rs.getString("title") %></a></td> <!-- 제목(링크, 제목) -->
			<!-- Detail : 이 번호에 해당하는 타이틀을 더 자세히 표현하겠다 (해당하는 번호의 힌트가 있어야함) -->
			<td><%=rs.getString("writer") %></td> <!-- 작성자 -->
			<td><%=rs.getString("regdate") %></td> <!-- 작성일 -->
			<td><%=rs.getString("hit") %></td> <!-- 조회수 -->
		</tr>
	<%
	}
	%>
	</table>
	
	<a href="noticeRec_2.jsp">write</a>
	
</body>
</html>

<% //자원 회수
rs.close();
st.close();
con.close();
%>

