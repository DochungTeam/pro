package com.kedu.member.service;

import java.util.Date;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kedu.member.dao.MemberDao;
import com.kedu.member.dto.LoginDto;
import com.kedu.member.dto.MemberDto;

@Service
public class MemberServiceImpl implements MemberService {

	@Inject
	private MemberDao dao;

	@Override
	public MemberDto login(MemberDto member) throws Exception {

		return dao.login(member);
	}
  

	@Override
	public MemberDto checkLoginBefore(String value) {
		return dao.checkMemberWithSessionKey(value);
	}
  
	@Override
	public void insert(MemberDto member) throws Exception {
		dao.insert(member);
	}
	
	@Override
	public int confrim(MemberDto member) throws Exception {
		return dao.confrim(member);
	}
	
	@Override
	public void mailConfrim(MemberDto member) throws Exception {
		dao.mailConfrim(member);				
	}

	@Override
	public int idcheck(MemberDto member) throws Exception {
		return dao.idcheck(member);
	}
	
	@Override
	public int logincheck(MemberDto member) throws Exception {
		return dao.logincheck(member);
	}
	
}
