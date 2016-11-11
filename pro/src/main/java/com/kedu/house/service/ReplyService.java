package com.kedu.house.service;

import java.util.List;

import com.kedu.house.dto.Criteria;
import com.kedu.house.dto.ReplyDto;

public interface ReplyService {

  public void addReply(ReplyDto dto) throws Exception;

  public List<ReplyDto> listReply(Integer hno) throws Exception;

  public void modifyReply(ReplyDto dto) throws Exception;

  public void removeReply(Integer rno) throws Exception;

  public List<ReplyDto> listReplyPage(Integer hno, Criteria cri) 
      throws Exception;

  public int count(Integer hno) throws Exception;
}
