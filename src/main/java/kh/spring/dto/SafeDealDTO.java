package kh.spring.dto;

public class SafeDealDTO {
	
	private int seq;
	private String buyer;
	private String seller;
	private int items_no;
	private int cash;
	private int fee;
	public SafeDealDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public SafeDealDTO(int seq, String buyer, String seller, int items_no, int cash, int fee) {
		super();
		this.seq = seq;
		this.buyer = buyer;
		this.seller = seller;
		this.items_no = items_no;
		this.cash = cash;
		this.fee = fee;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getBuyer() {
		return buyer;
	}
	public void setBuyer(String buyer) {
		this.buyer = buyer;
	}
	public String getSeller() {
		return seller;
	}
	public void setSeller(String seller) {
		this.seller = seller;
	}
	public int getItems_no() {
		return items_no;
	}
	public void setItems_no(int items_no) {
		this.items_no = items_no;
	}
	public int getCash() {
		return cash;
	}
	public void setCash(int cash) {
		this.cash = cash;
	}
	public int getFee() {
		return fee;
	}
	public void setFee(int fee) {
		this.fee = fee;
	}
	
	
	

}
