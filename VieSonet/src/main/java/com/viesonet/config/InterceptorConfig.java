package com.viesonet.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.viesonet.interceptor.AccessTimeInterceptor;
import com.viesonet.interceptor.AdminInterceptor;
import com.viesonet.interceptor.AuthInterceptor;

@Configuration
public class InterceptorConfig implements WebMvcConfigurer {

	@Autowired
	private AuthInterceptor authInterceptor;

	@Autowired
	private AccessTimeInterceptor accessTimeInterceptor;

	@Autowired
	private AdminInterceptor adminInterceptor;

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(authInterceptor)
				 .addPathPatterns("/**")
				// Áp dụng cho tất cả các đường dẫn
				.excludePathPatterns("/dangnhap")
				.excludePathPatterns("/dieukhoan")
				.excludePathPatterns("/dangky")
				.excludePathPatterns("/quenmatkhau").excludePathPatterns("/quenmatkhau/guima")
				.excludePathPatterns("/quenmatkhau/xemmatkhau").excludePathPatterns("/style.css")
				.excludePathPatterns("/images/**");
		registry.addInterceptor(accessTimeInterceptor).addPathPatterns("/**").excludePathPatterns("/quenmatkhau/guima")
				.excludePathPatterns("/dangnhap").excludePathPatterns("/style.css").excludePathPatterns("/images/**");		
		
		registry.addInterceptor(adminInterceptor).addPathPatterns("/quanly/**");
		

	}

	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/style.css").addResourceLocations("/");
	}

}
