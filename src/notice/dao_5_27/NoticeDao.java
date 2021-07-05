package notice.dao_5_27;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import notice.db_5_31.DBCon_3;
import notice.vo_5_27.Notice;

public class NoticeDao {
	//순서15 메소드 생성 
	public int insert(Notice not) throws Exception {
		//dbconnect
		String sql="insert into notices VALUES("
				+"(select max(to_number(seq))+1 from notices),"
				+"?,'cj',?,SYSTIMESTAMP,0)";
		
		//DB접속 내용 대신에 아래 문장만 입력하면 DB접속 가능
		Connection con = DBCon_3.getConnection(); //DBCon_3의 getConnection 메소드를 con 객체로 호출
		
		//실행
		PreparedStatement pstmt=con.prepareStatement(sql);
		pstmt.setString(1, not.getTitle());
		pstmt.setString(2, not.getContent());
		
		//결과
		int af = pstmt.executeUpdate();//insert 실행
		return af;
	}

	
	//순서10 메소드 생성
	//public int update(String title, String content, String seq) throws Exception {
	public int update(Notice n) throws Exception {
		//db connect 
		String sql = "update notices set title = ?, content = ? where seq = ?";
		
		//DB접속 내용 대신 입력
		Connection con = DBCon_3.getConnection();

		//실행
		//PreparedStatement pstmt = con.prepareStatement(sql);
		//pstmt.setString(1, title);
		//pstmt.setString(2, content);
		//pstmt.setString(3, seq);
		//title, content, seq 오류 -> 두가지 방법으로 처리
		//1. 메소드 호출 시 매개변수로 전달, 예외처리 : throws Exception

		//실행
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, n.getTitle());
		pstmt.setString(2, n.getContent());
		pstmt.setString(3, n.getSeq());
		
		//결과
		//순서12 업데이트 확인: int af 값 보내줌, 메소드 타입 변경, return 값 넣어줌
		int af = pstmt.executeUpdate(); //update 실행
		System.out.println("af : " + af);
		
		return af;
	}
	
	
	//순서3 메소드 생성 - 메소드를 호출하면 신호받고 내용을 전달
	//순서5 Notice 클래스 타입으로 리턴 타입 잡아주기
	public Notice getNotice(String seq) throws Exception {
		//순서4 db 연결, 예외처리
		//db connect 
		String sql = "select * from notices where seq = " + seq; //seq가 고정되지 않게

		//DB접속 내용 대신 입력하면 DB 접속 가능
		Connection con = DBCon_3.getConnection();

		//실행
		Statement st = con.createStatement();

		//결과
		ResultSet rs = st.executeQuery(sql); //select 실행
		rs.next(); //db내용을 jsp에서 꺼내기
		
		//순서6
		Notice n = new Notice(); //객체 생성
		//순서7 NoticeDetail에서 필요한 정보를 Notice에 담아보기
		n.setSeq(rs.getString("seq")); //Notice 클래스의 setSeq에 db 데이터 넣기
		n.setTitle(rs.getString("title"));
		n.setWriter(rs.getString("writer"));
		n.setContent(rs.getString("content"));
		n.setRegdate(rs.getDate("regdate"));
		n.setHit(rs.getInt("hit"));
		
		//자원회수 - 필요한만큼 사용 후 없애기
		rs.close();
		st.close();
		con.close();
		
		//순서6
		return n; //Notice 타입의 n을 리턴하겠다
		
	}
	
	
	
}
