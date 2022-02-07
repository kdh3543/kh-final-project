package kh.spring.controller;

import java.io.File;
import java.util.ArrayList;
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

import kh.spring.dto.FilesDTO;
import kh.spring.dto.ItemsDTO;
import kh.spring.dto.ItemsQNADTO;
import kh.spring.dto.JoinDTO;
import kh.spring.dto.MemberDTO;
import kh.spring.dto.ReportDTO;
import kh.spring.dto.SearchKeywordDTO;
import kh.spring.service.AlertService;
import kh.spring.service.FilesService;
import kh.spring.service.FollowingService;
import kh.spring.service.ItemsService;
import kh.spring.service.MemberService;
import kh.spring.service.ReportService;
import kh.spring.service.SearchService;
import kh.spring.service.WishListService;


@Controller
@RequestMapping(value= {"/items/","/"})
public class ItemsController {

	@Autowired
	public ItemsService iservice;

	@Autowired
	public FilesService fservice;


	@Autowired
	public SearchService sservice;

	@Autowired
	HttpSession session;

	@Autowired
	public MemberService mservice;

	@Autowired
   public FollowingService fwservice;

	@Autowired
	public WishListService wlservice;
	
	@Autowired
	public ReportService rservice;
	
	@Autowired
	public AlertService aservice;

	@RequestMapping("")	
	public String home( Model model) {
		
	

		List<ItemsDTO>ilist =iservice.selectAll();

		model.addAttribute("ilist",ilist);

		List<FilesDTO>flist =fservice.selectAll();
		//		

		model.addAttribute("flist",flist);

		

		//인기검색어 넘겨주기 hot search =hs

		List<SearchKeywordDTO> hslist = sservice.selectByHot();
		model.addAttribute("hslist",hslist);
		
		
		//검색기록을 위한 아이디 넘기기
		String id =(String)session.getAttribute("loginID");
		
		
		//alert
		System.out.println("id는 : "+id);
		if(id != null) {
			
			//${alertCount}
		int alertCount = aservice.selectCount(id);	
				
		model.addAttribute("alertCount",alertCount);
		model.addAttribute("loginID",id);
		//헤더 부분 프로필 넘기기
		
		MemberDTO dto = mservice.select(id);

		model.addAttribute("dto",dto);
		System.out.println("메인이미지는 ?  : "+dto.getProfile_image());
		 
		
		}
		

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

		return "redirect:/items/";

	}



	// 아이템 판매내역- 수정하기 눌렀을시에 



	// 아이템 등록시  정보를 띄워주기 위한 mapping 

	@RequestMapping("itemsModify")
	public String itemsModify(int iseq,MultipartFile[] file,Model model)throws Exception {

		//		seq 받아와서 상품  찾기
		List<ItemsDTO> ilist =iservice.selectBySeq(iseq);
		//		seq 받아와서 사진  찾기
		List<FilesDTO> flist = fservice.selectBySeq(iseq);


		model.addAttribute("ilist",ilist);
		model.addAttribute("flist",flist);

		String id =(String)session.getAttribute("loginID");
		model.addAttribute("loginID",id);

		return "/items/itemsModify";

	}
	@ResponseBody
	@RequestMapping("itemsDeleteBySeq")
	public int itemsDelete(int iseq)throws Exception {
		
		
		int deleteResult = iservice.itemsDeleteBySeq(iseq);
		
		System.out.println("삭제결과는? :" +deleteResult);
		
		return deleteResult;
		
	}
	
	
	
	//아이템 수정시 proc

	//	@RequestMapping("itemsModifyProc")
	//	public String itemsModifyProc(int iseq,MultipartFile[] file,Model model)throws Exception {
	//		
	////		seq 받아와서 상품  찾기
	//		List<ItemsDTO> ilist =iservice.selectBySeq(iseq);
	//		
	//		int result = iservice.itemsModifyProc(ilist);
	//		System.out.println(result);
	//		
	////		seq 받아와서 사진  찾기
	//		System.out.println(file.length);
	////		List<FilesDTO> flist = fservice.selectBySeq(iseq);
	//		
	//		
	////		model.addAttribute("ilist",ilist);
	////		model.addAttribute("flist",flist);
	////		
	//		String id =(String)session.getAttribute("loginID");
	//		model.addAttribute("loginID",id);
	//	
	//		return "/";
	//		
	//	}





	@RequestMapping("itemsModifyProc")

	public String itemsModifyProc(String countImg, ItemsDTO dto,MultipartFile[] file,Model model)throws Exception {



		// 해당 상품과 이미지들
		System.out.println(dto.getCondition());
		System.out.println(dto.getName());

		int resultI =iservice.itemsModifyProc(dto);
		//사진은 지워야함 업데이트하고 (delete & update) parentSeq 에서
		//		List<FilesDTO> flist = fservice.selectBySeq(iseq);

		System.out.println("업데이트 완료 : " + resultI);

		String id =(String)session.getAttribute("loginID");

		model.addAttribute("loginID",id);




		System.out.println("사진 올린 개수는 String 값으로  " +countImg);
		int countImgInt = Integer.parseInt(countImg);


		//		상품번호 추출
		int iseq = dto.getIseq();
		int parentSeq= iseq;


		if(countImgInt !=0 ) {//file 개수가 0이 아니면 즉, 1개이상 들어와서 수정요청이 있다면
			//			기존 사진들 삭제하고(file delete)
			int resultFD= fservice.deleteBySeq(iseq);
			System.out.println("사진 지워졌는가? "+ resultFD);
			//			올린 사진들로 업데이트

			//파일 다시 넣기

			for(MultipartFile mf : file) {
				if(!mf.isEmpty()) { //  업로드 된 파일 중 첫번째 파일이 비어있지 않다면,
					String realPath = session.getServletContext().getRealPath("");
					File realPathFile = new File(realPath);
					if(!realPathFile.exists()) {realPathFile.mkdir();}


					String oriName = mf.getOriginalFilename(); //클라이언트에게 보여주는 목적 - 사용자가 업로드 한 파일의 원본 이름
					String sysName = "/upload/"+UUID.randomUUID()+"_"+oriName; // 절대 겹치지 않는 무작위의 이름 - 서버쪽에 저장할 파일 이름


					// 서버에 업로드되어 메모리에 적재된 파일의 내용을 어디에 저장할지 결정하는 부분
					mf.transferTo(new File(realPath+"/"+sysName));
					fservice.modifyProc(new FilesDTO(0,oriName,sysName,parentSeq)); //첨부된 파일 정보를 DB에 저장하는 부분
				}
			}




		}


		return "redirect:/myPage";		
	}


	//		return "/items/index";
	//	}



	// 아이템 수정후에 update.do 될 mapping



	//	아이템 상세페이지 하나 클릭했을때
	@RequestMapping("itemsDetail")

	public String itemsDetail(int iseq ,Model model) {
		
		
		

		// 조회수 올리기
		int result = iservice.addViewCount(iseq);

		// 해당 상품과 이미지들
		List<ItemsDTO> ilist =iservice.selectBySeq(iseq);
		List<FilesDTO> flist = fservice.selectBySeq(iseq);
		List<ItemsQNADTO> qlist = iservice.selectQNABySeq(iseq);

		model.addAttribute("ilist",ilist);
		model.addAttribute("flist",flist);
		model.addAttribute("qlist",qlist);

		//	관련 상품과 이미지들 (rlist = related item list)
		//상품 한개이므로 get (0) 또한 해당상품은 연관상품에 안떠야하니까 iseq 가져간다.
		String targetStr =ilist.get(0).getName(); 
		/* System.out.println(targetStr); */

		System.out.println("targetStr :"+targetStr);
		String[] str = targetStr.split(" ");



		List<String> targetList = new ArrayList<>();

		// 상품클릭시 이름값으로 띄어쓰기 구분해서 담음	
		for(int i=0; i< str.length; i++) {
			targetList.add(str[i]);
		}

		//연관상품 이름 뽑기
		List<ItemsDTO> rilist = iservice.selectByName(targetList,iseq);

		System.out.println("연관상품 이름구분 개수 : " + rilist.size());
		// 연관상품 이미지 뽑기
		
		if(rilist.size()!=0) {
			
		
		List<ItemsDTO> NameToSeq = iservice.selectNameToSeq(rilist);
		


		List<FilesDTO> rflist = fservice.selectBySeqR(NameToSeq);
		model.addAttribute("rilist",rilist);
		model.addAttribute("rflist",rflist);
		}


		//좋아요 넘겨주기 count

		int wishCount=wlservice.wishListCountDetail(iseq);
		
		model.addAttribute("wishCount",wishCount);

		String id =(String)session.getAttribute("loginID");
		model.addAttribute("loginID",id);
		
		
//		detailpage 오른쪽하단
		
		//상점 정보에 대한 추가정보 넘겨주기 iseq 로 받아야함
		MemberDTO mdto =mservice.selectByIseq(iseq);
		model.addAttribute("mdto",mdto);
		//상점 정보를 iseq 의 sellerid 로 찾기
		int detailICount = iservice.ItemsCount(iseq);
		model.addAttribute("detailICount",detailICount);
		
		
		List<ItemsDTO> detailIlist = iservice.selectByIseq(iseq);
		
		model.addAttribute("detailIlist",detailIlist);
		
//		String id 값 추출 (해당 상점의)
		String sellerID =detailIlist.get(0).getSellerID();

		List<FilesDTO> detailFlist = fservice.selectMineById(sellerID);
		
		model.addAttribute("detailFlist",detailFlist);
		
		
		
//		신고하기
		
		//List<ReportDTO> rlist = rservice.selectAll();
		
		if(id !=null) {
		ReportDTO rdto = rservice.selectById(id,iseq);
		model.addAttribute("rdto",rdto);
		}
		
		
		
		
		

//		model.addAttribute("detailFlist",detailFlist);
		
		
		


		

		return "/items/itemsDetail";

	}

	//아이템 상세페이지 하나 클릭했을때 - 문의글

	@RequestMapping("QNAWriteProc")
	public String writeProc(ItemsQNADTO dto) throws Exception {
		System.out.println("QNAWriteProc 로 들어온 요청은 이 메서드를 실행합니다.");

		dto.setWriter((String) session.getAttribute("loginID"));
		int result = iservice.insertQNA(dto);

		// bservice.addCommentCount(dto.getBoard_seq());
		// items 테이블에 상품문의 달린 개수 필요없지?

		return "redirect:/items/itemsDetail?iseq=" + dto.getIseq();
	}

	
	
	//	상품등록시 이동 

	@RequestMapping("itemsSell")

	public String itemsSell(Model model) {

		String id =(String)session.getAttribute("loginID");

		model.addAttribute(id);

		return "items/itemsSell";

	}




	//
	@RequestMapping("itemsList")

	public String itemsList() {

		return "/items/itemsList";
	}






	//


	// 검색어 파트입니다-----------------------------------------------------------

	//최근 검색어 data 넣기
	//NI = name items/files

	@RequestMapping("searchByInput")	
	public String input(SearchKeywordDTO dto,Model model) {


		//최근검색어 목록에 값 저장 회원일 경우만

		if (dto.getUser_id() != null && !dto.getUser_id().isEmpty() ) {

			String keyword = dto.getKeyword();

			int existCount = sservice.searchExistCount(keyword);

			System.out.println("existCOunt : "+ existCount );
			if(existCount ==0) {
				//넣는작업
				sservice.insert(dto);


			}

		}
		
		

		//검색내용
		 String keyword = dto.getKeyword().trim(); 
		 
		 
		String id = (String)session.getAttribute("loginID");
		
		if(id !=null ) {
			model.addAttribute("loginID",id);
			
		}
	

		//인기검색어 넘겨주기 hot search =hs

		List<SearchKeywordDTO> hslist = sservice.selectByHot();
		model.addAttribute("hslist",hslist);
		



//		System.out.println("seerawerwerawerawer"+NIlist.size());

		//상점명 검색시
		if(keyword.substring(0, 1).equals("@")) {
			//멤버 + 상품개수 + 팔로워수 넘겨줘야함
			int end =keyword.length();
			
			//기존 검색어에는 @가 붙어있기에 뗴주는 작업
			keyword =keyword.substring(1, end);
			
			
			List<JoinDTO> mlist = mservice.selectAllStoreList(keyword);
			
			//멤버별 총 상품수
//			List<ItemsDTO> sellCountAll = iservice.sellCountAll();
			
			//멤버별 총 팔로워수
//			List<FollowDTO> followCountAll = fwservice.followCountAll();
			
			model.addAttribute("mlist",mlist);
			model.addAttribute("keyword",keyword);
			
			return "/items/storeList";
			

		}else {
			//상품명 검색시
			List<ItemsDTO> NIlist = iservice.selectByIName(keyword);
			
			List<FilesDTO> NFlist = fservice.selectByIName(keyword);
			model.addAttribute("NIlist",NIlist);
			model.addAttribute("NFlist",NFlist);
			model.addAttribute("keyword",keyword);
			
			return "/items/itemsList";
		}

	}

	//	CF = category file / items
	@RequestMapping("searchByCategory")
	public String category(String category,Model model) {

		System.out.println("카테고리 검색 결과 : " +category);

		//해당 id 의 상품목록들 가져오기
		List<ItemsDTO> CLlist = iservice.selectByCategory(category);
		//해당 상품목록의 사진들도 가져오기
		List<FilesDTO> CFlist = fservice.selectByCategory(category);

		//session

		String id = (String)session.getAttribute("loginID");



		model.addAttribute("CIlist",CLlist);
		model.addAttribute("CFlist",CFlist);
		model.addAttribute("loginID",id);
		model.addAttribute("category",category);

		return "/items/itemsList";
	}


	//최근검색어 삭제
	@ResponseBody
	@RequestMapping(value ="deleteAll", produces="text/html; charset=utf8")
	public String deleteAll() throws Exception{

		int result =sservice.deleteAll();
		return String.valueOf(result);

	}

	//최근검색어 보여주기
	@ResponseBody
	@RequestMapping(value ="listing", produces="text/html; charset=utf8")
	public String listing() throws Exception{

		String id =(String)session.getAttribute("loginID");
		if(id ==null) {
			
			return "";
			
		}else {
			
			
			List<SearchKeywordDTO> slist = sservice.selectAll(id);

			Gson gson = new Gson();

			String listJson = gson.toJson(slist, List.class).toString();

			/* System.out.println(listJson); */
			return listJson;
		}





	}

	@ResponseBody
	@RequestMapping(value ="deleteByKeyword", produces="text/html; charset=utf8")
	public String deleteByKeyword(String keyword) throws Exception{

		int result = sservice.deleteByKeyword(keyword);


		return String.valueOf(result);


	}


	// 검색어 파트입니다 끝-----------------------------------------------------------






	//구매하기 

	@RequestMapping("itemsOrder")
	public String itemsOrder(int iseq,Model model) {
		
		
		List<ItemsDTO> ilist =iservice.selectBySeq(iseq);
		FilesDTO fdto = fservice.selectBySeqOrder(iseq);

		String id = (String)session.getAttribute("loginID");
		
		
		MemberDTO mdto = mservice.select(id);
		
		model.addAttribute("ilist",ilist);
		model.addAttribute("fdto",fdto);
		model.addAttribute("mdto",mdto);
		model.addAttribute("loginID",id);



		return "/items/itemsOrder";
	}

	//메인화면 홈-상품전체 끌고오기

	@RequestMapping("join")
	public String join() {

		return "/member/join";
	}

	//	memberController 에서 회원정보(dto) 와 가입일(SignDate) 가져옴
	//마이페이지 이동기능
	@RequestMapping("myPage")
	public String mypage(Model model) {
		String id = (String)session.getAttribute("loginID");
		MemberDTO dto = mservice.select(id);
		//가입한지 몇일 째인지 확인
		int signDate = mservice.signDate(id);
		model.addAttribute("signDate",signDate);
		model.addAttribute("dto", dto);
		
		
		


		//해당 id 의 상품목록들 가져오기
		List<ItemsDTO> ilist = iservice.selectMineById(id);
		//해당 상품목록의 사진들도 가져오기
		List<FilesDTO> flist = fservice.selectMineById(id);

		//찜 목록 가져오기
		List<ItemsDTO> wishlist = new ArrayList<ItemsDTO>();
		
	
		
		
		
		//iseq 값 가져옴 여러개나옴 이 값은 ITEMSDTO 와 연관
		wishlist = wlservice.mywishList(id);
		
	
		//마이페이지-찜목록 사진 출력
		List<FilesDTO> likeImg = fservice.selectLikeImg(id);
		
		
		model.addAttribute("wlist",wishlist);
		//찜 개수 가져오기
		int wishlistCount = wlservice.wishlistCount(id);
		model.addAttribute("wCount",wishlistCount);
		model.addAttribute("likeImg",likeImg);



		//판매내역 건수 보내기

		int sellCount = iservice.sellCount(id);

		model.addAttribute("ilist",ilist);
		model.addAttribute("flist",flist);
		model.addAttribute("sellCount",sellCount);
		
		
		//구매내역 건수 보내기
		
		//구매내역 보내기
		
		List<ItemsDTO> buyIlist = iservice.buyIList(id);
		List<FilesDTO> buyFlist = fservice.buyFList(id);
		int buyCount = iservice.buyCount(id);
		
		
		model.addAttribute("buyIlist",buyIlist);
		model.addAttribute("buyFlist",buyFlist);
		
		model.addAttribute("buyCount",buyCount);
		
		
		
		// 팔로워 리스트
	      List<MemberDTO> followlist =new ArrayList<MemberDTO>();
	      followlist = fwservice.selectfollowing(id);            
	      model.addAttribute("followlist",followlist);
	      System.out.println(followlist);
	      
	    //내가 팔로워 한 수 가져오기
	      int followingCount = fwservice.followingCount(id);
	      
	      model.addAttribute("fCount",followingCount);
	      
	    //팔로우 목록
	      List<MemberDTO> followedList = new ArrayList<MemberDTO>();
	      followedList = fwservice.selectfollowed(id);
	      model.addAttribute("followedList",followedList);
	      //팔로우 수 가져오기
	      int followedCount = fwservice.followedCount(id);
	      model.addAttribute("followedCount",followedCount);
	      
	    //인기검색어 넘겨주기 hot search =hs

	      List<SearchKeywordDTO> hslist = sservice.selectByHot();
	      model.addAttribute("hslist",hslist);
			

		
		
		
		return "/member/myPage";

	}
	
	// 다른사람 페이지임 여기로 진입시에 해당 id 값을 가져와서 동일하게 뿌림.
	// 기능들에는 disabled 를 적절히 배치. 회원정보 수정은 안보이게끔 설정한다.
	
	@RequestMapping("otherPage")
	public String otherPage(String id,Model model) {
		
		
		MemberDTO dto = mservice.select(id);
	    //가입한지 몇일 째인지 확인
	    int signDate = mservice.signDate(id);
	    model.addAttribute("signDate",signDate);
	    model.addAttribute("dto", dto);
	    
	  //해당 id 의 상품목록들 가져오기
	    List<ItemsDTO> ilist = iservice.selectMineById(id);
	    //해당 상품목록의 사진들도 가져오기
	    List<FilesDTO> flist = fservice.selectMineById(id);

	    //찜 목록 가져오기
	    List<ItemsDTO> wishlist = new ArrayList<ItemsDTO>();
	    
	    
	    
	    
	    //iseq 값 가져옴 여러개나옴 이 값은 ITEMSDTO 와 연관
	    wishlist = wlservice.mywishList(id);
	    

	    //마이페이지-찜목록 사진 출력
	    List<FilesDTO> likeImg = fservice.selectLikeImg(id);
	    
	    
	    model.addAttribute("wlist",wishlist);
	    //찜 개수 가져오기
	    int wishlistCount = wlservice.wishlistCount(id);
	    model.addAttribute("wCount",wishlistCount);
	    model.addAttribute("likeImg",likeImg);
	    
	    
	  //상점방문수 추가 otherpage 왔을때 추가
	    
	  		int result = mservice.addViewCount(id);
	  		
	  	//판매내역 건수 보내기

	  	    int sellCount = iservice.sellCount(id);

	  	    model.addAttribute("ilist",ilist);
	  	    model.addAttribute("flist",flist);
	  	    model.addAttribute("sellCount",sellCount);
	  	    
	  	    
	  	    //구매내역 건수 보내기
	  	    
	  	    //구매내역 보내기
	  	    
	  	    List<ItemsDTO> buyIlist = iservice.buyIList(id);
	  	    List<FilesDTO> buyFlist = fservice.buyFList(id);
	  	    int buyCount = iservice.buyCount(id);
	  	    
	  	    
	  	    model.addAttribute("buyIlist",buyIlist);
	  	    model.addAttribute("buyFlist",buyFlist);
	  	    
	  	    model.addAttribute("buyCount",buyCount);
	  	    
	  	    
	  	    
	  	//   팔로워 리스트
	  	      List<MemberDTO> followlist =new ArrayList<MemberDTO>();
	  	      followlist = fwservice.selectfollowing(id);            
	  	      model.addAttribute("followlist",followlist);
	  	      
	  	    //내가 팔로워 한 수 가져오기
	  	      int followingCount = fwservice.followingCount(id);
	  	      
	  	      model.addAttribute("fCount",followingCount);
	  	      
	  	    //팔로우 목록
	  	      List<MemberDTO> followedList = new ArrayList<MemberDTO>();
	  	      followedList = fwservice.selectfollowed(id);
	  	      model.addAttribute("followedList",followedList);
	  	      //팔로우 수 가져오기
	  	      int followedCount = fwservice.followedCount(id);
	  	      model.addAttribute("followedCount",followedCount);
	  		
		   
	  		
		
		
	
		return "/member/otherPage";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	//	상품의 상태 예약중/ 판매완료/판매중
	@ResponseBody
	@RequestMapping(value="updateProc", produces="text/html; charset=utf8")
	public String updateProc(String piseq,String pdeal) {

		int iseq = Integer.parseInt(piseq); 

		String deal = pdeal;
		System.out.println(iseq + ":" + deal);

		int result = iservice.updateProc( deal, iseq);

		return "update complete";


	}


	//		@RequestMapping("itemsDetail")
	//		public String itemsDetail(int iseq ,Model model) {
	//			
	//	// 해당 상품과 이미지들
	//			List<ItemsDTO> ilist =iservice.selectBySeq(iseq);
	//		List<FilesDTO> flist = fservice.selectBySeq(iseq);
	//		
	//		model.addAttribute("ilist",ilist);
	//		model.addAttribute("flist",flist);

	@RequestMapping("signIn")
	public String login() {

		return "/member/signIn";
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



	@RequestMapping("itemsDetailExam")
	public String itemsDetail2() {
		return "/items/itemsDetailExam";

	}

	@RequestMapping("deleteQNAProc")
	public String deleteProc(int qseq, int iseq) {
		System.out.println("deleteQNAProc 로 들어온 요청은 이 메서드를 실행합니다.");

		int result = iservice.deleteQNA(qseq);
		
		return "redirect:/items/itemsDetail?iseq=" + iseq;
	}



}
