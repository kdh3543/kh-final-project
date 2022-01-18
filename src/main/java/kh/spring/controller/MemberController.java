package kh.spring.controller;

import java.io.File;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kh.spring.dto.MemberDTO;
import kh.spring.service.MemberService;
import kh.spring.utils.EncryptionUtils;

@Controller
@RequestMapping("/member/")
public class MemberController {
	
	@Autowired
	public MemberService mservice;
	
	@Autowired
	private HttpSession session;
	
	//아이디 중복체크
	@ResponseBody
	@RequestMapping(value = "idCheck",produces="text/html;charset=utf8")
	public String idCheck(String id) throws Exception{	
	int result = mservice.idCheck(id);
		return String.valueOf(result);
	}
	//회원가입 정보 입력 
	@RequestMapping("signup")
	public String signup(MemberDTO dto,MultipartFile file) {
		try {

			int result = mservice.insert(dto,file);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/";
	}
	
	//로그인 기능
	@RequestMapping("login")
	public String login(String logid, String logpw ,Model model) {
		logpw = EncryptionUtils.getSHA512(logpw);
		int result = mservice.login(logid,logpw);
		
		//로그인 성공 시
		if(result>0) {
			session.setAttribute("loginID", logid);
			String id = (String)session.getAttribute("loginID");
			
			MemberDTO dto = mservice.select(id);
			
			model.addAttribute("dto", dto);
	
		}

		return "index";
	}
	//로그아웃 기능
	@RequestMapping("logout")
	public String logout() {
		session.invalidate();
		System.out.println("로그아웃 되었습니다.");
		return "redirect:/";
	}
	//회원탈퇴 기능
	@RequestMapping("leave")
	public String leave() {
		String id = (String)session.getAttribute("loginID");
		int result = mservice.delete(id);
		session.invalidate();
		System.out.println("회원이 탈퇴되었습니다.");
		return "redirect:/";
	}
	//마이페이지 이동기능
	@RequestMapping("mypage")
	public String mypage(Model model) {
		String id = (String)session.getAttribute("loginID");
		MemberDTO dto = mservice.select(id);
		model.addAttribute("dto", dto);
		return "/member/myPage";
	}
}
