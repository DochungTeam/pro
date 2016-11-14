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
import org.springframework.transaction.annotation.Transactional;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;
import org.xmlpull.v1.XmlPullParserFactory;

import com.kedu.house.dao.HouseDao;
import com.kedu.house.dto.Criteria;
import com.kedu.house.dto.DiHouseDto;
import com.kedu.house.dto.HouseDto;
import com.kedu.house.dto.ImageDto;
import com.kedu.house.dto.SearchCriteria;

@Service
public class HouseServiceImpl implements HouseService{
	private static String clientID="0GNzYEuHHTbQ5Q4gsSLY";
	private static String clientSecret="mxGth1kV6a";
	@Inject
	private HouseDao dao;

	@Override
	public List<HouseDto> listAll() throws Exception {
		return dao.listAll();
	}
	
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
	  public List<HouseDto> listSearchCriteria(SearchCriteria cri) throws Exception {

	    return dao.listSearch(cri);
	  }

	  @Override
	  public int listSearchCount(SearchCriteria cri) throws Exception {

	    return dao.listSearchCount(cri);
	  }
	  

	  @Override
	  public List<String> getAttach(Integer hno) throws Exception {
	    
	    return dao.getAttach(hno);
	  }   


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
					case "link":
						if(houseDto!=null){
							houseDto.setHlink(parser.nextText());
						}
						break;
					case "description":
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
							houseDto.setHaddr(parser.nextText());
						}
						break;
					case "mapx":
						if(houseDto!=null){
							houseDto.setHmapx(parser.nextText());
						}
						break;
					case "mapy":
						if(houseDto!=null){
							houseDto.setHmapy(parser.nextText());
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

	
	/*@Override
	public List<HouseDto> searchImage(String keyword, int display, int start) throws Exception {
		List<HouseDto> list1=null;
		
		try {
			URL url1=null;
			url1 = new URL("https://openapi.naver.com/v1/search/"
					+"image.xml?query="
					+URLEncoder.encode(keyword,"UTF-8")
					+(display!=0?"&display="+display:"")
					+(start!=1? "&start="+start:""));
			
			
			URLConnection urlConn1= url1.openConnection();
			urlConn1.setRequestProperty("X-Naver-Client-Id", clientID);
			urlConn1.setRequestProperty("X-Naver-Client-Secret", clientSecret);
			
			XmlPullParserFactory factory1=XmlPullParserFactory.newInstance();
			XmlPullParser parser1= factory1.newPullParser();
			parser1.setInput(new InputStreamReader(urlConn1.getInputStream()));
			
			int eventType1= parser1.getEventType();
			HouseDto houseDto1=null;
			
			
			while(eventType1!=XmlPullParser.END_DOCUMENT){
				switch(eventType1){
				case XmlPullParser.END_DOCUMENT:
					break;
				case XmlPullParser.START_DOCUMENT:
					list1 = new ArrayList<>();
					break;
				case XmlPullParser.END_TAG:{
					String tag1=parser1.getName();
					if(tag1.equals("item")){
						list1.add(houseDto1);
						houseDto1=null;
					}
				}
				case XmlPullParser.START_TAG:{
					String tag1= parser1.getName();
					System.out.println(tag1.toString());
					switch(tag1){
					case "item":
						houseDto1= new HouseDto();
						break;
					
					case "thumbnail":
						if(houseDto1!=null){
							houseDto1.setThumbnail(parser1.nextText());			
						}
					break;
					
					case "sizeheight":
					if(houseDto1!=null){
						houseDto1.setSizeheight(parser1.nextText());
					}
					break;
					
					case "sizewidth":
					if(houseDto1!=null){
						houseDto1.setSizewidth(parser1.nextText());
					}
					break;
					default:
						break;
					}
					}
				
				}
				eventType1=parser1.next();
				
			}
		}  catch (MalformedURLException e) {
			e.printStackTrace();
		}catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}catch (IOException e) {
			e.printStackTrace();
		}catch (XmlPullParserException e) {
			e.printStackTrace();
		}
		return list1;
	}*/
	@Override
	public List<HouseDto> searchImage(String keyword, int display, int start) throws Exception {
		return null;
	}
}

