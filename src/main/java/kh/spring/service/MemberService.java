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
	public int insert(MemberDTO dto) throws Exception{
	
		//비밀번호 암호화 작업
		String encPw = EncryptionUtils.getSHA512(dto.getPw());
		dto.setPw(encPw);
		return mdao.insert(dto);
	}
	public MemberDTO select(String id){
		return mdao.select(id);
	}
	
	public int delete(String id) {
		return mdao.delete(id);
	}

	public int login(String logid, String logpw) {
		return mdao.login(logid, logpw);
	}

	public int modify(MemberDTO dto) {
		return mdao.modify(dto);
	}
}
