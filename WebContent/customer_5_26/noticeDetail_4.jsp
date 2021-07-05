<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
%>
<%
/* String seq = request.getParameter("c");

NoticeDao dao = new NoticeDao(); //객체 생성 
Notice n = dao.getNotice(seq); */ //getNotice 메소드 호출
//getNotice에 담아놓은 자료가 전부 전달됨

/* NoticeDao.java에 내용을 이동하고 주석처리 -> 주석처리 부분 삭제
 */
 
 //MVC2 모델 : Control과 View단이 분리, 전달 받아서 사용
 
 //DB의 내용을 받는 Notice n을 전부 주석처리 했기 때문에
 //EL로 받아주는 방법을 사용
 
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>noticeDetail_4</title>
<link rel="stylesheet" href="../css/nstyle.css" />

</head>
<body>
	<h3>noticeDetail</h3>
	
	<table class="twidth">                                                                                                                        
		<colgroup>
			<col width="15%"/>
			<col width="35%"/>
			<col width="15%"/>
			<col width="35%"/>
		</colgroup>
		<caption>Detail</caption>
		<tbody>
		<!-- 주소창에 .jsp로는 로드 안됨 -> .do?c=seq 등으로 사용 -->
		
			<tr> <%-- <%=rs.getString("seq") %>를 대체 --%>
				<th class="left">글번호</th>
				<td>${n.seq }</td> <!-- Notice.java의 getSeq를 찾아감, 필드가 아니라 getSeq에서 get을 제외하고 S를 소문자로 바꿔서 찾음 -->
				<th class="left">조회수</th>
				<td>${n.hit }</td>
			</tr>
			<tr>
				<th class="left">작성자</th>
				<td>${n.writer }</td>
				<th class="left">작성시간</th>
				<td>${n.regdate }</td> <!-- 타입 확인 -->
			</tr>
			<tr>
				<th class="left">제목</th>
				<td colspan="3">
				${n.title }
				</td>
			</tr>
			<tr>
				<th class="left">내용</th>
				<td colspan="3" id="content">
				${n.content }
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
		<a href="noticeEdit_5.do?c=${n.seq }">수정</a>
		<a href="noticeDelProc_7.do?c=${n.seq }">삭제</a>
		<a href="notice_1.jsp">목록</a>
	</div>
	
	
	<%-- 전달된 값 : <%=c %> : c값이 잘 전달되는지 확인 --%>
</body>
</html>
<%--
위에서 생성한 내용이 없어서 주석처리 
<% //자원 회수
rs.close();
st.close();
con.close();
%>
--%>