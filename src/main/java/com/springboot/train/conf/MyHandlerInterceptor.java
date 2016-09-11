package com.springboot.train.conf;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.springboot.train.util.HttpRequestNg;
import com.springboot.train.util.HttpsRequestNg;

public class MyHandlerInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		boolean handlerOk =true;
		HttpSession session = request.getSession();
		Object attribute = session.getAttribute("httpClient");
		if(attribute==null){
			HttpRequestNg httpclient = new HttpsRequestNg();
			attribute=httpclient;
			String url = "https://kyfw.12306.cn/otn/login/init";
			try {
				httpclient.doGet(url);
				request.setAttribute("httpClient", httpclient);
			} catch (Exception e) {
				e.printStackTrace();
			}		
		}
		request.setAttribute("httpClient",attribute);
		session.setAttribute("httpClient", attribute);
		return handlerOk;
	}

	@Override
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
			throws Exception {
	}

}
