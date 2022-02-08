package kh.spring.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.nio.charset.CharsetEncoder;
import java.util.List;
import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kh.spring.dto.FilesDTO;
import kh.spring.dto.ItemsDTO;
import kh.spring.dto.MemberDTO;
import kh.spring.service.FilesService;
import kh.spring.service.ItemsService;
import kh.spring.service.MemberService;
import kh.spring.utils.EncryptionUtils;
@Controller
@RequestMapping("/member/")
public class MemberController {

   @Autowired
   public MemberService mservice;
   @Autowired
   public ItemsService iservice;
   @Autowired
   public FilesService fservice;


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
   public void signup(MemberDTO dto,MultipartFile file,HttpServletResponse response) {
      try {

         int result = mservice.insert(dto,file);
         PrintWriter out = response.getWriter();
         response.setContentType("text/html; charset=utf-8");
         out.print("<script>alert('회원가입에 성공했습니다');location.href='/signIn';</script>");
         out.flush();
         out.close();

      } catch (Exception e) {
         e.printStackTrace();
      }
     

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

      return "redirect:/items/";
   }

   //로그인 기능
   @RequestMapping(value="login")
   public String login(String logid, String logpw ,String remember_userID,HttpServletResponse response,HttpServletRequest request,Model model) throws IOException {
      logpw = EncryptionUtils.getSHA512(logpw);
      int result = mservice.login(logid,logpw);
      System.out.println("로그인 기억 안하면 null 이옵니다 ." +remember_userID);

      //쿠키 생성
      Cookie cookie = new Cookie("logid", logid);
      cookie.setDomain("localhost");
      cookie.setPath("/signIn");

      // alert 띄우기
      response.setContentType("text/html; charset=utf-8");
      PrintWriter out = response.getWriter();
      
      if(remember_userID !=null) {
         // 체크박스 체크 된 경우
         response.addCookie(cookie); // 쿠키 저장

      }else {
         // 체크박스 체크 해제 경우
         cookie.setMaxAge(0); // 쿠키 유효시간 0으로 해서 브라우저에서 삭제
         response.addCookie(cookie);
      }
      
      
      //로그인 성공 시
      if(result > 0) {

         // 관리자 ID 넣어야만 관리자로 인식 가능

         if(logid.contains("Admin")) {
            session.setAttribute("Admin",logid);

            String id = (String)session.getAttribute("Admin");

            MemberDTO dto = mservice.select(id);

            model.addAttribute("dto", dto);
            
            
            

         }else {
            session.setAttribute("loginID", logid);

            String id = (String)session.getAttribute("loginID");

            MemberDTO dto = mservice.select(id);

            model.addAttribute("dto", dto);
            

         }

      }else {
         
 
         out.print("<script>alert('로그인에 실패했습니다!'); location.href='/signIn';</script>");
         out.flush();
         out.close();

      }
  
      return "forward:/items/";


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

   /*
    * //마이페이지 이동기능
    * 
    * @RequestMapping("myPage") public String mypage(Model model) { String id =
    * (String)session.getAttribute("loginID"); MemberDTO dto = mservice.select(id);
    * //가입한지 몇일 째인지 확인 int signDate = mservice.signDate(id);
    * model.addAttribute("signDate",signDate); model.addAttribute("dto", dto);
    * return "forward:/myPage"; }
    */
   //마이페이지 수정기능
   @RequestMapping("updateInfo")
   public String modify(MemberDTO dto,MultipartFile file) {



      try {
         System.out.println(file);
         System.out.println(dto.getId());
         System.out.println(dto.getAddress1());
         System.out.println(dto.getAddress2());
         System.out.println(dto.getZipcode());


         int result = mservice.modify(dto,file);


      } catch (Exception e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }
      System.out.println("컨트롤러 정보수정완료");
      return "redirect:/";   
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
   @RequestMapping("changePw")
   public String changePw(String inputID,String inputEmail,Model model) {
      System.out.println(inputID);
      System.out.println(inputEmail);
      int result = mservice.AccountExist(inputID, inputEmail);
      System.out.println(result);
      if(result>0) {
         String host = "smtp.naver.com";
         String user = "wishstar1998"; //자신의 네이버 계정
         String password = "1q2w3e4r!";//자신의 네이버 패스워드
         //  메일 받을 주소
         String to_email = inputEmail;
         System.out.println(to_email);
         //SMTP 서버 정보를 설정한다.
         Properties props = System.getProperties();
         props.put("mail.smtp.starttls.enable", "true");
         props.put("mail.smtp.host", host);
         props.put("mail.smtp.port", 465);
         props.put("mail.smtp.auth", "true");
         props.put("mail.smtp.ssl.enable", "true");
         props.put("mail.smtp.ssl.trust", host);
         props.put("mail.smtp.ssl.protocols","TLSv1.2");
         props.put("mail.debug", "true"); // 오류날때 debug로 확인 가능

         //인증 번호 생성기
         StringBuffer temp =new StringBuffer();
         Random rnd = new Random();
         for(int i=0;i<10;i++)
         {
            int rIndex = rnd.nextInt(3);
            switch (rIndex) {
            case 0:
               // a-z
               temp.append((char) ((int) (rnd.nextInt(26)) + 97));
               break;
            case 1:
               // A-Z
               temp.append((char) ((int) (rnd.nextInt(26)) + 65));
               break;
            case 2:
               // 0-9
               temp.append((rnd.nextInt(10)));
               break;
            }
         }
         String AuthenticationKey = temp.toString();


         Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
               return new PasswordAuthentication(user,password);
            }
         });
         //email 전송
         try {
            MimeMessage msg = new MimeMessage(session);
            msg.setFrom(new InternetAddress("wishstar1998@naver.com", "OIMarket"));
            msg.addRecipient(Message.RecipientType.TO, new InternetAddress(to_email));

            //메일 제목
            msg.setSubject("안녕하세요 오이마켓 [아이디 찾기 인증번호] 입니다.");
            //메일 내용
            msg.setText("인증 번호는 : "+temp +"입니다. ");

            Transport.send(msg);

            System.out.println("이메일 전송");
            model.addAttribute("temp",temp);
            model.addAttribute("inputID",inputID);
            model.addAttribute("inputEmail",inputEmail);
         }catch (Exception e) {
            e.printStackTrace();// TODO: handle exception
         }
         //             HttpSession saveKey = request.getSession();
         //             saveKey.setAttribute("AuthenticationKey", AuthenticationKey);
         //             saveKey.setMaxInactiveInterval(3*60); // 3분까지만 세션 저장
         //             System.out.println("이메일 전송 완료");
         //            
         //             HttpSession session1 = request.getSession();
         //             session1.setAttribute("email2", email2);
         //        
         //              response.getWriter().append(String.valueOf(result));
         //        
         //        request.getRequestDispatcher("member/findId.jsp").forward(request, response);
      }else {
         System.out.println("이메일 전송 실패");
         return "redirect:/findInfo";
      }
      return "/member/findInfo";
   }
   @RequestMapping("findPw")
   public String findPw(String inputID,Model model) {
      System.out.println(inputID+"아이디findpw");
      model.addAttribute("inputID",inputID);
      return "/member/findPw";
   }
   @RequestMapping("updatePw")
   public String updatePw(String pw, String id) {
      System.out.println(id+"아이디로 찾기");
      int result = mservice.updatePw(pw,id);
      System.out.println(result+"비밀번호 변경에 성공하였습니다.");
      return "redirect:/";
   }







}