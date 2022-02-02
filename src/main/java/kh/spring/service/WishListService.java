package kh.spring.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.dao.WishListDAO;
import kh.spring.dto.ItemsDTO;

@Service
public class WishListService {
   
    @Autowired
      private HttpSession session;
    @Autowired
    private WishListDAO wdao;
    //찜 정보 확인
    public int checkwishlist(String seller,String buyer,String iseq) {
       return wdao.checkwishlist(seller,buyer,iseq);
    }
    //찜 리스트 추가
    public int addwishlist(String seller,String buyer,String iseq) {
       return wdao.addwishlist(seller,buyer,iseq);
    }
   //찜 리스트 삭제
       public int deletewishlist(String seller,String buyer,String iseq) {
          return wdao.deletewishlist(seller,buyer,iseq);
       }
      public List<ItemsDTO> mywishList(String id) {
         
         return wdao.mywishList(id);
      }
      public int wishlistCount(String id) {
         
         return wdao.wishlistCount(id);
      }
      
      public int wishListCountDetail(int iseq) {
          return wdao.wishListCountDetail(iseq);

       }
	public int wishListCountMypage(String id) {
        return wdao.wishListCountMypage(id);

	}

}