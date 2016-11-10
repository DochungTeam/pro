package com.kedu.member.controller;

import java.util.Date;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.util.WebUtils;

import com.kedu.member.dto.LoginDto;
import com.kedu.member.dto.MemberDto;
import com.kedu.member.service.MemberService;

@Controller
@RequestMapping("/member/*")
public class MemberController {

	@Inject
	private MemberService service;

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public void loginGET(@ModelAttribute("dto") LoginDto dto) {

	}
  
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
  
  
	@RequestMapping(value="/input",method=RequestMethod.GET)
	public void memberInputGET(Model model)throws Exception{
		logger.info("회원가입창");
	}

	@RequestMapping(value="/input",method=RequestMethod.POST)
	public void memberInputPOST(MemberDto member,Model model)throws Exception{
		logger.info("회원가입처리");
		
		UUID muuid = UUID.randomUUID();
		
		
		member.setMemail(member.getFirstmemail() + member.getSecondmemail());
		member.setMuuid(muuid.toString());
		
		service.insert(member);
		
		
		
		
	}
	

	@RequestMapping(value="/main",method=RequestMethod.GET)
	public void memberL(Model model)throws Exception{
	
	}
	
	@RequestMapping(value="/face",method=RequestMethod.GET)
	public void memberF(Model model)throws Exception{
	}
  


	@RequestMapping(value = "/loginPost", method = RequestMethod.POST)
	public void loginPOST(LoginDto dto, HttpSession session, Model model) throws Exception {

		MemberDto vo = service.login(dto);

		if (vo == null) {
			return;
		}

		model.addAttribute("memberDto", vo);

		if (dto.ismCookie()) {

			int amount = 60 * 60 * 24 * 7;

			Date sessionLimit = new Date(System.currentTimeMillis() + (1000 * amount));

		}

	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public void logout(HttpServletRequest request, 
		HttpServletResponse response, HttpSession session) throws Exception {

		Object obj = session.getAttribute("login");

		if (obj != null) {
			
			MemberDto dto = (MemberDto) obj;

			session.removeAttribute("login");
	  		session.invalidate();

	  		Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");

	  		if (loginCookie != null) {
	  			loginCookie.setPath("/");
	  			loginCookie.setMaxAge(0);
	  			response.addCookie(loginCookie);
	  		}
	  	}
  	}

}
