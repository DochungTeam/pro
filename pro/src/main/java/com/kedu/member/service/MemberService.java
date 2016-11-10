package com.kedu.member.service;

import java.util.Date;

import com.kedu.member.dto.LoginDto;
import com.kedu.member.dto.MemberDto;

public interface MemberService {

  public MemberDto login(LoginDto dto) throws Exception;
  
  public MemberDto checkLoginBefore(String value);  
  
  public void insert(MemberDto member) throws Exception;
  
}
