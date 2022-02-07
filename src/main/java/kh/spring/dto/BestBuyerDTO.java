package kh.spring.dto;

public class BestBuyerDTO {
	
	private String buyerid;
	private int count;
	public BestBuyerDTO(String buyerid, int count) {
		super();
		this.buyerid = buyerid;
		this.count = count;
	}
	public BestBuyerDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getBuyerid() {
		return buyerid;
	}
	public void setBuyerid(String buyerid) {
		this.buyerid = buyerid;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	
	

}
