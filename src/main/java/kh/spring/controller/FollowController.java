package kh.spring.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kh.spring.dto.FollowDTO;
import kh.spring.service.FilesService;
import kh.spring.service.FollowingService;
import kh.spring.service.ItemsService;
import kh.spring.service.MemberService;

@Controller
@RequestMapping("/follow/")
public class FollowController {

   @Autowired
   public MemberService mservice;
   @Autowired
   public ItemsService iservice;
   @Autowired
   public FilesService fservice;
   @Autowired
   public FollowingService fwservice;
   

   @Autowired
   private HttpSession session;

   // 팔로우 여부 체크
      @ResponseBody
      @RequestMapping(value = "followCheck", produces = "text/html; charset=utf8")
      public int followCheck(String sellerID, Model model) {
         System.out.println("팔로워 컨트롤러 시작 지점");
         
         System.out.println("무조건 내 아이디는 아님"+sellerID);
         String followingID = (String)session.getAttribute("loginID");
         System.out.println("무조건 내아이디임 "+followingID);
         int followCheck = fwservice.followCheck(sellerID,followingID); //추천 여부 확인, 1 추천 0 기록없음      
         System.out.println("팔로워에서 팔로우를 눌렀을 때 팔로우 여부 확인 완료 :"+followCheck);
         return followCheck;
      }
   //내가 팔로우를 누른 사람들 
   @ResponseBody
   @RequestMapping(value = "following", produces = "text/html; charset=utf8")
   public String following(String sellerID, Model model) {
      System.out.println("팔로워 컨트롤러 시작 지점");
      
      System.out.println("무조건 내 아이디는 아님"+sellerID);
      String followingID = (String)session.getAttribute("loginID");
      System.out.println("무조건 내아이디임 "+followingID);
      int followCheck = fwservice.followCheck(sellerID,followingID); //추천 여부 확인, 1 추천 0 기록없음      
      System.out.println("팔로워에서 팔로우를 눌렀을 때 팔로우 여부 확인 완료 :"+followCheck);
      if(followCheck == 1) {
         int resp = fwservice.unfollow(sellerID,followingID);
         int updateunFollowing = fwservice.updateunFollowing(sellerID,followingID);
         System.out.println("팔로워에서 팔로우 취소 완료");

         return String.valueOf(resp);
      }else{
         int resp = fwservice.follow1(sellerID,followingID);
         fwservice.updateFollowing1(sellerID, followingID);
         System.out.println("팔로워에서 팔로우 성공");

         return String.valueOf(resp);
      }
      
    
   }
   
   //detail 페이지 팔로우
   @ResponseBody
   @RequestMapping(value = "detailFollow", produces = "text/html; charset=utf8")
   public String detailFollow(String sellerID,String followingID ,Model model) {
	   
   int result =fwservice.followCheck(sellerID, followingID);
   
   if(result>0) {
	   //DB에서 삭제
	   int  resp = fwservice.unfollow(sellerID,followingID); 
	   fwservice.delFollowingUpdate(sellerID,followingID);	   
	   return String.valueOf(resp);

   }else {
	   //DB에 입력
	   //이게 상대방이 나를 팔로우중인지 체크
	    int result1 =fwservice.followCheck1(sellerID, followingID);
	    if(result1>0) {
	    	// 팔로우한 상대 myfollower 업데이트
	    	  fwservice.updateFollowing1(sellerID,followingID);
	    	// 내가 팔로우 했을때
	    	  int resp = fwservice.follow1(sellerID,followingID)+1;
	    	  return String.valueOf(resp);
	    }else {
	    	// 팔로우한 상대 myfollower 업데이트
	    	 fwservice.updateFollowing(sellerID,followingID);
	    	 //  내가 팔로우 했을때
	    	 int resp = fwservice.follow(sellerID,followingID)+1;
	    	 return String.valueOf(resp);
	    }
	   
	   
   }
	   
	   
   }
   
   //detail 페이지 팔로우 onload
   @ResponseBody
   @RequestMapping(value = "detailFCheck", produces = "text/html; charset=utf8")
   public String detailFCheck(String sellerID,String followingID ,Model model) {
	   
   int result =fwservice.followCheck(sellerID, followingID);
   
  return String.valueOf(result);
	   
   }
   
  
   @ResponseBody
   @RequestMapping("unfollowed")
   public String unfollow(String sellerID) {
	   String followedID = (String)session.getAttribute("loginID");
	      System.out.println("언팔로우드에서 팔로우 취소를 눌렀을 때 팔로우 중인지 체크");
	      System.out.println(followedID + " : " + sellerID );
	      int followedCheck = fwservice.followedCheck1(followedID,sellerID); //추천 여부 확인, 1 추천 0 기록없음   
	      System.out.println("**팔로우 중인지 체크 완료 :"+followedCheck);
	      //맞팔 상태였다면 요기로 온다..
	      if(followedCheck > 0) {
	    	fwservice.unfollowed1(followedID, sellerID);
	    	fwservice.delFollowedUpdate(followedID, sellerID);
	    	
	         String id = (String)session.getAttribute("loginID");
	         int resp = fwservice.followedCount(id);
	         return String.valueOf(resp);
	         //나만 팔로우 중이었다면 요기로 온다..
	      }else{
	    	  fwservice.unfollowed1(followedID, sellerID);
	    	  fwservice.delFollowedUpdate(followedID, sellerID);
	        	 String id = (String)session.getAttribute("loginID");
		         int resp = fwservice.followedCount(id);
	        	 return String.valueOf(resp);
 
	      }
   }
   
   
   
   
   
   
   
   
}