package kh.spring.dto;

import java.sql.Timestamp;

public class SearchKeywordDTO {
	
	private int seq;
	private String keyword;
	private Timestamp write_time;
	private String user_id;
	
	
	public SearchKeywordDTO(int seq, String keyword, Timestamp write_time, String user_id) {
		super();
		this.seq = seq;
		this.keyword = keyword;
		this.write_time = write_time;
		this.user_id = user_id;
	}


	public SearchKeywordDTO() {
		super();
		// TODO Auto-generated constructor stub
	}


	public int getSeq() {
		return seq;
	}


	public void setSeq(int seq) {
		this.seq = seq;
	}


	public String getKeyword() {
		return keyword;
	}


	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}


	public Timestamp getWrite_time() {
		return write_time;
	}


	public void setWrite_time(Timestamp write_time) {
		this.write_time = write_time;
	}


	public String getUser_id() {
		return user_id;
	}


	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	
	
	
	

	
	
}
