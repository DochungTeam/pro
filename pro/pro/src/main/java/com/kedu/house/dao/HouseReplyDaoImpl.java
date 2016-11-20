package com.kedu.house.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kedu.house.dto.Criteria;
import com.kedu.house.dto.HouseReplyDto;

@Repository
public class HouseReplyDaoImpl implements HouseReplyDao {

	@Inject
	private SqlSession session;
	
	private static String namespace = "com.kedu.mapper.HouseReplyMapper";
	
	@Override
	public List<HouseReplyDto> list(int hno) throws Exception {
		return session.selectList(namespace + ".list", hno);
	}
	
	@Override
	public void create(HouseReplyDto dto) throws Exception {
		session.insert(namespace + ".create", dto);
	}
	
	@Override
	public void update(HouseReplyDto dto) throws Exception {
		session.update(namespace + ".update", dto);
	}
	
	@Override
	public void delete(int hrno) throws Exception {
		session.delete(namespace + ".delete", hrno);
	}
	
	@Override
	public List<HouseReplyDto> listPage(int hno, Criteria cri) throws Exception {
		
		Map<String, Object> paramMap = new HashMap<>();
		
		paramMap.put("hno", hno);
		paramMap.put("cri", cri);
		
		return session.selectList(namespace + ".listPage", paramMap);
	}
	
	@Override
	public int count(int hno) throws Exception {
		return session.selectOne(namespace + ".count", hno);
	}
	
	@Override
	public int getHno(int hrno) throws Exception {
		return session.selectOne(namespace + ".getHno", hrno);
	}

}
