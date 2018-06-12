package com.hzit.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class LoginInterceptor implements HandlerInterceptor {

	Logger logger = Logger.getLogger(LoginInterceptor.class);

	/**
	 * 
	 * 在进入Controller之前进行
	 * 
	 * 
	 * 如果返回的是:true 表示放行 false:表示被拦截
	 * 
	 */
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		// 1.判断是否登录的依据 session里面是否有用户信息
		HttpSession session = request.getSession();
		Object object = session.getAttribute("userInfo");

		// 2.如果失败，返回到登录界面，并携带错误信息
		if (object == null) {
			session.setAttribute("msg", "权限不足，请先登录");
			request.getRequestDispatcher("/").forward(request, response);
			logger.info("尚未登录，权限不足!!");
			return false;
		} else {
			//logger.info("恭喜，登录成功!!");
			return true;
		}
	}

	/**
	 * 在进入Controller之后，但是没有return ModelAndView之前执行
	 */
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub

	}

	/**
	 * 返回ModelAndView之后，但是在返回过滤器或者客户端之前
	 */
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub

	}

}
