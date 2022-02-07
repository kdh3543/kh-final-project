package kh.spring.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kh.spring.dto.BestBuyerDTO;
import kh.spring.dto.BestSellerDTO;
import kh.spring.dto.BoardDTO;
import kh.spring.dto.CountUploadItemsDTO;
import kh.spring.dto.GraphDTO;
import kh.spring.dto.ItemGraphDTO;
import kh.spring.dto.ItemsDTO;
import kh.spring.dto.ItemsReportCountDTO;
import kh.spring.dto.ItemsReportDTO;
import kh.spring.dto.MemberDTO;
import kh.spring.dto.PriceRangeDTO;
import kh.spring.service.BoardService;
import kh.spring.service.FilesService;
import kh.spring.service.FollowingService;
import kh.spring.service.ItemsService;
import kh.spring.service.MemberService;
import kh.spring.service.ReportService;
import kh.spring.service.SearchService;
import kh.spring.service.WishListService;

@Controller
@RequestMapping("/admin/")
public class AdminController {
	@Autowired
	   public MemberService mservice;
	   
	   @Autowired
	   public BoardService bservice;
	   @Autowired
	   public ItemsService iservice;

	   @Autowired
	   public FilesService fservice;
	  


	   @Autowired
	   public SearchService sservice;

	   @Autowired
	   HttpSession session;


	   @Autowired
	   public FollowingService fwservice;

	   @Autowired
	   public WishListService wlservice;
	   
	   @Autowired
	   public ReportService rservice;
	
	@RequestMapping("adminIndex")
	public String adminIndex(Model model) {
		
		// 회원 관리 부분 호출
		List<MemberDTO> list = mservice.selectAll();
		model.addAttribute("list", list);
		session.getAttribute("Admin");
		
		// 게시물 관리 부분 호출
		List<BoardDTO> blist = bservice.selectAll();
		model.addAttribute("blist", blist);
		
		// 월일 호출 
		List<GraphDTO> monthList = mservice.groupByMonth();
		model.addAttribute("monthList",monthList);
	
		// 월일 가입자 수 호출 
		List<GraphDTO> countMember = mservice.countMember();
		model.addAttribute("countMember",countMember);
			
		  //판매통계 시작
	      
	      //1.등록된 상품수
	      List<CountUploadItemsDTO> countUploadItems = iservice.countUploadItems();
	      
	      //2. 판매중인 상품수
	      int countSell = iservice.countSell();
	      //3. 구매중 (예약중)인 OR 거래완료된 상품수
	      int countBuy = iservice.countBuy();
	      
	      //4.  가장 많은상품을 올린 사람과 상품개수 List
	      List<BestSellerDTO> bestSeller = iservice.bestSeller();
	      //5  가장 많은상품을 구매한 사람과 상품개수 List 
	      List<BestBuyerDTO> bestBuyer = iservice.bestBuyer();
	      
	      //6. 가격대별 상품수 4그룹으로 나뉨 1원이상/1천원이상/1만원이상/10만원이상 List
	      // 주의!! price 는 String 임.
	      List<PriceRangeDTO> ItemsPriceRange = iservice.ItemsPriceRange();
	      
	      //7. 모든상품보기 - 이건 items-mapper에 있음!
	      List<ItemsDTO> ilist = iservice.selectAll();
	      
	      //신고 시작
	      
	      //1. 유형별 신고수
	      
	      
	      
	      model.addAttribute("countUploadItems",countUploadItems);
	      model.addAttribute("countSell",countSell);
	      model.addAttribute("countBuy",countBuy);
	      model.addAttribute("bestSeller",bestSeller);
	      model.addAttribute("bestBuyer",bestBuyer);
	      model.addAttribute("ItemsPriceRange",ItemsPriceRange);
	      model.addAttribute("ilist",ilist);
	      
	      
	      //판매통계 끝
	      
	      
	      
	      //신고관리 시작
	      //-신고 LIST
	      
	      List<ItemsReportDTO> ItemsReport = iservice.ItemsReport();
	      //-신고개수 (상품iseq / count) --LIST
	      List<ItemsReportCountDTO> ItemsReportCount = iservice.ItemsReportCount();
	      
	      //신고관리 끝
	      
	      model.addAttribute("ItemsReport",ItemsReport);
	      model.addAttribute("ItemsReportCount",ItemsReportCount);
		return "/admin/adminIndex";
		
		
	}
	 @RequestMapping("leave")
	   public String leave(String seqNum) {
		 int seq = Integer.parseInt(seqNum);
	     mservice.deleteBySeq(seq);
	      return "redirect:/admin/adminIndex";
	   }
	 
	 @RequestMapping("update")
	   public String updatePage(@RequestParam int seq, Model model) {
		 MemberDTO dto = mservice.findIdBySeq(seq);
	      return "redirect:/items/adminUpdateMem/?loginID=" + dto.getId();
	   }
	 

	 @RequestMapping("deleteBySeqBoard")
	 public String deleteBtSeqBoard(String seqNum) {
		 int seq = Integer.parseInt(seqNum);
		 bservice.delete(seq);
		  return "redirect:/admin/adminIndex";
		 
	 }
	 
	 

}
