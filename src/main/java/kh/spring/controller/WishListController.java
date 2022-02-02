package kh.spring.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kh.spring.dto.ItemsDTO;
import kh.spring.service.FilesService;
import kh.spring.service.ItemsService;
import kh.spring.service.MemberService;
import kh.spring.service.WishListService;

@Controller
@RequestMapping("/wishlist/")
public class WishListController {
   @Autowired
   public MemberService mservice;
   @Autowired
   public ItemsService iservice;
   @Autowired
   public FilesService fservice;
   @Autowired
   public WishListService wlservice; 
   

   @Autowired
   private HttpSession session;
   
    //찜하기 기능 추가
      @RequestMapping("checkwishlist")
      @ResponseBody
      public int checkwishlist(String seller,String iseq) {
         String buyer = (String)session.getAttribute("loginID");
         System.out.println("판매자아이디도착1"+seller+"구매자아이디1"+buyer+"상품 이름:"+iseq);
         int result = wlservice.checkwishlist(seller,buyer,iseq); 
         System.out.println("결과값1:"+result);
         return result; 
      }
      
      //detail 에서 사용할 좋아요 개수
      @ResponseBody
      @RequestMapping("reCount")
      public int recount(int iseq) {
    	
	      int wishCount=wlservice.wishListCountDetail(iseq);

    	  return wishCount;
      }
      
      //mypage 에서 사용할 좋아요 개수
      @ResponseBody
      @RequestMapping("reMycount")
      public int reMycount() {
    	  
    	  String id =(String)session.getAttribute("loginID");
    	  
    	  int result = wlservice.wishListCountMypage(id);
    	  
    	  return result;
      }
      
    //찜하기 기능 추가
      @RequestMapping("addwishlist")
      @ResponseBody
      public int addwishlist(String seller,String iseq) {
         String buyer = (String)session.getAttribute("loginID");
         System.out.println("판매자아이디도착2"+seller+"구매자아이디2"+buyer+"상품 이름:"+iseq);
         int result = wlservice.addwishlist(seller,buyer,iseq); 
         System.out.println("DB입력성공2"+result);
         return result; 
      }
      //찜목록 삭제
      @RequestMapping("deletewishlist")
      @ResponseBody
      public int deletewishlist(String seller,String iseq) {
         String buyer = (String)session.getAttribute("loginID");
         System.out.println("판매자아이디도착3"+seller+"구매자아이디3"+buyer+"상품 이름:"+iseq);
         int result = wlservice.deletewishlist(seller,buyer,iseq); 
         System.out.println("DB입력성공3"+result);
         
         
         
         
         //수정중
         
         
         return result; 
      }
      //찜목록 리스트
      @RequestMapping("rewishlist")
      @ResponseBody
      public int wishlist(Model model) {
         System.out.println("잘 도착>?");
         
         String id = (String)session.getAttribute("loginID");
       
         List<ItemsDTO> wishlist = new ArrayList<ItemsDTO>();
         wishlist = wlservice.mywishList(id);
         model.addAttribute("wlist",wishlist);
      
         return 1; 
      }
      


}