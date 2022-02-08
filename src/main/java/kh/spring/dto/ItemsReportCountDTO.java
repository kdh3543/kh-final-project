package kh.spring.dto;

public class ItemsReportCountDTO {
	
	private String iseq;
	private String count;
	public ItemsReportCountDTO(String iseq, String count) {
		super();
		this.iseq = iseq;
		this.count = count;
	}
	public ItemsReportCountDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getIseq() {
		return iseq;
	}
	public void setIseq(String iseq) {
		this.iseq = iseq;
	}
	public String getCount() {
		return count;
	}
	public void setCount(String count) {
		this.count = count;
	}

	
	
	
	
	
	
	

}
