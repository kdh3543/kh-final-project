package kh.spring.dto;

public class BestSellerDTO {
	
	private String sellerid;
	private int count;
	public BestSellerDTO(String sellerid, int count) {
		super();
		this.sellerid = sellerid;
		this.count = count;
	}
	public BestSellerDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getsellerid() {
		return sellerid;
	}
	public void setsellerid(String sellerid) {
		this.sellerid = sellerid;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	

}
