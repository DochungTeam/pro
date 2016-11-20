package com.kedu.board.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kedu.board.dto.BoardCriteria;
import com.kedu.board.dto.BoardReplyDto;

@Repository
public class BoardReplyDaoImpl implements BoardReplyDao {
	
	@Inject
	private SqlSession session;
	
	private static String namespace = "com.kedu.mapper.BoardReplyMapper";
	
	@Override
	public List<BoardReplyDto> list(int bno) throws Exception {
		return session.selectList(namespace + ".list", bno);
	}
	
	@Override
	public void create(BoardReplyDto dto) throws Exception {
		session.insert(namespace + ".create", dto);
	}
	
	@Override
	public void update(BoardReplyDto dto) throws Exception {
		session.update(namespace + ".update", dto);
	}
	
	@Override
	public void delete(int rno) throws Exception {
		session.delete(namespace + ".delete", rno);
	}
	
	@Override
	public List<BoardReplyDto> listPage(int bno, BoardCriteria cri) throws Exception {
		
		Map<String, Object> paramMap = new HashMap<>();
		
		paramMap.put("bno", bno);
		paramMap.put("cri", cri);
		
		return session.selectList(namespace + ".listPage", paramMap);
	}
	
	@Override
	public int count(int bno) throws Exception {
		return session.selectOne(namespace + ".count", bno);
	}
	
	@Override
	public int getBno(int rno) throws Exception {
		return session.selectOne(namespace + ".getBno", rno);
	}

}
