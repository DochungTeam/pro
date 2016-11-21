package com.kedu.member.interceptor;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;

import com.kedu.member.dto.MemberDto;
import com.kedu.member.service.MemberService;

public class AuthInterceptor extends HandlerInterceptorAdapter {

  private static final Logger logger = LoggerFactory.getLogger(AuthInterceptor.class);
  
  @Inject
  private MemberService service;
  
  @Override
  public boolean preHandle(HttpServletRequest request,
      HttpServletResponse response, Object handler) throws Exception {
    
    HttpSession session = request.getSession();   


    if(session.getAttribute("login") == null){
    
      logger.info("current member is not logined");
      
      saveDest(request);
      
      Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
      
      if(loginCookie != null) { 
        
        MemberDto memberDto = service.checkLoginBefore(loginCookie.getValue());
        
        logger.info("MemberDto: " + memberDto);
        
        if(memberDto != null){
          session.setAttribute("login", memberDto);
          return true;
        }
        
      }

      response.sendRedirect("/member/login");
      return false;
    }
    return true;
  }  
  

  private void saveDest(HttpServletRequest req) {

    String uri = req.getRequestURI();

    String query = req.getQueryString();

    if (query == null || query.equals("null")) {
      query = "";
    } else {
      query = "?" + query;
    }

    if (req.getMethod().equals("GET")) {
      logger.info("dest: " + (uri + query));
      req.getSession().setAttribute("dest", uri + query);
    }
  }
}
