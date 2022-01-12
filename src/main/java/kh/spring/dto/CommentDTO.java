package kh.spring.dto;

import java.sql.Timestamp;

public class CommentDTO {
	private int comment_seq;
	private int board_seq;
	private String writer;
	private String contents;
	private Timestamp write_date;
	private int like_count;

	public CommentDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public CommentDTO(int comment_seq, int board_seq, String writer, String contents, Timestamp write_date,
			int like_count) {
		super();
		this.comment_seq = comment_seq;
		this.board_seq = board_seq;
		this.writer = writer;
		this.contents = contents;
		this.write_date = write_date;
		this.like_count = like_count;
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

}
