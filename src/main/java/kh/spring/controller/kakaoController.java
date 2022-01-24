package kh.spring.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kh.spring.dto.MemberDTO;
import kh.spring.service.MemberService;
import kh.spring.service.kakaoService;

@Controller
public class kakaoController {
	 @Autowired
	    private kakaoService kakaoService;
	 
	 @Autowired
	 private MemberService mservice;
	 @Autowired
	 private HttpSession session;

	    @RequestMapping("/kakaologin")
	    public String home(@RequestParam(value = "code", required = false) String code,Model model) throws Exception{
	    	System.out.println("넘어온 정보" + code);
	        String access_Token = kakaoService.getAccessToken(code);
	        HashMap<String, Object> userInfo = kakaoService.getUserInfo(access_Token);
	        System.out.println("토큰: " + access_Token);
	        System.out.println("이메일 값 : " + userInfo.get("email"));
	        String kakaoemail = (String) userInfo.get("email");
	        String profile_image = (String) userInfo.get("profile_image");

	        System.out.println("프로필 사진 : " + userInfo.get("profile_image"));
	        
	        if(access_Token !=null) {
	        	
	        	int result = mservice.selectBykakao(kakaoemail);
	        	if(result>0) {
	        		MemberDTO dto1 =  mservice.selectBykakaoemail(kakaoemail);
	        		String id = dto1.getId();
	        		session.setAttribute("loginID", id);
	        		String id1 = (String)session.getAttribute("loginID");
	        		MemberDTO dto = mservice.select(id1);
	        		
	        		model.addAttribute("dto",dto);
	        		
	        		
	        	}else {
	        		model.addAttribute("kakaoemail",kakaoemail);
	        		model.addAttribute("profile_image",profile_image);
	        		return "/member/kakaoLogin";
	        	}
	        }
	        return "forward:/items/";
	        
	        // 만약에 카카오 로그인으로 가입한 사람의 경우 index로 보내
	        // 카카오로 최초 로그인한 경우 필수 가입정보 입력
	    }
	    
	

	
	 
}
