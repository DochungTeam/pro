package com.kedu.member.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kedu.house.dto.HouseDto;
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
	public void update(MemberDto dto) throws Exception {
		
		session.update(namespace + ".memberUpdate", dto);		
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
	
	@Override
	public void regiJjim(int hno, String mid) throws Exception {
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		
		paramMap.put("hno", hno);
		paramMap.put("mid", mid);
		
		session.insert(namespace+".regiJjim", paramMap);
	}

	@Override
	public void delJjim(int hno, String mid) throws Exception {
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		
		paramMap.put("hno", hno);
		paramMap.put("mid", mid);
		
		session.delete(namespace+".delJjim", paramMap);
	}

	@Override
	public List<HouseDto> JjimList(String mid) throws Exception {
		
		List<HouseDto> list =session.selectList(namespace+".JjimList", mid);
		
		return list;
	}

	@Override
	public int Jjimchk(String mid, int hno) throws Exception {
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		
		paramMap.put("mid", mid);
		paramMap.put("hno", hno);
		
		int result = session.selectOne(namespace+".Jjimchk",paramMap );
		
		return result;
	}
	
	@Override
	public MemberDto selectMember(MemberDto dto) {
		return session.selectOne(namespace+".selectMember", dto);
	}
	
}
