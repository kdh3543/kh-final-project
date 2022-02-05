package kh.spring.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kh.spring.dto.BoardDTO;
import kh.spring.dto.GraphDTO;
import kh.spring.dto.MemberDTO;
import kh.spring.service.BoardService;
import kh.spring.service.MemberService;

@Controller
@RequestMapping("/admin/")
public class AdminController {
	
	@Autowired
	public MemberService mservice;
	
	@Autowired
	public BoardService bservice;
	
	
	@Autowired
	private HttpSession session;
	
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
			
		System.out.println(monthList.get(0));
		System.out.println(countMember);
	
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
