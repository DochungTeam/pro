package com.kedu.house.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kedu.house.dto.Criteria;
import com.kedu.house.dto.ReplyDto;
import com.kedu.house.dao.HouseDao;
import com.kedu.house.dao.ReplyDAO;

@Service
public class ReplyServiceImpl implements ReplyService {

  @Inject
  private ReplyDAO replyDAO;
  
  @Inject
  private HouseDao houseDao;

  @Transactional
  @Override
  public void addReply(ReplyDto dto) throws Exception {

    replyDAO.create(dto);
    houseDao.updateReplyCnt(dto.getHno(), 1);
  }
  
  @Transactional
  @Override
  public void removeReply(Integer rno) throws Exception {
  
    int hno = replyDAO.getHno(rno);
    replyDAO.delete(rno);
    houseDao.updateReplyCnt(hno, -1);
  }   



  @Override
  public List<ReplyDto> listReply(Integer hno) throws Exception {

    return replyDAO.list(hno);
  }

  @Override
  public void modifyReply(ReplyDto dto) throws Exception {

    replyDAO.update(dto);
  }



  @Override
  public List<ReplyDto> listReplyPage(Integer hno, Criteria cri) 
      throws Exception {

    return replyDAO.listPage(hno, cri);
  }

  @Override
  public int count(Integer hno) throws Exception {

    return replyDAO.count(hno);
  }

}
