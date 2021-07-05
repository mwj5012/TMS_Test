<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>loginForm</title>
<link rel="stylesheet" href="../css/join_style.css" />
<script>
	function checkValue() {
		/* alert("도착"); */
		inputForm = eval("document.loginInfo"); /* inputForm을 전부 받음. form의 name="inputForm" */
		/* alert(inputForm.id.value); */ /* inputForm.id.value : id 입력값 */
		if(!inputForm.id.value){ /* !inputForm.id.value : 아무것도 입력하지 않으면 */
			alert("ID 입력 필요");
			inputForm.id.focus(); /* 포커스 위치 지정 */
			return false; /* return checkValue()을 false로 줘서 페이지 이동되지 않게함 */		
		}
		if(!inputForm.password.value){ /* !inputForm.id.value : 아무것도 들어있지 않다 */
			alert("pass 입력 필요");
			inputForm.password.focus(); /* 포커스 위치 지정 */
			return false; /* return checkValue()을 false로 줘서 페이지 이동되지 않게함 */		
		}
	}
	
	function goJoinForm() {
		/* alert("신호"); */
		location.href="../joinus_5_26/join.jsp";			
	}
	
	
</script>

</head>
<body>
	<h3>loginForm</h3>
	<div id="wrap">
		<form action="loginProc.jsp" name="loginInfo" method="post" onsubmit="return checkValue()"> <!-- checkValue()함수를 호출 : 내용 입력값을 체크해서 checkValue return 값이 false가 되면 submit 실행 안됨 -->
			<!-- 이미지 추가 -->
			<img src="../img/welcome.jpg" id="wel_img" />
			<br /><br />
			<table>
				<tr>
					<td bgcolor="skyblue">아이디</td>
					<td> <input type="text" name="id" maxlength="50" /> </td>
				</tr>
				<tr>
					<td bgcolor="skyblue">비밀번호</td>
					<td> <input type="password" name="password" maxlength="50" /> </td>
				</tr>
			</table>
			<br />
			<input type="submit" value="login" />
			<input type="button" value="join" onclick="goJoinForm()" />
		</form>
		
		<%
		String msg = request.getParameter("msg"); //0, -1이 올 수 있음
		if(msg != null && msg.equals("0")){
			out.println("<br>");
			out.println("<font color='red' size='5'>비밀번호 확인</font>");
		}else if(msg != null && msg.equals("-1")){
			out.println("<br>");
			out.println("<font color='red' size='5'>아이디 확인</font>");
		}
		%>
		
	</div>
</body>
</html>