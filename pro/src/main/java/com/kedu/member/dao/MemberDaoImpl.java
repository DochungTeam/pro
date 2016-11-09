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
	public MemberDto login(LoginDto dto) throws Exception {
		
		return session.selectOne(namespace +".login", dto);
	}
	
  @Override
  public void keepLogin(String mid, String sessionId, Date next) {

    Map<String, Object> paramMap = new HashMap<String, Object>();
    paramMap.put("mid", mid);
    paramMap.put("sessionId", sessionId);
    paramMap.put("next", next);
    
    session.update(namespace+".keepLogin", paramMap);
    
  }

  @Override
  public MemberDto checkMemberWithSessionKey(String value) {

    return session.selectOne(namespace +".checkMemberWithSessionKey", value);
  }	
}
