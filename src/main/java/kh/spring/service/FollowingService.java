package kh.spring.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.dao.FollowingDAO;
import kh.spring.dto.FollowDTO;
import kh.spring.dto.MemberDTO;

@Service
public class FollowingService {
    @Autowired
      public FollowingDAO fwdao;
      
      @Autowired
      private HttpSession session;
      
      public int followCheck(String sellerID, String followingID){
           
         return fwdao.followCheck(sellerID,followingID);
      }
      //팔로우 목록 체크
      public int followedCheck(String sellerID, String followedID){
            System.out.println("서비스도착"+sellerID+" : "+followedID);
         return fwdao.followedCheck(sellerID,followedID);
      }

   public int unfollow(String sellerID, String followingID) {
      
      return fwdao.unfollow(sellerID,followingID);
   }
   
   // 내가 팔로잉 했을때
   public int follow(String sellerID, String followingID) {
	   System.out.println("Following 서비스 : follow 잘 도착");
      return fwdao.follow(sellerID, followingID);
   }
   //팔로잉한 상대의 myfollower 업데이트
   public int updateFollowing(String sellerID, String followingID) {
	   System.out.println("Following 서비스 : updateFollowing 잘도착");
		return fwdao.updateFollowing(sellerID,followingID);		
	}
   //내가 팔로우 사람들
   public List<MemberDTO> selectfollowing(String id) {
      System.out.println(id+"selectfollowingService잘도착했습니다.");
      return fwdao.selectFollowing(id);
   }
   //내가 팔로우한 사람들 수
   public int followingCount(String id) {
      return fwdao.followingCount(id);      
   }
   //나를 팔로우한 사람들 목록
   public List<MemberDTO> selectfollowed(String id) {
      
      return fwdao.selectfollowed(id);
   }
   //나를 팔로우한 사람들 수
   public int followedCount(String id) {
      
      return fwdao.followedCount(id);
   }
   //나를 팔로우 한 사람 삭제
   public int unfollowed(String sellerID, String followedID) {
	   System.out.println("Following 서비스 : delFollowingUpdate 잘 도착!");
      return fwdao.unfollowed(sellerID,followedID);
   }
   //삭제한 사람 myfollower 업데이트
   public int delFollowingUpdate(String sellerID, String followingID) {
	   System.out.println("Following 서비스 : delFollowingUpdate 잘 도착!");
		return fwdao.delFollowingUpdate(sellerID,followingID);	
	}
   //나를 팔로우 한 사람 다시 추가
   public int followed(String sellerID, String followedID) {
      return fwdao.followed(sellerID, followedID);
   }
   public List<MemberDTO> selectfid(String id) {
      return fwdao.selectfid(id);
   }
   
   //storelist 뿌려줄 팔로워수
public List<FollowDTO> followCountAll() {
    return fwdao.followCountAll();
}


   
//   public List<followDTO> followSid(String id){
//      return fwdao.selectSid(id);
//   }

}