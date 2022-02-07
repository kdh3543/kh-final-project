package kh.spring.dto;

public class FollowDTO {
	private String sellerID;
	private String followingID;
	private int myfollower;
	private int imfollowing;
	
	public FollowDTO() {
		
	}
	public FollowDTO(String sellerID, String followingID, int myfollower, int imfollowing) {
		super();
		this.sellerID = sellerID;
		this.followingID = followingID;
		this.myfollower = myfollower;
		this.imfollowing = imfollowing;
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
	public int getMyfollower() {
		return myfollower;
	}
	public void setMyfollower(int myfollower) {
		this.myfollower = myfollower;
	}
	public int getImfollowing() {
		return imfollowing;
	}
	public void setImfollowing(int imfollowing) {
		this.imfollowing = imfollowing;
	}


}