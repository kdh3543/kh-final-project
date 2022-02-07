package kh.spring.dto;

public class PriceRangeDTO {

	private int iseq;
	private String name;
	private String price;
	private String sellerID;
	private String price_range;
	public PriceRangeDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public PriceRangeDTO(int iseq, String name, String price, String sellerID, String price_range) {
		super();
		this.iseq = iseq;
		this.name = name;
		this.price = price;
		this.sellerID = sellerID;
		this.price_range = price_range;
	}
	public int getIseq() {
		return iseq;
	}
	public void setIseq(int iseq) {
		this.iseq = iseq;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getSellerID() {
		return sellerID;
	}
	public void setSellerID(String sellerID) {
		this.sellerID = sellerID;
	}
	public String getPrice_range() {
		return price_range;
	}
	public void setPrice_range(String price_range) {
		this.price_range = price_range;
	}
	
	
	
}