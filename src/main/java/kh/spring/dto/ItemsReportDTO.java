package kh.spring.dto;

import java.sql.Date;
import java.sql.Timestamp;

public class ItemsReportDTO {
	private int iseq;
	private String name;
	private String category;	
	private String exarea;
	private String condition;
	private String refundable;
	private String price;
	private String info;
	private Timestamp write_date;	
	private String tag;
	private int cnt;
	private String sellerID;
	private String buyerID;
	private String deal;
	private String deal2;
	private int like_cnt;
	private int view_cnt;
	private String items_img1;
	private String items_img2;
	private String items_img3;
	private int seq;
	private String buyerid_1;
	private String sellerid_1;
	private int iseq_1;
	private String reason;
	private Date report_date;
	public ItemsReportDTO(int iseq, String name, String category, String exarea, String condition, String refundable,
			String price, String info, Timestamp write_date, String tag, int cnt, String sellerID, String buyerID,
			String deal, String deal2, int like_cnt, int view_cnt, String items_img1, String items_img2,
			String items_img3, int seq, String buyerid_1, String sellerid_1, int iseq_1, String reason,
			Date report_date) {
		super();
		this.iseq = iseq;
		this.name = name;
		this.category = category;
		this.exarea = exarea;
		this.condition = condition;
		this.refundable = refundable;
		this.price = price;
		this.info = info;
		this.write_date = write_date;
		this.tag = tag;
		this.cnt = cnt;
		this.sellerID = sellerID;
		this.buyerID = buyerID;
		this.deal = deal;
		this.deal2 = deal2;
		this.like_cnt = like_cnt;
		this.view_cnt = view_cnt;
		this.items_img1 = items_img1;
		this.items_img2 = items_img2;
		this.items_img3 = items_img3;
		this.seq = seq;
		this.buyerid_1 = buyerid_1;
		this.sellerid_1 = sellerid_1;
		this.iseq_1 = iseq_1;
		this.reason = reason;
		this.report_date = report_date;
	}
	public ItemsReportDTO() {
		super();
		// TODO Auto-generated constructor stub
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
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getExarea() {
		return exarea;
	}
	public void setExarea(String exarea) {
		this.exarea = exarea;
	}
	public String getCondition() {
		return condition;
	}
	public void setCondition(String condition) {
		this.condition = condition;
	}
	public String getRefundable() {
		return refundable;
	}
	public void setRefundable(String refundable) {
		this.refundable = refundable;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	public Timestamp getWrite_date() {
		return write_date;
	}
	public void setWrite_date(Timestamp write_date) {
		this.write_date = write_date;
	}
	public String getTag() {
		return tag;
	}
	public void setTag(String tag) {
		this.tag = tag;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public String getSellerID() {
		return sellerID;
	}
	public void setSellerID(String sellerID) {
		this.sellerID = sellerID;
	}
	public String getBuyerID() {
		return buyerID;
	}
	public void setBuyerID(String buyerID) {
		this.buyerID = buyerID;
	}
	public String getDeal() {
		return deal;
	}
	public void setDeal(String deal) {
		this.deal = deal;
	}
	public String getDeal2() {
		return deal2;
	}
	public void setDeal2(String deal2) {
		this.deal2 = deal2;
	}
	public int getLike_cnt() {
		return like_cnt;
	}
	public void setLike_cnt(int like_cnt) {
		this.like_cnt = like_cnt;
	}
	public int getView_cnt() {
		return view_cnt;
	}
	public void setView_cnt(int view_cnt) {
		this.view_cnt = view_cnt;
	}
	public String getItems_img1() {
		return items_img1;
	}
	public void setItems_img1(String items_img1) {
		this.items_img1 = items_img1;
	}
	public String getItems_img2() {
		return items_img2;
	}
	public void setItems_img2(String items_img2) {
		this.items_img2 = items_img2;
	}
	public String getItems_img3() {
		return items_img3;
	}
	public void setItems_img3(String items_img3) {
		this.items_img3 = items_img3;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getBuyerid_1() {
		return buyerid_1;
	}
	public void setBuyerid_1(String buyerid_1) {
		this.buyerid_1 = buyerid_1;
	}
	public String getSellerid_1() {
		return sellerid_1;
	}
	public void setSellerid_1(String sellerid_1) {
		this.sellerid_1 = sellerid_1;
	}
	public int getIseq_1() {
		return iseq_1;
	}
	public void setIseq_1(int iseq_1) {
		this.iseq_1 = iseq_1;
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
