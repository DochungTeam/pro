package com.kedu.board.dao;

import java.util.List;

import com.kedu.board.dto.BoardCriteria;
import com.kedu.board.dto.BoardReplyDto;

public interface BoardReplyDao {

	public List<BoardReplyDto> list(int bno) throws Exception;
	
	public void create(BoardReplyDto dto) throws Exception;
	
	public void update(BoardReplyDto dto) throws Exception;
	
	public void delete(int rno) throws Exception;
	
	public List<BoardReplyDto> listPage(int bno, BoardCriteria cri) throws Exception;
	
	public int count(int bno) throws Exception;
	
	public int getBno(int rno) throws Exception;
	
}
