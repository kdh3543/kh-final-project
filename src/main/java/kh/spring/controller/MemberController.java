package kh.spring.controller;

import java.io.File;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

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
	@RequestMapping("profileimage")
	public String profileimage(MultipartFile profile_image) throws Exception{
		String realPath = session.getServletContext().getRealPath("profileimage");
		File realPathFile = new File(realPath);
		if(!realPathFile.exists()) {realPathFile.mkdir();}
		
		String oriName = profile_image.getOriginalFilename();	// 사용자가 업로드 한 파일의 원본 이름
		String sysName = UUID.randomUUID()+"_"+oriName; // 서버쪽에 저장할 파일 이름
		// 절대로 겹치지 않는 무작위의 배열을 생성해줌
		
		//서버에 업로드되어 메모리에 적재된 파일의 내용을 어디에 저장할지 결정하는 부분
		profile_image.transferTo(new File(realPath+"/"+sysName));
		System.out.println(profile_image);
		return "redirect:/";
	}


}
