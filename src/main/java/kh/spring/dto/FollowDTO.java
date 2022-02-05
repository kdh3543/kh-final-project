package kh.spring.dto;

public class FollowDTO {
   private String sellerID;
   private String followingID;
   public FollowDTO() {
      super();
      
   }
   public FollowDTO(String sellerID, String followingID) {
      super();
      this.sellerID = sellerID;
      this.followingID = followingID;
   }
   public String getSellerID() {
      return sellerID;
   }
   public void setSellerID(String sellerID) {
      this.sellerID = sellerID;
   }
   public String getFollowingID() {
      return followingID;
   }
   public void setFollowingID(String followingID) {
      this.followingID = followingID;
   }
}