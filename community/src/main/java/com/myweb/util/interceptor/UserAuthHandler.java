package com.myweb.util.interceptor;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.web.servlet.HandlerInterceptor;
import com.myweb.command.UserVO;

public class UserAuthHandler implements HandlerInterceptor{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session	=request.getSession();
	    UserVO vo =(UserVO)session.getAttribute("user");
	
	    String query = request.getQueryString();
		System.out.println(query);
		String uri = request.getRequestURI();
		System.out.println(uri);
	   
	   if(vo == null) { //로그인이 안된시점
		   response.sendRedirect(request.getContextPath()+"/user/loginView"); //절대경로
		   return false;
	   }
		return true;
	}
}
