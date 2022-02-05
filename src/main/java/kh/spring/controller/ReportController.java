package kh.spring.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.spring.dto.ReportDTO;
import kh.spring.service.FilesService;
import kh.spring.service.FollowingService;
import kh.spring.service.ItemsService;
import kh.spring.service.MemberService;
import kh.spring.service.ReportService;
import kh.spring.service.SearchService;
import kh.spring.service.WishListService;

@Controller
@RequestMapping("/report/")
public class ReportController {

	
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
	
	
	
	@RequestMapping("itemsReport")
	public String itemsReport(ReportDTO dto,Model model) {
	
	
//		신고시 접수
		System.out.println("reason :"+dto.getReason());
		System.out.println("iseq :"+dto.getIseq());
		System.out.println("buyer :"+dto.getBuyerid());
		System.out.println("seller :"+dto.getSellerid());
		
		int insertReport = rservice.insertReport(dto);
		
		int iseq = dto.getIseq();
		
		
	
		return "redirect:/items/itemsDetail?iseq="+iseq;
	}


}
