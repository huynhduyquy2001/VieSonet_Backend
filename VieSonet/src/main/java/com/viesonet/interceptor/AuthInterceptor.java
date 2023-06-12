package com.viesonet.interceptor;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Component
public class AuthInterceptor implements HandlerInterceptor {


    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        if (request.getSession().getAttribute("sdt") == null) {
            response.sendRedirect("/dangnhap");
            return false;
        }
        if(request.getSession().getAttribute("vt")=="1") {
        	response.sendRedirect("/");
        	return false;
        }
        return true;
    }
}

