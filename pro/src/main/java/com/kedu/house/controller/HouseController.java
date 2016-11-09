package com.kedu.house.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kedu.house.dto.PageMaker;
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

	    return "redirect:/house/houseList";
	  }
	
	  @RequestMapping(value = "/list", method = RequestMethod.GET)
	  public void listPage(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {

	    logger.info(cri.toString());

	    model.addAttribute("list", service.listSearchCriteria(cri));

	    PageMaker pageMaker = new PageMaker();
	    pageMaker.setCri(cri);

	    pageMaker.setTotalCount(service.listSearchCount(cri));

	    model.addAttribute("pageMaker", pageMaker);
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
