package com.kedu.house.service;

import java.util.List;

import com.kedu.house.dto.SearchCriteria;
import com.kedu.house.dto.HouseDto;
import com.kedu.house.dto.Criteria;

public interface HouseService {
	public List<HouseDto> listAll()throws Exception;
	
	public void insertHouse(HouseDto house)throws Exception;
	
	  public List<HouseDto> listCriteria(Criteria cri) throws Exception;

	  public int listCountCriteria(Criteria cri) throws Exception;

	  public List<HouseDto> listSearchCriteria(SearchCriteria cri) 
	      throws Exception;

	  public int listSearchCount(SearchCriteria cri) throws Exception;
	  
	  public List<String> getAttach(Integer hno)throws Exception;
	  
	  public HouseDto read(Integer hno) throws Exception;
	  
	  public void modify(HouseDto house) throws Exception;

	  public void remove(Integer hno) throws Exception;
	  
	  public void list(HouseDto house) throws Exception;

	}
	
//	public List<HouseDto> searchHouse(String keyword,int display,int start)throws Exception;

