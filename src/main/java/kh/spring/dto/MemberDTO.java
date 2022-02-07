package kh.spring.dto;

import java.sql.Timestamp;

public class MemberDTO {
	private int seq;
	private String id;
	private String pw;
	private String name;
	private String phone;
	private String email;
	private String zipcode;
	private String address1;
	private String address2;
	private Timestamp signup_date;
	private String prefer_location;
	private String profile_image;
	private int cash;
	private String login_check;
	private String kakao;
	private int view_count;
	private int myfollower;
	private int imfollowing;
	
	public MemberDTO() {
		
	}
	@Override
	public String toString() {
		return "MemberDTO [seq=" + seq + ", id=" + id + ", pw=" + pw + ", name=" + name + ", phone=" + phone
				+ ", email=" + email + ", zipcode=" + zipcode + ", address1=" + address1 + ", address2=" + address2
				+ ", signup_date=" + signup_date + ", prefer_location=" + prefer_location + ", profile_image="
				+ profile_image + ", cash=" + cash + ", login_check=" + login_check + ", kakao=" + kakao
				+ ", view_count=" + view_count + ", myfollower=" + myfollower + ", imfollowing=" + imfollowing + "]";
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getAddress1() {
		return address1;
	}
	public void setAddress1(String address1) {
		this.address1 = address1;
	}
	public String getAddress2() {
		return address2;
	}
	public void setAddress2(String address2) {
		this.address2 = address2;
	}
	public Timestamp getSignup_date() {
		return signup_date;
	}
	public void setSignup_date(Timestamp signup_date) {
		this.signup_date = signup_date;
	}
	public String getPrefer_location() {
		return prefer_location;
	}
	public void setPrefer_location(String prefer_location) {
		this.prefer_location = prefer_location;
	}
	public String getProfile_image() {
		return profile_image;
	}
	public void setProfile_image(String profile_image) {
		this.profile_image = profile_image;
	}
	public int getCash() {
		return cash;
	}
	public void setCash(int cash) {
		this.cash = cash;
	}
	public String getLogin_check() {
		return login_check;
	}
	public void setLogin_check(String login_check) {
		this.login_check = login_check;
	}
	public String getKakao() {
		return kakao;
	}
	public void setKakao(String kakao) {
		this.kakao = kakao;
	}
	public int getView_count() {
		return view_count;
	}
	public void setView_count(int view_count) {
		this.view_count = view_count;
	}
	public int getMyfollower() {
		return myfollower;
	}
	public void setMyfollower(int myfollower) {
		this.myfollower = myfollower;
	}
	public int getImfollowing() {
		return imfollowing;
	}
	public void setImfollowing(int imfollowing) {
		this.imfollowing = imfollowing;
	}
	
	
}
