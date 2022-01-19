package kh.spring.dto;

import java.security.Timestamp;

public class ChatRoomDTO {
	private int roomId;
	private Timestamp createTime;
	private Timestamp updateTime;
	private char sellerStatus;
	private char buyerStatus;
	private String buyerId;
	private String productId;
	
	public ChatRoomDTO() {}

	public ChatRoomDTO(int roomId, Timestamp createTime, Timestamp updateTime, char sellerStatus, char buyerStatus,
			String buyerId, String productId) {
		super();
		this.roomId = roomId;
		this.createTime = createTime;
		this.updateTime = updateTime;
		this.sellerStatus = sellerStatus;
		this.buyerStatus = buyerStatus;
		this.buyerId = buyerId;
		this.productId = productId;
	}

	public int getRoomId() {
		return roomId;
	}

	public void setRoomId(int roomId) {
		this.roomId = roomId;
	}

	public Timestamp getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Timestamp createTime) {
		this.createTime = createTime;
	}

	public Timestamp getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Timestamp updateTime) {
		this.updateTime = updateTime;
	}

	public char getSellerStatus() {
		return sellerStatus;
	}

	public void setSellerStatus(char sellerStatus) {
		this.sellerStatus = sellerStatus;
	}

	public char getBuyerStatus() {
		return buyerStatus;
	}

	public void setBuyerStatus(char buyerStatus) {
		this.buyerStatus = buyerStatus;
	}

	public String getBuyerId() {
		return buyerId;
	}

	public void setBuyerId(String buyerId) {
		this.buyerId = buyerId;
	}

	public String getProductId() {
		return productId;
	}

	public void setProductId(String productId) {
		this.productId = productId;
	}
	
}


