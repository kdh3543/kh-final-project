package kh.spring.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


import kh.spring.dto.MemberDTO;
import kh.spring.service.MemberService;

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
	public String signup(MemberDTO dto) {
		try {
			int result = mservice.insert(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "index";
	}


}
