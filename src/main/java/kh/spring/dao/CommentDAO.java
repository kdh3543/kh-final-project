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
	public CommentDTO selectBySeq(int seq) {
		return mybatis.selectList("Comment.selectBySeq", seq);
	}

	// 신규 댓글 삽입
	public int insert(CommentDTO dto) {
		mybatis.insert("Comment.insert", dto);
		return dto.getComment_seq();
	}
}
