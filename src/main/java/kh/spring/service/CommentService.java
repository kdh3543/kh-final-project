package kh.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.dao.CommentDAO;
import kh.spring.dto.CommentDTO;
import kh.spring.utils.DateParseUtils;

@Service
public class CommentService {

	@Autowired
	private CommentDAO dao;

	// 해당 게시물 전체 댓글 리스트
	public List<CommentDTO> selectBySeq(int seq) {
		List<CommentDTO> list = dao.selectBySeq(seq);
		for (CommentDTO dto : list) {
			dto.setParsed_date(DateParseUtils.parseDate(dto.getWrite_date()));
		}
		return list;
	}

	// 신규 댓글 삽입
	public int insert(CommentDTO dto) {
		return dao.insert(dto);
	}

	// 시퀀스로 댓글 삭제
	public int delete(int seq) {
		return dao.delete(seq);
	}

	// 댓글 수정
	public int modify(CommentDTO dto) {
		return dao.modify(dto);
	}

	// 댓글 좋아요
	public int like(int seq) {
		return dao.like(seq);
	}

	// 댓글 좋아요 취소
	public int dislike(int seq) {
		return dao.dislike(seq);
	}
}
