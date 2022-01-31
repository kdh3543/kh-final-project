package kh.spring.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.spring.dto.MemberDTO;
import kh.spring.service.MemberService;

@Controller
@RequestMapping("/admin/")
public class AdminController {
	
	@Autowired
	public MemberService mservice;
	
	@Autowired
	private HttpSession session;
	
	@RequestMapping("adminIndex")
	public String adminIndex(Model model) {
		
		List<MemberDTO> list = mservice.selectAll();
		model.addAttribute("list", list);
		
		return "/admin/adminIndex";
		
		
	}
	
	 @RequestMapping("leave")
	   public String leave(String seqNum) {
		 int seq = Integer.parseInt(seqNum);
	      int result = mservice.deleteBySeq(seq);
	      System.out.println("회원이 탈퇴되었습니다.");
	      return "forward:/admin/adminIndex";
	   }
}
