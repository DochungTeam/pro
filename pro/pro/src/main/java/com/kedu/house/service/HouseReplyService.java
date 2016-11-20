package com.kedu.house.service;

import java.util.List;

import com.kedu.house.dto.Criteria;
import com.kedu.house.dto.HouseReplyDto;


public interface HouseReplyService {
	
	public void addReply(HouseReplyDto dtd) throws Exception;
	
	public List<HouseReplyDto> listReply(int hno) throws Exception;
	
	public void modifyReply(HouseReplyDto dto) throws Exception;
	
	public void removeReply(int hrno) throws Exception;
	
	public List<HouseReplyDto> listReplyPage(int hno, Criteria cri) throws Exception;
	
	public int count(int hno) throws Exception;

}
