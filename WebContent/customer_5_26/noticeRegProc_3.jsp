<%@page import="notice.dao_5_27.NoticeDao"%>
<%@page import="notice.vo_5_27.Notice"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
%>
<%
	String title=request.getParameter("title");
	String content=request.getParameter("content");
	
	//순서16
	Notice n = new Notice();
	n.setTitle(title);
	n.setContent(content);
	
	NoticeDao dao = new NoticeDao();
	int af = dao.insert(n);
	
	//목록으로 이동
	if(af > 0){
		response.sendRedirect("notice_1.jsp");
	} else {
		out.write("입력 오류");
	}
	
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>noticeRegProc_3</title>
</head>
<body>
	<h3>noticeRegProc</h3>
</body>
</html>

<%-- <% //자원 회수
pstmt.close();
con.close();
%> --%>