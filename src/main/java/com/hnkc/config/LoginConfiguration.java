package com.hnkc.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

import com.hnkc.interceptor.LoginInterceptor;


@Configuration
public class LoginConfiguration extends WebMvcConfigurerAdapter {
	@Autowired LoginInterceptor loginInterceptor;
	
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		//和页面有关的静态目录都放在项目的static目录下
        registry.addResourceHandler("/static/**").addResourceLocations("classpath:/static/");
        //上传的图片在D盘下的springbootUpload目录下，访问路径如：http://localhost:8081/qx/upload/d3cf0281-bb7f-40e0-ab77-406db95ccf2c.jpg
        //其中upload表示访问的前缀。"file:D:/springbootUpload/"是文件真实的存储路径
        registry.addResourceHandler("/upload/**").addResourceLocations("file:D:/springbootUpload/");
        
        //swagger拦截
        registry.addResourceHandler("swagger-ui.html")
        .addResourceLocations("classpath:/META-INF/resources/");
        registry.addResourceHandler("/webjars/**")
        .addResourceLocations("classpath:/META-INF/resources/webjars/");
        super.addResourceHandlers(registry);
	}
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(loginInterceptor)
		.addPathPatterns("/**")
		.excludePathPatterns("/login", "/register", "/demo", "/swagger-resources/**", "/v2/**", "/configuration/**", "/categories/**", "/systemLogs/**");
		super.addInterceptors(registry);
	}
}

