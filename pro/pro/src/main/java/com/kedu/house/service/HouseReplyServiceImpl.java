package com.kedu.house.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kedu.house.dao.HouseDao;
import com.kedu.house.dao.HouseReplyDao;
import com.kedu.house.dto.Criteria;
import com.kedu.house.dto.HouseReplyDto;

@Service
public class HouseReplyServiceImpl implements HouseReplyService {
	
	@Inject
	private HouseReplyDao dao;
	
	@Inject
	private HouseDao houseDao;
	
	@Transactional
	@Override
	public void addReply(HouseReplyDto dto) throws Exception {
		dao.create(dto);
		houseDao.updateRcount(dto.getHno(), 1);
	}
	
	@Override
	public List<HouseReplyDto> listReply(int hno) throws Exception {
		return dao.list(hno);
	}
	
	@Override
	public void modifyReply(HouseReplyDto dto) throws Exception {
		dao.update(dto);
	}
	
	@Transactional
	@Override
	public void removeReply(int hrno) throws Exception {
		int hno = dao.getHno(hrno);
		dao.delete(hrno);
		houseDao.updateRcount(hno, -1);
	}
	
	@Override
	public List<HouseReplyDto> listReplyPage(int hno, Criteria cri) throws Exception {
		return dao.listPage(hno, cri);
	}
	
	@Override
	public int count(int hno) throws Exception {
		return dao.count(hno);
	}

}
