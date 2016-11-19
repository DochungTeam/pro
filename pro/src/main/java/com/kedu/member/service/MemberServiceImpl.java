package com.kedu.member.service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kedu.house.dto.HouseDto;
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
	public void update(MemberDto member) throws Exception {
		dao.update(member);
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


	@Override
	public List<HouseDto> JjimList(String mid) throws Exception {
		
		return dao.JjimList(mid);
	}

	@Transactional
	@Override
	public int Jjim(String mid, int hno) throws Exception {
		int result = 0;
		
		result =  dao.Jjimchk(mid, hno);
		
		if(result ==0){
			dao.regiJjim(hno, mid);
		}else{
			dao.delJjim(hno, mid);
		}
		
		return result;
	}
	
	@Override
	public MemberDto selectMember(MemberDto member) throws Exception {
		return dao.selectMember(member);
	}
	
}
