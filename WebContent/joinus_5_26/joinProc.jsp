<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
%>
<%
String id = request.getParameter("id");
String pwd = request.getParameter("pwd");
String pwd2 = request.getParameter("pwd2");
String name = request.getParameter("name");
String gender = request.getParameter("gender");
String year = request.getParameter("year");
String month = request.getParameter("month");
String day = request.getParameter("day");
String birth = String.format("%s-%s-%s", year, month, day);

String IsLuar = request.getParameter("IsLuar");
String cphone = request.getParameter("cphone");
String email = request.getParameter("email");

String[] habits = request.getParameterValues("habit");
String habit = "";

//체크박스는 배열로 처리
//habit에 아무 체크도 하지 않고 진행했을 때 if문으로 잡아주지 않으면 NullpointerException 오류 발생
if(habits != null){
	for(int i = 0; i < habits.length; i++){
		habit += habits[i];
		
		//문자열끼리 나열되었을 때 마지막 ,(콤마) 없애기 : 조건절 사용
		if(habits.length > i+1) {
			habit += ", ";
		}
	}
}

//id, 비밀번호 필터링 : id 없으면 / pwd, pwd2가 다르면 오류 처리
List<String> errors = new ArrayList();
if(id == null || id.equals("")){
	errors.add("아이디 입력 없음");
}
if(!pwd.equals(pwd2)){ //pwd가 pwd와 같지 않은 모든 경우에
	errors.add("pwd 불일치");
}
if(errors.size() > 0){ //에러가 하나라도 존재하면
	//에러를 request에 세팅(넣을 때는 setAttribute())
	request.setAttribute("errors", errors);
	request.getRequestDispatcher("join.jsp").forward(request, response);
	//join.jsp로 가라, request, response를 가지고 가라
	//response.sendRedirect()를 주면 그 전까지의 내용이 전부 사라지고 페이지 이동
	
	//request라는 (요청)저장소가 있음. -> "errors"라는 이름으로 error라는 내용을 저장(setAttribute) -> getAttribute로 받음
	//forward : 방금 request에 담은 내용을 가져간다.
	//Dispatcher(배포하다)
	//RequestDispatcher : 요청을 배포하다 정도 의미
	
	
} else {
	//db 연결
	String seq = request.getParameter("c");

	String sql = "insert into member(id, pwd, name, gender, birth, is_lunar, cphone, email, habit, regdate)"
			+ " values(?, ?, ?, ?, ?, ?, ?, ?, ?, sysdate)";

	//드라이버로드
	Class.forName("oracle.jdbc.driver.OracleDriver");

	//접속
	String url="jdbc:oracle:thin:@localhost:1521:xe";
	String user="hr";
	String pw="123456";
	Connection con = DriverManager.getConnection(url, user, pw);

	//실행
	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setString(1, id);
	pstmt.setString(2, pwd);
	pstmt.setString(3, name);
	pstmt.setString(4, gender);
	pstmt.setString(5, birth);
	pstmt.setString(6, IsLuar);
	pstmt.setString(7, cphone);
	pstmt.setString(8, email);
	pstmt.setString(9, habit);

	//결과
	pstmt.executeUpdate();

	//결과 후 메인 페이지로 이동
	response.sendRedirect("../index.jsp");
}

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>joinProc.jsp</title>
</head>
<body>
	<h3>joinProc.jsp</h3>
	
	id : <%=id %> <br />
	habit : <%=habit %> <br />
	
	
</body>
</html>