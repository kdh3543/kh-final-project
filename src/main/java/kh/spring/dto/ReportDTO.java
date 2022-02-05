package kh.spring.dto;

import java.sql.Date;

public class ReportDTO {
	
	private int seq;
	private String buyerid;
	private String sellerid;
	private int iseq;
	private String reason;
	private Date report_date;
	public ReportDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ReportDTO(int seq, String buyerid, String sellerid, int iseq, String reason, Date report_date) {
		super();
		this.seq = seq;
		this.buyerid = buyerid;
		this.sellerid = sellerid;
		this.iseq = iseq;
		this.reason = reason;
		this.report_date = report_date;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getBuyerid() {
		return buyerid;
	}
	public void setBuyerid(String buyerid) {
		this.buyerid = buyerid;
	}
	public String getSellerid() {
		return sellerid;
	}
	public void setSellerid(String sellerid) {
		this.sellerid = sellerid;
	}
	public int getIseq() {
		return iseq;
	}
	public void setIseq(int iseq) {
		this.iseq = iseq;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public Date getReport_date() {
		return report_date;
	}
	public void setReport_date(Date report_date) {
		this.report_date = report_date;
	}

	
	
	
	
	
}
