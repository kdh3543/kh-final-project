package kh.spring.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;

public class TestInterceptor implements HandlerInterceptor {
	
	@Autowired
	private HttpSession session;
	
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		
		String id = (String)session.getAttribute("loginID");
		if(id== null) { //login 한 적이 없다면
			
			response.sendRedirect("/");
			
			//세션이 없으니까 로그인한 회원이 존재하지 않다는 것
			//알림창을 좀 띄워보자
			//브라우저에 html을 자바코드로 출력하는 방법
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print("<script>alert('로그인이 필요합니다 !'); location.href='/myapp';</script>");
			out.flush();//출력버퍼를 비우는 코드
			out.close();
			System.out.println("로그인이 필요한 기능입니다");
			return false;  //false 가 실행되면 controller 에게 전달하지 x
			
			
		}
		return HandlerInterceptor.super.preHandle(request, response, handler);
	}

}
