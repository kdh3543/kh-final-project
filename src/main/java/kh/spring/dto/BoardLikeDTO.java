package kh.spring.dto;

public class BoardLikeDTO {
	private int board_like_seq; // 시퀀스
	private int board_seq; // 게시물 시퀀스
	private String user_id; // 사용자 아이디

	public BoardLikeDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public BoardLikeDTO(int board_like_seq, int board_seq, String user_id) {
		super();
		this.board_like_seq = board_like_seq;
		this.board_seq = board_seq;
		this.user_id = user_id;
	}

	public int getBoard_like_seq() {
		return board_like_seq;
	}

	public void setBoard_like_seq(int board_like_seq) {
		this.board_like_seq = board_like_seq;
	}

	public int getBoard_seq() {
		return board_seq;
	}

	public void setBoard_seq(int board_seq) {
		this.board_seq = board_seq;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

}
