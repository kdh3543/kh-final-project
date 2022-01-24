package kh.spring.controller;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;

import kh.spring.dao.SearchKeywordDAO;
import kh.spring.dto.FilesDTO;
import kh.spring.dto.ItemsDTO;
import kh.spring.dto.SearchKeywordDTO;
import kh.spring.service.FilesService;
import kh.spring.service.ItemsService;


@Controller
@RequestMapping(value= {"/items/","/"})
public class ItemsController {

	@Autowired
	public ItemsService iservice;

	@Autowired
	public FilesService fservice;
	
	@Autowired
	public SearchKeywordDAO sdao;
	
	@Autowired
	HttpSession session;
	
	
	@RequestMapping("")	
	public String home(Model model) {
		
		List<ItemsDTO>ilist =iservice.selectAll();
		
		model.addAttribute("ilist",ilist);
		
		List<FilesDTO>flist =fservice.selectAll();
//		
		
		model.addAttribute("flist",flist);
		
		
		
		return "/items/index";
	}
	
	//	상품등록
	
	@RequestMapping("itemsUpload")
	public String itemsUpload(ItemsDTO dto, MultipartFile[] file) throws Exception {
		
		
		
		System.out.println(dto.getIseq());
		
		String sellerID = (String)session.getAttribute("loginID");
		
		dto.setSellerID(sellerID);		
		
		
		
		
		int parentSeq = iservice.insert(dto);
		
		
		
		for(MultipartFile mf : file) {
			if(!mf.isEmpty()) { //  업로드 된 파일 중 첫번째 파일이 비어있지 않다면,
				String realPath = session.getServletContext().getRealPath("");
				File realPathFile = new File(realPath);
				if(!realPathFile.exists()) {realPathFile.mkdir();}
				

				String oriName = mf.getOriginalFilename(); //클라이언트에게 보여주는 목적 - 사용자가 업로드 한 파일의 원본 이름
				String sysName = "/upload/"+UUID.randomUUID()+"_"+oriName; // 절대 겹치지 않는 무작위의 이름 - 서버쪽에 저장할 파일 이름


				// 서버에 업로드되어 메모리에 적재된 파일의 내용을 어디에 저장할지 결정하는 부분
				mf.transferTo(new File(realPath+"/"+sysName));
				fservice.insert(new FilesDTO(0,oriName,sysName,parentSeq)); //첨부된 파일 정보를 DB에 저장하는 부분
			}
			
//			dto.setItems_img1();
			
		}
		/* service.insert(dto,file); */
//		마이페이지로 이동예정^^
		
		return "redirect:/items/itemsDetail";
 
	}
	
//	아이템 상세페이지 하나 클릭했을때
	@RequestMapping("itemsDetail")
	public String itemsDetail(Model model) {
		
//	List<ItemsDTO>ilist =iservice.selectBySeq();
		
//		model.addAttribute("ilist",ilist);
		
		
		
		
		
		return "/items/itemsDetail";

	}
	
	
//최근 검색어 data 넣기
	@RequestMapping("searchByInput")	
	public String input(SearchKeywordDTO dto,Model model) {

		//검색 목록에 값 저장
		sdao.insert(dto);

		
		
		return "items/index";
	}


//최근검색어 삭제
	@ResponseBody
	@RequestMapping(value ="deleteAll", produces="text/html; charset=utf8")
	public String deleteAll() throws Exception{

		int result =sdao.deleteAll();
		return String.valueOf(result);

	}

//최근검색어 보여주기
	@ResponseBody
	@RequestMapping(value ="listing", produces="text/html; charset=utf8")
	public String listing() throws Exception{

		List<SearchKeywordDTO> slist = sdao.selectAll();

		Gson gson = new Gson();

		String listJson = gson.toJson(slist, List.class).toString();

		/* System.out.println(listJson); */
		return listJson;



	}

	@ResponseBody
	@RequestMapping(value ="deleteByKeyword", produces="text/html; charset=utf8")
	public String deleteByKeyword(String keyword) throws Exception{

		int result = sdao.deleteByKeyword(keyword);


		return String.valueOf(result);


	}
	
	
	//메인화면 홈-상품전체 끌고오기
	
	
	
	@RequestMapping("signIn")
	public String login() {
		
		return "/member/signIn";
	}
	
	@RequestMapping("join")
	public String join() {
		
		return "/member/join";
	}
	
	@RequestMapping("myPage")
	public String myPage() {
		
		return "/member/myPage";
	}
	
	@RequestMapping("findInfo")
	public String findInfo() {
		
		return "/member/findInfo";
	}
	@RequestMapping("talk")
	public String talk() {
		
		return "/talk/talk";
	}

	//	상품등록시 이동 
	
	@RequestMapping("itemsSell")
	
	public String itemsSell() {
		
		return "items/itemsSell";
		
	}
	


}
