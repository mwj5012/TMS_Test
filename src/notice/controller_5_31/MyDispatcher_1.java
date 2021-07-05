package notice.controller_5_31;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import notice.controller.customer_5_31.NoticeDetailController_2;

//서블릿 형식의 doGet을 사용하기 위해서 httpServlet 상속 받음
public class MyDispatcher_1 extends HttpServlet{
	
//	@Override
//	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		System.out.println("service 신호");
//	}
		
	protected void doService(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet doPost 모두 받기");
		String uri = request.getRequestURI();
		String conPath = request.getContextPath();
		String com = uri.substring(conPath.length());
		
		System.out.println("uri : " + uri);
		System.out.println("conPath : " + conPath); //uri에 conPath가 포함되어있음
		System.out.println("com : " + com); //uri에 com이 포함되어있음
		
		//com 사용
		NoticeDetailController_2 controller1 = new NoticeDetailController_2();
		
		try {
			if (com.equals("/customer_5_26/noticeDetail_4.do")) { //이런 주소가 들어오면
				controller1.execute(request, response);
				
			}
		} catch(Exception e) {
			
		}
		
	}
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doService(request, response); //doGet으로 오는 신호를 doService로 보냄
	}
	
	@Override
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doService(request, response); //doPost로 오는 신호를 doService로 보냄
		}
	
}
