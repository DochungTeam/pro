package com.kedu.house.service;

import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;
import org.xmlpull.v1.XmlPullParserFactory;

import com.kedu.house.dto.SearchCriteria;
import com.kedu.house.dto.HouseDto;
import com.kedu.house.dto.Criteria;
import com.kedu.house.dao.HouseDao;

@Service
public class HouseServiceImpl implements HouseService{
	private static String clientID="";
	private static String clientSecret="";
	@Inject
	private HouseDao dao;

	@Override
	public List<HouseDto> listAll() throws Exception {
		return dao.listAll();
	}
	
//	@Override
//	public void insertHouse(HouseDto house) throws Exception {
//		dao.insertHouse(house);
//	}
	
	@Transactional
	@Override
	public void insertHouse(HouseDto house) throws Exception{
		
		dao.insertHouse(house);
		
		String[] files = house.getFiles();
		
		if(files == null) { return; }
		
		for(String fileName : files) {
			dao.addAttach(fileName);
		}
	}
	
	@Override
	  public List<HouseDto> listCriteria(Criteria cri) throws Exception {

	    return dao.listCriteria(cri);
	  }

	  @Override
	  public int listCountCriteria(Criteria cri) throws Exception {

	    return dao.countPaging(cri);
	  }

	  @Override
	  public List<HouseDto> listSearchCriteria(SearchCriteria cri, String mid) throws Exception {

	    return dao.listSearch(cri,mid);
	  }

	  @Override
	  public int listSearchCount(SearchCriteria cri) throws Exception {

	    return dao.listSearchCount(cri);
	  }
	  

	  @Override
	  public List<String> getAttach(Integer hno) throws Exception {
	    
	    return dao.getAttach(hno);
	  }   
	  
	  @Transactional(isolation=Isolation.READ_COMMITTED)
	  @Override
	  public HouseDto read(Integer hno) throws Exception {
	    dao.updateViewCnt(hno);
	    return dao.read(hno);
	  }
	  
	  @Transactional
	  @Override
	  public void modify(HouseDto house) throws Exception {
	    dao.update(house);
	    
	    Integer hno = house.getHno();
	    
	    String[] files = house.getFiles();
	    
	    if(files == null) { return; } 
	    
	    /*for (String fileName : files) {
	      dao.replaceAttach(fileName, hno);
	    }*/
	  }
	  
	  @Transactional
	  @Override
	  public void remove(Integer hno) throws Exception {
	    dao.deleteAttach(hno);
	    dao.delete(hno);
	  } 

	  @Transactional
	  @Override
	  public void list(HouseDto house) throws Exception {
	    dao.list(house);
	    
	    Integer hno = house.getHno();
	    
	    String[] files = house.getFiles();
	    
	    if(files == null) { return; } 
	  
	  }
/*
	@Override
	public List<HouseDto> searchHouse(String keyword, int display, int start) throws Exception {
		List<HouseDto> list=null;
		
		try {
			URL url;
			url = new URL("https://openapi.naver.com/v1/search/"
					+"local.xml?query="
					+URLEncoder.encode(keyword,"UTF-8")
					+(display!=0?"&display="+display:"")
					+(start!=1? "&start="+start:""));
			
			URLConnection urlConn= url.openConnection();
			urlConn.setRequestProperty("X-Naver-Client-Id", clientID);
			urlConn.setRequestProperty("X-Naver-Client-Secret", clientSecret);	
			
			XmlPullParserFactory factory= XmlPullParserFactory.newInstance();
			XmlPullParser parser= factory.newPullParser();
			parser.setInput(new InputStreamReader(urlConn.getInputStream()));
		
			int eventType= parser.getEventType();
			HouseDto houseDto= null;
			
			while(eventType!=XmlPullParser.END_DOCUMENT){
				switch (eventType) {
				case XmlPullParser.END_DOCUMENT:
					break;
				case XmlPullParser.START_DOCUMENT:
					list = new ArrayList<HouseDto>();
					break;
				case XmlPullParser.END_TAG: {
					String tag= parser.getName();
					if(tag.equals("item")){
						list.add(houseDto);
						houseDto=null;
					}
				}
				case XmlPullParser.START_TAG:{
					String tag= parser.getName();
					switch (tag) {
					case "item":
						houseDto = new HouseDto();
						break;
					case "title":
						if(houseDto!=null){
							houseDto.setHnm(parser.nextText());
						}
						break;
					case "discription":
						if(houseDto!=null){
							houseDto.setHcontent(parser.nextText());
						}
						break;
					case "lastBuildDate":
						if(houseDto!=null){
							houseDto.setHtime(parser.nextText());
						}
						break;
					case "telephone":
						if(houseDto!=null){
							houseDto.setHphone(parser.nextText());;
						}
						break;
					case "category":
						if(houseDto!=null){
							houseDto.setHkind(parser.nextText());
						}
						break;
					case "address":
						if(houseDto!=null){
							houseDto.sethaddr(parser.nextText());
						}
						break;
					case "mapx":
						if(houseDto!=null){
							houseDto.setHmapx(parser.next());
						}
						break;
					case "mapy":
						if(houseDto!=null){
							houseDto.setHmapy(parser.next());
						}
						break;
					
					default:
						break;
					}
				}
				default:
					break;
				}
				eventType=parser.next();
			}
		
			
		} catch (MalformedURLException e) {
			e.printStackTrace();
		}catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}catch (IOException e) {
			e.printStackTrace();
		}catch (XmlPullParserException e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	*/

	@Override
	public List<HouseDto> nonMemberList(SearchCriteria cri) throws Exception {
		return dao.nonMemberList(cri);
	}
}
