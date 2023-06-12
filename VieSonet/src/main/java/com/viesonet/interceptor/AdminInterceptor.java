package com.viesonet.interceptor;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Component
public class AdminInterceptor implements HandlerInterceptor {
	@Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        if (request.getSession().getAttribute("vt") != null) {
            String vt = request.getSession().getAttribute("vt").toString();
            if (vt.equals("1") || vt.equals("2")) {
                response.sendRedirect("/");
                return false;
            }
        }
        return true;
    }
}
