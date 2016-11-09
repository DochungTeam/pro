package com.kedu.board.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kedu.board.dto.BoardDto;
import com.kedu.board.dto.BoardSearchCriteria;
import com.kedu.board.dto.BoardCriteria;

@Repository
public class BoardDaoImpl implements BoardDao {

	@Inject
	private SqlSession session;
	
	private static String namespace = "com.kedu.mapper.BoardMapper";
	
	@Override
	public void create(BoardDto dto) throws Exception {
		session.insert(namespace + ".create", dto);
	}
	
	@Override
	public BoardDto read(int bno) throws Exception {
		return session.selectOne(namespace + ".read", bno);
	}
	
	@Override
	public void update(BoardDto dto) throws Exception {
		session.update(namespace + ".update", dto);
	}
	
	@Override
	public void delete(int bno) throws Exception {
		session.delete(namespace + ".delete", bno);
	}
	
	@Override
	public List<BoardDto> listAll() throws Exception {
		return session.selectList(namespace + ".listAll");
	}
	
	@Override
	public List<BoardDto> listPage(int page) throws Exception {

		if(page <= 0) {
			page = 1;
		}
		page = (page - 1) * 10;
		
		return session.selectList(namespace + ".listPage", page);
	}
	
	@Override
	public List<BoardDto> listCriteria(BoardCriteria cri) throws Exception {
		return session.selectList(namespace + ".listCriteria", cri);
	}
	
	@Override
	public int countPaging(BoardCriteria cri) throws Exception {
		return session.selectOne(namespace + ".countPaging", cri);
	}
	
	@Override
	public List<BoardDto> listSearch(BoardSearchCriteria cri) throws Exception {
		return session.selectList(namespace + ".listSearch", cri);
	}
	
	@Override
	public int listSearchCount(BoardSearchCriteria cri) throws Exception {
		return session.selectOne(namespace + ".listSearchCount", cri);
	}
}
