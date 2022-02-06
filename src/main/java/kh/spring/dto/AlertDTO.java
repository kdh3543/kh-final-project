package kh.spring.dto;

public class AlertDTO {
	private int seq;
	private String buyer;
	private String seller;
	private int items_no;
	
	public AlertDTO() {}

	public AlertDTO(int seq, String buyer, String seller, int items_no) {
		super();
		this.seq = seq;
		this.buyer = buyer;
		this.seller = seller;
		this.items_no = items_no;
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
	
	
}
