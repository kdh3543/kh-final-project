package kh.spring.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.dto.ItemsDTO;
@Repository
public class WishListDAO {
   @Autowired
      private SqlSessionTemplate mybatis;
   
   public int checkwishlist(String seller,String buyer,String iseq) {
       Map<String,String> map = new HashMap<String,String>();
         map.put("seller", seller);
         map.put("buyer", buyer);
         map.put("iseq", iseq);
      return mybatis.selectOne("WishList.checkList",map);
   }
   
   public int addwishlist(String seller,String buyer,String iseq) {
       Map<String,String> map = new HashMap<String,String>();
         map.put("seller", seller);
         map.put("buyer", buyer); 
         map.put("iseq", iseq);
      return mybatis.insert("WishList.addList",map);
   }
   public int deletewishlist(String seller,String buyer,String iseq) {
       Map<String,String> map = new HashMap<String,String>();
         map.put("seller", seller);
         map.put("buyer", buyer); 
         map.put("iseq", iseq);
      return mybatis.delete("WishList.deleteList",map);
   }

   public List<ItemsDTO> mywishList(String id) {
      return mybatis.selectList("WishList.mywishList",id);
   }

   public int wishlistCount(String id) {
      
      return mybatis.selectOne("WishList.wishListCount",id);
   }
   
   
   public int wishListCountDetail(int iseq) {
	      return mybatis.selectOne("WishList.wishListCountDetail",iseq);

	   }

public int wishListCountMypage(String id) {
    return mybatis.selectOne("WishList.wishListCountMypage",id);


}

}