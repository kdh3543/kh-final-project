package kh.spring.dto;

import java.sql.Timestamp;

public class CommentDTO {
	private int comment_seq; // 시퀀스
	private int board_seq; // 게시물 시퀀스
	private String writer; // 작성자
	private String contents; // 내용
	private Timestamp write_date; // 작성일
	private int like_count; // 좋아요 수
	private String parsed_date;

	public CommentDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getComment_seq() {
		return comment_seq;
	}

	public void setComment_seq(int comment_seq) {
		this.comment_seq = comment_seq;
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

	public Timestamp getWrite_date() {
		return write_date;
	}

	public void setWrite_date(Timestamp write_date) {
		this.write_date = write_date;
	}

	public int getLike_count() {
		return like_count;
	}

	public void setLike_count(int like_count) {
		this.like_count = like_count;
	}

	public String getParsed_date() {
		return parsed_date;
	}

	public void setParsed_date(String parsed_date) {
		this.parsed_date = parsed_date;
	}

}
