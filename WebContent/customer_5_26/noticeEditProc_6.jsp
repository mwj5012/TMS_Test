<%@page import="notice.vo_5_27.Notice"%>
<%@page import="notice.dao_5_27.NoticeDao"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
%>
<%
//업데이트 처리
String title = request.getParameter("title");
String content = request.getParameter("content");

String seq = request.getParameter("c");

//순서11 //순서13 int af를 받아줌
NoticeDao dao = new NoticeDao(); //객체 생성
//int af = dao.update(title, content, seq); //방법1

//순서14 방법2
Notice n = new Notice(); //객체 생성, 새로운 객체
n.setSeq(seq);
n.setTitle(title);
n.setContent(content);

int af = dao.update(n); //NoticeDao에서 매개변수(Notice n)으로 받아줌

//결과 후 이동 //순서14 int af 이용
if(af > 0) { //업데이트가 성공하면(1개 이상이면)
	response.sendRedirect("noticeDetail_4.jsp?c=" + seq);
} else {
	out.write("수정 오류");
}

%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>noticeEditProc_6</title>
</head>
<body>
	<h3>noticeEditProc_6</h3>
	
	<%=seq %>
	
</body>
</html>