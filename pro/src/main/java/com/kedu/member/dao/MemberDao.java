package com.kedu.member.dao;

import java.util.List;

import com.kedu.house.dto.HouseDto;
import com.kedu.house.dto.SearchCriteria;
import com.kedu.member.dto.MemberDto;

public interface MemberDao {
	
	public MemberDto login(MemberDto dto)throws Exception;

	public MemberDto checkMemberWithSessionKey(String value);
	
	public void insert(MemberDto dto) throws Exception;
	
	public void update(MemberDto dto) throws Exception;
	
	public int confrim(MemberDto dto) throws Exception;
	
	public void mailConfrim(MemberDto dto) throws Exception;
	
	public int idcheck(MemberDto dto) throws Exception;
	
	public int logincheck(MemberDto dto) throws Exception;
	
	public void regiJjim(int hno, String mid)throws Exception;
	  
	public void delJjim(int hno, String mid)throws Exception;
	
	public List<HouseDto> JjimList(String mid , int hno)throws Exception;
	
	public int Jjimchk(String mid, int hno)throws Exception;
	
	public MemberDto selectMember(MemberDto dto);
	
	public List<HouseDto> JjimList(String mid) throws Exception;
	
	public int JjimListcheck(SearchCriteria cri, String mid) throws Exception;
	
}



