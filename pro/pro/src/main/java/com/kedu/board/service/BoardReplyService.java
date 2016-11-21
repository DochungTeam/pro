package com.kedu.board.service;

import java.util.List;

import com.kedu.board.dto.BoardCriteria;
import com.kedu.board.dto.BoardReplyDto;

public interface BoardReplyService {
	
	public void addReply(BoardReplyDto dtd) throws Exception;
	
	public List<BoardReplyDto> listReply(int bno) throws Exception;
	
	public void modifyReply(BoardReplyDto dto) throws Exception;
	
	public void removeReply(int rno) throws Exception;
	
	public List<BoardReplyDto> listReplyPage(int bno, BoardCriteria cri) throws Exception;
	
	public int count(int bno) throws Exception;

}
