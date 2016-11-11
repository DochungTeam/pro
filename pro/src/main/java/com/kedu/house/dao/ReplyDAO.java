package com.kedu.house.dao;

import java.util.List;

import com.kedu.house.dto.Criteria;
import com.kedu.house.dto.ReplyDto;

public interface ReplyDAO {

  public List<ReplyDto> list(Integer hno) throws Exception;

  public void create(ReplyDto dto) throws Exception;

  public void update(ReplyDto dto) throws Exception;

  public void delete(Integer rno) throws Exception;

  public List<ReplyDto> listPage(
      Integer hno, Criteria cri) throws Exception;

  public int count(Integer hno) throws Exception;
  
  public int getHno(Integer rno) throws Exception;

}
