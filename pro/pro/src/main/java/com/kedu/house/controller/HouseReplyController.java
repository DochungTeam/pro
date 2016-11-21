package com.kedu.house.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.kedu.house.dto.Criteria;
import com.kedu.house.dto.PageMaker;
import com.kedu.house.dto.HouseReplyDto;
import com.kedu.house.service.HouseReplyService;

@RestController
@RequestMapping("/hreply")
public class HouseReplyController {
	
	@Inject
	private HouseReplyService service;
	
	@RequestMapping(value = "/", method = RequestMethod.POST)
	public ResponseEntity<String> register(@RequestBody HouseReplyDto dto) {
		
		ResponseEntity<String> entity = null;
		try {
			service.addReply(dto);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	@RequestMapping(value = "/all/{hno}", method = RequestMethod.GET)
	public ResponseEntity<List<HouseReplyDto>> list (@PathVariable("hno") int hno) {
		
		ResponseEntity<List<HouseReplyDto>> entity = null;
		try {
			entity = new ResponseEntity<>(service.listReply(hno), HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	@RequestMapping(value = "/{hrno}", method = {RequestMethod.PUT, RequestMethod.PATCH})
	public ResponseEntity<String> update(@PathVariable("hrno") int hrno, @RequestBody HouseReplyDto dto) {
		
		ResponseEntity<String> entity = null;
		try {
			dto.setHrno(hrno);
			service.modifyReply(dto);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	@RequestMapping(value = "/{hrno}", method = RequestMethod.DELETE)
	public ResponseEntity<String> remove(@PathVariable("hrno") int hrno) {
		
		ResponseEntity<String> entity = null;
		try {
			service.removeReply(hrno);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	@RequestMapping(value = "/{hno}/{page}", method = RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> listPage(@PathVariable("hno") int hno, @PathVariable("page") int page) {
		
		ResponseEntity<Map<String, Object>> entity = null;
		
		try {
			Criteria cri = new Criteria();
			cri.setPage(page);
			
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			
			Map<String, Object> map = new HashMap<String, Object>();
			List<HouseReplyDto> list = service.listReplyPage(hno, cri);
			
			map.put("list", list);
			
			int replyCount = service.count(hno);
			pageMaker.setTotalCount(replyCount);
			
			map.put("pageMaker", pageMaker);
			
			entity = new ResponseEntity<Map<String,Object>>(map, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<Map<String,Object>>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

}