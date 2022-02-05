package kh.spring.dto;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class ItemsDTO {
	
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
	/* private int view_count; */
	

	public String getFormedDate() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd hh:mm:ss");
		return sdf.format(this.write_date.getTime());
		
	}
	
	public String getDetailDate() {
		long current_time= System.currentTimeMillis();  // 현재의 timestamp
		long write_time = this.write_date.getTime(); //글이 작성된 시점의 timestamp
		
//		System.out.println("이 글이 저장된 시간 : " + write_time);
		long time_gap = current_time - write_time;
		
		if(time_gap <60000) {  //1000 ms  1초
			
			return "1분 이내" ;
			
			
		}else if (time_gap < 300000) {
			
			return "5분 이내" ;
		}else if (time_gap < 3600000) {
			return "1시간 이내" ;
		
		}else if (time_gap<86400000) {
			return "오늘 " ;
		}else {
			return getFormedDate();
		}
		
	}

	public ItemsDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ItemsDTO(int iseq, String name, String category, String exarea, String condition, String refundable,
			String price, String info, Timestamp write_date, String tag, int cnt, String sellerID, String buyerID,
			String deal, String deal2, int like_cnt, int view_cnt, String items_img1, String items_img2,
			String items_img3) {
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

	
		
	
	
	
	
	
	
	
	
	
}
