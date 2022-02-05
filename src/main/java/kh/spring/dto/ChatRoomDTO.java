package kh.spring.dto;

import java.sql.Timestamp;

public class ChatRoomDTO {
	private int roomId;
	private Timestamp createTime;
	private Timestamp updateTime;
	private char sellerStatus;
	private char buyerStatus;
	private String sellerId;
	private String buyerId;
	private int productId;
	private String productName;
	private String lastMessage;
	private String latestDate;
	private String chatImg;
	
	public ChatRoomDTO() {}

	public ChatRoomDTO(int roomId, Timestamp createTime, Timestamp updateTime, char sellerStatus, char buyerStatus,
			String sellerId, String buyerId, int productId, String productName) {
		super();
		this.roomId = roomId;
		this.createTime = createTime;
		this.updateTime = updateTime;
		this.sellerStatus = sellerStatus;
		this.buyerStatus = buyerStatus;
		this.sellerId = sellerId;
		this.buyerId = buyerId;
		this.productId = productId;
		this.productName = productName;
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

	public String getSellerId() {
		return sellerId;
	}

	public void setSellerId(String sellerId) {
		this.sellerId = sellerId;
	}

	public String getBuyerId() {
		return buyerId;
	}

	public void setBuyerId(String buyerId) {
		this.buyerId = buyerId;
	}

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}
	
	public String getLastMessage() {
		return lastMessage;
	}
	
	public void setLastMessage(String lastMessage) {
		this.lastMessage = lastMessage;
	}
	
	public void setLatestDate(String latestDate) {
		this.latestDate = latestDate;
	}
	public String getLatestDate() {
		return latestDate;
	}
	
	public void setChatImg(String chatImg) {
		this.chatImg = chatImg;
	}
	
	public String getChatImg() {
		return chatImg;
	}
	
}


