package com.kedu.house.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kedu.house.dto.Criteria;
import com.kedu.house.dto.SearchCriteria;
import com.kedu.house.dto.HouseDto;
import com.kedu.house.dto.SearchAreaDto;

@Repository
public class HouseDaoImpl implements HouseDao{
	
	@Inject
	private SqlSession session;
	
	private static String namespace="com.kedu.mapper.HouseMapper";

	@Override
	public List<HouseDto> listAll() throws Exception {
		return session.selectList(namespace+".listAll");
	}
	
	@Override
	public List<SearchAreaDto> searchGugun(String sido) throws Exception {
		return session.selectList(namespace+".searchGugun", sido);
	}

	@Override
	public List<SearchAreaDto> searchDong(String sigungu) throws Exception {
		return session.selectList(namespace+".searchDong", sigungu);
	}


	@Override
	public void insertHouseAddr(HouseDto dto) throws Exception {
		session.selectList(namespace+".insertHouseAddr",dto);
	}
	
	@Override
	public String getTime() {
		return session.selectOne(namespace+".getTime");
	}
	
	@Override
	public void insertHouse(HouseDto dto){
		session.insert(namespace+".insertHouse",dto);
	}
	
	@Override
	public void addAttach(String fullName) throws Exception{
		
		session.insert(namespace+".addAttach", fullName);
	}
	
	@Override
	  public List<HouseDto> listPage(int page) throws Exception {

	    if (page <= 0) {
	      page = 1;
	    }

	    page = (page - 1) * 10;

	    return session.selectList(namespace + ".listPage", page);
	  }

	  @Override
	  public List<HouseDto> listCriteria(Criteria cri) throws Exception {

	    return session.selectList(namespace + ".listCriteria", cri);
	  }

	  @Override
	  public int countPaging(Criteria cri) throws Exception {

	    return session.selectOne(namespace + ".countPaging", cri);
	  }

	  @Override
	  public List<HouseDto> listSearch(SearchCriteria cri, String mid) throws Exception {

		  Map<String, Object> paramMap = new HashMap<String, Object>();
		  
		  paramMap.put("keyword", cri.getKeyword());
		  paramMap.put("page", cri.getPage());
		  paramMap.put("pageStart", cri.getPageStart());
		  paramMap.put("perPageNum", cri.getPerPageNum());
		  paramMap.put("searchtype", cri.getSearchType());
		  paramMap.put("mid", mid);
		  
	    return session.selectList(namespace + ".listSearch", paramMap);
	  }

	  @Override
	  public int listSearchCount(SearchCriteria cri) throws Exception {

	    return session.selectOne(namespace + ".listSearchCount", cri);
	  }
	  @Override
	  public List<String> getAttach(Integer hno) throws Exception {
	    
	    return session.selectList(namespace +".getAttach", hno);
	  }
	  
	  @Override
	  public HouseDto read(Integer hno) throws Exception {
	    return session.selectOne(namespace + ".read", hno);
	  }
	  @Override
	  public void updateReplyCnt(Integer hno, int amount) throws Exception {

	    Map<String, Object> paramMap = new HashMap<String, Object>();

	    paramMap.put("hno", hno);
	    paramMap.put("amount", amount);

	    session.update(namespace + ".updateReplyCnt", paramMap);
	  }

	  @Override
	  public void updateViewCnt(Integer hno) throws Exception {
	    
	    session.update(namespace+".updateViewCnt", hno);
	    
	  }
	  
	  @Override
	  public void deleteAttach(Integer hno) throws Exception {

	    session.delete(namespace+".deleteAttach", hno);
	    
	  }

	  @Override
	  public void replaceAttach(String fullName, Integer hno) throws Exception {
	    
	    Map<String, Object> paramMap = new HashMap<String, Object>();
	    
	    paramMap.put("hno", hno);
	    paramMap.put("fullName", fullName);
	    
	    session.insert(namespace+".replaceAttach", paramMap);
	    
	  }
	  
	  @Override
	  public void update(HouseDto dto) throws Exception {
	    session.update(namespace + ".update", dto);
	  }
	  
	  @Override
	  public void delete(Integer hno) throws Exception {
	    session.delete(namespace + ".delete", hno);
	  }


	  
	  @Override
	  public void list(HouseDto dto) throws Exception {
	    session.update(namespace + ".list", dto);
	  }

	@Override
	public List<HouseDto> nonMemberList(SearchCriteria cri) throws Exception {
		return session.selectList(namespace+".nonMemberList", cri);
	}

	@Override
	public void imageUpdate(String fullName, Integer hno) {
		Map<String,Object> map = new HashMap<>();
		map.put("fullName", fullName);
		map.put("hno", hno);
		
		session.update(namespace+".imageUpdate",map);		
	}

	@Override
	public void updateRcount(int hno, int amount) throws Exception {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		
		paramMap.put("hno", hno);
		paramMap.put("amount", amount);
		
		session.update(namespace + ".updateRcount", paramMap);
	}

	@Override
	public int countReplyPaging(int hno) throws Exception {
		return session.selectOne(namespace + ".countReplyPaging", hno);
	}
}