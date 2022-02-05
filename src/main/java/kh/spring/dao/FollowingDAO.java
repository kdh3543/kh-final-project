package kh.spring.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.dto.FollowDTO;
import kh.spring.dto.MemberDTO;

@Repository
public class FollowingDAO {
   
   @Autowired
      private SqlSessionTemplate mybatis;
   
   public int followCheck(String sellerID , String followingID) {
      
       Map<String,String> map = new HashMap<String,String>();
         map.put("sellerID", sellerID);
         map.put("followingID", followingID);   
      return mybatis.selectOne("follow.followCheck", map);
   }
   // 팔로우 체크
   public int followedCheck(String sellerID , String followedID) {
       System.out.println("DAO도착1"+sellerID+" : "+followedID);
       Map<String,String> map = new HashMap<String,String>();
         map.put("sellerID", sellerID);
         map.put("followedID", followedID);   
      return mybatis.selectOne("follow.followedCheck", map);
   }

   public int unfollow(String sellerID, String followingID) {
       System.out.println("DAO도착2"+sellerID+" : "+followingID);
      Map<String,String> map = new HashMap<String,String>();
         map.put("sellerID", sellerID);
         map.put("followingID", followingID);   
      return mybatis.delete("follow.unfollow", map);
   }
   
   public int follow(String sellerID, String followingID) {
       System.out.println("DAO도착3"+sellerID+" : "+followingID);
      Map<String,String> map = new HashMap<String,String>();
         map.put("sellerID", sellerID);
         map.put("followingID", followingID);   
      return mybatis.insert("follow.follow", map);
   }

   public List<MemberDTO> selectFollowing(String id) {
         System.out.println(id+"selectfollowingDAO잘도착했습니다.");
         return mybatis.selectList("follow.selectFollowing",id);
      }

   public int followingCount(String id) {
      System.out.println("DAO 잘도착 : " + id);
      return mybatis.selectOne("follow.followingCount",id);
   }

   public List<MemberDTO> selectfollowed(String id) {
      
      return mybatis.selectList("follow.selectFollowed",id);
   }

   public int followedCount(String id) {
      
      return mybatis.selectOne("follow.followedCount",id);
   }
   //팔로우 삭제
   public int unfollowed(String sellerID, String followedID) {
       System.out.println("DAO도착3"+sellerID+" : "+followedID);
         Map<String,String> map = new HashMap<String,String>();
            map.put("sellerID", sellerID);
            map.put("followedID", followedID);   
         return mybatis.delete("follow.unfollowed", map);
   }
   //팔로우 다시 추가
   public int followed(String sellerID, String followedID) {
       System.out.println("DAO도착3"+sellerID+" : "+followedID);
      Map<String,String> map = new HashMap<String,String>();
         map.put("sellerID", sellerID);
         map.put("followedID", followedID);   
      return mybatis.insert("follow.followed", map);
   }
   public List<MemberDTO> selectfid(String id) {
      
      return mybatis.selectList("follow.selectfid",id);
   }
public List<FollowDTO> followCountAll() {
    return mybatis.selectList("follow.followCountAll");

}
   
   
//   public List<FollowDTO> selectSid(String id){
//      return mybatis.selectList("follow.followid",id);
//   }

}