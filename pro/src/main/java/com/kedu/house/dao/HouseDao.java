package com.kedu.house.dao;

import java.util.List;

import com.kedu.house.dto.Criteria;
import com.kedu.house.dto.SearchCriteria;
import com.kedu.house.dto.HouseDto;

public interface HouseDao {
	public List<HouseDto> listAll()throws Exception;
	
	public String getTime();
	
	public void insertHouse(HouseDto dto);
	
	public void addAttach(String fullName)throws Exception;
	
	public List<HouseDto> listPage(int page) throws Exception;

	  public List<HouseDto> listCriteria(Criteria cri) throws Exception;

	  public int countPaging(Criteria cri) throws Exception;
	  
	  public List<HouseDto> listSearch(SearchCriteria cri)throws Exception;
	  
	  public int listSearchCount(SearchCriteria cri)throws Exception;
	  
	  public List<String> getAttach(Integer hno)throws Exception;
}
