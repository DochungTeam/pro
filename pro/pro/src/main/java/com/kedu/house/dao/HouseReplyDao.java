package com.kedu.house.dao;

import java.util.List;

import com.kedu.house.dto.Criteria;
import com.kedu.house.dto.HouseReplyDto;


public interface HouseReplyDao {
	
	public List<HouseReplyDto> list(int hno) throws Exception;
	
	public void create(HouseReplyDto dto) throws Exception;
	
	public void update(HouseReplyDto dto) throws Exception;
	
	public void delete(int hrno) throws Exception;
	
	public List<HouseReplyDto> listPage(int hno, Criteria cri) throws Exception;
	
	public int count(int hno) throws Exception;
	
	public int getHno(int hrno) throws Exception;
	
}

