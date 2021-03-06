package com.kedu.house.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kedu.house.dto.SearchCriteria;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.kedu.house.dto.HouseDto;
import com.kedu.house.dto.PageMaker;
import com.kedu.house.dto.SearchAreaDto;
import com.kedu.house.service.HouseReplyService;
import com.kedu.house.service.HouseService;
import com.kedu.member.dto.MemberDto;

@Controller
@RequestMapping("/house/*")
public class HouseController {
	private static final Logger logger= LoggerFactory.getLogger(HouseController.class);
	
	@Inject
	private HouseService service;
	
	@Inject
	private HouseReplyService replyService;
	
	@RequestMapping(value="/houseList",method=RequestMethod.GET)
	public void houseList(@RequestParam(required=false)String keyword,Model model) throws Exception{
	/*	logger.info(keyword);
		if(keyword!=null){
			model.addAttribute("list",service.searchHouse(keyword, 10, 1));
			System.out.println(keyword);

			
			
			model.addAttribute("list1",service.searchImage(keyword, 3, 1));
			System.out.println(keyword);

			logger.info(keyword);
		}*/
	}
	
	@RequestMapping(value="/houseList",method=RequestMethod.POST)
	public void houseListPost(@RequestParam(required=false)String keyword,HttpServletResponse response){
		logger.info(keyword);
		
		ObjectMapper mapper= new ObjectMapper();
		
		List<HouseDto> dto=null;
		
		if(!keyword.isEmpty()){
			try {
				dto= service.searchHouse(keyword, 7, 1);
				response.setCharacterEncoding("UTF-8");
				response.getWriter().print(mapper.writeValueAsString(dto));
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	@RequestMapping(value="/gunguSearch", method=RequestMethod.POST)
	   public void sigungu(@RequestParam(value="sido", required=false)String sido, HttpServletResponse response)throws Exception{
	      logger.info(sido);
	      
	      ObjectMapper mapper = new ObjectMapper();
	      
	      List<SearchAreaDto> sdto = null;
	      try{
	      sdto = service.searchSido(sido);
	      response.setCharacterEncoding("utf-8");
	      response.getWriter().print(mapper.writeValueAsString(sdto));
	      }catch(Exception e){
	         e.printStackTrace();
	      }
	   }

	 @RequestMapping(value = "/dongSearch", method=RequestMethod.POST)
	   public void dong(@RequestParam(value="sigungu" ,required=false)String sigungu, HttpServletResponse response)throws Exception{
	      logger.info(sigungu);
	      
	      ObjectMapper mapper = new ObjectMapper();
	      
	      List<SearchAreaDto> sdto = null;
	      try{
	         sdto = service.searchDong(sigungu);
	         response.setCharacterEncoding("utf-8");
	         response.getWriter().print(mapper.writeValueAsString(sdto));
	      }catch(Exception e){
	         e.printStackTrace();
	      }
	   }

	
	@RequestMapping(value="/type",method=RequestMethod.GET)
	public void typeGET(Model model)throws Exception{
		List<HouseDto> dto= null;
		
		for(int i=0;i<51;i++){
			dto= service.searchHouse("강원도 한식", 100, i);
			
			for(HouseDto list:dto){
				service.insertHouseAddr(list);
			}
			dto= service.searchHouse("강원도 중식", 100, i);
			
			for(HouseDto list:dto){
				service.insertHouseAddr(list);
			}
			dto= service.searchHouse("강원도 일식", 100, i);
			

	         for(HouseDto list : dto){
	            service.insertHouse(list);
	         }
	            
	         dto = service.searchHouse("강원도양식", 100, i);
	         
	         for(HouseDto list : dto){
	            service.insertHouse(list);
	         }
	         
	         dto = service.searchHouse("강원도퓨전", 100, i);
	         
	         for(HouseDto list : dto){
	            service.insertHouse(list);
	         }
	         
	         dto = service.searchHouse("강원도디저트", 100, i);
	         
	         for(HouseDto list : dto){
	            service.insertHouse(list);
	         }
	         
	         dto = service.searchHouse("강원도분식", 100, i);
	         
	         for(HouseDto list : dto){
	            service.insertHouse(list);
	         }
	         
		}
		model.addAttribute("list",dto);
	}
	
	@RequestMapping(value="/insertAjax",method=RequestMethod.POST)
	 @ResponseBody
	 public List<HouseDto> insertAjax(@RequestBody String keyword)throws Exception{
		List<HouseDto> entity=null;
		 
		 try {
			entity=new ArrayList<>(service.searchHouse(keyword, 10, 1));
			logger.info(entity.toString());
		} catch (Exception e) {
		}
		System.out.println(entity.toString());
		return entity;
	 }
	
	@RequestMapping(value = "/insertHouse", method = RequestMethod.GET)
	  public void insertHouseGET() throws Exception {

	    logger.info("insertHouse get ...........");
	  }

	  @RequestMapping(value = "/insertHouse", method = RequestMethod.POST)
	  public String insertHousePOST(HouseDto house, RedirectAttributes rttr) throws Exception {

	    logger.info("insertHouse post ...........");
	    logger.info(house.toString());
	    
	    service.insertHouse(house);

	    rttr.addFlashAttribute("msg", "SUCCESS");

	    return "redirect:/house/list";
	  }
	
//	  @RequestMapping(value="/list",method=RequestMethod.GET)
//		public void listPage(Model model)throws Exception{
//		
//		}
	  
	  @RequestMapping(value = "/list", method = RequestMethod.GET)
	  public void listPage(@ModelAttribute("cri") SearchCriteria cri
			  			 , Model model
			  			 , HttpSession session) throws Exception {

	    logger.info(cri.toString());

	    String mid =null;
	    
	    if(((MemberDto)session.getAttribute("loginMember"))!=null){
	    	mid = ((MemberDto)session.getAttribute("loginMember")).getMid();
	    
	    	model.addAttribute("list", service.listSearchCriteria(cri,mid));
	    }else{
	    	model.addAttribute("list", service.nonMemberList(cri));
	    }
	    
	    
	    PageMaker pageMaker = new PageMaker();
	    pageMaker.setCri(cri);

	    pageMaker.setTotalCount(service.listSearchCount(cri));

	    model.addAttribute("pageMaker", pageMaker);
	    
	  }
	  
	  @RequestMapping(value = "/readHouse", method = RequestMethod.GET)
	  public void read(@RequestParam("hno") int hno, @ModelAttribute("cri") SearchCriteria cri, Model model)
	      throws Exception {

	    model.addAttribute(service.read(hno));
	    model.addAttribute("replyList", replyService.listReplyPage(hno, cri));
	    
	    PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		
		pageMaker.setTotalCount(service.listCountReply(hno));
		model.addAttribute("pageMaker", pageMaker);
	  }
	  
	  @RequestMapping(value = "/removePage", method = RequestMethod.POST)
	  public String remove(@RequestParam("hno") int hno, SearchCriteria cri, RedirectAttributes rttr) throws Exception {

	    service.remove(hno);

	    rttr.addAttribute("page", cri.getPage());
	    rttr.addAttribute("perPageNum", cri.getPerPageNum());
	    rttr.addAttribute("searchType", cri.getSearchType());
	    rttr.addAttribute("keyword", cri.getKeyword());

	    rttr.addFlashAttribute("msg", "SUCCESS");

	    return "redirect:/house/list";
	  }

	  @RequestMapping(value = "/modifyPage", method = RequestMethod.GET)
	  public void modifyPagingGET(int hno, @ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {

	    model.addAttribute(service.read(hno));
	  }

	  @RequestMapping(value = "/modifyPage", method = RequestMethod.POST)
	  public String modifyPagingPOST(HouseDto house, SearchCriteria cri, RedirectAttributes rttr) throws Exception {

	    logger.info(cri.toString());
	    service.modify(house);

	    rttr.addAttribute("page", cri.getPage());
	    rttr.addAttribute("perPageNum", cri.getPerPageNum());
	    rttr.addAttribute("searchType", cri.getSearchType());
	    rttr.addAttribute("keyword", cri.getKeyword());

	    rttr.addFlashAttribute("msg", "SUCCESS");

	    logger.info(rttr.toString());

	    return "redirect:/house/list";
	  }
	  
	  @RequestMapping("/getAttach/{hno}")
	  @ResponseBody
	  public List<String> getAttach(@PathVariable("hno")Integer hno)throws Exception{
	    
	    return service.getAttach(hno);
	  }
	/*
	@RequestMapping(value="/houseList",method=RequestMethod.GET)
	public void houseList(@RequestParam(required=false)String keyword,Model model) throws Exception{
		if(keyword!=null){
			model.addAttribute("list",service.searchHouse(keyword, 10, 1));
		}
	}
	*/
}
