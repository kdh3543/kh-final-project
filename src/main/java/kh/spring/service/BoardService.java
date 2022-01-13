package kh.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.dao.BoardDAO;
import kh.spring.dto.BoardDTO;

@Service
public class BoardService {

	@Autowired
	private BoardDAO dao;
	
	// 전체 게시글 리스트
	public List<BoardDTO> selectAll() {
		return dao.selectAll();
	}

	// 신규 게시글 삽입
	public int insert(BoardDTO dto) {
		return dao.insert(dto);
	}

	// 시퀀스로 검색
	public BoardDTO selectBySeq(int seq) {
		return dao.selectBySeq(seq);
	}

	// 시퀀스로 삭제
	public int delete(int seq) {
		return dao.delete(seq);
	}
	
	// 게시글 수정
	public int modify(BoardDTO dto) {
		return dao.modify(dto);
	}
}
