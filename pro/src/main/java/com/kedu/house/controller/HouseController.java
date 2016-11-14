package com.kedu.house.controller;

import java.io.InputStream;
import java.net.URL;
import java.net.URLDecoder;

import javax.inject.Inject;
import javax.lang.model.element.Element;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kedu.house.dto.HouseDto;
import com.kedu.house.service.HouseService;

@Controller
@RequestMapping("/house/*")
public class HouseController {
	private static final Logger logger= LoggerFactory.getLogger(HouseController.class);
	
	@Inject
	private HouseService service;
	
/*	@RequestMapping(value="/houseList",method=RequestMethod.GET)
	public void listAll(Model model)throws Exception{
		logger.info("listAll!!");
		
		model.addAttribute("list",service.listAll());
	}*/
	
	@RequestMapping(value="/houseList",method=RequestMethod.GET)
	public void houseList(@RequestParam(required=false)String keyword,Model model) throws Exception{
		logger.info(keyword);
		if(keyword!=null){
			model.addAttribute("list",service.searchHouse(keyword, 10, 1));
			System.out.println(keyword);

			model.addAttribute("list1",service.searchImage(keyword, 3, 1));
			System.out.println(keyword);

			logger.info(keyword);
		}
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

	@RequestMapping(value="/houseRead",method=RequestMethod.GET)
	public void houseRead(@RequestParam(required=false)String keyword,Model model) throws Exception{
		logger.info(keyword);
		if(keyword!=null){
			model.addAttribute("list",service.searchHouse(keyword, 10, 1));
			
			logger.info(keyword);
		}
	}
	
	
}
