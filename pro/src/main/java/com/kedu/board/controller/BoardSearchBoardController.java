package com.kedu.board.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kedu.board.dto.BoardDto;
import com.kedu.board.dto.BoardPageMaker;
import com.kedu.board.dto.BoardSearchCriteria;
import com.kedu.board.service.BoardService;

@Controller
@RequestMapping("/board/*")
public class BoardSearchBoardController {

	private static final Logger logger = LoggerFactory.getLogger(BoardSearchBoardController.class);
	
	@Inject
	private BoardService service;
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void listPage(@ModelAttribute("cri") BoardSearchCriteria cri, Model model) throws Exception {
		logger.info(cri.toString());
		
		model.addAttribute("list", service.listCriteria(cri));
		
		BoardPageMaker pageMaker = new BoardPageMaker();
		pageMaker.setCri(cri);
		
		pageMaker.setTotalCount(service.listCountCriteria(cri));
		
		model.addAttribute("pageMaker", pageMaker);
	}
	
	@RequestMapping(value = "/readPage", method = RequestMethod.GET)
	public void read(@RequestParam("bno") int bno, @ModelAttribute("cri") BoardSearchCriteria cri, Model model) throws Exception {
		
		model.addAttribute(service.read(bno));
	}
	
	@RequestMapping(value = "/removePage", method = RequestMethod.POST)
	public String remove(@RequestParam("bno") int bno, BoardSearchCriteria cri, RedirectAttributes rttr) throws Exception {
		
		service.remove(bno);
		
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		rttr.addFlashAttribute("msg", "SUCCESS");
		
		return "redirect:/board/list";
	}
	
	@RequestMapping(value = "/modifyPage", method = RequestMethod.GET)
	public void modifyPagingGET(int bno, @ModelAttribute("cri") BoardSearchCriteria cri, Model model) throws Exception {
		
		model.addAttribute(service.read(bno));
	}
	
	@RequestMapping(value = "/modifyPage", method = RequestMethod.POST)
	public String modifyPagingPOST(BoardDto board, BoardSearchCriteria cri, RedirectAttributes rttr) throws Exception {
		
		logger.info(cri.toString());
		service.modify(board);
		
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		rttr.addFlashAttribute("msg", "SUCCESS");
		
		logger.info(rttr.toString());
		
		return "redirect:/board/list";
	}
	
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public void registGET() throws Exception {
		
		logger.info("register get............");
	}
	
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String registPOST(BoardDto board, RedirectAttributes rttr) throws Exception {
		
		logger.info("regist post............");
		logger.info(board.toString());
		
		service.regist(board);
		
		rttr.addFlashAttribute("msg", "SUCCESS");
		
		return "redirect:/board/list";
	}
public void multipleUpload(HttpServletRequest request,HttpServletResponse response)throws Exception{
		
		try {
			 //파일정보
			 String sFileInfo = "";
			 //파일명을 받는다 - 일반 원본파일명
			 String filename = request.getHeader("file-name");
			 //파일 확장자
			 String filename_ext = filename.substring(filename.lastIndexOf(".")+1);
			 //확장자를소문자로 변경
			 filename_ext = filename_ext.toLowerCase();
			 	
			 //이미지 검증 배열변수
			 String[] allow_file = {"jpg","png","bmp","gif"};

			 //돌리면서 확장자가 이미지인지 
			 int cnt = 0;
			 for(int i=0; i<allow_file.length; i++) {
			 	if(filename_ext.equals(allow_file[i])){
			 		cnt++;
			 	}
			 }

			 //이미지가 아님
			 if(cnt == 0) {
				 PrintWriter print = response.getWriter();
				 print.print("NOTALLOW_"+filename);
				 print.flush();
				 print.close();
			 } else {
			 //이미지이므로 신규 파일로 디렉토리 설정 및 업로드	
			 //파일 기본경로
			 String dftFilePath = request.getSession().getServletContext().getRealPath("/");
			 //파일 기본경로 _ 상세경로
			 String filePath = dftFilePath + "resources" + File.separator + "editor" + File.separator +"multiupload" + File.separator;
			 File file = new File(filePath);
			 if(!file.exists()) {
			 	file.mkdirs();
			 }
			 String realFileNm = "";
			 SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
			 String today= formatter.format(new java.util.Date());
			 realFileNm = today+UUID.randomUUID().toString() + filename.substring(filename.lastIndexOf("."));
			 String rlFileNm = filePath + realFileNm;
			 ///////////////// 서버에 파일쓰기 ///////////////// 
			 InputStream is = request.getInputStream();
			 OutputStream os=new FileOutputStream(rlFileNm);
			 int numRead;
			 byte b[] = new byte[Integer.parseInt(request.getHeader("file-size"))];
			 while((numRead = is.read(b,0,b.length)) != -1){
			 	os.write(b,0,numRead);
			 }
			 if(is != null) {
			 	is.close();
			 }
			 os.flush();
			 os.close();
			 ///////////////// 서버에 파일쓰기 /////////////////

			 // 정보 출력
			 sFileInfo += "&bNewLine=true";
			 // img 태그의 title 속성을 원본파일명으로 적용시켜주기 위함
			 sFileInfo += "&sFileName="+ filename;;
			 sFileInfo += "&sFileURL="+"/resources/editor/multiupload/"+realFileNm;
			 PrintWriter print = response.getWriter();
			 print.print(sFileInfo);
			 print.flush();
			 print.close();
			 }	
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}

