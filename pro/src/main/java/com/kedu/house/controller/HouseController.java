package com.kedu.house.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kedu.house.dto.SearchCriteria;
import com.kedu.house.dto.HouseDto;
import com.kedu.house.service.HouseService;

@Controller
@RequestMapping("/house/*")
public class HouseController {
	private static final Logger logger= LoggerFactory.getLogger(HouseController.class);
	
	@Inject
	private HouseService service;
	
	@RequestMapping(value="/houseList",method=RequestMethod.GET)
	public void listAll(Model model)throws Exception{
		logger.info("listAll!!");
		
		model.addAttribute("list",service.listAll());
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
	
	  @RequestMapping(value="/list",method=RequestMethod.GET)
		public void listman(Model model)throws Exception{
		
		}
	  
	  @RequestMapping(value = "/readHouse", method = RequestMethod.GET)
	  public void read(@RequestParam("hno") int hno, @ModelAttribute("cri") SearchCriteria cri, Model model)
	      throws Exception {

	    model.addAttribute(service.read(hno));
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
