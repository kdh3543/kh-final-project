package kh.spring.controller;

import java.io.File;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import kh.spring.dto.FilesDTO;
import kh.spring.dto.ItemsDTO;
import kh.spring.service.FilesService;
import kh.spring.service.ItemsService;


@Controller
@RequestMapping("/items/")
public class ItemsController {

	@Autowired
	public ItemsService iservice;

	@Autowired
	public FilesService fservice;
	
	@Autowired
	HttpSession session;

	//	상품등록 -> 상세페이지
	
	@RequestMapping("itemsSell")
	
	public String itemsSell() {
		
		return "items/itemsSell";
		
	}
	
	@RequestMapping("itemsUpload")
	public String itemsUpload(ItemsDTO dto, MultipartFile[] file) throws Exception {
		
		
		
		System.out.println(dto.getIseq());
		
		String sellerID = (String)session.getAttribute("loginID");
		
		dto.setSellerID(sellerID);		
		
		
		
		
		int parentSeq = iservice.insert(dto);
		
		
		for(MultipartFile mf : file) {
			if(!mf.isEmpty()) { //  업로드 된 파일 중 첫번째 파일이 비어있지 않다면,
				String realPath = session.getServletContext().getRealPath("resources/images");
				File realPathFile = new File(realPath);
				if(!realPathFile.exists()) {realPathFile.mkdir();}

				String oriName = mf.getOriginalFilename(); //클라이언트에게 보여주는 목적 - 사용자가 업로드 한 파일의 원본 이름
				String sysName = UUID.randomUUID()+"_"+oriName; // 절대 겹치지 않는 무작위의 이름 - 서버쪽에 저장할 파일 이름


				// 서버에 업로드되어 메모리에 적재된 파일의 내용을 어디에 저장할지 결정하는 부분
				mf.transferTo(new File(realPath+"/"+sysName));
				fservice.insert(new FilesDTO(0,oriName,sysName,parentSeq)); //첨부된 파일 정보를 DB에 저장하는 부분
			}
		}
		/* service.insert(dto,file); */
//		마이페이지로 이동예정^^
		
		return "redirect:/items/itemsDetail";
 
	}
	
	
	@RequestMapping("itemsDetail")
	public String itemsDetail() {
		return "/items/itemsDetail";

	}
	@RequestMapping("itemsDetail2")
	public String itemsDetail2() {
		return "/items/itemsDetail2";

	}

}
