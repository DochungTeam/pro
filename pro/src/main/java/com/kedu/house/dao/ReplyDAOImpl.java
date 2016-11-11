package com.kedu.house.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import com.kedu.house.dto.Criteria;
import com.kedu.house.dto.ReplyDto;

@Repository
public class ReplyDAOImpl implements ReplyDAO {

  @Inject
  private SqlSession session;

  private static String namespace = "com.kedu.mapper.ReplyMapper";

  @Override
  public List<ReplyDto> list(Integer hno) throws Exception {

    return session.selectList(namespace + ".list", hno);
  }

  @Override
  public void create(ReplyDto dto) throws Exception {

    session.insert(namespace + ".create", dto);
  }

  @Override
  public void update(ReplyDto dto) throws Exception {

    session.update(namespace + ".update", dto);
  }

  @Override
  public void delete(Integer rno) throws Exception {

    session.update(namespace + ".delete", rno);
  }

  @Override
  public List<ReplyDto> listPage(Integer hno, Criteria cri)
      throws Exception {

    Map<String, Object> paramMap = new HashMap<>();

    paramMap.put("hno", hno);
    paramMap.put("cri", cri);

    return session.selectList(namespace + ".listPage", paramMap);
  }

  @Override
  public int count(Integer hno) throws Exception {

    return session.selectOne(namespace + ".count", hno);
  }
  
  @Override
  public int getHno(Integer rno) throws Exception {

    return session.selectOne(namespace + ".getHno", rno);
  }
}
