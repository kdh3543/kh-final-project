package kh.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.dao.CommentDAO;
import kh.spring.dto.BoardDTO;
import kh.spring.dto.CommentDTO;

@Service
public class CommentService {

	@Autowired
	private CommentDAO dao;

	// 해당 게시물 전체 댓글 리스트
		public BoardDTO selectBySeq(int seq) {
			return dao.selectBySeq(seq);
		}

	// 신규 댓글 삽입
	public int insert(CommentDTO dto) {
		return dao.insert(dto);
	}
}
