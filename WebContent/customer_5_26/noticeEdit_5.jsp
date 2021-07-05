<%@page import="notice.vo_5_27.Notice"%>
<%@page import="notice.dao_5_27.NoticeDao"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
%>
<%
//데이터베이스에서 seq로 select 조건이 필요
String seq = request.getParameter("c");

//순서9
NoticeDao dao = new NoticeDao(); //객체 생성 
Notice n = dao.getNotice(seq);

%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>noticeEdit_5</title>
<link rel="stylesheet" href="../css/nstyle.css" />
</head>
<body>
	<h3>noticeEdit_5</h3>
	
	<form action="noticeEditProc_6.jsp" method="post">
		<table class="twidth">
			<colgroup>
				<col width="15%"/>
				<col width="35%"/>
				<col width="15%"/>
				<col width="35%"/>
			</colgroup>
			<caption>Edit</caption>
			<tbody>
				<tr>
					<th class="left">글번호</th>
					<td><%=n.getSeq() %></td>
					<th class="left">조회수</th>
					<td><%=n.getHit() %></td>
				</tr>
				<tr>
					<th class="left">작성자</th>
					<td><%=n.getWriter() %></td>
					<th class="left">작성시간</th>
					<td><%=n.getRegdate() %></td> <!-- 타입 확인 -->
				</tr>
				<tr>
					<th class="left">제목</th>
					<td colspan="3">
					<input class="inp" name="title" type="text" value="<%=n.getTitle() %>" />
					<!-- input 태그 사용, class로 css적용, name 사용 -->
					</td>
				</tr>
				<tr>
					<th class="left">내용</th>
					<td colspan="3" id="content">
					<textarea class="txt" name="content" ><%=n.getContent() %></textarea>
					<!-- textarea 태그 사용, class로 css적용, name 사용 -->
					</td>
				</tr>
				<tr>
					<th class="left">첨부</th>
					<td colspan="3" id="addfile">
					첨부
					</td>
				</tr>		
			</tbody>
		</table>
		
		<div>
		<input type="hidden" name="c" value="<%=n.getSeq() %>" />
		<!-- type="hidden" : 내용을 숨김, 다음 단계에 보낼 값을 숨겨서 전달 가능, name="c"로 전달-받기 -->
		<input type="submit" value="저장"/>
		<a href="noticeDetail_4.jsp?c=<%=n.getSeq() %>">취소</a>
		
		</div>
		
	</form>
	


</body>
</html>