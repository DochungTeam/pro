package com.kedu.house.service;

import java.util.List;

import com.kedu.house.dto.SearchCriteria;
import com.kedu.house.dto.HouseDto;
import com.kedu.house.dto.SearchAreaDto;
import com.kedu.house.dto.Criteria;

public interface HouseService {
	public List<HouseDto> listAll()throws Exception;
	
	public List<HouseDto> searchHouse(String keyword,int display,int start)throws Exception;
	
	public void insertHouse(HouseDto house)throws Exception;
	
	  public List<HouseDto> listCriteria(Criteria cri) throws Exception;

	  public int listCountCriteria(Criteria cri) throws Exception;

	  public List<HouseDto> listSearchCriteria(SearchCriteria cri, String mid) 
	      throws Exception;

	  public int listSearchCount(SearchCriteria cri) throws Exception;
	  
	  public List<String> getAttach(Integer hno)throws Exception;
	  
	  public HouseDto read(Integer hno) throws Exception;
	  
	  public void modify(HouseDto house) throws Exception;

	  public void remove(Integer hno) throws Exception;
	  
	  public void list(HouseDto house) throws Exception;
	  
	  public List<HouseDto> nonMemberList(SearchCriteria cri)throws Exception;
	  
	  public void imageUpdate(String fullName, Integer hno);
	  
	  public int listCountReply(int hno) throws Exception;
	  
	  public List<SearchAreaDto> searchSido(String sido) throws Exception;
	  
	  public List<SearchAreaDto> searchDong(String sigungu) throws Exception;
	  
	  public void insertHouseAddr(HouseDto list) throws Exception;
	}
	
//	public List<HouseDto> searchHouse(String keyword,int display,int start)throws Exception;

