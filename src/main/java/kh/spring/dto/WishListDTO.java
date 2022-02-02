package kh.spring.dto;

public class WishListDTO {
   private int seq;
   private int items_no;
   private String seller;
   private String buyer;
   
   public WishListDTO(int seq, int items_no, String seller, String buyer) {
      super();
      this.seq = seq;
      this.items_no = items_no;
      this.seller = seller;
      this.buyer = buyer;
   }
   public WishListDTO() {
      super();
      // TODO Auto-generated constructor stub
   }
   
   
   
   public int getSeq() {
      return seq;
   }
   public void setSeq(int seq) {
      this.seq = seq;
   }
   public int getItems_no() {
      return items_no;
   }
   public void setItems_no(int items_no) {
      this.items_no = items_no;
   }
   public String getSeller() {
      return seller;
   }
   public void setSeller(String seller) {
      this.seller = seller;
   }
   public String getBuyer() {
      return buyer;
   }
   public void setBuyer(String buyer) {
      this.buyer = buyer;
   }
   
   
   
}