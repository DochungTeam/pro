package com.kedu.board.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kedu.board.dao.BoardDao;
import com.kedu.board.dao.BoardReplyDao;
import com.kedu.board.dto.BoardCriteria;
import com.kedu.board.dto.BoardReplyDto;

@Service
public class BoardReplyServiceImpl implements BoardReplyService {
	
	@Inject
	private BoardReplyDao dao;
	
	@Inject
	private BoardDao boardDao;
	
	@Transactional
	@Override
	public void addReply(BoardReplyDto dto) throws Exception {
		dao.create(dto);
		boardDao.updateRcount(dto.getBno(), 1);
	}
	
	@Override
	public List<BoardReplyDto> listReply(int bno) throws Exception {
		return dao.list(bno);
	}
	
	@Override
	public void modifyReply(BoardReplyDto dto) throws Exception {
		dao.update(dto);
	}
	
	@Transactional
	@Override
	public void removeReply(int rno) throws Exception {
		int bno = dao.getBno(rno);
		dao.delete(rno);
		boardDao.updateRcount(bno, -1);
	}
	
	@Override
	public List<BoardReplyDto> listReplyPage(int bno, BoardCriteria cri) throws Exception {
		return dao.listPage(bno, cri);
	}
	
	@Override
	public int count(int bno) throws Exception {
		return dao.count(bno);
	}

}
