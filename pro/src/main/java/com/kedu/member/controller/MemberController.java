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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.WebUtils;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.kedu.house.dto.PageMaker;
import com.kedu.house.dto.SearchCriteria;
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
		
		
		return "redirect:/house/list";
				
	}
	
//	회원정보 수정 페이지 이동
	@RequestMapping(value="/modify",method=RequestMethod.GET)
	public void memberModifyGET(HttpSession session, Model model)throws Exception{
		if(session.getAttribute("loginMember") != null){
			MemberDto memberDto = (MemberDto)session.getAttribute("loginMember");
			
			if(memberDto.getMmanyn() == 0 || memberDto.getMmanyn() == 1){
//			회원정보 select
				memberDto = service.selectMember(memberDto);
				String email = memberDto.getMemail();
				int index = email.indexOf('@');
				memberDto.setFirstmemail(email.substring(0, index));
				memberDto.setSecondmemail(email.substring(index));
				
				model.addAttribute("memberDto", memberDto);			
			}
		}
		
	}
//	회원정보수정
	@RequestMapping(value="/modify",method=RequestMethod.POST)
	public String memberModifyPOST(MemberDto member,Model model)throws Exception{
		
		member.setMemail(member.getFirstmemail() + member.getSecondmemail());
		
		System.out.println(member);
		
//		회원정보 update
		service.update(member);
		
		return "redirect:/house/list";
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
	public String loginPOST(MemberDto member, HttpSession session,  RedirectAttributes rttr) throws Exception {

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
			url = "redirect:/house/list";
		} else if (member.getMmanyn() == 4){
			
			mid = new StringBuilder();
			
			mail = member.getMemail();
			
			mid.append(mail.substring(0, mail.indexOf('@')));
			mid.append("(google)");
			
			member.setMid(mid.toString());
			
			session.setAttribute("loginMember", member);

			url = "redirect:/house/list";
		} else{
			
			int check = service.logincheck(member);
			
			System.out.println(check);
			
			if(check == 1){
				member = service.login(member);
				
//				보안을 위해 세션에 암호값 제거
				member.setMpw("");
				
				session.setAttribute("loginMember", member);
								
				url = "redirect:/house/list";
			}else{
				
				rttr.addFlashAttribute("fallmsg", "fallmsg");
				
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
	@ResponseBody
	public void logout(HttpServletRequest request, 
		HttpServletResponse response, HttpSession session) throws Exception {

		Object obj = session.getAttribute("loginMember");

		if (obj != null) {
			session.removeAttribute("loginMember");
	  		session.invalidate();
	  	}
		
  	}

	@RequestMapping(value="/jjim", method = RequestMethod.GET)
	public void Jjim(@RequestParam(value="mid")String mid
				   , @RequestParam(value="hno")int hno
				   , HttpServletResponse response)throws Exception{
		int result;
		
		result = service.Jjim(mid, hno);
		
		ObjectMapper mapper = new ObjectMapper();
		
		response.getWriter().print(mapper.writeValueAsString(result));
	}
	
	@RequestMapping(value="/myPage", method = RequestMethod.GET)
	public void myPage(@ModelAttribute("cri") SearchCriteria cri
					 , Model model
					 , HttpSession session)throws Exception{
		String mid = null;
		
		mid = ((MemberDto)session.getAttribute("loginMember")).getMid();
		
		model.addAttribute("list", service.JjimList(mid));
	}
		
	@RequestMapping(value="/myjjim", method = RequestMethod.GET)
	public void myJjim(@ModelAttribute("cri") SearchCriteria cri
 			 , Model model
 			 , HttpSession session) throws Exception{

	    
		MemberDto memberDto = (MemberDto)session.getAttribute("loginMember");
		
		if(memberDto != null){
			model.addAttribute("list", service.JjimList(memberDto.getMid()));
		
		    PageMaker pageMaker = new PageMaker();
		    pageMaker.setCri(cri);
	
		    pageMaker.setTotalCount(service.JjimListCheck(cri, memberDto.getMid()));
	
		    model.addAttribute("pageMaker", pageMaker);
		}
		
	}
}
