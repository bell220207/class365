package com.myweb.util.interceptor;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.myweb.command.UserVO;

public class UserLoginSuccessHandler implements HandlerInterceptor{

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		
		System.out.println("2. 로그인 석세스 입장");
		
	    ModelMap mv = modelAndView.getModelMap();
	    UserVO user = (UserVO)mv.get("user"); //컨트롤러에서 넘겨받은 유저객체
	     
	    if(user != null) {
	    	System.out.println("2-1) 유저 있음");
			HttpSession session=  request.getSession();
			session.setAttribute("user", user);
			response.sendRedirect(request.getContextPath()+"/");
		} else {
			System.out.println("2-2) 유저 없음");
		}
	    
	    System.out.println("3. 로그인 석세스 끝");
	}
}
