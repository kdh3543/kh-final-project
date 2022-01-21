package kh.spring.dto;

import java.security.Timestamp;

public class ChatContentsDTO {
	private int contentsId;
	private Timestamp createTime;
	private Timestamp updateTime;
	private String chatContents;
	private int roomId;
	private String sellerId;
	private String buyerId;
	private char contentCheck;
	
	public ChatContentsDTO() {}

	public ChatContentsDTO(int contentsId, Timestamp createTime, Timestamp updateTime, String chatContents, int roomId,
			String sellerId, String buyerId, char contentCheck) {
		super();
		this.contentsId = contentsId;
		this.createTime = createTime;
		this.updateTime = updateTime;
		this.chatContents = chatContents;
		this.roomId = roomId;
		this.sellerId = sellerId;
		this.buyerId = buyerId;
		this.contentCheck = contentCheck;
	}

	public int getContentsId() {
		return contentsId;
	}

	public void setContentsId(int contentsId) {
		this.contentsId = contentsId;
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

	public String getChatContents() {
		return chatContents;
	}

	public void setChatContents(String chatContents) {
		this.chatContents = chatContents;
	}

	public int getRoomId() {
		return roomId;
	}

	public void setRoomId(int roomId) {
		this.roomId = roomId;
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

	public char getContentCheck() {
		return contentCheck;
	}

	public void setContentCheck(char contentCheck) {
		this.contentCheck = contentCheck;
	}
	
}
