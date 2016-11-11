package com.kedu.board.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kedu.board.dao.BoardReplyDao;
import com.kedu.board.dto.BoardCriteria;
import com.kedu.board.dto.BoardReplyDto;

@Service
public class BoardReplyServiceImpl implements BoardReplyService {
	
	@Inject
	private BoardReplyDao dao;
	
	@Override
	public void addReply(BoardReplyDto dto) throws Exception {
		dao.create(dto);
	}
	
	@Override
	public List<BoardReplyDto> listReply(int bno) throws Exception {
		return dao.list(bno);
	}
	
	@Override
	public void modifyReply(BoardReplyDto dto) throws Exception {
		dao.update(dto);
	}
	
	public void removeReply(int rno) throws Exception {
		dao.delete(rno);
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
