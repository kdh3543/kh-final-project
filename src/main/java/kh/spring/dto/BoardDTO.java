package kh.spring.dto;

import java.sql.Timestamp;

public class BoardDTO {
	private int board_seq; // 시퀀스
	private String writer; // 작성자
	private String contents; // 내용
	private String subject; // 주제(동네질문, 동네맛집, 동네소식 ...)
	private Timestamp write_date; // 작성일
	private int view_count; // 조회 수
	private int like_count; // 좋아요 수
	private int comment_count; // 댓글 수
	private String user_id; // 좋아요 한 아이디 체크

	public BoardDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public BoardDTO(int board_seq, String writer, String contents, String subject, Timestamp write_date, int view_count,
			int like_count, int comment_count, String user_id) {
		super();
		this.board_seq = board_seq;
		this.writer = writer;
		this.contents = contents;
		this.subject = subject;
		this.write_date = write_date;
		this.view_count = view_count;
		this.like_count = like_count;
		this.comment_count = comment_count;
		this.user_id = user_id;
	}

	public int getBoard_seq() {
		return board_seq;
	}

	public void setBoard_seq(int board_seq) {
		this.board_seq = board_seq;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public Timestamp getWrite_date() {
		return write_date;
	}

	public void setWrite_date(Timestamp write_date) {
		this.write_date = write_date;
	}

	public int getView_count() {
		return view_count;
	}

	public void setView_count(int view_count) {
		this.view_count = view_count;
	}

	public int getLike_count() {
		return like_count;
	}

	public void setLike_count(int like_count) {
		this.like_count = like_count;
	}

	public int getComment_count() {
		return comment_count;
	}

	public void setComment_count(int comment_count) {
		this.comment_count = comment_count;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

}
