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
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.WebUtils;

import com.kedu.member.dto.EmailDto;
import com.kedu.member.dto.EmailSender;
import com.kedu.member.dto.LoginDto;
import com.kedu.member.dto.MemberDto;
import com.kedu.member.service.MemberService;

@Controller
@RequestMapping("/member/*")
public class MemberController {
	
	@Inject
	private MemberService service;
	
	@Autowired
	private EmailSender emailSender;
	@Autowired
	private EmailDto email;
	

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public void loginGET(@ModelAttribute("dto") LoginDto dto) {

	}
  
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
  
  
//	회원가입 창으로 이동
	@RequestMapping(value="/input",method=RequestMethod.GET)
	public void memberInputGET(Model model)throws Exception{
		logger.info("회원가입창");
	}

//	회원가입처리
	@RequestMapping(value="/input",method=RequestMethod.POST)
	public String memberInputPOST(MemberDto member,Model model)throws Exception{
		logger.info("회원가입처리");
		
//		메일 인증을 위한 유일값 랜덤 생성.
		UUID muuid = UUID.randomUUID();

		
		
		member.setMemail(member.getFirstmemail() + member.getSecondmemail());
		member.setMuuid(muuid.toString());
		
//		회원정보 insert
		service.insert(member);
		
//		회원가입 후 메일 전송
//		메일 작성
		email.setContent("http://projecy.mooo.com:8080/member/confirm?muuid="+muuid.toString()+"&mid="+member.getMid()+" 이 링크를 클릭해 인증을 완료해주세요.");
		email.setReceiver(member.getMemail());
		email.setSubject(member.getMnm()+"님 회원 가입을 축하합니다!");
		
//		작성한 메일 전송
		emailSender.SendEmail(email);
		
		
		return "redirect:/member/main";
				
	}
	

//	메일 인증 처리
	@RequestMapping(value="/confirm",method=RequestMethod.GET)
	public void confirm (@RequestParam("muuid") String muuid, @RequestParam("mid") String mid, Model model)throws Exception{
		
		MemberDto member = new MemberDto();
		
		member.setMid(mid);
		member.setMuuid(muuid);
		
		int con = service.confrim(member);
		
		if(con==1){
			service.mailConfrim(member);
			model.addAttribute("msg", "SUCCESS");			
		}else{
			model.addAttribute("msg", "FALL");
		}
		
	}
	
	@RequestMapping(value="/main",method=RequestMethod.GET)
	public void memberL(Model model)throws Exception{
	
	}
	
	@RequestMapping(value="/face",method=RequestMethod.GET)
	public void memberF(Model model)throws Exception{
	}
  
	
	@RequestMapping(value="/idcheck", method=RequestMethod.POST)
	@ResponseBody
	public String idcheck(@RequestBody MemberDto member) throws Exception{
		
		String result = null;
		
		int check = service.idcheck(member);
		
		if(check==0){
			result = "SUCCESS";
		}else{
			result = "FALL";
		}
		
		return result;
		
	}


	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String loginPOST(MemberDto member, HttpSession session, Model model) throws Exception {

		String url = "";
		String mail = "";
		StringBuilder mid = null;
				
		System.out.println(member);
				
		if(member.getMmanyn() == 3){
			
			mid = new StringBuilder();
			
			mail = member.getMemail();
			
			System.out.println(mail.indexOf('@'));
			System.out.println(mail.substring(0, mail.indexOf('@')));
			
			mid.append(mail.substring(0, mail.indexOf('@')));
			mid.append("(facebook)");
			
			member.setMid(mid.toString());
		
			session.setAttribute("loginMember", member);
			model.addAttribute("msg", "방문을 환영합니다 "+member.getMnm()+"님!");
			url = "redirect:/member/main";
		} else if (member.getMmanyn() == 4){
			
			mid = new StringBuilder();
			
			mail = member.getMemail();
			
			mid.append(mail.substring(0, mail.indexOf('@')));
			mid.append("(google)");
			
			member.setMid(mid.toString());
			
			session.setAttribute("loginMember", member);

			model.addAttribute("msg", "방문을 환영합니다 "+member.getMnm()+"님!");
			url = "redirect:/member/main";
		} else{
			
			int check = service.logincheck(member);
			
			System.out.println(check);
			
			if(check == 1){
				member = service.login(member);
				
				session.setAttribute("loginMember", member);
								
				model.addAttribute("msg", "방문을 환영합니다 "+member.getMnm()+"님!");
				url = "redirect:/member/main";
			}else{
				model.addAttribute("msg", "로그인에 실패하셨습니다.");
				url = "redirect:/member/login";
			}
		}
		
		return url;
		
		/*
		MemberDto memberDto = service.login(loginDto);

		if (memberDto == null) {
			return;
		}

		model.addAttribute("memberDto", memberDto);
		
		if (loginDto.ismCookie()) {

			int amount = 60 * 60 * 24 * 7;

			Date sessionLimit = new Date(System.currentTimeMillis() + (1000 * amount));

		}
		*/

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
