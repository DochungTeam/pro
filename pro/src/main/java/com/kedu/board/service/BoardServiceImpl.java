package com.kedu.board.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kedu.board.dao.BoardDao;
import com.kedu.board.dto.BoardCriteria;
import com.kedu.board.dto.BoardDto;
import com.kedu.board.dto.BoardSearchCriteria;

@Service
public class BoardServiceImpl implements BoardService {

	@Inject
	private BoardDao dao;
	
	@Override
	public void regist(BoardDto board) throws Exception {
		dao.create(board);
	}
	
	@Override
	public BoardDto read(int bno) throws Exception {
		return dao.read(bno);
	}
	
	@Override
	public void modify(BoardDto board) throws Exception {
		dao.update(board);
	}
	
	@Override
	public void remove(int bno) throws Exception {
		dao.delete(bno);
	}
	
	@Override
	public List<BoardDto> listAll() throws Exception {
		return dao.listAll();
	}
	
	@Override
	public List<BoardDto> listCriteria(BoardCriteria cri) throws Exception {
		return dao.listCriteria(cri);
	}
	
	@Override
	public int listCountCriteria(BoardCriteria cri) throws Exception {
		return dao.countPaging(cri);
	}
	
	@Override
	public List<BoardDto> listSearchCriteria(BoardSearchCriteria cri) throws Exception {
		return dao.listSearch(cri);
	}
	
	@Override
	public int listSearchCount(BoardSearchCriteria cri) throws Exception {
		return dao.listSearchCount(cri);
	}
}
