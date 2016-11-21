package com.kedu.member.service;

import java.util.List;

import com.kedu.house.dto.HouseDto;
import com.kedu.house.dto.SearchCriteria;
import com.kedu.member.dto.MemberDto;

public interface MemberService {

  public MemberDto login(MemberDto member) throws Exception;
  
  public MemberDto checkLoginBefore(String value);  
  
  public void insert(MemberDto member) throws Exception;
  
  public void update(MemberDto member) throws Exception;
  
  public int confrim(MemberDto member) throws Exception;
  
  public void mailConfrim(MemberDto member) throws Exception;
  
  public int idcheck(MemberDto member) throws Exception;
  
  public int logincheck(MemberDto member) throws Exception;
  
  public int Jjim(String mid, int hno)throws Exception;
  
  public MemberDto selectMember(MemberDto member)throws Exception;
  
  public List<HouseDto> JjimList(String mid) throws Exception;
  
  public int JjimListCheck(SearchCriteria cri, String mid) throws Exception;
}
