package kh.spring.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.dto.BoardDTO;

@Repository
public class BoardDAO {

	@Autowired
	private SqlSessionTemplate mybatis;

	// 전체 게시글 리스트
	public List<BoardDTO> selectAll() {
		return mybatis.selectList("Board.selectAll");
	}

	// 시퀀스로 게시글 검색
	public BoardDTO selectBySeq(int seq) {
		return mybatis.selectOne("Board.selectBySeq", seq);
	}

	// 신규 게시글 삽입
	public int insert(BoardDTO dto) {
		mybatis.insert("Board.insert", dto);
		return dto.getBoard_seq();
	}

	// 시퀀스로 게시글 삭제
	public int delete(int seq) {
		return mybatis.delete("Board.delete", seq);
	}

	// 게시글 수정
	public int modify(BoardDTO dto) {
		return mybatis.update("Board.modify", dto);
	}

	// 게시글 좋아요 개수 증가
	public int addLikeCount(int seq) {
		return mybatis.update("Board.addLikeCount", seq);
	}

	// 게시글 좋아요 테이블 삽입
	public int addLikeList(int seq, String user_id) {
		return mybatis.update("Board.addLikeList", seq);
	}

	// 게시글 좋아요 개수 감소
	public int subtractLikeCount(int seq) {
		return mybatis.update("Board.subtractLikeCount", seq);
	}

	// 게시글 좋아요 테이블 제거
	public int removeLikeList(int seq, String user_id) {
		return mybatis.update("Board.removeLikeList", seq);
	}

	// 게시글 댓글 개수 증가
	public int addCommentCount(int seq) {
		return mybatis.update("Board.addCommentCount", seq);
	}

	// 게시글 댓글 개수 감소
	public int subtractCommentCount(int seq) {
		return mybatis.update("Board.subtractCommentCount", seq);
	}
}
