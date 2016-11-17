package com.kedu.board.dao;

import java.util.List;

import com.kedu.board.dto.BoardDto;
import com.kedu.board.dto.BoardSearchCriteria;
import com.kedu.board.dto.BoardCriteria;

public interface BoardDao {

	public void create(BoardDto dto) throws Exception;
	
	public BoardDto read(int bno) throws Exception;
	
	public void update(BoardDto dto) throws Exception;
	
	public void delete(int bno) throws Exception;
	
	public List<BoardDto> listAll() throws Exception;
	
	public List<BoardDto> listPage(int page) throws Exception;
	
	public List<BoardDto> listCriteria(BoardCriteria cri) throws Exception;
	
	public int countPaging(BoardCriteria cri) throws Exception;

	public int countReplyPaging(int bno) throws Exception;
	
	public List<BoardDto> listSearch(BoardSearchCriteria cri) throws Exception;
	
	public int listSearchCount(BoardSearchCriteria cri) throws Exception;
	
	public void updateRcount(int bno, int amount) throws Exception;
	
	public void updateBcount(int bno) throws Exception;
	
	public List<BoardDto> listNotice() throws Exception;
}
