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

	// 전체 게시글 리스트(로그인 시)
	public List<BoardDTO> selectByUser(String user_id) {
		return dao.selectByUser(user_id);
	}

	// 신규 게시글 삽입
	public int insert(BoardDTO dto) {
		return dao.insert(dto);
	}

	// 시퀀스로 게시글 검색
	public BoardDTO selectBySeq(int seq) {
		return dao.selectBySeq(seq);
	}

	// 시퀀스로 게시글 삭제
	public int delete(int seq) {
		return dao.delete(seq);
	}

	// 게시글 수정
	public int modify(BoardDTO dto) {
		return dao.modify(dto);
	}

	// 게시글 좋아요
	public int like(int seq, String user_id) {
		dao.addLikeList(seq, user_id);
		dao.addLikeCount(seq);
		return dao.getLikeCount(seq);
	}

	// 게시글 좋아요 취소
	public int dislike(int seq, String user_id) {
		dao.removeLikeList(seq, user_id);
		dao.subtractLikeCount(seq);
		return dao.getLikeCount(seq);
	}

	// 게시글 댓글 개수 추가
	public int addCommentCount(int seq) {
		return dao.addCommentCount(seq);
	}

	// 게시글 댓글 개수 감소
	public int subtractCommentCount(int seq) {
		return dao.subtractCommentCount(seq);
	}

	// 게시글 좋아요 체크
	public int isLiked(int seq, String user_id) {
		return dao.isLiked(seq, user_id);
	}
}
