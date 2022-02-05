package kh.spring.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kh.spring.dto.SafeDealDTO;
import kh.spring.service.FilesService;
import kh.spring.service.ItemsService;
import kh.spring.service.MemberService;
import kh.spring.service.SafeDealService;
import kh.spring.service.SearchService;
import kh.spring.service.WishListService;

@Controller
@RequestMapping("safeDeal")
public class SafeDealController {

	@Autowired
	public ItemsService iservice;

	@Autowired
	public FilesService fservice;

	@Autowired
	public SafeDealService sdservice;

	@Autowired
	public SearchService sservice;

	@Autowired
	HttpSession session;

	@Autowired
	public MemberService mservice;

	// @Autowired
	// public FollowingService fwservice;

	@Autowired
	public WishListService wlservice;

	@RequestMapping("insert")
	public String insert(SafeDealDTO dto, Model model) {

		System.out.println("공백확인 seller :"+dto.getSeller());
		
		// safedeal 테이블에 정보 넣고 + update member 돈바꾸기 (다중쿼리)
		int sdresult = sdservice.insert(dto);

		System.out.println("상품 구매 완료 ! 계좌에서 돈나감");

		return "redirect:/items/myPage";
	}

	

	 @ResponseBody
	 @RequestMapping("dealOk")
	 
	 public String dealOk(int iseq) {
		 
		 
		 //해당 회원의 모든 거래내역 
		 SafeDealDTO sddto = sdservice.selectAllDealOkBySeq(iseq); 
		 
		 
		 System.out.println("sddto 의 정보는? : " +sddto.getBuyer() + sddto.getSeller()+sddto.getCash());
		 int sdresult = sdservice.dealOk(sddto);
		 
		 //seller 단어 정리
		 String seller =sddto.getSeller().trim();
		 sddto.setSeller(seller);
		 
		 //단어 넣고 돌리기
		 System.out.println("dealOk 시 결과값은 ?  :" + sdresult);
		 return String.valueOf(sdresult);
		 
	 }
	 
		
		 @ResponseBody
		 
		 @RequestMapping("dealCancel")
		 public int dealCancel(int iseq) {
			 
			 System.out.println("삭제하려는 상품은 ? : " + iseq );
			 //해당 회원의 모든 거래내역 
			 SafeDealDTO sddto = sdservice.selectAllDealOkBySeq(iseq); 
			
			 System.out.println(" dealCancel 의 iseq 는 ? :"+sddto.getItems_no());
			 int sdresult = sdservice.dealCancel(sddto);
			 
			 
			System.out.println("dealCancel 의 결과값은? " + sdresult);
			 
			 
			 
			 return  sdresult;
			 
		 }
		 
	 
	 
	

}
