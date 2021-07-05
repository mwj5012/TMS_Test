<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
%>
<%
String id = request.getParameter("id");
String pass = request.getParameter("password");

//String seq = request.getParameter("c");

//db connect 
String sql = "select id, pwd from member where id = ?";

//드라이버 로드
Class.forName("oracle.jdbc.driver.OracleDriver");

//접속
String url="jdbc:oracle:thin:@localhost:1521:xe";
String user="hr";
String pw="123456";
Connection con=DriverManager.getConnection(url, user, pw);

//실행
PreparedStatement pstmt = con.prepareStatement(sql);
pstmt.setString(1, id);
ResultSet rs = pstmt.executeQuery(); //select 실행

//내가 입력한 id, pass와 디비에 저장된 내용과 비교
String ypass = "";
int x = -1;
String msg = "";
if(rs.next()){
	ypass = rs.getString("pwd"); //DB에서 가져온 값
	if(ypass.equals(pass)){ //내가 입력한 값과 같으면
		x = 1;
	} else { //pass가 불일치하면
		x = 0;
	}
} else { //id가 존재하지 않으면
	x = -1; //id가 없는 x값 = -1
}
System.out.println("xxxx : " + x);

//x값에 따라 어느 페이지로 보낼지 결정. 세션에 저장
if(x == 1){ //아이디와 비밀번호가 일치하면
	session.setAttribute("sessionID", id);
	msg = "../mainForm.jsp";
} else if(x == 0) { //비밀번호가 일치하지 않을 때
	msg = "loginForm.jsp?msg=0";
} else { //아이디가 존재하지 않을 때
	msg = "loginForm.jsp?msg=-1";
}
//loginForm에서 내용(경고문구) 표시
response.sendRedirect(msg);


//콘솔창에 출력
System.out.println("id : " + id);
System.out.println("pw : " + pass);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>loginProc</title>
</head>
<body>
	<h3>loginProc</h3>
</body>
</html>