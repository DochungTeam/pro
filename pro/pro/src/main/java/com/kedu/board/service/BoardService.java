package com.kedu.board.service;

import java.util.List;

import com.kedu.board.dto.BoardDto;
import com.kedu.board.dto.BoardSearchCriteria;
import com.kedu.board.dto.BoardCriteria;

public interface BoardService {

	public void regist(BoardDto board) throws Exception;
	
	public BoardDto read(int bno) throws Exception;
	
	public void modify(BoardDto board) throws Exception;
	
	public void remove(int bno) throws Exception;
	
	public List<BoardDto> listAll() throws Exception;
	
	public List<BoardDto> listCriteria(BoardCriteria cri) throws Exception;
	
	public int listCountCriteria(BoardCriteria cri) throws Exception;
	
	public int listCountReply(int bno) throws Exception;
	
	public List<BoardDto> listSearchCriteria(BoardSearchCriteria cri) throws Exception;
	
	public int listSearchCount(BoardSearchCriteria cri) throws Exception;
	
	public List<BoardDto> listNotice() throws Exception;
}
