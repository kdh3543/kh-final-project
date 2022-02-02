package kh.spring.service;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.servlet.http.HttpServletRequest;
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
		if(!file.isEmpty()) { //  업로드 된 파일 중 첫번째 파일이 비어있지 않다면,

			String realPath = session.getServletContext().getRealPath("");
			File realPathFile = new File(realPath);
			if(!realPathFile.exists()) {
				realPathFile.mkdir();
			}
			String oriName = file.getOriginalFilename();
			String sysName = "/signup/"+UUID.randomUUID()+"_"+ oriName;

			file.transferTo(new File(realPath+"/"+sysName));
			dto.setProfile_image(sysName);
		}
		//비밀번호 암호화 작업
		String encPw = EncryptionUtils.getSHA512(dto.getPw());
		dto.setPw(encPw);
		return mdao.insert(dto);
	}
	//kakao회원 정보 입력
	public int kakaoinsert(MemberDTO dto)throws Exception{
		return mdao.kakaoinsert(dto);
	}
	//이미 가입한 카카오 회원
	public MemberDTO selectBykakaoemail(String kakaoemail) {
		return mdao.selectBykakaoemail(kakaoemail);
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
		int result =  mdao.login(logid, logpw);
		if(result!=1) {
			result = 0;
			return result;
		}
		return result;
	}
	//회원 정보 수정
	public int modify(MemberDTO dto,MultipartFile file) throws Exception{
		
		
		if(!file.isEmpty()) { //  업로드 된 파일 중 첫번째 파일이 비어있지 않다면,

		String realPath = session.getServletContext().getRealPath("");
		File realPathFile = new File(realPath);
		if(!realPathFile.exists()) {
			realPathFile.mkdir();
		}
		String oriName = file.getOriginalFilename();
		String sysName = "/signup/"+UUID.randomUUID()+"_"+ oriName;

		file.transferTo(new File(realPath+"/"+sysName));
		dto.setProfile_image(sysName);
		}
		
		System.out.println(dto.getProfile_image()+"사진 정보수정완료");
		
		//비번 수정 안했을때 암호화 x 
		if(dto.getPw().length()<16) {
			String encPw = EncryptionUtils.getSHA512(dto.getPw());
			dto.setPw(encPw);
			
		}
		
		
		
		
		return mdao.modify(dto);
	}
	//가입 날짜
	public int signDate(String id) {
		return mdao.signDate(id);
	}
	//카카오 기존 회원 여부 확인
	public int selectBykakao(String kakaoemail) {
		return mdao.selectBykakao(kakaoemail);
	}
	//ID 찾기
	public MemberDTO selectID(String email,String phone) {
		return mdao.selectID(email,phone);
	}
	//id존재여부확인
	public int selectIDexist(String email,String phone) {
		return mdao.selectIDexist(email, phone);
	}
	//아이디 이메일 일치 여부
	public int AccountExist(String inputID,String inputEmail) {
		System.out.println(inputID+"Service");
		System.out.println(inputEmail+"Service");
		int result = mdao.AccountExist(inputID, inputEmail);
		if(result<1) {
			result=0;
			return result;
		}
		return result;
	}
	//비밀번호 변경
	public int updatePw(String pw, String id) {
		String encpw = EncryptionUtils.getSHA512(pw);
		return mdao.updatePw(encpw,id);
	}

	// 모든 회원 찾기 
	public List<MemberDTO> selectAll() {
		return mdao.selectAll();
	}

	// 관리자 계정에서 계정 탈퇴
	public int deleteBySeq(int seq) {
		return mdao.deleteBySeq(seq);
	}

	//detail 에서 보여줄 오른쪽하단 상점정보
	
	public MemberDTO selectByIseq(int iseq) {
		return mdao.selectByIseq(iseq);
	}
	

}