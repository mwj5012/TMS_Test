package notice.db_5_31;

import java.sql.Connection;
import java.sql.DriverManager;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DBCon_3 {
	public static Connection getConnection() throws Exception {
//		//db connect //드라이버로드
//		Class.forName("oracle.jdbc.driver.OracleDriver");
//		
//		//접속
//		String url="jdbc:oracle:thin:@localhost:1521:xe";
//		String user="hr";
//		String pw="123456";
//		Connection con=DriverManager.getConnection(url, user, pw);
//		
//		return con; //Connection con 객체 리턴 -> 호출하면 con 전달 -> NoticeDao에서 호출
		
		Context initCtx = new InitialContext();
		Context envCtx = (Context) initCtx.lookup("java:comp/env"); //mismatch -> 강제 형변환
		DataSource ds = (DataSource) envCtx.lookup("jdbc/noticeOrcl");
		Connection con = ds.getConnection();
		return con;
		
		//기존 드라이버 연결 방법 / dbcp 방법 중 더 효율적인 방법은 dbcp
		//어느 방법을 사용해도 상관 없음
		//dbcp는 Pool을 사용
		
	}
}
