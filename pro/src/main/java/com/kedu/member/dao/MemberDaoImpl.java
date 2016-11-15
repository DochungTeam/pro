package com.kedu.member.dao;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kedu.member.dto.LoginDto;
import com.kedu.member.dto.MemberDto;

@Repository
public class MemberDaoImpl implements MemberDao {
	
	@Inject
	
	private SqlSession session;
	
	private static String namespace ="com.kedu.mapper.MemberMapper";	

	@Override
	public MemberDto login(MemberDto dto) throws Exception {
		
		return session.selectOne(namespace +".login", dto);
	}
	
	@Override
	public MemberDto checkMemberWithSessionKey(String value) {

		return session.selectOne(namespace +".checkMemberWithSessionKey", value);
	}
  
	@Override
	public void insert(MemberDto dto) throws Exception {
		
		session.insert(namespace + ".memberInsert", dto);
	}
	
	@Override
	public int confrim(MemberDto dto) throws Exception {
		return session.selectOne(namespace + ".confirm", dto);
	}
	
	@Override
	public void mailConfrim(MemberDto dto) throws Exception {
		
		session.update(namespace + ".mailConfrim", dto);
	}
	
	@Override
	public int idcheck(MemberDto dto) throws Exception {
		return session.selectOne(namespace + ".idcheck", dto);
	}
	
	@Override
	public int logincheck(MemberDto dto) throws Exception {
		return session.selectOne(namespace + ".logincheck", dto);
	}
	
}
