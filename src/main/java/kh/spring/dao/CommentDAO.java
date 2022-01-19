package kh.spring.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.dto.BoardDTO;
import kh.spring.dto.CommentDTO;

@Repository
public class CommentDAO {

	@Autowired
	private SqlSessionTemplate mybatis;

	// 해당 게시물 전체 댓글 리스트
	public List<CommentDTO> selectBySeq(int seq) {
		return mybatis.selectList("Comment.selectBySeq", seq);
	}

	// 신규 댓글 삽입
	public int insert(CommentDTO dto) {
		mybatis.insert("Comment.insert", dto);
		return dto.getComment_seq();
	}

	// 시퀀스로 댓글 삭제
	public int delete(int seq) {
		return mybatis.delete("Comment.delete", seq);
	}

	// 댓글 수정
	public int modify(CommentDTO dto) {
		return mybatis.update("Comment.modify", dto);
	}

	// 댓글 좋아요
	public int like(int seq) {
		return mybatis.update("Comment.like", seq);
	}

	// 댓글 좋아요 취소
	public int unlike(int seq) {
		return mybatis.update("Comment.unlike", seq);
	}
}
