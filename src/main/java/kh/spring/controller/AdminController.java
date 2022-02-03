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
	 
	 @RequestMapping("selectProc")
	 public String selectProc(String selectedVal, Model model) {
		 List<BoardDTO> selectList = bservice.selectBySubject(selectedVal);
		 model.addAttribute("selectList",selectList);
		 return "redirect:/admin/adminIndex";
	 }
	 

}
