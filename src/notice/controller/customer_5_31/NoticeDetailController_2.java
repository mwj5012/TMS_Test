package notice.controller.customer_5_31;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import notice.dao_5_27.NoticeDao;
import notice.vo_5_27.Notice;

public class NoticeDetailController_2 {
	//execute 메소드 생성
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("NoticeDetailController_2");		
		String seq = request.getParameter("c");

		NoticeDao dao = new NoticeDao(); 
		Notice n = dao.getNotice(seq);
		
		//sout 문장을 맨 위로 올리면 주소창에 /customer_5_26/noticeDetail_4.do만 해도 됨,
		//아래에 쓰려면 맨 뒤에 ?c=seq(숫자)를 써줘야 표시됨.
		
		//request에 n을 저장
		request.setAttribute("n", n);
		//jsp로 forward. (noticeDetail_4.jsp로 n을 request해서 response 해라)
		request.getRequestDispatcher("noticeDetail_4.jsp").forward(request, response);
	}
	
}
