package com.kedu.member.dao;

import java.util.Date;

import com.kedu.member.dto.LoginDto;
import com.kedu.member.dto.MemberDto;

public interface MemberDao {
	
	public MemberDto login(LoginDto dto)throws Exception;

	public MemberDto checkMemberWithSessionKey(String value);
	
	public void insert(MemberDto dto) throws Exception;
	
	public int confrim(MemberDto dto) throws Exception;
	
	public void mailConfrim(MemberDto dto) throws Exception;
	
	public int idcheck(MemberDto dto) throws Exception;
}



