package kh.spring.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
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
   //kakao 회원가입 
   @RequestMapping("kakaosignup")
   public String kakaosignup(MemberDTO dto1,Model model) {
      String kakaoid = dto1.getId();
      dto1.setId(kakaoid);
      String kakao = dto1.getEmail();
      dto1.setKakao(kakao);
      try {
         int result = mservice.kakaoinsert(dto1);
         if(result>0) {
            session.setAttribute("loginID", kakaoid);
            String id = (String)session.getAttribute("loginID");
            
            MemberDTO dto = mservice.select(id);
            
            model.addAttribute("dto", dto);
      
         }
         
      } catch (Exception e) {
         e.printStackTrace();
      }
      
      return "index";
   }
   
   //로그인 기능
   @RequestMapping("login")
   public String login(String logid, String logpw ,String remember_userID, HttpServletResponse response,HttpServletRequest request,Model model) {
	   logpw = EncryptionUtils.getSHA512(logpw);
      int result = mservice.login(logid,logpw);
     
      Cookie cookie = new Cookie("logid", logid); //쿠키 생성
      cookie.setDomain("localhost");
      cookie.setPath("/signIn");
      System.out.println(logid);
      System.out.println(remember_userID);

      
      if(remember_userID != null) {
          // 체크박스 체크 된 경우
          response.addCookie(cookie); // 쿠키 저장
       }else {
          // 체크박스 체크 해제 경우
          cookie.setMaxAge(0); // 쿠키 유효시간 0으로 해서 브라우저에서 삭제
          response.addCookie(cookie);
       }
      
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
   @RequestMapping("myPage")
   public String mypage(Model model) {
      String id = (String)session.getAttribute("loginID");
      MemberDTO dto = mservice.select(id);
      //가입한지 몇일 째인지 확인
      int signDate = mservice.signDate(id);
      model.addAttribute("signDate",signDate);
      model.addAttribute("dto", dto);
      return "/member/myPage";
   }
   //마이페이지 수정기능
   @RequestMapping("modify")
   public String modify(MemberDTO dto) {
      String encPw = EncryptionUtils.getSHA512(dto.getPw());
      dto.setPw(encPw);
      int result = mservice.modify(dto);
      System.out.println("정보수정완료");
      return "home";   
   }
   @RequestMapping("findID")
   public String selectID(String email,String phone,Model model) {
      int result = mservice.selectIDexist(email, phone);
      model.addAttribute("result",result);
      if(result>0) {
         MemberDTO dto = mservice.selectID(email,phone);
         
            String id= dto.getId();
            model.addAttribute("id",id);
            model.addAttribute("dto",dto);
            return "/member/findID";
         
      }else {
         return "/member/findID";
      }
      
      
   }
   //@RequestMapping("changePw")
   
   
}