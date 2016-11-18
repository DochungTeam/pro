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
	  
	  public List<HouseDto> listSearch(SearchCriteria cri, String mid)throws Exception;
	  
	  public int listSearchCount(SearchCriteria cri)throws Exception;
	  
	  public List<String> getAttach(Integer hno)throws Exception;
	  
	  public HouseDto read(Integer hno) throws Exception;
	  
	  public void updateReplyCnt(Integer hno, int amount)throws Exception;

	  public void updateViewCnt(Integer hno)throws Exception;
	  
	  public void deleteAttach(Integer hno)throws Exception;
	  
	  public void replaceAttach(String fullName, Integer hno)throws Exception;
	  
	  public void update(HouseDto dto) throws Exception;
	  
	  public void delete(Integer hno) throws Exception;
	  
	  public void list(HouseDto dto) throws Exception;
	  
	  public List<HouseDto> nonMemberList(SearchCriteria cri)throws Exception;
	  
	  public void imageUpdate(String fullName, Integer hno);
	  
	  public void updateRcount(int hno, int amount) throws Exception;
	  
	  public int countReplyPaging(int hno) throws Exception;
}
