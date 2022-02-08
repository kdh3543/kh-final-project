package kh.spring.dto;

import java.sql.Date;

public class CountUploadItemsDTO {
	
	private int count;
	private String write_date;
	public CountUploadItemsDTO(int count, String write_date) {
		super();
		this.count = count;
		this.write_date = write_date;
	}
	public CountUploadItemsDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public String getWrite_date() {
		return write_date;
	}
	public void setWrite_date(String write_date) {
		this.write_date = write_date;
	}
	
	
	

}
