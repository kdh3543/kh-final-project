package kh.spring.dto;

public class GraphDTO {
	private String count;
	private String month;
	
	

	public GraphDTO() {
	}


	public GraphDTO(String count, String month) {
		super();
		this.count = count;
		this.month = month;
	}
	
	public String getCount() {
		return count;
	}

	public void setCount(String count) {
		this.count = count;
	}

	public String getMonth() {
		return month;
	}

	public void setMonth(String month) {
		this.month = month;
	}
}
