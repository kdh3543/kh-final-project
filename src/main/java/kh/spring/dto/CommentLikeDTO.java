package kh.spring.dto;

public class CommentLikeDTO {
	private int comment_like_seq; // 시퀀스
	private int comment_seq; // 게시물 시퀀스
	private String user_id; // 사용자 아이디

	public CommentLikeDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public CommentLikeDTO(int comment_like_seq, int comment_seq, String user_id) {
		super();
		this.comment_like_seq = comment_like_seq;
		this.comment_seq = comment_seq;
		this.user_id = user_id;
	}

	public int getComment_like_seq() {
		return comment_like_seq;
	}

	public void setComment_like_seq(int comment_like_seq) {
		this.comment_like_seq = comment_like_seq;
	}

	public int getComment_seq() {
		return comment_seq;
	}

	public void setComment_seq(int comment_seq) {
		this.comment_seq = comment_seq;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

}
