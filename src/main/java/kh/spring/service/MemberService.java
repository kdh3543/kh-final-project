package kh.spring.service;

import java.io.File;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kh.spring.dao.MemberDAO;
import kh.spring.dto.MemberDTO;
import kh.spring.utils.EncryptionUtils;

@Service
public class MemberService {
	
	@Autowired
	public MemberDAO mdao;
	
	@Autowired
	private HttpSession session;
	//id중복체크
	public int idCheck(String id) throws Exception{
		return mdao.idCheck(id);
	}
	//회원가입 정보 입력
	public int insert(MemberDTO dto,MultipartFile file) throws Exception{
		String realPath = session.getServletContext().getRealPath("signup");
		File realPathFile = new File(realPath);
		if(!realPathFile.exists()) {
			realPathFile.mkdir();
		}
		String oriName = file.getOriginalFilename();
		String sysName = UUID.randomUUID()+"_"+ oriName;
		
		file.transferTo(new File(realPath+"/"+sysName));
		dto.setProfile_image(sysName);
	
		//비밀번호 암호화 작업
		String encPw = EncryptionUtils.getSHA512(dto.getPw());
		dto.setPw(encPw);
		return mdao.insert(dto);
	}
	//아이디로 찾기
	public MemberDTO select(String id){
		return mdao.select(id);
	}
	//아이디 삭제
	public int delete(String id) {
		return mdao.delete(id);
	}
	//로그인하기
	public int login(String logid, String logpw) {
		return mdao.login(logid, logpw);
	}
	//회원 정보 수정
	public int modify(MemberDTO dto) {
		return mdao.modify(dto);
	}
}
