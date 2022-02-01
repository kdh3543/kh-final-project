package kh.spring.dto;

import java.sql.Timestamp;

public class ItemsQNADTO {
	private int items_qna_seq; // 시퀀스
	private int iseq; // 아이템 시퀀스
	private String writer; // 작성자
	private String contents; // 내용
	private Timestamp write_date; // 작성일
	private String parsed_date;

	public ItemsQNADTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ItemsQNADTO(int items_qna_seq, int iseq, String writer, String contents, Timestamp write_date,
			String parsed_date) {
		super();
		this.items_qna_seq = items_qna_seq;
		this.iseq = iseq;
		this.writer = writer;
		this.contents = contents;
		this.write_date = write_date;
		this.parsed_date = parsed_date;
	}

	public int getItems_qna_seq() {
		return items_qna_seq;
	}

	public void setItems_qna_seq(int items_qna_seq) {
		this.items_qna_seq = items_qna_seq;
	}

	public int getIseq() {
		return iseq;
	}

	public void setIseq(int iseq) {
		this.iseq = iseq;
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

	public String getParsed_date() {
		return parsed_date;
	}

	public void setParsed_date(String parsed_date) {
		this.parsed_date = parsed_date;
	}

}
